module UsersHelper

  def compare_answers versus
    count = 0
    global = versus.answers.map(&:choice_id)
    user = versus.answers.where(user_id: @user).map(&:choice_id)
    user.each { |answer| count += global.count(answer) - 1 }
    (count * 100.0 / (global.count - user.count)).round.to_s << "%"
  end

end
