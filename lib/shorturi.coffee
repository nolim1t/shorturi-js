request = require 'request'

#  coffee -e 'require("./lib/shorturi.coffee").shorturi {url: "http://www.google.com"}, (cb) -> console.log cb'
shorturi = (info, cb) ->
  result = {meta: {code: 400, msg: 'invalid parameters'}, result: undefined}
  if info.url != undefined
    google_url = 'https://www.googleapis.com/urlshortener/v1/url'
    google_payload = {longUrl: info.url}
    payload_content_type = 'application/json'
    request {uri: google_url, method: 'POST', headers: {'Content-type': payload_content_type}, body: JSON.stringify(google_payload)}, (e,r,b) ->
      cb(b)
      #cb(google_payload)
  else
    result.msg = 'Must specify a URL'
    cb(result)

module.exports = {
  shorturi: shorturi
}
