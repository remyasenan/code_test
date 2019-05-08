class Client < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :full_name, presence: true, length: {maximum: 100}
	validates :business_name, presence: true, length: {maximum: 100}
	validates :email, presence: true, length: {maximum: 80}, format: {with: VALID_EMAIL_REGEX}
  	validates :tel_num, presence: true, length: { maximum: 13 }
end
