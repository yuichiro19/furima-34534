class PurchasesController < ApplicationController
    def index
        @form_object = FormObject.new
        @item = Item.find(params[:item_id])
    end

    def create
        @form_object = FormObject.new(form_object_params)
        @item = Item.find(params[:item_id])
        if @form_object.valid?
            pay_item
            @form_object.save
            return redirect_to root_path
        else 
            render :index
        end 
    end

    private
    def form_object_params
        params.require(:form_object).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
            Payjp::Charge.create(
                amount: @item.price,
                card: form_object_params[:token],
                currency: 'jpy'
            )
        end
end
