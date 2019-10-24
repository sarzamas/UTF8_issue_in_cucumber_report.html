Before do |scenario| # Cucumber::RunningTestCase::Scenario
#  start_test_server_in_background
end

After do |scenario| # Cucumber::RunningTestCase::Scenario
#  screenshot_embed if scenario.failed?
#  shutdown_test_server
end
