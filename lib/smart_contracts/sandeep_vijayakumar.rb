require 'insurance_plan_1'

class SandeepVijayakumar < InsurancePlan1
  ISSUED_DATE = Date.parse('12/01/2018')
  EXPIRY_DATE = Date.parse('12/01/2020')

  ADDITIONAL_DIAGNOSIS_CODE = {
    :'A028' => {
      copay: 15,
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

  def self.eligible_for_diagnosis_code?(short_desc)
    short_desc = short_desc.to_sym
    diag_row = DiagnosisCode.find_by_short_desc(short_desc)

    return false if diag_row.nil?

    code = diag_row.code
    bool = (ADDITIONAL_DIAGNOSIS_CODE.keys + ACCEPTED_DIAGNOSIS_CODE.keys).include?(code.to_sym)
    bool ? code : false
  end

  def self.eligible_for_diagnosis_code
    ADDITIONAL_DIAGNOSIS_CODE.merge(ACCEPTED_DIAGNOSIS_CODE)
  end

  def self.show_html
    all_diag = ADDITIONAL_DIAGNOSIS_CODE.merge(ACCEPTED_DIAGNOSIS_CODE)
    html = "<div>Your contract issued on #{ISSUED_DATE}</div><br>"
    html = "<div>Your contract expires on #{EXPIRY_DATE}</div><br>"
    html << "<div>More details:</div>"
    html << "</ul>"
    all_diag.each do |k, v|
      diag = DiagnosisCode.find_by_code(k.to_s).short_desc
      html << "<li>You can visit #{v[:doctors].join(', ')} for #{diag} and the copay is #{v[:copay]}</li>"
    end
    html << "</ul>"
    html.html_safe
  end
end
