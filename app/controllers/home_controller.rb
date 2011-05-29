class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @articles = Article.order("created_at").page(params[:page]).per(3)
  end

  def vote
    if params[:user_id].present? && params[:article_id].present?
      voter = User.find(params[:user_id])
      article = Article.find(params[:article_id])
      if voter.present? && article.present?
        if voter.votes.where(:article_id => article.id).present?
          @voted = true
        else
          voter.votes.create(:article_id => article.id, :result => params[:result])
          if params[:result] == 'for'
            @votes_for = voter.votes.for.where(:article_id => article.id).count
          elsif params[:result] == 'against'
            @votes_against = voter.votes.against.where(:article_id => article.id).count
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

  def articles_by_max
    @articles = Article.all.sort {|a,b| b.votes.count <=> a.votes.count }

    response do
      format.js
    end
  end

  def articles_by_min
    @articles = Article.all.sort {|a,b| a.votes.count <=> b.votes.count }

    response do
      format.js
    end
  end

  def articles_by_date
    @articles = Article.order("created_at").page(params[:page]).per(3)

    response do
      format.js
    end
  end
end
