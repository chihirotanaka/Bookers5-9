class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end
  def about
  end

end
