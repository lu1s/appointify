class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  def error_response(code, message)
  	render :json => {success: false, message: message}, :status => code
  end
  def success_response(data = {}, message = "OK")
  	render :json => {success: true, message: message, data: data}
  end
  def check_authenticated
  	pretoken = request.headers["Authorization"]
  	if pretoken.nil? or pretoken == ''
  		error_response 400, "Missing parameters"
      return false
  	end
  	token = pretoken[7..-1]
  	@superuser = SuperUser.where(auth_token: token).first
  	if @superuser.nil?
  		error_response 401, "Unauthorized, bad token, please login"
  		return false
  	end
  	true
  end
end
