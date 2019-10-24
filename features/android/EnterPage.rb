class EnterPage < Calabash::ABase
  def trait
    "* text:'#{LANG['enter_phone']}'"
  end

  def verify_locators
    count_locator 'action_bar_root'          ,'FitWindowsLinearLayout'
    count_locator 'content'                  ,'ContentFrameLayout'
    count_locator 'fragment_container'       ,'FrameLayout'
    count_locator 'coordinator'              ,'CoordinatorLayout'
    count_locator 'toolbar'                  ,'Toolbar'
    count_locator 'AppCompatImageButton'                                  # TODO: добавить id к кнопке стрелка (назад)
    count_locator :text, LANG['enter']       ,'AppCompatTextView'
    count_locator :text, LANG['enter_phone'] ,'AppCompatTextView'         # id: header
    count_locator :text, LANG['enter_descr'] ,'AppCompatTextView'         # id: subheader
    count_locator 'phone'                    ,'TextInputLayout'
    count_locator :text, LANG['country_code'],'TextInputEditText'         # id: phone_edit
    count_locator 'action_done'              ,'ActionMenuItemView'        # contentDescription: 'Готово'    text: ''
    count_locator 'ActionMenuView'
    count_locator 'statusBarBackground'      ,'View'
    count_locator 'navigationBarBackground'  ,'View'
    count_locator 'DecorView'
    count_locator 'GridLayout'
    count_locator 3,'FrameLayout'
    count_locator 2,'LinearLayout'
    count_locator 3,'View'
  end

  def enter_phone_number
    count_locator 'phone_edit'               ,'TextInputEditText'
    hide_soft_keyboard
    press_locator 'phone_edit'               ,'TextInputEditText'
    wait_for_keyboard
    clear_text_in "* id:'phone_edit'"
    enter_text    "* id:'phone_edit'"        ,get_credentials[:phone_number]
    press_user_action_button
  end
end
