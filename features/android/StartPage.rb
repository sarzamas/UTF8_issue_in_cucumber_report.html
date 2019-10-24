class StartPage < Calabash::ABase
  def trait
    "* id:'imageLogin'"
  end

  def verify_locators
    count_locator 'action_bar_root'       ,'FitWindowsLinearLayout'
    count_locator 'content'               ,'ContentFrameLayout'
    count_locator 'start_fragment'        ,'GridLayout'
    count_locator 'backends_gateway'      ,'View'
    count_locator 'statusBarBackground'   ,'View'
    count_locator 'imageStartLogo'        ,'AppCompatImageView'
    count_locator 'imageLogin'            ,'AppCompatImageView'
    count_locator 'FrameLayout'
    count_locator 'LinearLayout'
    count_locator 'DecorView'
  end

  def to_enter_app
    press_locator 'imageLogin'            ,'AppCompatImageView'
    wait_locator 'phone'
  end

  def to_server_settings
    for i in 1..7 do print i
      touch("* id:'backends_gateway'",time:0.1)
    end
    print "\n"
    wait_locator 'current_mark'
  end
end
