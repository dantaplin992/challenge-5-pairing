require 'diary'

RSpec.describe Diary do

  context 'we want to add and read a diary entry' do
    it 'adds and reads an entry' do
      diary = Diary.new
      entry_1 = double("diary_entry", :title => "11 Mar", :contents => "What a day!")
      diary.add_entry(entry_1)
      expect(diary.read_entry("11 Mar")).to eq "What a day!"
    end

    it 'reads a specific entry by title' do
      diary = Diary.new
      entry_1 = double("diary_entry", :title => "11 Mar", :contents => "What a day!")
      entry_2 = double("diary_entry", :title => "12 Mar", :contents => "An even better day!")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.read_entry("12 Mar")).to eq "An even better day!"
    end
  end

  context 'recommends an entry to read' do

    it 'calculates the number of words in an entry' do
      diary = Diary.new
      entry_1 = double("diary_entry", :title => "11 Mar", :contents => "What a day!")
      diary.add_entry(entry_1)
      expect(diary.word_count(entry_1)).to eq 3
    end

    it 'returns a list of entries that could be read with the given time & speed' do
      diary = Diary.new
      entry_1 = double("diary_entry", :title => "11 Mar", :contents => "What a day!")
      entry_2 = double("diary_entry", :title => "12 Mar", :contents => "An even better day!")
      diary.add_entry(entry_1)
      diary.add_entry(entry_2)
      expect(diary.recommend_entries(3, 1)).to eq ["11 Mar"]
      expect(diary.recommend_entries(4, 1)).to eq ["11 Mar", "12 Mar"]
      expect(diary.recommend_entries(0, 1)).to eq []
    end

  end
end