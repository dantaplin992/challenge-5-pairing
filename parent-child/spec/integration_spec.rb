require 'music_library'
require 'track'

RSpec.describe 'integration' do
  context 'we want to add a track to the library' do
    it 'adds the track & returns it in the list' do
      lib = MusicLibrary.new
      track_1 = Track.new("Flashback", "Hiromi")
      lib.add(track_1)
      expect(lib.all).to eq [track_1]
    end
  end

  context 'we want to search tracks by keyword' do
    it 'returns a list of track objects where title or artist contain the keyword' do
      lib = MusicLibrary.new
      track_1 = Track.new("Flashback", "Hiromi")
      track_2 = Track.new("Tempest Pulse", "Greg Howe")
      lib.add(track_1)
      lib.add(track_2)
      expect(lib.search("Tempest")).to eq [track_2]
      expect(lib.search("Hiromi")).to eq [track_1]
    end
  end
end