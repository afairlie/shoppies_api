class Nomination < ApplicationRecord
  belongs_to :user

  validates :'1', presence: true
  validates :'2', presence: true
  validates :'3', presence: true
  validates :'4', presence: true
  validates :'5', presence: true
end
