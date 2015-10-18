require 'sinatra'

get '/' do
  erb :form
end

post '/' do
  def recursive_nth_fibonacci_number(num)
    return 0 if num == 0
    return 1 if num == 1
    recursive_nth_fibonacci_number(num - 1) + recursive_nth_fibonacci_number(num - 2)
  end

  def case_nth_number_suffix(num)
    num = num.to_s
    if num.length == 2 && num[0] == "1"
      return "#{num}th"
    end

    case num[-1]
    when "1"
      return "#{num}st"
    when "2"
      return "#{num}nd"
    when "3"
      return "#{num}rd"
    else
      return "#{num}th"
    end
  end

  if params[:number].to_i > 40
    return "Try again, recursion doesn't work well for Fibonacci numbers after the ~40th place :)"
  else
    "The #{case_nth_number_suffix(params[:number].to_s)} Fibonacci number is #{recursive_nth_fibonacci_number(params[:number].to_i)}."
  end
end
