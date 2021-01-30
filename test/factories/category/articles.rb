FactoryBot.define do
  factory :category_article, class: 'Category::Article' do
    title { "MyString" }
    body { "MyText" }
  end
end
