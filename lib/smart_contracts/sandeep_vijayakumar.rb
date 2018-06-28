require 'insurance_plan_1'

class SandeepVijayakumar < InsurancePlan1
  ISSUED_DATE = Date.parse('12/01/2018')
  EXPIRY_DATE = Date.parse('12/01/2020')

  ADDITIONAL_DIAGNOSIS_CODE = [
    'A028'
  ]

  def self.expired?(date)
    EXPIRY_DATE > date
  end

  def self.expiry_date
    EXPIRY_DATE
  end

  def self.eligible_for_diagnosis_code?(code)
    (ADDITIONAL_DIAGNOSIS_CODE + ACCEPTED_DIAGNOSIS_CODE).include?(code)
  end
end
