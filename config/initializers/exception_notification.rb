# Contains the application specific configurations supplied to ExceptionNotifier class to override the defaults.
# ActiveRecord::RecordNotFound, AbstractController::ActionNotFound, ActionController::RoutingError are ignored by Exception Notifier
# ActionController::InvalidAuthenticityToken needs to be ignored by the RevRemit

if ENV["RAILS_ENV"] == "production"
  LiveTheValue::Application.config.middleware.use ExceptionNotifier,
    :email_prefix => "[LTV : Error]",
    :sender_address => %("LTV Application" <rubysoftwaretest@gmail.com>),
    :exception_recipients => ExceptionRecipient.table_exists?  ? (ExceptionRecipient.all.blank? ? %w('venkateswara.rao@revenuemed.com') : ExceptionRecipient.all.map(&:email)) : %w('venkateswara.rao@revenuemed.com')
end
