class UsersController < ApplicationController
  def index
  	@loanDetails = User.all
  end

  def show
  	@user_detail = User.find(params[:id])
    @min = 1
    @max = 2000
    @bank_details = BankDetail.where(bank_name:'Citi Bank')
    @bank_logo = BankLogo.find(bank_name: 'axis')
    hash = {}
    hash.merge!("bank_name" => "SBI", "interest_rate" => 14, "charges" => "Rs. 1000", "emi" => "Rs 1024")
    @bank_details
  end

  def new
  	@user_detail = User.new
  end

  def create
  	@user_detail = User.new(user_detail_params)
  	if @user_detail.save
  	  redirect_to @user_detail
    else
      render 'new'
    end
  end

  def edit
    @loanDetail = LoanDetail.find(params[:id])
  end

  def update
    @loanDetail = LoanDetail.find(params[:id])
   
    if @loanDetail.update(loan_detail_params)
      redirect_to @user_detail
    else
      render 'edit'
    end
  end

  def destroy
    @loanDetail = LoanDetail.find(params[:id])
    @loanDetail.destroy
    redirect_to loan_detail_index_path
  end

  private
  def user_detail_params
  	params.require(:user_detail).permit(:user_name, :email_id, :mobile_number, :loan_amount, :tenure)
  end
end
