class User < ApplicationRecord
  authenticates_with_sorcery!

  enum role: { general:0, admin:1 }
  has_many :multiple_choice_challengers, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    %w[name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
