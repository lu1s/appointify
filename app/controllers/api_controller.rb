class ApiController < ApplicationController
	def register
		if params[:paidtoken].nil? or params[:paidtoken] == ''
			error_response 400, "Missing parameters"
			return
		end
		code = PaidCode.where(code: params[:paidtoken]).first
		if first.nil?
			error_response 404, "Invalid paid token"
			return
		end
		code.used = true
		code.usedon = DateTime.now
		if params[:email].nil? or params[:email] == '' or params[:password].nil? or params[:password] == ''
			error_response 400, "Missing parameterss"
			return
		end
		user = SuperUser.create(
				email: params[:email],
				password: Digest::SHA1.hexdigest(params[:password]),
				auth_token: "#{SecureRandom.hex}#{SecureRandom.hex}"
			)
		code.superuser_id = user.id
		code.save
		success_response({id: user.id, auth_token: user.auth_token})
	end
	def login
		if params[:email].nil? or params[:email] == '' or params[:password].nil? or params[:password] == ''
			error_response 400, "Missing parameters"
			return
		end
		user = User.where(email: params[:email]).first
		if user.nil?
			error_response 404, "User not found"
			return
		end
		if user.password != Digest::SHA1.hexdigest(params[:password])
			error_response 401, "Unauthorized. Bad password"
			return
		end
		user.auth_token = "#{SecureRandom.hex}#{SecureRandom.hex}"
		user.save
		success_response({auth_token: user.auth_token})
	end
	def logout
		if !check_authenticated
			return
		end
		@superuser.auth_token = "#{SecureRandom.hex}#{SecureRandom.hex}"
		@superuser.save
		success_response {}, "OK"
	end

	#authorized calls

end