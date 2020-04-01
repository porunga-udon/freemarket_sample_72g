class GoodsController < ApplicationController
  def index
    @good = Good.all
  end
end
