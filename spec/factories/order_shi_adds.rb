FactoryBot.define do
  factory :order_shi_adds do
    post_code         {'222-3444'}
    sender_id         {'2'}
    locality          {"松前市"}
    address           {"青山1-2-2"}
    phone             {'06066554321'}
    token             {"sk_test_ee23337fdd8cb182d4762176"}
    association :user
    association :item
    association :order
  end
end
