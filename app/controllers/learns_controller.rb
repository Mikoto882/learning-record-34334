class LearnsController < ApplicationController

  def index
    @learns = Learn.all.order("created_at DESC")
  end

end
