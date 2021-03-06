class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    logger.info "=====Available_Params====#{params}"
    #====================================Navin Documentation==========================================
    #build_resource(registration_params) - will be the similar to user = User.new(registration_params)
    #resource - will be an instance of User
    #resource.valid? - will be the name as user.valid?

    build_resource(registration_params)
    resource.save
    @resource = resource
    NotificationMailer.notification_mailer(@resource).deliver if resource.valid?
    render_resource(resource)
  end

  def show
    render json: current_user
  end

  private

  def registration_params
    params.require(:user).permit(:email, :password, :name)
  end
end