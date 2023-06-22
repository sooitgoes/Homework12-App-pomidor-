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
    private var isWorkMode = true
    private var isTimerStart = false
    private let backProgressLayer = CAShapeLayer()
    private let foreProgressLayer = CAShapeLayer()
    private var isAnimationStar = false
    private let animation = CABasicAnimation(keyPath: "strokeEnd")

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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        drawBackLayer()
        drawForeLayer()
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
        switch (isTimerStart, isWorkMode) {
        case (false, true):
            timer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(workTimerAction), userInfo: nil, repeats: true)
            playOrPause.setImage(UIImage(named: "pauseRed"), for: .normal)
            isTimerStart = true
        case (false, false):
            timer = .scheduledTimer(timeInterval: 1, target: self, selector: #selector(restTimerAction), userInfo: nil, repeats: true)
            playOrPause.setImage(UIImage(named: "pauseGreen"), for: .normal)
            isTimerStart = true
        default:
            timer.invalidate()
            isWorkMode == true
            ? playOrPause.setImage(UIImage(named: "playRed"), for: .normal)
            : playOrPause.setImage(UIImage(named: "playGreen"), for: .normal)
            isTimerStart = false
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
            isTimerStart = false
            isWorkMode = false
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
            isTimerStart = false
            isWorkMode = true
        }
    }

    // Прорисовка заднего слоя прогресс бара
    private func drawBackLayer() {
        let center = CGPoint(x: timerLabel.frame.midX, y: timerLabel.frame.midY)

        backProgressLayer.path = UIBezierPath(arcCenter: center, radius: 150, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        backProgressLayer.strokeColor = UIColor.white.cgColor
        backProgressLayer.fillColor = UIColor.clear.cgColor
        backProgressLayer.lineWidth = 5
        view.layer.addSublayer(backProgressLayer)
    }

    // Прорисовка переднего слоя прогресс бара
    private func drawForeLayer() {
        let center = CGPoint(x: view.frame.midX, y: view.frame.midY)

        foreProgressLayer.path = UIBezierPath(arcCenter: center, radius: 150, startAngle: -90.degreesToRadians, endAngle: 270.degreesToRadians, clockwise: true).cgPath
        if isWorkMode == true {
            foreProgressLayer.strokeColor = UIColor.red.cgColor
        } else {
            foreProgressLayer.strokeColor = UIColor.green.cgColor
        }
        foreProgressLayer.fillColor = UIColor.clear.cgColor
        foreProgressLayer.lineWidth = 5
        view.layer.addSublayer(foreProgressLayer)
    }

    private func startAnimation() {
        foreProgressLayer.speed = 1.0
        foreProgressLayer.timeOffset = 0.0
        foreProgressLayer.beginTime = 0.0
        foreProgressLayer.strokeEnd = 0.0
        animation.keyPath = "strokeEnd"
        animation.toValue = 1
        animation.fromValue = 0
        animation.duration = CFTimeInterval(durationTimer)
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.fillMode = CAMediaTimingFillMode.forwards
        foreProgressLayer.add(animation, forKey: "strokeEnd")
        isAnimationStar = true
    }
}

