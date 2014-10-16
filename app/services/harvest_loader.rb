class HarvestLoader

  def getHarvestInstance
    Harvest.client(HARVEST_CONFIG["subdomain"], HARVEST_CONFIG["username"], HARVEST_CONFIG["password"])
  end
  
end
