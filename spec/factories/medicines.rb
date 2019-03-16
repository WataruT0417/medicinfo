FactoryGirl.define do
  sequence :seq_name do |i| 
    "テスト医薬品#{i}"
  end
  sequence :seq_title do |i| 
    "テストタイトル#{i}"
  end
  sequence :seq_request_staff do |i| 
    "テスト 質問者#{i}"
  end
  sequence :seq_detail do |i| 
    "詳細テスト#{i} " * 10
  end
  sequence :seq_source do |i| 
    "情報源テスト#{i}"
  end
  sequence :seq_report_staff do |i| 
    "テスト 報告者#{i}"
  end
  

  factory :medicine do
    name {generate :seq_name}
    title {generate :seq_title}
    reported_at "2019/12/31"
    request_staff {generate :seq_request_staff}
    detail {generate :seq_detail}
    source {generate :seq_source}
    report_staff {generate :seq_report_staff}
  end 

end
