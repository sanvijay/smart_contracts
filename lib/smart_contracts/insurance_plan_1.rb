class InsurancePlan1

  ACCEPTED_DIAGNOSIS_CODE = {
    :'A0104' => {
      copay: '20',
      doctors: ['Akshay', 'Praveen', 'Buvi']
    },
    :'A0109' => {
      copay: '10',
      doctors: ['Raghav', 'Prem', 'Abhishek']
    }
  }

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
