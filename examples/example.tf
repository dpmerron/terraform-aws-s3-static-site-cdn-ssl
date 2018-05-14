module "site" {
  source = "https://github.com/dpmerron/terraform-aws-s3-static-site-cdn-ssl.git"
  domain   = ".example.com"
  zoneid = "Z1RAA1AAYPY6T"
  name = "subdomain"
}
