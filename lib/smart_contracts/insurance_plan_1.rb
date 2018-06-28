class InsurancePlan1

  ACCEPTED_DIAGNOSIS_CODE = [
    'A0104',
    'A0109'
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
