# == Schema Information
#
# Table name: users
#
#  id      :bigint(8)        not null, primary key
#  name    :string(255)      default(""), not null
#  id_name :string(255)      default(""), not null
#

class User < ApplicationRecord
end
