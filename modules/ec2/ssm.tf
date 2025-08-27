resource "aws_iam_policy" "policy-ssm-app" {
  name        = "ssm-policy-ec2-access-${var.proyecto}"
  path        = "/"
  description = "Mi politica de SSM para acceso a las instancias ec2"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssm:UpdateInstanceInformation",
          "ssmmessages:CreateControlChannel",
          "ssmmessages:CreateDataChannel",
          "ssmmessages:OpenControlChannel",
          "ssmmessages:OpenDataChannel"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:GetEncryptionConfiguration"
        ],
        "Resource" : "*"
      }
    ]
    }
  )
  tags = var.tags
}

resource "aws_iam_role" "role-ssm-app" {
  name = "ssm-role-ec2-access-${var.proyecto}"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}


resource "aws_iam_role_policy_attachment" "attach-ssm-role-app" {
  role       = aws_iam_role.role-ssm-app.name
  policy_arn = aws_iam_policy.policy-ssm-app.arn
}

resource "aws_iam_instance_profile" "instance-prof-app" {
  name = "instance_profile_for_app--${var.proyecto}"
  role = aws_iam_role.role-ssm-app.name
}
