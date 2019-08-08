class Caseload < ApplicationRecord
  belongs_to :user
  has_many :clients

  def case_manager
    self.user.name
  end
end
