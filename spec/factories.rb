FactoryBot.define do
  factory :pie_graph do
    score1 { 1 }
    score2 { 1 }
    score3 { 1 }
  end
  factory :gauge_graph do
    score { 1 }
    total { 1 }
  end
  factory :line_graph do
    score1 { 1 }
    score2 { 1 }
    score3 { 1 }
  end

  factory :circle_graph do
    score { 1 }
    total { 1 }
  end

  factory :bar_graph do
    score1 { 1 }
    score2 { 1 }
  end

end
