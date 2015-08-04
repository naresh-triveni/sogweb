class EmailSubscriptionsController < ApplicationController
  def new
  end

  def create
    email_subscription = EmailSubscription.new(email: params[:email])
    if email_subscription.valid?
      email_subscription.save()
      flash[:status] = "success"
      flash[:message] = "You have successfully subscribed on Sogweb"
    else
      flash[:status] = "error"
      flash[:message] = email_subscription.errors[:email][0]
    end
    redirect_to root_path
  end
end
