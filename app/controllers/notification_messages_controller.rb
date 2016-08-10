class NotificationMessagesController < ApplicationController
  before_action :set_notimsg, only: [:show, :edit, :update, :destroy]

  # GET /devices
  # GET /devices.json
  def index
    @msg = NotificationMessage.all
  end

  # GET /devices/new
  def new
    @msg = NotificationMessage.new
  end

  # GET /devices/1/edit
  def edit
  end

  # POST /devices
  # POST /devices.json
  def create
    @msg = NotificationMessage.new(msg_params)
    respond_to do |format|
      if @msg.save
        format.html { redirect_to @msg, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @msg }
      else
        format.html { render :new }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @msg.update(msg_params)
        format.html { redirect_to @msg, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @msg }
      else
        format.html { render :edit }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @msg.destroy
    respond_to do |format|
      format.html { redirect_to notification_messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notimsg
      @msg = NotificationMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def msg_params
      params.require(:notification_message).permit(:id, :message_title, :message_content, :message_time)
    end
end