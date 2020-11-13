FactoryBot.define do
  factory :post do
    uuid { "" }
    simple_image { nil }
    title { "MyString" }
    slug { "MyString" }
    lead { "MyText" }
    body { "MyText" }
    data { "" }
  end
end
