class Bowling


def strike?(roll)
 roll == 10
end

def spare?(frame)
 frame.sum == 10
end

def score(line)
 total = 0
       
 line.each_with_index do |frame, roll| 
  total+=frame.sum
            
  if strike?(frame[0]) && roll != 9
   next_roll = roll+1
   total += line[next_roll].sum
                    
   if strike?(line[next_roll][0])
    second_next_roll = roll+2
    total += line[second_next_roll][0]
   end  
  elsif spare?(frame) 
   total+=line[roll+1][0] unless roll == 9
   end
  end
       
total
        
end
end
