//
//  TrackCell.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/25/20.
//

import UIKit
import MediaPlayer

class TrackCell: UITableViewCell {
    static let reuseIdentifier = "albumCell"

    let songTitle = UILabel(frame: .zero)
    let artist = UILabel(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        songTitle.translatesAutoresizingMaskIntoConstraints = false
        artist.translatesAutoresizingMaskIntoConstraints = false
        self.songTitle.textColor = .white
        self.artist.textColor = .white

        contentView.addSubview(songTitle)
        contentView.addSubview(artist)
        createCellConstraints()
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        songTitle.translatesAutoresizingMaskIntoConstraints = false
//        artist.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(songTitle)
//        contentView.addSubview(artist)
//
//    }

    func setLibraryBodyCellForAlbums(_ track: Song) {
        self.songTitle.text = track.albumTitle!
        self.artist.text = track.artist!
    }

    func setLibraryBodyCellForSongs(_ track: Song) {
        self.songTitle.text = track.title!
        self.artist.text = track.artist!
    }

    func createCellConstraints() {
        NSLayoutConstraint.activate(
            [
              songTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
              songTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
              songTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor),
              songTitle.bottomAnchor.constraint(greaterThanOrEqualTo: artist.topAnchor),
              artist.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30)
            ]
        )
    }
}
