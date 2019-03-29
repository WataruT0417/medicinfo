FactoryBot.define do
  sequence :seq_staff_name do |i| 
    "テスト 報告者#{i}"
  end

  factory :staff do
    name {generate :seq_staff_name}
  end
end
