class SubscriptionsController < ApplicationController

  respond_to :json

  def create
    @subscription = Subscription.new(resource_params)
    if @subscription.save
      @subscription.add_to_mailchimp!
      render json: {}, status: 200
    else
      render json: @subscription.errors, status: 400
    end
  end

  private

    def resource_params
      params.require(:subscription).permit(:email, :first_name, :last_name, :source)
    end

end