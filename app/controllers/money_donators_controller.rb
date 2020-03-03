class MoneyDonatorsController < ApplicationController
    
    def new
        post = Post.find(params[:post])
        @donator = MoneyDonator.new(post: post)
    end

    def create
        post = Post.find_by(id: params[:money_donator][:post_id])
        @donator = post.money_donators.create(donator_params)
        if @donator.save!
            redirect_to billings_path()
            flash[:notice] = "Donator Saved Sucessfully"
        else
            flash[:notice] = "Donator not saved"
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
