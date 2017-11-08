//
//  Download.swift
//  HalfTunes
//
//  Created by Christopher Smith on 11/7/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import Foundation

class Download {
  
  var track: Track
  var task: URLSessionDownloadTask?
  var isDownloading = false
  var resumeData: Data?
  var progress: Float = 0
  
  init(track: Track) {
    self.track = track
  }
}
