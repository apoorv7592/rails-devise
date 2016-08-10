class NotificationMessage < ActiveRecord::Base
   after_create :send_notification

   def send_notification
   	 @message = self
   	 @ids = Registration.pluck(:registration_id)
     FirebaseNotification.notification(@msg,@ids)
   end

end
