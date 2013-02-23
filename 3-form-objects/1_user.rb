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
