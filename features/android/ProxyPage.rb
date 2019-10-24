class ProxyPage < Calabash::ABase
  def trait
    '*'
  end

  def is_start_screen?
    element_exists "* id:'imageLogin'"
  end

  def is_enter_screen?
    element_exists "* text:'#{LANG['enter_phone']}'"
  end

  def is_main_screen?
    scroll_until_visible :text, LANG['settings'], :down
    element_exists "* tag:'settings'"
  end

  def is_pin_code_screen?
    element_exists "* marked:'#{LANG['fast_enter']}'"
  end
end
