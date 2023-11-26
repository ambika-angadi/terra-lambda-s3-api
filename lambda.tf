# resource "aws_lambda_function" "terraform_lambda_func" {
#  filename                       = "${path.module}/python/hello-python.zip"
#  function_name                  = "hello-post"
#  role                           = aws_iam_role.lambda_role.arn
#  handler                        = "hello-post.lambda_handler"
#  runtime                        = "python3.11"
# }

# data "archive_file" "zip_the_python_code" {
#  type        = "zip"
#  source_dir  = "${path.module}/python/"
#  output_path = "${path.module}/python/hello-python.zip"
# }

resource "aws_lambda_function" "terraform_lambda_func" {
 filename                       = "hello-python.zip"
 function_name                  = "hello-post"
 role                           = aws_iam_role.lambda_role.arn
 handler                        = "lambda.lambda_handler"
 runtime                        = "python3.11"
}

data "archive_file" "lambda" {
 type        = "zip"
 source_file  = "lambda.py"
 output_path = "hello-python.zip"
}
