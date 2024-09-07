# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'
# pp "The candidates are #{@candidates}"
  def find(id)
    # Your code Here
    @candidates.each do |i|
      if i[:id] == id
        return i
      end
    end
    return nil
  end
  
  def experienced?(candidate)
    # Your code Here
    candidate[:years_of_experience] >= 2
  end
  
  def has_100_github_points candidate
    candidate[:github_points] >= 100
  end

  def knows_ruby_or_py candidate
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end

  def applied_in_last_15_days candidate
    candidate[:date_applied] >= 15.days.ago.to_date
  end

  def is_atleast_18 candidate
    candidate[:age] >= 18
  end

  def qualified_candidates(candidates)
    # Your code Here
    qualified = []
    candidates.each do |c|
      if experienced?(c) && has_100_github_points(c) && knows_ruby_or_py(c) && applied_in_last_15_days(c) && is_atleast_18(c)
        qualified.push(c)
      end
    end
    qualified
  end
  
  # More methods will go below

  single = {
    id: 5,
    years_of_experience: 1,
    github_points: 293,
    languages: ['C', 'Ruby', 'Python', 'Clojure'],
    date_applied: 5.days.ago.to_date,
    age: 6
  }
  result = qualified_candidates(@candidates)
  # puts "Date applied: #{result}"
  # pp "The candidate with id 7 is: #{result}"

  pp "The qualified candidates are: #{result}"

  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end