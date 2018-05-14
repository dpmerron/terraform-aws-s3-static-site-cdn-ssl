module "site" {
  source = "dpmerron/s3-static-site-cdn-ssl/aws"

  domain = ".example.com"
  zoneid = "Z1RAA1AAYPY6T"
  name   = "subdomain"
}
