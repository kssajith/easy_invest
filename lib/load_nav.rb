require 'net/http'

class LoadNav

  def initialize
    @scheme_name_id_map = Fund.scheme_name_id_map
  end

  def load_axis_bank_data
    logger.info "Start updating NAV values"

    begin
      data = fetch_data(axis_bank_url)
    rescue Exception => e
      p "Data fetching failed with exception: #{e.class} :: #{e.message}"
      return
    end

    data = data.split("\r\n")
    headings = data.delete_at(0).split(';')

    data.each_with_index do |line, idx|
      next unless line.include?(';')
      date_wise_rec = line.split(';')

      scheme_name = date_wise_rec[headings.index('Scheme Name')].to_s
      fund_id = get_fund_id(scheme_name)
      nav = date_wise_rec[headings.index('Net Asset Value')].to_f
      date = date_wise_rec[headings.index('Date')].to_date

      fnd_dtail = FundDetail.where(fund_id: fund_id, date: date).first_or_create
      fnd_dtail.update(nav: nav)
    end

    logger.info "NAV updaing completed!"
  end

  def axis_bank_url
    base_url = "http://portal.amfiindia.com/DownloadNAVHistoryReport_Po.aspx?mf=53&tp=1&frmdt=01-Apr-2015&todt=%{todt}"
    todt = Time.now.strftime('%d-%b-%Y')
    url = base_url % { todt: todt }
    url
  end

  def fetch_data(url)
    uri = URI(url)
    Net::HTTP.get(uri)
  end

  def logger
    @logger ||= Logger.new(STDOUT)
  end

  def get_fund_id(scheme_name)
    unless @scheme_name_id_map.has_key?(scheme_name)
      Fund.new(scheme_name: scheme_name, fund_house_id: FundHouse.last.id).save!
      @scheme_name_id_map = Fund.scheme_name_id_map
    end

    @scheme_name_id_map[scheme_name]
  end
end
