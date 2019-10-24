Given ("Я нахожусь на основном экране") do
  @page = page(ProxyPage).await(timeout:30)
  if @page.is_main_screen?
    @page = page(MainPage).await(timeout:30)
  elsif @page.is_start_screen?
    macro 'Я нахожусь на экране ввода SMS-кода'
    @page = page(MainPage).await(timeout:30)
  else raise("Unknown screen")
  end
end

Given ("Я нахожусь на экране ввода SMS-кода") do
  macro 'Я нахожусь на экране входа'
  macro 'Я ввожу номер телефона для авторизации'
  macro 'Я оказываюсь на экране ввода SMS-кода'
end

Given ("Я нахожусь на экране входа") do
  macro 'Я нахожусь на стартовом экране'
  macro 'Я нажимаю кнопку входа в приложение ->'
  macro 'Я оказываюсь на экране входа'
end

Given ("Я ввожу номер телефона для авторизации") do
  @page.enter_phone_number
end

Given ("Я оказываюсь на экране ввода SMS-кода") do
  @page = page(SmsCodePage).await(timeout:30)
end

Given ("Я нахожусь на стартовом экране") do
  @page = page(ProxyPage).await(timeout:30)
  if @page.is_start_screen?
    @page = page(StartPage).await(timeout:30)
  elsif @page.is_main_screen?
    @page = page(MainPage).await(timeout:30)
    @page.exit_to_start
    @page = page(StartPage).await(timeout:30)
  else raise("Unknown screen")
  end
end

Given ("Я нажимаю кнопку входа в приложение ->") do
  @page.to_enter_app
end

Given ("Я оказываюсь на экране входа") do
  @page = page(EnterPage).await(timeout:30)
end

Given ("Я оказываюсь на стартовом экране") do
  @page = page(StartPage).await(timeout:30)
end

Given ("Я выхожу из приложения") do
  @page.exit_to_start
end
