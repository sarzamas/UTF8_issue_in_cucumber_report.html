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

Given("Я выхожу из приложения") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("Я оказываюсь на стартовом экране") do
  pending # Write code here that turns the phrase above into concrete actions
end
