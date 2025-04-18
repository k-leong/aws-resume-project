# [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/)

Built [online resume](https://kennyleong-resume.com/) hosted on AWS using the Cloud Resume Challenge as a scope.  

## Main Components
- Frontend
    - HTML, JavaScript, CSS hosted on S3 bucket with static website hosting
    - Website hosted with HTTPS via Cloudfront as CDN and Route53 as DNS management
- Backend
    - Visitor counter implemented using Lambda function
    - Counter was updated using DynamoDB
- Infrastructure as Code
    - Used Terraform to create and deploy resources
- CI/CD
    - Set up GitHub Actions to test and deploy code changes
    - Implemented remote backend using S3 bucket to store terraform state files and DynamoDB as state lock
- Testing
    - Wrote simple test for Lambda visitor counter
    - Used `terraform plan` to test Terraform modules
- Version Control
    - Used GitHub as version control and to store code remotely

## Outcome
- An online resume hosted on AWS
- Gained experience in CI/CD and serverless architecture

## TODO
- :x: Write GitHub Actions workflow for frontend to automatically deploy any frontend changes
- :x: Add personal information to frontend without having to hard code
- :x: Implement live visitor counter
- :x: PDF resume download button