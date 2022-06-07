class LearnsController < ApplicationController

  def index
    @learns = Learn.order("created_at DESC")
  end

end
