require 'insurance_plan_1'

class SandeepVijayakumar < InsurancePlan1
  ISSUED_DATE = Date.parse('12/01/2018')
  EXPIRY_DATE = Date.parse('12/01/2020')

  ADDITIONAL_DIAGNOSIS_CODE = {
    :'A028' => {
      copay: 50,
      doctors: ['Arvind']
    }
  }

  def self.expired?(date)
    EXPIRY_DATE > date
  end

  def self.expiry_date
    EXPIRY_DATE
  end

  def self.issued_date
    ISSUED_DATE
  end

  def self.eligible_for_diagnosis_code?(code)
    (ADDITIONAL_DIAGNOSIS_CODE.keys + ACCEPTED_DIAGNOSIS_CODE.keys).include?(code.to_sym)
  end

  def self.eligible_for_diagnosis_code
    ADDITIONAL_DIAGNOSIS_CODE.merge(ACCEPTED_DIAGNOSIS_CODE)
  end
end
