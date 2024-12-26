resource "aws_lambda_function" "this" {
  function_name    = var.function_name
  runtime          = "python3.9"
  role             = var.role_arn
  handler          = "lambda_function.lambda_handler"
  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)
  environment {
    variables = var.environment_variables
  }
}
