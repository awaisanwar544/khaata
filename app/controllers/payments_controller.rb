class PaymentsController < ApplicationController
  def index; end

  private

  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
