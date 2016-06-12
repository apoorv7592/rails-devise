class GcmController < ApplicationController

def create
    @message = Message.new(message_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url, notice: 'Message was successfully pushed.' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
 
	 # Here we will send the notification to GCM using 'gcm' gem 
	 gcm = GCM.new("your_api_key")
	 options = {data: {title: @message.title, message: @message.msg, notId: rand(1...10000)}, collapse_key: "updated_score", title: @message.title}  
	 registration_ids = ["your_device_registration_id(s)"]
	 response = gcm.send(registration_ids, options)
  end
end