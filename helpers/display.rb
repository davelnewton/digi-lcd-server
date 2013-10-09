def display_message(message, spark, options={})
  puts message
  frames = encode_frames(message)
  if options[:loop]
    options[:loop].to_i.times do
      display_frames(frames, spark)
    end
  else
    display_frames(frames, spark)
  end
end

def display_frames(frames, spark)
  puts frames.inspect
  frames.each do |frame|
    spark.puts "#{frame[0]}\n#{frame[1]}"
    sleep(1.5)
  end
end

def split_words_sixteen(message)
  if message[" "].nil?
    split_message = [message]
  else
    split_message = message.split(" ")
  end
  further_split = []
  split_message.each do |word|
    if word.length > 16
      n = 0
      ((word.length/16)+1).times do
        further_split.push word[(n*16)..(((n+1)*16)-1)]
        n+=1
      end
    else
      further_split.push word
    end
  end
  further_split
end

def encode_frames(message, final_message=[])
  if message == nil
    final_message.push ["Message was empty.", " "]
  else
    if message.length <= 16
      final_message.push [message, " "]
    else
      line_1 = []
      line_2 = []
      final_encoded = false
      line_1_open = true
      line_2_open = true
      leftover_words = []
      final_message_pushed = false
      split_words = split_words_sixteen(message)
      split_words.each_with_index do |word, n|
        line_1_open = false if (line_1.join(" ") + " " +  word).length > 16 && line_1_open
        line_2_open = false if (line_2.join(" ") + " " +  word).length > 16 && line_2_open
        if (line_1.join(" ") + " " + word).length <= 16 && line_1_open 
          line_1.push word
        elsif (line_2.join(" ") + " " + word).length <= 16 && line_2_open 
          line_2.push word
        end
        if !line_1_open && !line_2_open && !final_message_pushed
          final_message.push [line_1.join(" "), line_2.join(" ")]
          final_message_pushed = true
        elsif !line_1_open && !line_2.empty? && !final_message_pushed && split_words[n] != nil && (line_2.join(" ") + " " +  split_words[n]).length > 16
          final_message.push [line_1.join(" "), line_2.join(" ")]
          final_message_pushed = true
        elsif !line_1_open && line_1[-1] == word && !final_message_pushed
          final_message.push [line_1.join(" "), " "]
          final_message_pushed = true
        elsif !line_1_open && line_2[-1] == word && split_words[-1] == word && !final_message_pushed
          final_message.push [line_1.join(" "), line_2.join(" ")]
          final_message_pushed = true
          message_over = true
        end
        if final_message_pushed && !message_over
          leftover_words.push word
        end
      end
      if leftover_words.empty?
        final_message
      else

        encode_frames(leftover_words.join(" "), final_message)
      end
    end
  end
end