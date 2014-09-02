FactoryGirl.define do
  factory :project do
    name "Example project"
    description "Description for project"
    start_at "2014-07-01"
    end_at "2014-08-01"
    expected_progress 20
    current_progress 10
    unit "km"
    is_decimal_unit "false"
    target "200"
    is_consumed "false"
    created_at "2014-09-01"
    alert_type "OFF"
    init_progress 0
  end
end