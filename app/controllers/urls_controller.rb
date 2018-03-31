class UrlsController < ApplicationController
	before_action :set_url, only: :destroy
	before_action :find_url, only: :show

  def index
  	@urls = Url.all
  end

  def show
  	redirect_to @url.long
  end

  def new
  	@url = Url.new
  end

  def create
  	@url = Url.new(url_params)

  	respond_to do |format|
      if @url.save
        format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        render :new
      end
    end
  end

  def destroy
  	@url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private

		def set_url
      @url = Url.find(params[:id])
    end

    def url_params
      params.require(:url).permit(:long)
    end

    def find_url
	    	if params[:id].to_i == 0
	    		@url = Url.find_by(short: params[:id])
	    	else
	    		@url = Url.find_by(id: params[:id])
	    	end
    end
  #   def generate(x)
		# 	x.short = SecureRandom.hex(3)
		# end
end
#remote true in _form, views make create.js.erb in corresponding views folder $('#link').text('<%= @url.long %>');
#index.html div id link 
