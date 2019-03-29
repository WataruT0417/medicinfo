FactoryBot.define do
  sequence :seq_doubt_name do |i| 
    "テスト医薬品#{i}"
  end
  sequence :seq_doubt_title do |i| 
    "テストタイトル#{i}"
  end
  sequence :seq_doubt_doctor do |i| 
    "テスト 医師#{i}"
  end
  sequence :seq_doubt_detail do |i| 
    "詳細テスト#{i} " * 10
  end

  factory :doubt do
    name {generate :seq_doubt_name}
    title {generate :seq_doubt_title}
    reported_at {"2019/12/31"}
    doctor {generate :seq_doubt_doctor}
    detail {generate :seq_doubt_detail}
    report_staff {"テスト 報告者1"}
  end 
  
end
