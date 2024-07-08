require_relative '../url_parser'
# RSPEC keyword
# 1. describe -> naming the method
# 2. it -> describes the test in English
# 3. expect -> calling the method and comparing it

describe '#parse_url' do
  it 'should return a hash (with no path or params)' do
    actual = parse_url("http://www.lewagon.com/")
    expected = { scheme: "http", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: [], params: {} }
    expect(actual).to match(expected)
  end

  it 'should return a hash (with a path and no params)' do
    actual = parse_url("https://www.lewagon.com/courses/apply")
    expected = { scheme: "https", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: ["courses", "apply"], params: {} }
    expect(actual).to match(expected)
  end

  it 'should return a hash (with a path and params)' do
    actual = parse_url("https://www.lewagon.com/berlin?search=currywurst")
    expected = { scheme: "https", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: ["berlin"], params: { search: "currywurst" } }
    expect(actual).to match(expected)
  end

  it 'should return a hash (with a path and multiple params)' do
    actual = parse_url("https://www.lewagon.com/berlin?search=currywurst&feature=livecode")
    expected = { scheme: "https", subdomain: "www", domain: "lewagon", top_level_domain: ".com", path: ["berlin"], params: { search: "currywurst", feature: 'livecode' } }
    expect(actual).to match(expected)
  end
end
