class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, uniqueness: true, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_one :applicants

  has_many :applicants

  # ,:dependent => :destroy
end
