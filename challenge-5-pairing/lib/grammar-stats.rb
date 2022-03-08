class GrammarStats
  def initialize
    @result_array = []
  end

  def check(text) 
    result = (text[0] == text[0].upcase) && ([".", "!", "?"].include? text[-1])
    @result_array << result
    return result
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    trues = @result_array.count(true)
    total = @result_array.count
    return (trues.to_f/total.to_f) * 100
  end
end