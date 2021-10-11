/**
 * A Lambda function that returns a static string
 */
exports.helloFromLambdaHandler = async () => {
  // If you change this message, you will need to change hello-from-lambda.test.js

  console.log("sleeping....");
  await new Promise((r) => setTimeout(r, 2000));

  const message = "Hello from B!";

  // All log statements are written to CloudWatch
  console.info(`${message}`);

  return message;
};
