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

    let albumTitle = UILabel()
    albumTitle.translatesAutoresizingMaskIntoConstraints = false
    albumTitle.text = "AlbumTitle"
    albumTitle.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)
    albumTitle.sizeToFit()
    view.addSubview(albumTitle)

    let songTitle = UILabel()
    songTitle.translatesAutoresizingMaskIntoConstraints = false
    songTitle.text = "SongTitle"
    songTitle.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)

    let artist = UILabel()
    artist.translatesAutoresizingMaskIntoConstraints = false
    artist.font = UIFont(name: "Hiragino Mincho ProN W3", size:  25.0)
    artist.text = "Artist"
    artist.sizeToFit()

    let startTime = UILabel()
    startTime.translatesAutoresizingMaskIntoConstraints = false
    startTime.font = UIFont(name: "Hiragino Mincho ProN W3", size:  17.0)
    startTime.text = "0:00"
    startTime.sizeToFit()

    let endTime = UILabel()
    endTime.translatesAutoresizingMaskIntoConstraints = false
    endTime.font = UIFont(name: "Hiragino Mincho ProN W3", size: 17.0)
    endTime.text = " 0:00"
    endTime.sizeToFit()

    //MARK: StackView for Music ProgressBar
    let progressBar = UIProgressView(progressViewStyle: .bar)
    progressBar.translatesAutoresizingMaskIntoConstraints = false
    progressBar.progress = 0.10
    progressBar.progressTintColor = .white
    progressBar.backgroundColor = .gray

    let progressStackView = UIStackView(arrangedSubviews: [startTime, progressBar, endTime])
    progressStackView.axis = .horizontal
    progressStackView.alignment = .center
    progressStackView.distribution = .fillProportionally
    progressStackView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(progressStackView)
    progressStackView.sizeToFit()

  //MARK: StackView for Song/Artist Label
    let trackStackView = UIStackView(arrangedSubviews: [songTitle, artist])
    trackStackView.axis = .vertical
    trackStackView.alignment = .fill
    trackStackView.distribution = .equalSpacing
    trackStackView.translatesAutoresizingMaskIntoConstraints = false
    trackStackView.spacing = 15
//    trackStackView.backgroundColor = .blue
    self.view.addSubview(trackStackView)

    // AlbumArt
    let musicHouseArt = UIImage(systemName: "music.note.house.fill")
    let albumArt = UIImageView(image: musicHouseArt)
    albumArt.translatesAutoresizingMaskIntoConstraints = false
    albumArt.backgroundColor  = .white
    view.addSubview(albumArt)

    // MARK: Music Control Buttons
    let playButton = UIButton(type: .system)
    playButton.tintColor = .white
    let playIconConfig = UIImage.SymbolConfiguration(pointSize: 40)
    let playIcon = UIImage(systemName: "play.fill", withConfiguration: playIconConfig)
    let pauseIcon = UIImage(systemName: "pause.fill")
    playButton.setImage(playIcon, for: .normal)
    playButton.setImage(pauseIcon, for: .highlighted)
    playButton.translatesAutoresizingMaskIntoConstraints = false

    let fastForwardButton = UIButton(type: .system)
    fastForwardButton.tintColor = .white
    let fastForwardIconConfig = UIImage.SymbolConfiguration(pointSize: 20)
    let fastForwardIcon = UIImage(systemName: "forward.fill", withConfiguration: fastForwardIconConfig)
    fastForwardButton.setImage(fastForwardIcon, for: .normal)
    fastForwardButton.translatesAutoresizingMaskIntoConstraints = false

    let rewindButton = UIButton(type: .system)
    rewindButton.tintColor = .white
    let rewindButtonConfig = UIImage.SymbolConfiguration(pointSize: 20)
    let rewindIcon = UIImage(systemName: "backward.fill", withConfiguration: rewindButtonConfig)
    rewindButton.setImage(rewindIcon, for: .normal)
    rewindButton.translatesAutoresizingMaskIntoConstraints = false

    // Song Options
    let shuffleButton = UIButton(type: .system)
    shuffleButton.tintColor = .white
    let shuffleButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
    let shuffleIcon = UIImage(systemName: "shuffle", withConfiguration: shuffleButtonConfig)
    shuffleButton.setImage(shuffleIcon, for: .normal)
    shuffleButton.translatesAutoresizingMaskIntoConstraints = false

    let queueButton = UIButton(type: .system)
    queueButton.tintColor = .white
    let queueButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
    let queueIcon = UIImage(systemName: "list.dash", withConfiguration: queueButtonConfig)
    queueButton.setImage(queueIcon, for: .normal)
    queueButton.translatesAutoresizingMaskIntoConstraints = false

    let repeatButton = UIButton(type: .system)
    repeatButton.tintColor = .white
    let repeatButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
    let repeatIcon = UIImage(systemName: "repeat", withConfiguration: repeatButtonConfig)
    repeatButton.setImage(repeatIcon, for: .normal)
    repeatButton.translatesAutoresizingMaskIntoConstraints = false

    // StackView for Play, Forward, Backward, Pause
    let musicStackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
    musicStackView.axis = .horizontal
    musicStackView.alignment = .fill
    musicStackView.distribution = .fillEqually
