resource "aws_cloudwatch_log_group" "apig_log_group" {
  name = "API-Gateway-Exec-log-group"

  tags = {
    project = "cloud-resume"
  }
}