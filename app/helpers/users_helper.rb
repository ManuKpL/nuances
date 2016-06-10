module UsersHelper

  def compare_answers user, theme, scope
    count = 0
    user_answers = theme.answers.where(user_id: user).map(&:choice_id)
    if user_answers.empty?
      'N/R'
    elsif scope == 'all'
      global = theme.answers.map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) - 1 }
      (count * 100.0 / (global.count - user_answers.count)).round.to_s << '%'
    else
      global = theme.answers.where(user_id: scope).map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) }
      (count * 100.0 / user_answers.count).round.to_s << '%'
    end
  end

  def answered_queries user
    (user.answers.count * 100.0 / Query.all.count).round.to_s << '%'
  end

end
