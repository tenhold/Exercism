class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    a, b, first, *rest = each_wagons_id

    [first, *missing_wagons, *rest, a, b]
  end

  def self.add_missing_stops(route, **kargs)
    route.merge(stops: kargs.values)
  end

  def self.extend_route_information(route, more_route_information)
    route.merge(**more_route_information)
  end
end
