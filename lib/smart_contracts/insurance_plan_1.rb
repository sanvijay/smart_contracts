class InsurancePlan1

  ACCEPTED_DIAGNOSIS_CODE = {
    :'A0104' => {
      copay: 20,
      doctors: ['Akshay', 'Praveen', 'Buvi']
    },
    :'A0109' => {
      copay: 10,
      doctors: ['Raghav', 'Prem', 'Abhishek']
    }
  }

  def self.expired?(date)
    EXPIRY_DATE > date
  end

  def self.expiry_date
    EXPIRY_DATE
  end

  def self.eligible_for_diagnosis_code?(code)
    (ADDITIONAL_DIAGNOSIS_CODE.keys + ACCEPTED_DIAGNOSIS_CODE.keys).include?(code)
  end
end
