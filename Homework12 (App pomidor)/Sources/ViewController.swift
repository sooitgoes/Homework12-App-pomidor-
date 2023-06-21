//
//  ViewController.swift
//  Homework12 (App pomidor)
//
//  Created by Михаил Латий on 21.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private var timer = Timer()
    private var durationTimer = 25
    private var isWork = true
    private var isStart = false

    // MARK: - UI Elements
    private lazy var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.text = "\(durationTimer):00"
        timerLabel.font = .systemFont(ofSize: 70, weight: .light)
        timerLabel.textAlignment = .center
        timerLabel.textColor = .systemRed
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        return timerLabel
    }()

    private lazy var playOrPause: UIButton = {
        let playOrPause = UIButton()
        let playIcon = UIImage(named: "playRed")

        playOrPause.setImage(playIcon, for: .normal)
        playOrPause.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        playOrPause.translatesAutoresizingMaskIntoConstraints = false
        return playOrPause
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = .black
    }

    private func setupHierarchy() {
        view.addSubview(timerLabel)
        view.addSubview(playOrPause)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            playOrPause.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 40),
            playOrPause.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playOrPause.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Actions
    @objc private func buttonPressed() {
        switch (isStart, isWork) {
        case (false, true):
            timer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(workTimerAction), userInfo: nil, repeats: true)
            playOrPause.setImage(UIImage(named: "pauseRed"), for: .normal)
            isStart = true
        case (false, false):
            timer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(restTimerAction), userInfo: nil, repeats: true)
            playOrPause.setImage(UIImage(named: "pauseGreen"), for: .normal)
            isStart = true
        default:
            timer.invalidate()
            isWork == true
            ? playOrPause.setImage(UIImage(named: "playRed"), for: .normal)
            : playOrPause.setImage(UIImage(named: "playGreen"), for: .normal)
            isStart = false
        }
    }

    // Варианты действия таймера, для режима работы или отдыха.
    @objc func workTimerAction() {
        durationTimer -= 1
        timerLabel.text = "\(durationTimer):00"

        if durationTimer == 0 {
            timer.invalidate()
            durationTimer = 10
            timerLabel.text = "\(durationTimer):00"
            timerLabel.textColor = .systemGreen
            playOrPause.setImage(UIImage(named: "playGreen"), for: .normal)
            isStart = false
            isWork = false
        }
    }

    @objc func restTimerAction() {
        durationTimer -= 1
        timerLabel.text = "\(durationTimer):00"

        if durationTimer == 0 {
            timer.invalidate()
            durationTimer = 25
            timerLabel.text = "\(durationTimer):00"
            timerLabel.textColor = .systemRed
            playOrPause.setImage(UIImage(named: "playRed"), for: .normal)
            isStart = false
            isWork = true
        }
    }
}

