class PaymentsController < ApplicationController
  def index
    @payments = current_user.categories.find(params[:category_id]).payments
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user_id = current_user.id
    @payment.category_id = params[:category_id]

    if @payment.save
      redirect_to category_payments_path(@payment), notice: 'Transaction Added'
    else
      @errors = @payment.errors.full_messages
      render :new
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
