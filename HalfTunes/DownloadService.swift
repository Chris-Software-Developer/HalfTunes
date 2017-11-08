//
//  SearchVC+URLSessionDelegates.swift
//  HalfTunes
//
//  Created by Christopher Smith on 11/7/17.
//  Copyright © 2017 Ray Wenderlich. All rights reserved.
//

import Foundation

// Downloads song snippets, and stores in local file.
// Allows cancel, pause, resume download.

class DownloadService {

  var activeDownloads: [URL: Download] = [:]
  var downloadsSession: URLSession!

  // MARK: - Download methods called by TrackCell delegate methods

  func startDownload(_ track: Track) {
    let download = Download(track:track)
    download.task = downloadsSession.downloadTask(with: track.previewURL)
    download.task!.resume()
    download.isDownloading = true
    activeDownloads[download.track.previewURL] = download
  }
  
  // TODO: previewURL is http://a902.phobos.apple.com/...
  // why doesn't ATS prevent this download?

  func pauseDownload(_ track: Track) {
    guard let download = activeDownloads[track.previewURL] else { return }
    if download.isDownloading {
      download.task?.cancel(byProducingResumeData: { data in
        download.resumeData = data
      })
      download.isDownloading = false
    }
  }

  func cancelDownload(_ track: Track) {
    if let download = activeDownloads[track.previewURL] {
      download.task?.cancel()
      activeDownloads[track.previewURL] = nil
    }
  }

  func resumeDownload(_ track: Track) {
    guard let download = activeDownloads[track.previewURL] else { return }
    if let resumeData = download.resumeData {
      download.task = downloadsSession.downloadTask(withResumeData: resumeData)
      download.task = downloadsSession.downloadTask(with: download.track.previewURL)
    }
    download.task!.resume()
    download.isDownloading = true
  }
}
