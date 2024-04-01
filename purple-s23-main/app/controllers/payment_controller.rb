class PaymentController < ApplicationController

    def index
        @payment = Payment.new
        render :index
    end

    def update
        @payment = Payment.find_or_create_by(cardnumber: params[:cardnumber])
        updateFlag = false
        if params[:payment]
          if @payment.update(params.require('payment').permit(:cardnumber, :cardholdername, :expirydate, :cvv, :zipcode, :paymentstatus))
            flash[:success] = 'Order successfully placed!'
            updateFlag = true
            redirect_to curated_salads_path
          else
            flash.now[:error] = 'Payment failed'
            updateFlag = false
            render  :index, status: :unprocessable_entity
          end
        end
    end
end
