FactoryGirl.define do
  sequence :seq_reaction_name do |i| 
    "テスト医薬品#{i}"
  end
  sequence :seq_reaction_title do |i| 
    "テストタイトル#{i}"
  end
  sequence :seq_reaction_doctor do |i| 
    "テスト 医師#{i}"
  end
  sequence :seq_reaction_detail do |i| 
    "詳細テスト#{i} " * 10
  end
  sequence :seq_reaction_patient_id do |i| 
    "2000#{i} "
  end
  sequence :seq_reaction_patient_name do |i| 
    "テスト 患者#{i} " * 10
  end
  sequence :seq_reaction_report_staff do |i| 
    "テスト 報告者#{i}"
  end

  factory :reaction do
    name {generate :seq_reaction_name}
    title {generate :seq_reaction_title}
    reported_at "2019/12/31"
    doctor {generate :seq_reaction_doctor}
    patient_id {generate :seq_reaction_patient_id}
    patient_name {generate :seq_reaction_patient_name}
    detail {generate :seq_reaction_detail}
    report_staff {generate :seq_reaction_report_staff}
  end 
  
end
