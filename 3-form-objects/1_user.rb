# 1. What if the user fails to save after saving the company?
# 2. wtf does user#company return? strings?
# 3. how do you create _just_ a fscking user
class User < ActiveRecord::Base
  attr_accessor :company

  belongs_to :company

  attr_accessible :company, :name, :email
  before_create :create_company

  validates :company, length: { minimum: 3 }, on: :create

  def create_company
    self.company = Company.create!(name: read_attribute(:company))
  end
end
