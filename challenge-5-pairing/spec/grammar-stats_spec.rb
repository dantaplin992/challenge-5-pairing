require 'grammar-stats'

RSpec.describe GrammarStats do
  it 'returns true if grammar is correct' do
    grammar_stats = GrammarStats.new
    expect(grammar_stats.check("Good Morning!")).to eq true
    expect(grammar_stats.check("good Morning!")).to eq false
    expect(grammar_stats.check("Good Morning")).to eq false
  end

  it 'returns %(integer) of texts checked that passed' do
    grammar_stats = GrammarStats.new
    grammar_stats.check("Good Morning!")
    grammar_stats.check("good Morning")
    expect(grammar_stats.percentage_good).to eq 50
  end
end