class List < ApplicationRecord
  has_one_attached :image
  
  # 8章・バリデーション（「必須」入力になるように設定）
  validates :title, presence: true
  validates :body, presence: true
  # validates :image, presence: true
end
