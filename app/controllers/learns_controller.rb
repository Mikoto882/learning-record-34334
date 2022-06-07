class LearnsController < ApplicationController

  def index
    @learns = Learn.all
  end

end
