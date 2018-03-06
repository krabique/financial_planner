# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :confirmable, :omniauthable,
    omniauth_providers: %i[google github]

  validates :name, presence: true

  validates_integrity_of  :avatar
  validates_processing_of :avatar

  has_many :transactions, dependent: :destroy
end
