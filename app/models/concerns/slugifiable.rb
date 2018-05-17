require 'pry'

module SlugLife
  module InstanceMethods
    def slug
      name.downcase.gsub(" ","-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      name = slug.gsub("-", " ")
      where('lower(name) = ?', name.downcase)[0]
    end
  end
end
