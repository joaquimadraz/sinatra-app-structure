class User < ActiveRecord::Base

  def self.random_name
    firsts = ["Scarlett", "Jeniffer", "Elisha", "Megan", "Joaquina"]
    lasts  = ["Johansson", "Lawrence", "Cuthbert", "Fox", "da Silva"]

    "#{firsts.sample} #{lasts.sample}"
  end

end