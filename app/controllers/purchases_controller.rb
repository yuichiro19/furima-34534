class PurchasesController < ApplicationController
    def index
        @form_object = FormObject.new
    end

    def create
        @form_object = FormObject.new(form_object_params)
    end

    private
    def form_object_params
        params.require(:form_object).permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :purchase_id).merge(user_id: current_user.id)
    end
end
