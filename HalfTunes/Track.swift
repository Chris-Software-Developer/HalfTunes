//
//  SearchVC+URLSessionDelegates.swift
//  HalfTunes
//
//  Created by Christopher Smith on 11/7/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import Foundation.NSURL

// Query service creates Track objects
class Track {

  let name: String
  let artist: String
  let previewURL: URL
  let index: Int
  var downloaded = false

  init(name: String, artist: String, previewURL: URL, index: Int) {
    self.name = name
    self.artist = artist
    self.previewURL = previewURL
    self.index = index
  }
}
