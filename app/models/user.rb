# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable, :omniauthable,
    omniauth_providers: %i[google github]

  validates :name, presence: true

  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many :transactions, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :sub_categories, as: :categorizable, dependent: :destroy,
                            inverse_of: :categorizable, class_name: 'Category'
end
