resource "cloudflare_healthcheck" "%[2]s" {
  zone_id = "%[1]s"
  name = "%[2]s"
  address = "example.com"
  type = "HTTPS"
  description = "Full config test"
  suspended = false
  check_regions = ["WNAM"]
  interval = 60
  timeout = 10
  retries = 3
  consecutive_successes = 2
  consecutive_fails = 3
  http_config = {
    method = "GET"
    path = "/health"
    port = 443
    expected_codes = ["200", "201"]
    follow_redirects = true
    allow_insecure = false
    header = {
      "X-Custom-Header" = ["value1", "value2"]
    }
  }
}
