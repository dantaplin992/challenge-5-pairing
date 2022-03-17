class Diary
  def initialize
    @entries = []
  end

  def add_entry(entry)
    @entries << entry
  end

  def read_entry(title)
    for entry in @entries do
      if entry.title == title
        return entry.contents
      end
    end
  end

  def recommend_entries(minutes, wpm)
    recommended = []
    max_words = (minutes * wpm).ceil
    for entry in @entries do
      words = word_count(entry)
      if words <= max_words
        recommended << entry.title
      end
    end
    return recommended
  end

  def word_count(entry)
    entry.contents.split(" ").count
  end
end