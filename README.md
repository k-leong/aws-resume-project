# [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/)

Built [online resume](https://kennyleong-resume.com/) hosted on AWS using the Cloud Resume Challenge as a scope.  

## Main Components
- Frontend
    - HTML, JavaScript, CSS hosted on S3 bucket with static website hosting
    - Website hosted with HTTPS via Cloudfront as CDN and Route53 as DNS management
- Backend
    - Visitor counter implemented using Lambda function and API Gateway
    - Counter was updated using DynamoDB
- Infrastructure as Code
    - Used Terraform to create and deploy resources
- CI/CD
    - Set up GitHub Actions to test and deploy code changes
    - Implemented remote backend using S3 bucket to store terraform state files and DynamoDB as state lock
- Testing
    - Wrote a simple test for Lambda visitor counter
    - Used `terraform plan` to test Terraform modules
- Version Control
    - Used GitHub as version control and to store code remotely

## Architecture Diagram
![Architecture Diagram](/image.png)

## Outcome
- An online resume hosted on AWS
- Learned how to architect a serverless application in a cost effective manner
- Learned how to create and write a CI/CD pipeline with GitHub Actions
- Gained experience in CI/CD and serverless architecture
- Gained more experience with Terraform and how to implement remote backend as part of development and within CI/CD pipeline

## TODO
- :x: Write GitHub Actions workflow for frontend to automatically deploy any frontend changes
- :x: Update frontend content
  - :x: Remove any work experience to only showcase project related work
  - :x: Update layout
- :x: Implement live visitor counter
- :x: PDF resume download button
- :x: Architecture diagram of application
- :x: Add monitoring