# frozen_string_literal: true

class PatientRecordPolicy < ApplicationPolicy
  def index?
    user.admin? || user.clinician? || user.patient?
  end

  def show?
    user.admin? || user.clinician? || record.patient_id == user.id
  end

  def create?
    user.admin? || user.clinician?
  end

  def update?
    user.admin? || user.clinician?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      return scope.all if user.admin? || user.clinician?
      scope.where(patient_id: user.id)
    end
  end
end