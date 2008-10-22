class MainController < ApplicationController
  def index
    @keywords = Keyword.all
    do_search
  end
  
  def search
    @keywords = Keyword.all
    do_search
  end

  private
  
  def do_search
    b = BossmanClient.new
    results = b.search(*@keywords.collect{|keyword| keyword.phrase})
    @results = results.sort {|a,b| b.date <=> a.date}
  end
    
end
