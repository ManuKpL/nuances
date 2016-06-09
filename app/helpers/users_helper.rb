module UsersHelper

  def compare_answers versus, user
    count = 0
    user_answers = versus.answers.where(user_id: @user).map(&:choice_id)
    if user == 'all'
      global = versus.answers.map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) - 1 }
      return (count * 100.0 / (global.count - user_answers.count)).round.to_s << '%'
    else
      global = versus.answers.where(user_id: user).map(&:choice_id)
      user_answers.each { |answer| count += global.count(answer) }
      return  (count * 100.0 / user_answers.count).round.to_s << '%'
    end
  end

end
