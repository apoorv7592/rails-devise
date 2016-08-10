class FirebaseNotification
    require 'fcm'

    # def self.notification(msg,ids)
    #   @msg = {}
    #   @msg[:messga]
    # end

    # def send_notification
    #   base_uri = 'https://medss-app.firebaseio.com'
    #   #firebase = Firebase::Client.new(base_uri)
    #   secret_key = 
    #   firebase = Firebase::Client.new(base_uri, secret_key)
    #   response = firebase.push("todos", { :name => 'Pick tkaskashe milk', :priority => 1 })
    #   #response = firebase.push(@obj)
    #   if response.success? 
    #     puts "success"
    #   end
    #   response.code 
    #   response.body 
    #   response.raw_body 
    # end

    def send
      fcm = FCM.new("AIzaSyDrONF9t70ZQLhJlnjVJu5K-51mIJj4arQ")
      registration_ids= ["e_rWE5kvM24:APA91bFJF3UZQHVwCxGei5UWFrlK3G0Hqk9YxTbMXPCmX0Y0IQCdj3m_CsCSK6wm7YqfPbDu_iU15EjJUvQ9tvtA_CBQToTmzLRvGozJJYKh5paJGC4mUS8BV-Mf_C7hZk2Cc_yka-2W"] # an array of one or more client registration tokens
      options = {data: {score: "123"}, collapse_key: "updated_score"}
      response = fcm.send(registration_ids, options)
    end
end

#@object = {
#   "to" : "bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
#   "priority" : "normal",
#   "notification" : {
#     "body" : "This week's edition is now available.",
#     "title" : "NewsMagazine.com",
#     "icon" : "new"
#   },
#   "data" : {
#     "volume" : "3.21.15",
#     "contents" : "http://www.news-magazine.com/world-week/21659772"
#   }
# }



