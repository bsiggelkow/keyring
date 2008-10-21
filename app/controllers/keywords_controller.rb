class KeywordsController < ApplicationController
  def create 
    @keyword = Keyword.create(params[:keyword])
  end
  
  def clear_all
    Keyword.destroy_all
  end
end
