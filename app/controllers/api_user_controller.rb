class ApiUserController < ApplicationController

	def create_user
		if !check_authenticated
			return
		end
		if params[:first_name].nil? or params[:first_name] == '' or params[:last_name].nil? or params[:last_name] == '' or params[:email].nil? or params[:email] == '' or params[:password].nil? or params[:password] == ''
			error_response 401, "Invalid parameters"
		end
		## TODO: Create a user
		#payments params
		card_number = params[:card_number]
		exp_month = params[:expiration_month]
		exp_year = params[:expiration_year]
		cvc = params[:cvc]
		name_on_card = params[:name_on_card]
		#TODO: Create token
		Conekta::Customer.create({
				:name => "#{params[:first_name]} #{params[:last_name]}",
				:email => params[:email],
				:phone => params[:phone_number],
				:plan_id => "appointify",
				:corporate => true,
				:payment_sources => [
						{
							:token_id => params[:card_token],
							:type => "card"
						}
					]
			})
		user = User.create(
				email: params[:email],
				password: Digest::SHA1.hexdigest(params[:password]),
				first_name: params[:first_name],
				last_name: params[:last_name]
			)
		if !params[:phone_number].nil?
			user.phone_number = params[:phone_number]
		end
		if !params[:address].nil?
			user.address = params[:address]
		end
		if !params[:address2].nil?
			user.address2 = params[:address2]
		end
		if !params[:city].nil?
			user.city = params[:city]
		end
		if !params[:state].nil?
			user.state = params[:state]
		end
		if !params[:postal_code].nil?
			user.postal_code = params[:postal_code]
		end
		if !params[:country].nil?
			user.country = params[:country]
		end
		user.save
		success_response {user: user}, "OK"
	end

	def edit_user
		if !check_authenticated
			return
		end
		if params[:id].nil? or params[:id] == ''
			error_response 400, "Incorrect parameters"
			return
		end
		user = User.where(id: params[:id]).first
		if user.nil?
			error_response 404, "User not found"
			return
		end
		if !params[:first_name].nil?
			user.first_name = params[:first_name]
		end
		if !params[:last_name].nil?
			user.last_name = params[:last_name]
		end
		if !params[:phone_number].nil?
			user.phone_number = params[:phone_number]
		end
		if !params[:address].nil?
			user.address = params[:address]
		end
		if !params[:address2].nil?
			user.address2 = params[:address2]
		end
		if !params[:city].nil?
			user.city = params[:city]
		end
		if !params[:state].nil?
			user.state = params[:state]
		end
		if !params[:postal_code].nil?
			user.postal_code = params[:postal_code]
		end
		if !params[:country].nil?
			user.country = params[:country]
		end
		user.save
		success_response {user: user}, "OK"
	end

	def get_users
		if !check_authenticated
			return
		end
		users = User.where(superuser_id: @superuser.id)
		success_response {users: users}, "OK"
	end

	def get_user
		if !check_authenticated
			return
		end
		if params[:id].nil? or params[:id] == ''
			error_response 400, "No parameters"
			return
		end
		user = User.where(id: params[:id], superuser_id: @superuser.id).first
		if user.nil?
			error_response 404, "User not found"
			return
		end
		success_response {user: user}, "OK"
	end

end