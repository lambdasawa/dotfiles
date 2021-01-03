import * as cdk from "@aws-cdk/core";
import * as ec2 from "@aws-cdk/aws-ec2";

interface CdkProps extends cdk.StackProps {
  globalIPAddress: string;
}

export class EC2Stack extends cdk.Stack {
  private readonly availabilityZone = process.env.AWS_AVAILABILITY_ZONE || "";
  private readonly imageRegion = process.env.AWS_REGION || "";
  private readonly imageID = process.env.AWS_IMAGE_ID || "";

  constructor(scope: cdk.Construct, id: string, props?: CdkProps) {
    super(scope, id, props);

    if (!props) throw new Error("Props is empty.");

    const vpc = this.useVPC();
    const securityGroup = this.buildSecurityGroup(props, vpc);
    this.buildHost(props, vpc, securityGroup);
  }

  private useVPC(): ec2.IVpc {
    return ec2.Vpc.fromLookup(this, "VPC", {
      isDefault: true,
    });
  }

  private buildSecurityGroup(
    props: CdkProps,
    vpc: ec2.IVpc
  ): ec2.ISecurityGroup {
    const securityGroup = new ec2.SecurityGroup(this, "SecurityGroup", {
      vpc,
    });

    securityGroup.addEgressRule(ec2.Peer.anyIpv4(), ec2.Port.allTraffic());
    securityGroup.addIngressRule(
      ec2.Peer.ipv4(EC2Stack.buildSshCidr(props)),
      ec2.Port.tcp(22)
    );
    securityGroup.addIngressRule(
      ec2.Peer.ipv4(EC2Stack.buildSshCidr(props)),
      ec2.Port.tcpRange(8000, 9000)
    );

    return securityGroup;
  }

  private static buildSshCidr(props?: CdkProps): string {
    return `${this.getGlobalIPAddress(props)}/32`;
  }

  private static getGlobalIPAddress(props?: CdkProps): string {
    if (!props?.globalIPAddress) throw new Error("global IP address is empty");

    return props.globalIPAddress;
  }

  private buildHost(
    props: CdkProps,
    vpc: ec2.IVpc,
    securityGroup: ec2.ISecurityGroup
  ) {
    const host = new ec2.BastionHostLinux(this, "BastionHost", {
      instanceName: "dev",
      machineImage: ec2.MachineImage.genericLinux(
        {
          [this.imageRegion]: this.imageID,
        },
        {}
      ),
      instanceType: ec2.InstanceType.of(
        ec2.InstanceClass.T3,
        ec2.InstanceSize.MEDIUM
      ),
      vpc,
      subnetSelection: { subnetType: ec2.SubnetType.PUBLIC },
      availabilityZone: this.availabilityZone,
      securityGroup,
    });
    host.instance.userData.addCommands(
      "sudo apt update -yqq",
      "sudo apt upgrade -yqq",
      "sudo snap refresh",
      "sudo snap install starship",
      `su ubuntu -c '${[
        "git clone https://github.com/lambdasawa/dotfiles /home/ubuntu/.dotfiles",
        "cd /home/ubuntu/.dotfiles",
        "git checkout dev",
        "./apply",
      ].join(" && ")}'`
    );

    host.allowSshAccessFrom(ec2.Peer.ipv4(EC2Stack.buildSshCidr(props)));

    return host;
  }
}
