class PurchasesController < ApplicationController
    def index
        @form_object = FormObject.new
        @item = Item.find(params[:item_id])
    end

    def create
        @form_object = FormObject.new(form_object_params)
        @item = Item.find(params[:item_id])
        if @form_object.valid?
            @form_object.save
            redirect_to root_path
        else 
            render :index
        end 
    end

    private
    def form_object_params
        params.require(:form_object).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:authenticity_token])
    end
end
