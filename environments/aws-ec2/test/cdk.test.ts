import {
  expect as expectCDK,
  matchTemplate,
  MatchStyle,
} from "@aws-cdk/assert";
import * as cdk from "@aws-cdk/core";
import * as EC2 from "../lib/ec2-stack";

test("Empty Stack", () => {
  const app = new cdk.App();
  // WHEN
  const stack = new EC2.EC2Stack(app, "MyTestStack");
  // THEN
  expectCDK(stack).to(
    matchTemplate(
      {
        Resources: {},
      },
      MatchStyle.EXACT
    )
  );
});
