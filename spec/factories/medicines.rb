FactoryBot.define do
  sequence :seq_medicine_name do |i| 
    "テスト医薬品#{i}"
  end
  sequence :seq_medicine_title do |i| 
    "テストタイトル#{i}"
  end
  sequence :seq_medicine_request_staff do |i| 
    "テスト 質問者#{i}"
  end
  sequence :seq_medicine_detail do |i| 
    "詳細テスト#{i} " * 10
  end
  sequence :seq_medicine_source do |i| 
    "情報源テスト#{i}"
  end

  factory :medicine do
    name {generate :seq_medicine_name}
    title {generate :seq_medicine_title}
    reported_at {"2019/12/31"}
    request_staff {generate :seq_medicine_request_staff}
    detail {generate :seq_medicine_detail}
    source {generate :seq_medicine_source}
    report_staff {"テスト 報告者1"}
  end 

end
