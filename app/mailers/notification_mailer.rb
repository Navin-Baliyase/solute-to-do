class NotificationMailer < ApplicationMailer
	default from: 'info@solute.com'
	def notification_mailer(resource)
		@resource = resource
		mail(to: @resource.email,:subject => "Successfully registered.")
	end
end
