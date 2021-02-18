//
//  PlayerUIView.swift
//  MusicPlayerV2
//  Created by Andy Peralta on 12/22/20.
//
protocol PlayerUIViewDelegate: class {
    func songIsSelected()
}

import UIKit
import MediaPlayer
class PlayerUIView: UIView, LibraryTableViewControllerDelegate {
    weak var delegate: PlayerUIViewDelegate?

    lazy var albumTitleLabel: UILabel = {
        let albumLabel = UILabel()
        albumLabel.text = "AlbumTitle"

        albumLabel.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)
        albumLabel.textAlignment = .center
        albumLabel.sizeToFit()
        return albumLabel
    }()

    lazy var albumImageView: UIImageView = {
        var albumArtImage = UIImage(systemName: "music.note.house.fill")
        let imageView = UIImageView(image: albumArtImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor  = .white
        return imageView
    }()

    lazy var songTitleLabel: UILabel = {
        let songLabel = UILabel()
        songLabel.text = "SongTitle"
        songLabel.font = UIFont(name: "Hiragino Mincho ProN W3", size:  25.0)
        songLabel.translatesAutoresizingMaskIntoConstraints = false
        songLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        return songLabel
    }()

    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size:  20.0)
        label.text = "Artist"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()

    private lazy var trackStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [songTitleLabel, artistLabel])
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .fillEqually
        stackview.spacing = 10
        return stackview
    }()

    private lazy var startTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size:  17.0)
        label.text = "0:00 "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()

    private lazy var endTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size:  17.0)
        label.text = " 0:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()

    private lazy var progressBarView: UIProgressView = {
        let pgBar = UIProgressView(progressViewStyle: .bar)
        pgBar.progress = 0.10
        pgBar.progressTintColor = .white
        pgBar.backgroundColor = .gray
        return pgBar
    }()

    private lazy var progressStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startTimeLabel, progressBarView, endTimeLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.sizeToFit()
        return stackView
    }()

    private lazy var volumeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let volumeButtonConfig = UIImage.SymbolConfiguration(pointSize: 32)
        let volumeIcon = UIImage(systemName: "speaker.wave.2.circle", withConfiguration: volumeButtonConfig)
        button.setImage(volumeIcon, for: .normal)
        return button
    }()

    private lazy var volumePercentageLabel: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.textAlignment = .center
        return label
    }()

    private lazy var volumeStack: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [volumeButton, volumePercentageLabel])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing
        stackview.spacing = 15
        return stackview
    }()

    private lazy var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100.0
        slider.minimumValue = 1.0
        slider.isContinuous = true
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = .black
        slider.tintColor = .white
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)

        UIView.animate(withDuration: 0.8) {
            slider.setValue(80.0, animated: true)
        }
        return slider
    }()


    func delay(_ delay: Double, closure: @escaping () -> ()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }

    @objc func sliderValueChanged(_ sender: UISlider!) {
        let step: Float = 10.0
        let approximateStepVal =  round(sender.value / step) * step
        sender.value = approximateStepVal
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let controlsView = PlayerControlsView()

    private func setupViews() {
        delegate = controlsView
        for sub in [albumTitleLabel, albumImageView, controlsView,
        progressStackView, volumeStack,trackStackView, volumeSlider] {
            sub.translatesAutoresizingMaskIntoConstraints = false
            addSubview(sub)
        }

        // Setup Constraints
        NSLayoutConstraint.activate([
            // Album Title
            albumTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 90),
            albumTitleLabel.leadingAnchor.constraint(equalTo:  centerXAnchor, constant: -150),
            albumTitleLabel.widthAnchor.constraint(equalToConstant: 320),

            // Album Art
            albumImageView.topAnchor.constraint(equalTo: albumTitleLabel.bottomAnchor, constant: 10),
            albumImageView.heightAnchor.constraint(equalToConstant:  320),
            albumImageView.widthAnchor.constraint(equalToConstant:  320),
            albumImageView.leadingAnchor.constraint(equalTo: centerXAnchor, constant: -160),

             //ControlsView
            controlsView.topAnchor.constraint(equalTo: topAnchor, constant: 460),
            controlsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),

            // TrackStackView
            trackStackView.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 80),
            trackStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  50),
            trackStackView.heightAnchor.constraint(equalToConstant:  100),

              //Volume StackView
            volumeStack.topAnchor.constraint(equalTo:  trackStackView.topAnchor),
            volumeStack.trailingAnchor.constraint(equalTo: controlsView.trailingAnchor),

              //ProgressStackView
            progressStackView.topAnchor.constraint(equalTo: trackStackView.bottomAnchor, constant: 30),
            progressStackView.leadingAnchor.constraint(equalTo: trackStackView.leadingAnchor),
            progressStackView.widthAnchor.constraint(equalToConstant: 320),
            progressStackView.heightAnchor.constraint(equalToConstant: 20),


            // Inside the PorgressStackView
            progressBarView.heightAnchor.constraint(equalToConstant: 3),

            //VolumeTouchBar
            volumeSlider.topAnchor.constraint(equalTo: progressStackView.bottomAnchor, constant: 15),
            volumeSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            volumeSlider.widthAnchor.constraint(equalToConstant: 330),
        ])
    }

    func tableViewController(_ viewController: LibraryTableViewController, didSelectSong song: Song) {
        // Show the right album art for the song
        albumTitleLabel.text = song.albumTitle
        songTitleLabel.text = song.title
        artistLabel.text = song.artist
        artistLabel.sizeToFit()

        let albumImageSize = CGSize(width: albumImageView.frame.width, height: albumImageView.frame.height)
        if let albumArt = song.albumArt?.image(at: albumImageSize) {
          albumImageView.image = albumArt
        } else { print("The current song's album art doesn't exist ")}

        //Calculate Track Time and Song Duration
        let songDuration =  (song.duration! / 60)
        let  roundedDuration  =  round(songDuration * 100) / 100
        let stringDescription = String(format: "%.2f", roundedDuration)
        print("The rounded duration is: ", stringDescription)
        endTimeLabel.text = stringDescription.description.replacingOccurrences(of: ".", with: ":")

        //progressview change
        let timer = Timer.scheduledTimer(timeInterval: 1/60, target: self, selector: #selector(timeFired), userInfo: nil, repeats: true)
        timer.tolerance = 0.1

        // trigger to change play icon to pause when tableview cell is selected
        delegate?.songIsSelected()
    }


    @objc func timeFired(_: Any) {
        let player =  MPMusicPlayerController.applicationMusicPlayer
        guard let item = player.nowPlayingItem,
        player.playbackState != .stopped else {
            self.progressBarView.isHidden = true
            return
        }
        self.progressBarView.isHidden = false

        let currentTime = player.currentPlaybackTime
        let seconds = Int(currentTime) % 60
        let minutes = Int(currentTime)/60
        self.startTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
        let songDuration = item.playbackDuration 
        self.progressBarView.progress = Float(currentTime/songDuration)
    }
}
