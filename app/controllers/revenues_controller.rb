class RevenuesController < ApplicationController
  
  def index
		@revenues = Revenue.order(created_at: :asc)
	end

	def show
		@revenue = Revenue.find(params[:id])
	end

	def new
		@revenue = Revenue.new()
	end

	def edit
		@revenue = Revenue.find(params[:id])
	end

	def create
		#@revenue = Expense.new(params[:revenue])
		@revenue = Revenue.new(revenue_params)
		if @revenue.save
			redirect_to @revenue, notice: "収入を登録しました"
		else
			render "new"
		end	
	end

	def update
		@revenue = Revenue.find(params[:id])
		#@revenue.assign_attributes(params[:revenue])
		@revenue.assign_attributes(revenue_params)
		if @revenue.save
			redirect_to @revenue, notice: "収入を登録しました"
		else
			render "new"
		end
	end

	def destroy
		@revenue = Revenue.find(params[:id])
		@revenue.destroy
		redirect_to :revenues, notice: "収入を削除しました。"
	end
	
	private
		def revenue_params
			params.require(:revenue).permit(:name, :value, :description)
		end
end
