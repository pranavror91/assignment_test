class MoneyDonatorsController < ApplicationController
    
    def new
        $post = Post.find(params[:post])
        @donator = MoneyDonator.new()
    end

    def create
        @donator = $post.money_donators.create(donator_params)
        # redirect_to redirect_search
        # redirect_to add_payment_method_path(), format: 'js', :remote => true
        # respond_to do |format|
        #     format.js {render :js => "window.location.href='"+add_payment_method_path+"'"}
        #     # format.js { redirect_to add_payment_method_path }
        # end
        # @donator = MoneyDonator.new(donator_params)
        if @donator.save!
            redirect_to billings_path()
            flash[:notice] = "hey saved"
        else
            flash[:notice] = "not saved"
        end
    end

    def redirect_search
        "window.location.href='"+add_payment_method_path+"'"
    end

private

    def donator_params
        params.require(:money_donator).permit(:name, :contact_number, :post_id)
    end
end
