require_relative '../db/config'

class ModelBase
  def self.attributes
    raise NotImplementedError
  end

  def self.all
    raise NotImplementedError
  end

  def ==(other)
    self.class.attributes.all? { |attribute| send(attribute) == other.send(attribute) }
  end
end
