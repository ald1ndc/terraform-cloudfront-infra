resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "sctp-staticwebsite-files.s3.ap-southeast-1.amazonaws.com"
    origin_id = "sctp-staticwebsite-files.s3.ap-southeast-1.amazonaws.com"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Aldin Test"
  default_root_object = "home.html"
  http_port              = 80
  https_port             = 443
  origin_protocol_policy = "http-only"
  origin_ssl_protocols   = ["TLSv1"]
 }
  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
