# frozen_string_literal: true

class Organisation < ApplicationRecord
  has_many :users, dependent: :restrict_with_exception

  validates :name, presence: true
end
