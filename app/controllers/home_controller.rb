class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @articles = Article.order("created_at").page(params[:page]).per(3)
  end

  def vote
    if params[:user_id].present? && params[:article_id].present?
      voter = User.find(params[:user_id])
      if voter.present?
        if voter.votes.where(:article_id => params[:article_id]).present?
          @voted = true
        else
          voter.votes.create(:article_id => params[:article_id], :result => params[:result])
          if params[:result] == 'for'
            @votes_for = voter.votes.for.where(:article_id => params[:article_id]).count
          elsif params[:result] == 'against'
            @votes_against = voter.votes.against.where(:article_id => params[:article_id]).count
          end
        end
      end
    else  
      @error = true
    end

    response do
      format.js
    end
  end
end
