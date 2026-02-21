# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  enum role: { patient: 0, clinician: 1, admin: 2 }

  has_many :patient_records, foreign_key: :patient_id, dependent: :destroy

  validates :role, presence: true
end