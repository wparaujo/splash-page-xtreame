require 'sinatra'
require 'pony'
require 'mongoid'
require_relative 'db/config.rb'
require_relative 'model/user'

get '/' do
	erb :home
end

post '/send-email' do
	# @user = User.new name: params[:name], email: params[:email]
	# @user.save

	Pony.mail :to => params[:email],
						:from => 'noreply',
						:subject => 'Você agora é prioridade!',
						:body => erb :email,
						:via => :smtp,
						:via_options => {
							:address              => 'smtp.sendgrid.net',
							:port                 => '587',
							:enable_starttls_auto => true,
							:user_name            => ENV['SENDGRID_USERNAME'],
							:password             => ENV['SENDGRID_PASSWORD'],
							:authentication       => :plain, 
							:domain               => "heroku.com" 
						}

	redirect to '/'
end

