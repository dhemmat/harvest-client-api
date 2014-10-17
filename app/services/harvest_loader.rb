class HarvestLoader
  def self.getHarvestInstance
    Harvest.client(subdomain: HARVEST_CONFIG["subdomain"], username: HARVEST_CONFIG["username"], password: HARVEST_CONFIG["password"])
  end
end
