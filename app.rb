require 'sinatra'
require 'pony'

get '/' do
	erb :home
end

post '/send-email' do
	Pony.mail :to => params[:email],
						:from => 'wesley.sickert@gmail.com',
						:subject => 'Você agora é prioridade!',
						:body => 'Obrigado!'

	redirect to '/'
end

