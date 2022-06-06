Rails.application.routes.draw do
  mount Converter::CurrencyRoutesTest => '/api'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
