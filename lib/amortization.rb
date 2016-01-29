module Amortization
	def self.calculate(loan_amount, rate_of_interest = 0.0000001, tenure)
		
monthly_interest_rate = (rate_of_interest / 12)/100
   total_number_of_months = tenure * 12
   
   factor = (1 + monthly_interest_rate) ** total_number_of_months
   emi = (loan_amount * monthly_interest_rate * factor) / (factor - 1)
		return emi
	end
end
