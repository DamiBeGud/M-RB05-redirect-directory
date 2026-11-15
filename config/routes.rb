Rails.application.routes.draw do
 get '/health/live',to:'health#live'
 get '/ready',to:'health#ready'
post '/aliases',to:'aliases#create'
get '/aliases/:slug',to:'aliases#show'
get '/resolve/:slug',to:'aliases#resolve'
end
