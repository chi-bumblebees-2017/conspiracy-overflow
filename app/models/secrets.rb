module Secrets
  def secrets
    no_illuminati
  end

  def no_illuminati
    if title
      if title.match(/illuminati/i)
        errors.add(:title, "is an unacceptable topic in our New World Order.")
      end
    end
    if body.match(/illuminati/i)
      errors.add(:body, "discusses unacceptable topics in our New World Order.")
    end
  end
end
