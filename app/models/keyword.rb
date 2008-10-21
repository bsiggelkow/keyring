# == Schema Information
# Schema version: 20081017013729
#
# Table name: keywords
#
#  id         :integer         not null, primary key
#  phrase     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Keyword < ActiveRecord::Base
  validates_presence_of :phrase
  validates_uniqueness_of :phrase
end
