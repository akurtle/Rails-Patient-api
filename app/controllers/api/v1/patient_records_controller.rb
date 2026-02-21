# frozen_string_literal: true

module Api
  module V1
    class PatientRecordsController < BaseController
      def index
        records = policy_scope(PatientRecord).order(created_at: :desc)
        authorize PatientRecord
        render json: records.as_json(include: { patient: { only: [:id, :email, :role] } })
      end

      def show
        record = PatientRecord.find(params[:id])
        authorize record
        render json: record.as_json(include: { patient: { only: [:id, :email, :role] } })
      end

      def create
        record = PatientRecord.new(record_params)
        authorize record
        record.save!
        render json: record, status: :created
      end

      def update
        record = PatientRecord.find(params[:id])
        authorize record
        record.update!(record_params)
        render json: record
      end

      def destroy
        record = PatientRecord.find(params[:id])
        authorize record
        record.destroy!
        head :no_content
      end

      private

      def record_params
        params.require(:patient_record).permit(:patient_id, :summary, :diagnosis, :notes)
      end
    end
  end
end