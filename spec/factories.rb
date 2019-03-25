FactoryBot.define do
  factory :pie_graph do
    scores { [1, 1] }
  end

  factory :gauge_graph do
    score { 1 }
    total { 1 }
  end

  factory :line_graph do
    scores  { [1, 1] }
    maximum { 1 }
  end

  factory :circle_graph do
    score { 1 }
    total { 1 }
  end

  factory :bar_graph do
    scores  { [1, 1] }
    maximum { 1 }
  end

end