//  musicStackView.backgroundColor = .blue
    musicStackView.translatesAutoresizingMaskIntoConstraints = false
    musicStackView.spacing = 0
    self.view.addSubview(musicStackView)


    //MARK: StackView for Song Options
    let musicStackView2 = UIStackView(arrangedSubviews: [repeatButton, shuffleButton, queueButton])
    musicStackView2.axis = .horizontal
    musicStackView2.alignment = .fill
    musicStackView2.distribution = .fillEqually
    musicStackView2.translatesAutoresizingMaskIntoConstraints = false
    musicStackView2.spacing = 0
    self.view.addSubview(musicStackView2)

    //MARK: Staview for Volume
    let volumeButton = UIButton(type: .system)
    volumeButton.tintColor = .white
    let volumeButtonConfig = UIImage.SymbolConfiguration(pointSize: 32)
    let volumeIcon = UIImage(systemName: "speaker.wave.2.circle", withConfiguration: volumeButtonConfig)
    volumeButton.setImage(volumeIcon, for: .normal)
    volumeButton.translatesAutoresizingMaskIntoConstraints = false


    let volumePercentage = UILabel()
    volumePercentage.translatesAutoresizingMaskIntoConstraints = false
    volumePercentage.text = "100%"
    volumePercentage.textAlignment = .center

    let volumeStack = UIStackView(arrangedSubviews: [volumeButton, volumePercentage])
    volumeStack.axis = .vertical
    volumeStack.alignment = .fill
    volumeStack.distribution =  .fill
    volumeStack.translatesAutoresizingMaskIntoConstraints = false
    volumeStack.spacing = 5
//    volumeStack.backgroundColor = .blue
    self.view.addSubview(volumeStack)


    //MARK: Volume Touchbars
    let touchBarStack = UIStackView()
    touchBarStack.axis = .horizontal
    touchBarStack.distribution = .equalSpacing
    touchBarStack.spacing = 4
    touchBarStack.sizeToFit()
    createVolumeBar(volumeBarStack: touchBarStack)




    let marginLayoutGuide = self.view.layoutMarginsGuide
    let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide

    //transition LibraryVC
    view.backgroundColor = .black
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Library", style: .plain, target: self, action: #selector(transitionToLibraryVC))

    //MARK: Constraints
    NSLayoutConstraint.activate(
      [

        // Album Title
        albumTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
        albumTitle.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 50),
        albumTitle.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -120),

        //TrackStackView
        trackStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 490),
        trackStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  30),

        //Volume StackView
        volumeStack.topAnchor.constraint(equalTo: trackStackView.topAnchor),
        volumeStack.leadingAnchor.constraint(greaterThanOrEqualTo: marginLayoutGuide.leadingAnchor, constant:  280),
        volumeStack.bottomAnchor.constraint(greaterThanOrEqualTo:  trackStackView.bottomAnchor),

        //Album Art
        albumArt.topAnchor.constraint(equalTo: v1.topAnchor, constant: 120),
        albumArt.leadingAnchor.constraint(equalTo: v1.leadingAnchor, constant: 50),
        albumArt.heightAnchor.constraint(equalToConstant:  320),
        albumArt.widthAnchor.constraint(equalToConstant:  320),

        //MusicPlayer Horizontal StackView
        musicStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 390),
        musicStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  30),
        musicStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor),

        //ProgressStackView
        progressStackView.topAnchor.constraint(equalTo: trackStackView.bottomAnchor, constant: 5),
        progressStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant: 30),
        progressStackView.trailingAnchor.constraint(equalTo: marginLayoutGuide.trailingAnchor, constant: 42),
        safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: progressStackView.bottomAnchor, constant: 70),

        // Inside the PorgressStackView
        progressBar.widthAnchor.constraint(equalToConstant: 250),
        progressBar.heightAnchor.constraint(equalToConstant: 3),

         //MusicStack2
        musicStackView2.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  400),
        musicStackView2.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant: 230),

        //VolumeTouchBar
        safeAreaLayoutGuide.bottomAnchor.constraint(equalTo:  touchBarStack.bottomAnchor, constant: 30),
        touchBarStack.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant: 30)
     ]
    )
    // Do any additional setup after loading the view.
  }

    func createVolumeBar(volumeBarStack: UIStackView) {
        volumeBarStack.translatesAutoresizingMaskIntoConstraints = false
        for  _ in 0...9 {
            let volumeBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 6, height: 20))
            volumeBarButton.translatesAutoresizingMaskIntoConstraints = false
            volumeBarButton.backgroundColor = .white
            volumeBarStack.addArrangedSubview(volumeBarButton)
            self.view.addSubview(volumeBarStack)
        }

    }

    //MARK: Push to a LibraryTableViewController
  @objc func transitionToLibraryVC() {
    navigationController?.pushViewController(LIbraryTableViewController(), animated: true)
  }

}

