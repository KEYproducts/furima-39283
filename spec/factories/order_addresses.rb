FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '金沢市' }
    addresses { '青山２－１' }
    building { '青山ビル２０２' }
    phone_number { '09012345678' }
  end
end
