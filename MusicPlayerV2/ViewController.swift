//
//  ViewController.swift
//  interfaceDesignViaCode
//
//  Created by Andy Peralta on 11/21/20.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

  override func viewDidLoad() {
    super.viewDidLoad()

    //MARK: UIObject Creation
    let v1 = UIView()
    v1.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(v1)

    // MARK: Music TextLabels
    let songTitle = UILabel()
    songTitle.translatesAutoresizingMaskIntoConstraints = false
    songTitle.text = "SongTitle"
    songTitle.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)


    let artist = UILabel()
    artist.translatesAutoresizingMaskIntoConstraints = false
    artist.font = UIFont(name: "Hiragino Mincho ProN W3", size:  25.0)
    artist.text = "Artist"
    artist.sizeToFit()


  //MARK: StackView for Song/Artist Label
    let traackStackView = UIStackView(arrangedSubviews: [songTitle, artist])
    traackStackView.axis = .vertical
    traackStackView.alignment = .fill
    traackStackView.distribution = .fillEqually
    traackStackView.translatesAutoresizingMaskIntoConstraints = false
    traackStackView.spacing = 0
    self.view.addSubview(traackStackView)

    // AlbumArt
    let musicHouseArt = UIImage(systemName: "music.note.house.fill")
    let albumArt = UIImageView(image: musicHouseArt)
    albumArt.translatesAutoresizingMaskIntoConstraints = false
    albumArt.backgroundColor  = .white
    view.addSubview(albumArt)

    // MARK: Music Control Buttons
    let playButton = UIButton(type: .system)
    let playIconConfig = UIImage.SymbolConfiguration(pointSize: 40)
    let playIcon = UIImage(systemName: "play.fill", withConfiguration: playIconConfig)
    let pauseIcon = UIImage(systemName: "pause.fill")
    playButton.setImage(playIcon, for: .normal)
    playButton.setImage(pauseIcon, for: .highlighted)
    playButton.translatesAutoresizingMaskIntoConstraints = false


    let fastForwardButton = UIButton(type: .system)
    let fastForwardIcon = UIImage(systemName: "forward.fill")
    fastForwardButton.setImage(fastForwardIcon, for: .normal)
    fastForwardButton.translatesAutoresizingMaskIntoConstraints = false


    let rewindButton = UIButton(type: .system)
    let rewindIcon = UIImage(systemName: "backward.fill")
    rewindButton.setImage(rewindIcon, for: .normal)
    rewindButton.translatesAutoresizingMaskIntoConstraints = false


    // StackView for Play, Forward, Backward, Pause
    let musicStackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
    musicStackView.axis = .horizontal
    musicStackView.alignment = .fill
    musicStackView.distribution = .fillEqually
    musicStackView.translatesAutoresizingMaskIntoConstraints = false
    musicStackView.spacing = 0
    self.view.addSubview(musicStackView)

   // Song Options
    let shuffleButton = UIButton(type: .system)
    let shuffleIcon = UIImage(systemName: "shuffle")
    shuffleButton.setImage(shuffleIcon, for: .normal)
    shuffleButton.translatesAutoresizingMaskIntoConstraints = false

    let queueButton = UIButton(type: .system)
    let queueIcon = UIImage(systemName: "list.dash")
    queueButton.setImage(queueIcon, for: .normal)
    queueButton.translatesAutoresizingMaskIntoConstraints = false

    let repeatButton = UIButton(type: .system)
    let repeatIcon = UIImage(systemName: "repeat")
    repeatButton.setImage(repeatIcon, for: .normal)
    repeatButton.translatesAutoresizingMaskIntoConstraints = false

    //MARK: StackView for Song Options
    let musicStackView2 = UIStackView(arrangedSubviews: [repeatButton, shuffleButton, queueButton])
    musicStackView2.axis = .horizontal
    musicStackView2.alignment = .fill
    musicStackView2.distribution = .fillEqually
    musicStackView2.translatesAutoresizingMaskIntoConstraints = false
    musicStackView2.spacing = 0
    self.view.addSubview(musicStackView2)

    let marginLayoutGuide = self.view.layoutMarginsGuide
    let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide

    //transition LibraryVC
    view.backgroundColor = .black
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(transitionToLibraryVC))

    //MARK: Constraints
    NSLayoutConstraint.activate(
      [
        //TrackStackView
        traackStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 460),
        traackStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  50),
        traackStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -140),

        //Album Art
        albumArt.topAnchor.constraint(equalTo: v1.topAnchor, constant: 100),
        albumArt.leadingAnchor.constraint(equalTo: v1.leadingAnchor, constant: 50),
        albumArt.heightAnchor.constraint(equalToConstant:  320),
        albumArt.widthAnchor.constraint(equalToConstant:  320),

        //MusicPlayer Horizontal StackView
        musicStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 120),
        musicStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  130),
        musicStackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
     ]
    )
    // Do any additional setup after loading the view.
  }

    //MARK: Push to a LibraryTableViewController
  @objc func transitionToLibraryVC() {
    navigationController?.pushViewController(LIbraryTableViewController(), animated: true)
  }

}

