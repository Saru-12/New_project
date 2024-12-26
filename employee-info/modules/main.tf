provider "aws" {
  region = "us-east-1"
}

# ECS Module
module "ecs" {
  source                  = "./modules/ecs"
  cluster_name            = "employee-cluster"
  task_family             = "employee-task"
  container_definitions_file = "container-definitions.json"
  execution_role_arn      = aws_iam_role.ecs_task_execution_role.arn
  service_name            = "employee-service"
  desired_count           = 2
  subnets                 = ["subnet-12345", "subnet-67890"]
  security_groups         = ["sg-12345"]
}

# Lambda Module
module "lambda" {
  source                  = "./modules/lambda"
  function_name           = "employee-lambda"
  role_arn                = aws_iam_role.lambda_execution_role.arn
  filename                = "backend/lambda_function.zip"
  environment_variables   = {
    TABLE_NAME = "EmployeeInfo"
  }
}

# DynamoDB Module
module "dynamodb" {
  source                  = "./modules/dynamodb"
  table_name              = "EmployeeInfo"
  hash_key                = "EmployeeID"
}

# API Gateway Module
module "api_gateway" {
  source                  = "./modules/api_gateway"
  api_name                = "employee-api"
  path_part               = "employee"
  http_method             = "POST"
  lambda_invoke_url       = module.lambda.lambda_function_arn
}
