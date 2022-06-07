class LearnsController < ApplicationController

  def index
    @learns = Learn.all.order("created_at DESC")
  end

  def new
    @learn = Learn.new
  end

end
