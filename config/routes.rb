Rails.application.routes.draw do
	root 'clients#new'

	get '/clients', to: 'clients#new'
	post '/clients', to: 'clients#create'
end
