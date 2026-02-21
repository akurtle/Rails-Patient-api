# frozen_string_literal: true

class PatientRecord < ApplicationRecord
  belongs_to :patient, class_name: "User"

  validates :summary, presence: true
end