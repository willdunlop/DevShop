class ChargesController < ApplicationController
  before_action :amount_to_be_charged, :set_description, :authenticate_user!
  def new
    # this will remain empty unless you need to set some instance variables to pass on
  end

  def create

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])


    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: @description)

  redirect_to thanks_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
  end

  private

   def amount_to_be_charged
     @amount = params[:cost]
   end

   def set_description
      @description = "Some amazing product"
    end

    def charges_params
      params.require(:charges).permit(:cost)
    end
end