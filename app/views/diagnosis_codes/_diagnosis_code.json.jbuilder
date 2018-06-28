json.extract! diagnosis_code, :id, :code, :short_desc, :long_desc, :created_at, :updated_at
json.url diagnosis_code_url(diagnosis_code, format: :json)
