module Counter

  private
  def set_counter
    @counter = session[:counter].nil? || session[:counter] >= 5 ? reset_counter : update_counter
  end

  def update_counter
    session[:counter] += 1
  end

  def reset_counter
    session[:counter] = 0
  end
end
