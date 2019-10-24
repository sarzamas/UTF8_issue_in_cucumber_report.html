Before do |scenario| # Cucumber::RunningTestCase::Scenario
  log "Check if tag @reinstall_app is present for Scenario: '#{scenario.name}'? '#{scenario.source_tag_names}'"
  if scenario.source_tag_names.include?('@reinstall_app')
    log 'Scenario tag @reinstall_app is present - reinstalling apps...'
    reinstall_apps
  else
    log 'Scenario tag @reinstall_app is NOT present - proceeding with same apps...'
  end

#  start_test_server_in_background
end

After do |scenario| # Cucumber::RunningTestCase::Scenario

#  screenshot_embed if scenario.failed?
#  shutdown_test_server
end
