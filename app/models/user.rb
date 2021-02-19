class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         validates :name, presence: true
         has_many :cars, dependent: :destroy
         has_many :favorites, dependent: :destroy
         
         def already_favorited?(car)
           self.favorites.exists?(car_id: car.id)
         end
         #self=current.user exists?=存在するか
         #current.userに結びついている car_idがいいねをしようとしているcar.idが存在するか否かを調べる
         #ture=いいねを外す　false＝いいねをする
end
