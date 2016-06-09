module UsersHelper

  def compare_answers user, theme, scope
    count = 0
    user_answers = theme.answers.where(user_id: user).map(&:choice_id)
    if user_answers.empty?
      return 'N/R'
    elsif scope == 'all'
      global = theme.answers.map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) - 1 }
      return (count * 100.0 / (global.count - user_answers.count)).round.to_s << '%'
    else
      global = theme.answers.where(user_id: scope).map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) }
      return  (count * 100.0 / user_answers.count).round.to_s << '%'
    end
  end

end
