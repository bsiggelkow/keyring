require 'rubygems'
require 'bossman'
require 'ruby-debug'
class BossmanClient
  include BOSSMan
  BOSSMan.application_id = 'nwY38pPV34HJZ72RFQHmNS5.7rh.cOQOVAO0d2_0lC.HZeZGIwmlUHLaau344F7Aqg--'
  
  def search(*args)
    search_results = []
    args.each do |keyword| 
      boss = BOSSMan::Search.web("\"#{keyword}\"", :count => 10)
      unless boss.totalhits.to_i == 0
        boss.results.each do |boss_result| 
          search_results << SearchResult.new(boss_result)
        end
      end
    end   
    search_results.flatten.uniq
  end

  # def search(*args)
  #   results = []
  #   query = args.collect {|keyword| "\"#{keyword}\""}.join(' ') 
  #   boss = BOSSMan::Search.web(query, :count => 10*args.size)
  #   boss.results.each do |boss_result| 
  #     results << { :title => boss_result.title, 
  #                  :abstract => boss_result.abstract, 
  #                  :date => boss_result.date,
  #                  :url => boss_result.clickurl }
  #   end
  #   results.flatten.compact.uniq
  # end

end