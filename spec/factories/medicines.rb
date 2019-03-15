FactoryGirl.define do
  sequence :seq_id do |i| 
    i.to_i
  end
  sequence :seq_name do |i| 
    "テスト医薬品#{i}"
  end
  sequence :seq_title do |i| 
    "テストタイトル#{i}"
  end
  sequence :seq_code do |i| 
    "TEST-#{i}"
  end
  sequence :seq_approval do |i| 
    "テスト 職員#{i}"
  end

  factory :medicine do
    name {generate :seq_name}
    title {generate :seq_title}
    code {generate :seq_code}
    reported_at "2019/12/31"
    approval {generate :seq_approval}
  end 

end
