require 'track'

RSpec.describe Track do
  context 'we search the track for a given keyword' do
    it 'returns true if title or artist contiain the keyword' do
      track = Track.new("Spark", "Hiromi")
      expect(track.matches?("Spark")).to eq true
    end

    it 'returns true if title or artist contiain the keyword in a longer string' do
      track = Track.new("All Things Considered", "Simon Phillips")
      expect(track.matches?("Things")).to eq true
    end

    it 'returns false if neither title nor artist contain the keyword' do
      track = Track.new("All Things Considered", "Simon Phillips")
      expect(track.matches?("Hiromi")).to eq false
    end
  end
end