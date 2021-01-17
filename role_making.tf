
resource "aws_iam_role" "s3_access_role" {
  name               = "s3-role"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}

resource "aws_iam_policy" "s3policy" {
  name        = "s3-policy"
  description = "A test policy"
  policy      = "${file("policys3bucket.json")}"
}

resource "aws_iam_policy_attachment" "policy-attach" {
  name       = "s3-policy-attachment"
  roles      = ["${aws_iam_role.s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.s3policy.arn}"
}
