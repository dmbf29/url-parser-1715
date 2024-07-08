def parse_url(url)
  #store the regular expression in a variable
  pattern = /^(?<scheme>https?):\/\/(?<subdomain>\w+)\.(?<domain>.+)(?<tld>\.\w{2,3})\/(?<path>[\w\/]*)\??(?<params>.*)$/
  #split up the url in some specific pattern(regexp) using .match
  match_data = url.match(pattern)
  #split by the slash for the path
  paths = match_data[:path].split('/')
  #for the params , first split by & , then iterate , then split by the equal sign
  params = {}
  match_data[:params].split('&').each do |param|
    split_params = param.split('=')
    params[split_params.first.to_sym] = split_params.last
  end
  #turn first value into the key and the second as the value
  #build a hash and fill it with the match data

  {
    scheme: match_data[:scheme],
    subdomain: match_data[:subdomain],
    domain: match_data[:domain],
    top_level_domain: match_data[:tld],
    path: paths,
    params: params
  }
end


# scan version
# param_pairs =  match_data[:params].scan(/(\w+)=(\w+)/)
# param_pairs.each do |param_pair|
#   params[param_pair.first.to_sym] = param_pair.last
# end
