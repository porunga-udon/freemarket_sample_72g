class GoodsController < ApplicationController
  def index
    @good = Good.all
  end

  def new
    @good = Good.new
   # @category = Category.new
   # @size = Size.new
   # @goog_image = Good_image.new
  end


  def show

  end
end