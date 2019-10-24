class MainPage < Calabash::ABase
    def trait
    scroll_until_visible :text, LANG['settings'], :down
    "* tag:'settings'"
    end

    def verify_locators
    debug_all
    wait_if_loading
    scroll_until_visible :tag, '1', :up
    count_locator 'action_bar_root'              ,'FitWindowsLinearLayout'
    count_locator 'content'                      ,'ContentFrameLayout'
    count_locator 'drawer'                       ,'DrawerLayout'
    count_locator 'fragment_container'           ,'FrameLayout'
    count_locator 'toolbarBinding'               ,'Toolbar'
    count_locator 'AppCompatImageButton'                                               # TODO: добавить id для кнопки выхода в настройки
    count_locator :text, LANG['object_name']     ,'AppCompatTextView'
    count_locator 'pager'                        ,'ViewPager'
    count_locator 2,'coordinator'                ,'CoordinatorLayout'
    count_locator 'recycler'                     ,'RecyclerView'
    count_locator :tag, '0'                      ,'AreaOrPartIconView'
    scroll_until_visible :text, LANG['settings'], :down
    count_locator :tag, 'security_service_button','SecurityServicesIconView'
    count_locator :text, LANG['security_service'],'AppCompatTextView'
    count_locator 'alarm'                        ,'AppCompatImageView'                 # желтый/красный колокольчик на кружке Улуги охраны
    count_locator :tag, 'settings'               ,'AreaSimpleIconView'
    count_locator :text, LANG['settings']        ,'AppCompatTextView'
    count_locator 3,'image'                      ,'AppCompatImageView'
    count_locator 3,'name'                       ,'AppCompatTextView'
    count_locator 'navigationBarBackground'      ,'View'
    count_locator 'AlternativeGridLayout'
    count_locator 'DecorView'
    count_locator 4,'LinearLayout'
    count_locator 2,'FrameLayout'
    count_locator 5,'GridLayout'
    count_locator 8,'AppCompatImageView'
    count_locator 2,'View'
  end

  def action_trigger(button)
    wait_if_loading
    scroll_until_visible :tag, '1', :up
    press_locator :tag, button
  end

  def in_progress?
    scroll_until_visible :tag, '1', :up
    count_locator 'progress'                     ,'MaterialProgressBar'
  end

  def exit_to_start
    press_locator 'AppCompatImageButton'                                               # TODO: добавить id для кнопки выхода в настройки
    wait_locator 'design_menu_item_text'
    press_locator :text, LANG['exit']            ,'AppCompatCheckedTextView'
    wait_locator 'imageLogin'
  end
end
