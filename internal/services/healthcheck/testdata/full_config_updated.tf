resource "cloudflare_healthcheck" "%[2]s" {
  zone_id = "%[1]s"
  name = "%[2]s-updated"
  address = "example.com"
  type = "HTTPS"
  description = "Full config test updated"
  suspended = true
  check_regions = ["WNAM"]
  interval = 120
  timeout = 5
  retries = 2
  consecutive_successes = 3
  consecutive_fails = 2
  http_config = {
    method = "GET"
    path = "/status"
    port = 443
    expected_codes = ["200"]
    follow_redirects = false
    allow_insecure = true
    header = {
      "X-Custom-Header" = ["updated-value"]
    }
  }
}
