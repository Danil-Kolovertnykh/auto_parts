class PartsSoftService
  URL_BASE = 'http://ohmyparts.ru/'
  API_KEY = Setting.find_by_name("api_key")&.value

  def self.get_offers_by_oem_and_make_name(oem,make_name)
    params_search = '?oem=' + oem + '&make_name=' + make_name + '&api_key=' + API_KEY + '&without_cross=false'
    url = URL_BASE + 'backend/price_items/api/v1/search/get_offers_by_oem_and_make_name' + params_search

    result = HTTParty.get(url)['data']
    result = result.select { |item| item["make_name"] == make_name && item["oem"] == oem} if result.present?
    result
  end

  def self.get_brands_by_oem(oem)
    params_search = '?oem=' + oem + '&api_key=' + API_KEY
    url = URL_BASE + 'backend/price_items/api/v1/search/get_brands_by_oem' + params_search
    HTTParty.get(url)['data']
  end

  def self.cart_items
    url = URL_BASE + 'api/v1/baskets' + '?api_key=' + API_KEY
    HTTParty.get(URI(url))['data']
  end

  def self.add_item_cart(item_params)
    url = URL_BASE + 'api/v1/baskets' + '?api_key=' + API_KEY
    HTTParty.post(URI(url), body: item_params.to_json)
  end

end




