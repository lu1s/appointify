class ApiCompanyController < ApplicationController

	def create_company
		if !check_authenticated
			return
		end
		if params[:name].nil? or params[:name] == '' or params[:legal_name].nil? or params[:name] == ''
			error_response 400, "Missing parameters"
			return
		end
		company = Company.new
		company.name = params[:name],
		company.legal_name = params[:legal_name]
		company.user = @superuser
		if !params[:website].nil? and params[:website] != ''
			company.website = params[:website]
		end
		if !params[:facebook_page].nil? and params[:facebook_page] != ''
			company.facebook_page = params[:facebook_page]
		end
		if !params[:twitter_page].nil? and params[:twitter_page] != ''
			company.twitter_page = params[:twitter_page]
		end
		if !params[:phone_number].nil? and params[:phone_number] != ''
			company.phone_number = params[:phone_number]
		end
		if !params[:phone_number2].nil? and params[:phone_number2] != ''
			company.phone_number2 = params[:phone_number2]
		end
		if !params[:email].nil? and params[:email] != ''
			company.email = params[:email]
		end
		if !params[:description].nil? and params[:description] != ''
			company.description = params[:description]
		end
		company.save
		success_response({company: company})
	end

	def get_company
		if !check_authenticated
			return
		end
		company = Company.where(id: params[:id], user_id: @superuser.id).first
		if company.nil?
			error_response 404, "Company not found"
			return
		end
		success_response({company: company})
	end

	def get_companies
		if !check_authenticated
			return
		end
		companies = Company.where(user_id: @superuser.id, user_id: @superuser.id)
		success_response({companies: companies})
	end

end