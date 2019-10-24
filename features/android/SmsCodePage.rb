class SmsCodePage < Calabash::ABase
  def trait
    "* id:'sms_code'"
#      "* text:'#{LANG['enter_sms_code']}'"                                      # TODO: добавить описание для локатора 'Код из СМС'
  end

  def verify_locators
    count_locator 'action_bar_root'          ,'FitWindowsLinearLayout'
    count_locator 'content'                  ,'ContentFrameLayout'
    count_locator 'fragment_container'       ,'FrameLayout'
    count_locator 'coordinator'              ,'CoordinatorLayout'
    count_locator 'toolbar'                  ,'Toolbar'
    count_locator 'AppCompatImageButton'                                         # TODO: добавить id к кнопке стрелка (назад)
    count_locator :text, LANG['enter']       ,'AppCompatTextView'
    count_locator 'textPhoneNumber'          ,'AppCompatTextView'                # TODO: text: "+7 " from env.rb :phone_number (Надо проверять этот форматированный номер)
    count_locator 'sms_code'                 ,'TextInputLayout'                  # TODO: добавить описание для локатора 'Код из СМС' - "* text:'#{LANG['enter_sms_code']}'"
    count_locator 'sms_code_edit'            ,'TextInputEditText'                # text: ''
    count_locator 'textResendCode'           ,'AppCompatTextView'                # TODO: id: textResendCode text: Не получили код? Сможем отправить заново через 47 секунд. Надо сделать отдельный тест на проверку этого текста, таймера и ввода неверного кода
    count_locator 'navigationBarBackground'  ,'View'
    count_locator 'statusBarBackground'      ,'View'
    count_locator 'DecorView'
    count_locator 'GridLayout'
    count_locator 2,'LinearLayout'
    count_locator 3,'FrameLayout'
    count_locator 3,'View'
  end
end
