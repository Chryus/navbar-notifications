class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifcations = Notifications.where(recipient: current_user).recent
  end

  def mark_as_read
    @notifcations = Notifications.where(recipient: current_user).unread
    @notifcations.update_all(read_at: Time.zone.now)
    render json: { success: true }
  end
end
