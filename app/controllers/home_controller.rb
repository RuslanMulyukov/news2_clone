class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @news = New.all
  end
end
