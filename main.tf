resource "aws_lambda_function" "this" {
  function_name = var.function_name
  role          = aws_iam_role.this.arn

  s3_bucket = var.s3_bucket_name
  s3_key = "${var.function_name}.zip"

  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"

  tags = merge(
    var.tags,
    {
      "Name": var.function_name,
      "Type": "lambda"
    }
  )
}

resource "aws_lambda_function_url" "this" {
  function_name = aws_lambda_function.this.function_name
  authorization_type = "NONE"
}