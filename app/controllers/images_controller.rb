class ImagesController < ApplicationController

  def index
  	@images = Image.all
  end

  def new
  	@image = Image.new
  end

  def create
  	# binding.pry
  	new_name = SecureRandom.hex + "." + params["picture"].original_filename
  	# Uploading image here
  	File.open(Rails.root.join('public', 'uploads', new_name), 'wb') do |file|
    	file.write(params[:picture].read)
    end
    Image.create(:pic => new_name)
    redirect_to images_path
  end

  def temp
  	@image = Image.find(10)
  	if @image
  		redirect_to images_path
  	end
  end

end
