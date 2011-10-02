# (C) 2011 Martin Wawrusch (http://martinatsunset.com)
# itunes-epf-feedcheck is a little module that checks the itunes epf server
# for new files.
# MIT licensed
#

jsdom = require 'jsdom'
fs = require 'fs'
path = require 'path'

# some wierd problem with require
jqueryUrl = "http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" 

appleEpfRoot = "feeds.itunes.apple.com/feeds/epf/v3/full/current/"
#DAY_FOLDER_REGEX = /\A\d{8}\/\z/i


exports.itunesEpfFeedcheck = 
  checkFeed : (username,password,cb) ->
    # check that username and password are ok and cb is not null
    url = "http://#{encodeURIComponent(username)}:#{encodeURIComponent(password)}@#{appleEpfRoot}"
 
    jsdom.env url, [ jqueryUrl], (e, window) ->
      return cb(e) if e     
      #console.log window.document
      
      console.log window.$('body').html()
      cb null,window.$("a").length