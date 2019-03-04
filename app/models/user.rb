# == Schema Information
#
# Table name: users
#
#  id      :bigint(8)        not null, primary key
#  name    :string(255)      default(""), not null
#  id_name :string(255)      default(""), not null
#

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :id_name, presence: true, length: { maximum: 255 }, uniqueness: true

  has_many :tweets, dependent: :destroy, inverse_of: :users
end
