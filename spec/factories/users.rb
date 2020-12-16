FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example.com"}
    password              {"abc123"}
    password_confirmation {password}
    last_name             {"てすと"}
    first_name            {"てすと"}
    last_name_kana        {"テスト"}
    first_name_kana       {"テスト"}
    birthday              {"1930-1-1"}
  end
end