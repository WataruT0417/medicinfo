FactoryGirl.define do
  sequence :seq_staff_name do |i| 
    "テスト 職員#{i}"
  end

  factory :staff do
    name {generate :seq_staff_name}
  end
end
