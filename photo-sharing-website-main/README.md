# Photo-sharing website

Static pre-rendered photo-sharing website to share publicly your pictures without needing to run or maintain servers.

## Concept

- A static website - publicly accessible web app,
- An admin web application - password protected web application (React.js web application) used to generate the static website on demand.

## Architecture

![](assets/photo_sharing_architecture.png)

1. CloudFront distribution with `/` path in S3 bucket as the origin
2. CloudFront distribution with `/website` path in S3 bucket as the origin (the static website static source code)
3. S3 Bucket which holds the all the static resources (html, css, javascript and images)
4. S3 Bucket with the initial uploaded pictures
5. AWS Lambda used to generate the static website's HTML source code
6. AWS Lambda used to generate thumbnails and to detect relevant labels for uploaded photos using Amazon Rekognition
7. Amazon Cognito to provide an authentication for admin user


## Deployment

### Prerequisites
- [Create an AWS account](https://aws.amazon.com/fr/premiumsupport/knowledge-center/create-and-activate-aws-account/)
- [Install the Amplify CLI](https://docs.amplify.aws/cli/start/install#install-the-amplify-cli)
- [Install npm](https://www.npmjs.com/get-npm)
