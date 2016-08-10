class RegistrationsController < ApplicationController

  def create
    @registration = registration_params[:user_id].present? ? Registration.find_or_create_by(user_id: registration_params[:user_id]) : Registration.create(registration_params)
    @registration.registration_id =  registration_params[:registration_id] if registration_params[:registration_id].present?
    @registration.device_name = registration_params[:device_name]
    respond_to do |format|
      if @registration.save
        format.json { render json: @registration }
      else
        format.html { render :new }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end


  def send_notification
      fcm = FCM.new("AIzaSyDw8SRZF3yqRKzq8K9oVH6S-0tZbojzw9k")
      registration_ids= ["e_rWE5kvM24:APA91bFJF3UZQHVwCxGei5UWFrlK3G0Hqk9YxTbMXPCmX0Y0IQCdj3m_CsCSK6wm7YqfPbDu_iU15EjJUvQ9tvtA_CBQToTmzLRvGozJJYKh5paJGC4mUS8BV-Mf_C7hZk2Cc_yka-2W"] # an array of one or more client registration tokens
          options = {}
          options[:notification] = {}
          options[:notification][:title] = "title"
          options[:notification][:body] = "body"
          options[:priority] = "high"
      response = fcm.send(registration_ids, options)
  end


  # def send_notification(tokens, title, body, tag, sound, icon, color,
  #                             data_type, data_title, data_body, data_image_url, data_url)
  #         fcm = FCM.new(@api_key)
  #         options = {}
  #         options[:notification] = {}
  #         options[:notification][:title] = title
  #         options[:notification][:body] = body
  #         options[:notification][:tag] = tag
  #         options[:notification][:sound] = sound unless sound == 'none'
  #         options[:notification][:icon] = icon
  #         options[:notification][:color] = color
  #         options[:content_available] = true
  #         options[:data] = {}
  #         options[:data][:type] = data_type
  #         options[:data][:title] = data_title
  #         options[:data][:body] = data_body
  #         options[:data][:image_url] = data_image_url
  #         options[:data][:url] = data_url

  #         responses = []
  #         tokens.compact.each_slice(1000) do |tokens_sliced|
  #           response = fcm.send(tokens_sliced, options)
  #           responses << response
  #         end
  #         return responses.to_yaml
  #       end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:id, :user_id, :registration_id, :device_name)
    end
end