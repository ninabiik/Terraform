resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = "${file("modules/policies/lambda-assume-role.json")}"
}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id
  policy = "${file("modules/policies/lambda-policy.json")}"
}

resource "aws_iam_role" "glue_role" {
  name = "glue_role"
  assume_role_policy = "${file("modules/policies/glue-assume-role.json")}"
}

resource "aws_iam_role_policy" "glue_policy" {
  name = "glue_policy"
  role = aws_iam_role.glue_role.id
  policy = "${file("modules/policies/glue-policy.json")}"
}



