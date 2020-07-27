class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  belongs_to :last_visited_store, class_name: 'Store', optional: true

  has_many :roles
  has_many :stores, through: :roles
end
