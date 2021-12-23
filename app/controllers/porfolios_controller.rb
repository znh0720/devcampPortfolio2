class PorfoliosController < ApplicationController
  layout "portfolio"

	def index
		@portfolio_item = Porfolio.all
	end

	def new
		@portfolio_item = Porfolio.new
	end

	def create
	    @portfolio_item = Porfolio.new(portfolio_params)

	    respond_to do |format|
	      if @portfolio_item.save
	        format.html { redirect_to porfolios_path, notice: "Your portfolio item is now live" }
	       
	      else
	        format.html { render :new, status: :unprocessable_entity }
	        
	      end
    end
  end

  def edit
  	@portfolio_item = Porfolio.find(params[:id])
  end

  def update
  	@portfolio_item = Porfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to porfolios_path, notice: "Blog was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@portfolio_item = Porfolio.find(params[:id])
  end

  def destroy
  	# Perform the lookup
  	@portfolio_item = Porfolio.find(params[:id])
  	
  	# Destroy/Delete the record
  	@portfolio_item.destroy
    
  	# Redirect
    respond_to do |format|
      format.html { redirect_to porfolios_url, notice: "Record was removed." }
      format.json { head :no_content }
    end
  end

  private 

  def portfolio_params
    params.require(:porfolio).permit(:title, :subtitle, :body)
  end

end
