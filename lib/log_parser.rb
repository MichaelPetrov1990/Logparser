

class LogParser
  def initialize(log_file_path = nil)
    unless log_file_path
      puts 'Please add log file path'
      return
    end
    unless File.exist?(log_file_path)
      puts 'Unable to find file: ' + log_file_path
      return
    end
    extract_log_file(log_file_path)
  end

  def extract_log_file(log_file_path)
    webpages = Hash.new { |url, ip_address| url[ip_address] = [] }
    File.readlines(log_file_path).each do |line|
      url, ip_address = line.split
      webpages[url] << ip_address
    end
    sort_results(webpages)
  end

  def sort_results(results)
    total_views = {}
    unique_views = {}
    results.each do |url, ip_address|
      total_views[url] = ip_address.length
      unique_views[url] = ip_address.uniq.length
    end
    display_results(total_views, unique_views)
  end

  def display_results(views, unique_views)
    puts 'The most viewed pages are:'
    @total_views_sorted = views.sort_by { |_k, count| -count }
    @total_views_sorted.each { |key, count| puts "#{key} #{count}" }
    puts 'The pages with the most unique views are:'
    @unique_sort = unique_views.sort_by { |_k, count| -count }
    @unique_sort.each { |key, count| puts "#{key} #{count}" }
  end
end

$PROGRAM_NAME == __FILE__ ? LogParser.new(ARGV[0]) : ''