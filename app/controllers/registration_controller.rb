class RegistrationsController < Devise::RegistrationsController
before_action :authenticate_user!
  respond_to :json

  def create
  	if context[:user].admin?
    	build_resource(sign_up_params)

    	resource.save
    	render_resource(resource)
    else return render_forbidden 
  	end

  def sign_up_params
    params.require(:user).permit(:email, :password, :name, :user_id, :mentor_id)
  end
end

