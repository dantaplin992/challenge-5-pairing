require 'exercise1'

RSpec.describe DiaryEntry do
  it 'returns the title as a string' do
    diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired")
    expect(diary_entry.title).to eq "Monday Morning"
  end

  it 'returns the contents as a string' do
    diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired")
    expect(diary_entry.contents).to eq "Feeling tired"
  end

  it 'returns the number of words in contents as an integer' do
    diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired")
    expect(diary_entry.count_words).to eq 2
  end

  it 'returns integer of reading time of contents' do
    diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired")
    expect(diary_entry.reading_time(2)).to eq 1
    expect(diary_entry.reading_time(3)).to eq 1
  end

  it 'returns a string with contents user can read in given minutes' do
    diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired need sleep")
    expect(diary_entry.reading_chunk(2, 2)).to eq "Feeling tired need sleep"
  end

  it 'returns the next readable string if reading chunk is called again' do
    diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired need sleep")
    diary_entry.reading_chunk(2, 1)
    expect(diary_entry.reading_chunk(2, 1)).to eq "need sleep"
  end

  it 'restarts if whole text is read' do
    diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired need sleep")
    diary_entry.reading_chunk(2, 1)
    diary_entry.reading_chunk(2, 1)
    expect(diary_entry.reading_chunk(2, 1)).to eq "Feeling tired"
  end
end