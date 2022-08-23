class Book < ApplicationRecord
 # ユーザーに属する
 belongs_to :user

 validates :title, presence: true
 validates :body, presence: true
end