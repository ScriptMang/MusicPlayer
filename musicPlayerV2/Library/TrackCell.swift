//
//  TrackCell.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/25/20.
//

import UIKit
import MediaPlayer

class TrackCell: UITableViewCell {
  var songTitle: UILabel!
  var artist: UILabel!
  
  func setLibraryBodyCellForAlbums(_ track: Song) {
    songTitle?.text = track.albumTitle
    artist?.text = track.artist
  }

  func setLibraryBodyCellForSongs(_ track: Song) {
    songTitle?.text = track.title
    artist?.text = track.artist
  }
}
