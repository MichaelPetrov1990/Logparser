require './lib/log_parser'

describe 'LogParser', :LogParser do
  it "should not run when a file path hasn't been supplied" do
    expect { LogParser.new }.to output(/Please add log file path/).to_stdout
  end
  it "Should let user know that it couldn't find the log file path" do
    wrong_file_path = 'random_file_path'
    expect { LogParser.new(wrong_file_path) }.to output(/Unable to find file: random_file_path/).to_stdout
  end
  it 'should respond to proper methods' do
    expect(subject.respond_to?(:extract_log_file))
    expect(subject.respond_to?(:sort_results))
    expect(subject.respond_to?(:display_results))
  end
end

describe 'display_results', :display_results do
  it 'should create a hash with count' do
    total_views = @total_views
    expect(total_views.respond_to?(:to_h))
  end
end