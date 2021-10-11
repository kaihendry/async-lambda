var AWS = require('aws-sdk');
const lambda = new AWS.Lambda();

exports.handler = async () => {
  console.log("invoking...")
  let lambdaInvoke = await lambda
            .invoke({ FunctionName: "arn:aws:lambda:ap-southeast-1:407461997746:function:asyncB-waitFunction-Imi1aWwtr2P9", })
            .promise();

  console.log("done!")
  return lambdaInvoke;
};
