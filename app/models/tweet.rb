# == Schema Information
#
# Table name: tweets
#
#  id       :bigint(8)        not null, primary key
#  content  :string(255)      default(""), not null
#  users_id :bigint(8)        not null
#

class Tweet < ApplicationRecord
end
