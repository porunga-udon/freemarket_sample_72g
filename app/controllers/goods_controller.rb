class GoodsController < ApplicationController
  def index
    @good = Good.new
  end
end
