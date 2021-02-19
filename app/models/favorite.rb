class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :car
    
   validates_uniqueness_of :car_id, scope: :user_id #いいねを一回のみに縛る書き方
end
