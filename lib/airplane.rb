class Airplane

  attr_reader :type, :wing_loading, :horse_power, :fuel

  def initialize(type, wing_loading, horse_power, fuel)
    @type = type
    @wing_loading = wing_loading
    @horse_power = horse_power
    @status = "off"
    @flying = false
    @fuel = fuel
  end

  def start
    if status == "off" && fuel >= 25
      self.status = "on"
      self.fuel = fuel - 25
      "airplane started. fuel remaining: #{fuel}"
    elsif status == "on"
      "airplane already started"
    elsif fuel < 25
      "not enough fuel. walk instead."
    end
  end

  def takeoff
    if status == "off"
      "airplane not started, please start"
    else
      self.flying = true
      self.fuel = fuel - 35
      "airplane launched. fuel remaining: #{fuel}"
    end
  end

  def land
    if flying
      self.fuel = fuel - 50
      "airplane landed. fuel remaining: #{fuel}"
    elsif status == "off"
      "airplane not started, please start"
    elsif start == "airplane already started"
      "airplane already on the ground"
    end
  end

  def refuel(gas)
    @fuel += gas
  end

  def fuel=(value)
    @fuel = value
  end

  private

  attr_accessor :status, :flying
  attr_writer :fuel

end
