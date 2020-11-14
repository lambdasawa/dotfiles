#!/usr/bin/env node
import "source-map-support/register";
import * as cdk from "@aws-cdk/core";
import { EC2Stack } from "../lib/ec2-stack";
import Axios from "axios";

function buildCDKEnv(): cdk.Environment {
  return {
    account: process.env.CDK_DEFAULT_ACCOUNT,
    region: process.env.CDK_DEFAULT_REGION,
  };
}

async function fetchGlobalIPAddress(): Promise<string> {
  return Axios.get<string>("https://checkip.amazonaws.com").then((response) => {
    const body = response.data.trim();

    console.log("Check global IP.", body);

    return body;
  });
}

async function main() {
  const env = buildCDKEnv();

  const globalIPAddress = await fetchGlobalIPAddress();

  const app = new cdk.App();

  new EC2Stack(app, "LambDotfilesEc2Stack", {
    env,
    globalIPAddress,
  });

  app.synth();
}

main()
  .then(() => {
    console.log("Success.");
    process.exit(0);
  })
  .catch((error) => {
    console.error("Failure!", error);
    process.exit(1);
  });
