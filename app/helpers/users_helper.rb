module UsersHelper

  def compare_answers user, theme, scope
    count = 0
    user_answers = theme.answers.where(user_id: user).map(&:choice_id)
    if user_answers.empty?
      percentage = 'N/R'
      user_data = {
        theme_percentage: percentage,
        total_percentage: (user.answers.count * 100.0 / Query.all.count).round.to_s << '%'
      }
      return user_data
    elsif scope == 'all'
      global = theme.answers.map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) - 1 }
      percentage = (count * 100.0 / (global.count - user_answers.count)).round.to_s << '%'
      user_data = {
        theme_percentage: percentage,
        total_percentage: (user.answers.count * 100.0 / Query.all.count).round.to_s << '%'
      }
      return user_data
    else
      global = theme.answers.where(user_id: scope).map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) }
      percentage = (count * 100.0 / user_answers.count).round.to_s << '%'
      user_data = {
        theme_percentage: percentage,
        total_percentage: (user.answers.count * 100.0 / Query.all.count).round.to_s << '%'
      }
      return user_data
    end
  end

end
