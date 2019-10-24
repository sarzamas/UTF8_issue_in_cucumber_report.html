AfterConfiguration do |config|
  FeatureMemory.feature = nil
end

Before do |scenario|
  scenario = scenario.scenario_outline if scenario.respond_to?(:scenario_outline)

  feature = scenario.feature
  if FeatureMemory.feature != feature || ENV['RESET_BETWEEN_SCENARIOS'] == '1'
    if ENV['RESET_BETWEEN_SCENARIOS'] == '1'
      log "New scenario - will reinstall apps only if ENV['REINSTALL'] != '0': it is '#{ENV['REINSTALL']}'"
    else
      log "First scenario in feature - will reinstall apps only if ENV['REINSTALL'] != '0': it is '#{ENV['REINSTALL']}'"
    end

    if ENV['REINSTALL'] != '0'
      uninstall_apps
      install_app(ENV['TEST_APP_PATH'])
      install_app(ENV['APP_PATH'])
    end

    FeatureMemory.feature = feature
    FeatureMemory.invocation = 1
  else
    FeatureMemory.invocation += 1
  end
end

FeatureMemory = Struct.new(:feature, :invocation).new
