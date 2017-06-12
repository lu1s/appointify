Rails.application.routes.draw do
	get '/' => 'welcome#index'
	get '/register' => 'welcome#register'
	get '/api' => 'welcome#api'

  post 'api/register' => 'api#register'
  post 'api/login' => 'api#login'
  post 'api/companies/new' => 'api_company#create_company'
  get 'api/companies' => 'api_company#get_companies'
  get 'api/companies/:id' => 'api_company#get_company'

  get 'api/users' => 'api_user#get_users'
  get 'api/users/:id' => 'api_user#get_user'
  post 'api/users/new' => 'api_user#create_user'
  post 'api/users/edit/:id' => 'api_user#edit_user'
end
