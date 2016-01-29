require 'amortization.rb'
class UsersController < ApplicationController

  def new
    @user_detail = User.new
  end
  def show
  	@user_detail = User.find(params[:id])
    loan_amount = @user_detail.loan_amount
    tenure = @user_detail.tenure
    @min_loan = (@user_detail.loan_amount / 2).to_i
    @max_loan = (@user_detail.loan_amount * 2).to_i
    @min_tenure= (@user_detail.tenure / 2).to_i
    @max_tenure = (@user_detail.tenure * 2).to_i
    @display_details = calculation(loan_amount, tenure) 
  end
  


  def create
    @user_detail = User.new(user_detail_params)
    if @user_detail.save
      redirect_to @user_detail
    else
      render 'new'
    end
  end


  def calculation(loan_amount = params[:loan_amount].to_i, tenure = 10)
    display_details = []
    hash = {}
    bank_details = BankDetail.where(:loan_min_vl.lte => loan_amount, :loan_max_vl.gte => loan_amount, :loan_tenure.gte => tenure)
    bank_details.each do |bank_detail|
      bank_logo = BankLogo.where(bank_name: bank_detail.bank_name).first.logo_base64
      emi = Amortization.calculate(loan_amount, bank_detail.rate, tenure)
      hash.merge!({"bank_logo" => bank_logo, "interest_rate" => bank_detail.rate, "processing_amount" => bank_detail.processing_amount, "emi" => emi})
      display_details.push(hash.clone)
      hash = {}
    end

    respond_to do |format|
      format.html {
        return display_details
      }
      format.json {
        render json: display_details
      }
    end
  end

  private

  def user_detail_params
  	params.require(:user_detail).permit(:user_name, :email_id, :mobile_number, :loan_amount, :tenure)
  end
end
