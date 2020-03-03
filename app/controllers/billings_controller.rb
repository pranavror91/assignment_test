class BillingsController < ApplicationController

    before_action :authenticate_user!

    def index
     @user=current_user.email
    end

    def new_card
        respond_to do |format|
          format.js 
        end
    end

    def create_card 
      respond_to do |format|
        if current_user.stripe_id.nil?
          customer = Stripe::Customer.create({"email": current_user.email}) 
          current_user.update(:stripe_id => customer.id)
        end
  
        card_token = params[:stripeToken]
        if card_token.nil?
          format.html { redirect_to billing_path, error: "Oops"}
        end
  
        customer = Stripe::Customer.new current_user.stripe_id
        customer.source = card_token
        customer.save
  
        format.html { redirect_to success_path }
      end
    end

    def success
    end


end
