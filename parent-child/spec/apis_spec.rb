require 'apis'

RSpec.describe CatFacts do
  it 'returns a cat fact from the api' do
    req_double = double(:requester)
    cat_facts = CatFacts.new(req_double)
    allow(req_double).to receive(:get).and_return('{"fact":"When a domestic cat goes after mice, about 1 pounce in 3 results in a catch.","length":76}')
    expect(cat_facts.provide).to eq "Cat fact: When a domestic cat goes after mice, about 1 pounce in 3 results in a catch."
  end
end