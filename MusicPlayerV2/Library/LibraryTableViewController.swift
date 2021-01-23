//
//  LIbraryTableViewController.swift
//  MusicPlayerV2
//
//  Created by Andy Peralta on 11/30/20.
//

protocol LibraryTableViewControllerDelegate: class {
    func tableViewController(_ viewController: LibraryTableViewController, didSelectSong song: Song)
}

import UIKit
import MediaPlayer

class LibraryTableViewController: UITableViewController {
    weak var delegate: LibraryTableViewControllerDelegate?

    let mediaFiles = MPMediaQuery.songs().items!
    var albumLst = [Song]()
    var albumArtImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addAlbumsIntoLst()
    }

    private func setupTableView() {
        tableView.register(TrackCell.self, forCellReuseIdentifier: TrackCell.reuseIdentifier)
        tableView.rowHeight = 60
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaFiles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: TrackCell.reuseIdentifier, for: indexPath) as? TrackCell
        else {
            fatalError()
        }
        let mediaFile = albumLst[indexPath.row]
        cell.tintColor = .white
        cell.setLibraryBodyCellForSongs(mediaFile)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let musicPlyr = MPMusicPlayerController.applicationQueuePlayer
        let song = albumLst[indexPath.row]
        let tappedSongTitle = song.title
        let mediaCollections =  getMediaCollections()

        for  mediaCollection in mediaCollections {
            let songTitle = mediaCollection.representativeItem!.title!
            if songTitle == tappedSongTitle  {
                delegate?.tableViewController(self, didSelectSong: song)
                albumArtImage = mediaCollection.representativeItem?.artwork?.image(at: CGSize(width: 320, height: 320))
                musicPlyr.setQueue(with: mediaCollection)
                musicPlyr.play()
                break
            }
        }
    }

//MARK: sortedSongCollection
    func getMediaCollections() -> [MPMediaItemCollection] {
        let songQuery = MPMediaQuery.songs()
        let tracks = songQuery.collections
        if tracks != nil {
            return tracks!
        }
        print("The songList is empty. Get this Fixed")
        return []
    }

    func addAlbumsIntoLst() {
        for media in mediaFiles {
            let albumTitle = media.albumTitle ?? "AlbumTitle"
            let songTitle = media.title  ?? "SongTitle"
            let albumArt = media.artwork
            let albumArtist = media.albumArtist ?? "AlbumArtist"
            let artist = media.albumArtist  ?? "Artist"
            let genre = media.genre  ?? "AlbumTitle"
            let trackCount = media.albumTrackCount
            let trackTime  = media.playbackDuration
            let track =
                Song(albumTitle: albumTitle, title: songTitle,
                     albumArt: albumArt , albumArtist: albumArtist, artist: artist,
                genre: genre, duration: trackTime, trackCount: trackCount)
            albumLst.append(track)
        }
    }
}
