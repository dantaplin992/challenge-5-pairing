class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @current_text = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    # Returns the number of words in the contents as an integer
    @contents.split(" ").count
  end

  def reading_time(wpm) # wpm is an integer representing the number of words the
                        # user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # for the contents at the given wpm.
    words = @contents.split(" ")
    (words.length / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes) 
    if @current_text.empty?
      @current_text = @contents
    end
    return_words = []
    text = @current_text.split(" ")
    how_many_words = wpm * minutes
    for num in [0..(how_many_words-1)] do
      return_words << text[num]
      text.slice!(num)
    end
    @current_text = text.join(" ")
   return return_words[0..(how_many_words-1)].join(" ")
  end
end

diary_entry = DiaryEntry.new("Monday Morning", "Feeling tired need sleep")
diary_entry.reading_chunk(2, 1)