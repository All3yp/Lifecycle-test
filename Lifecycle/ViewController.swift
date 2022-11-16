//
//  ViewController.swift
//  Lifecycle
//
//  Created by Alley Pereira on 15/11/22.
//

import UIKit

var controllerID = 1

class ViewController: UIViewController {

	var someView: SomeView = SomeView()

	// MARK: - Init
	// Programatical init
	init() {
		print("🏐🎾 init Programaticaly controller")
		super.init(nibName: nil, bundle: nil)
		self.title = "#\(controllerID)"
	}

	// Storyboard init
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		self.title = "#\(controllerID)"
	}

	// MARK: - Lifecycle ViewController

	override func loadView() {
		super.loadView()
		self.view = someView
		self.someView.delegate = self
		print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
	}

	// Deprecated
	override func loadViewIfNeeded() {
		super.loadViewIfNeeded()
		print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		print("🟢 \(#function) | \(self.title!) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		print("🟢 \(#function) | \(self.title!) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print("🟢 \(#function) | \(self.title!) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print("🟢 \(#function) | \(self.title!) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		print("🟢 \(#function) | \(self.title!) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		print("🟢 \(#function) | \(self.title!) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		print("🟢 \(#function) | \(self.title!) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)

		print("🟢 \(#function) State: \(UIApplication.shared.applicationState.toString())")
	}

	deinit {
		print("⭕️ deinit")
	}

}

extension ViewController: SomeViewDelegate {

	func didTapButton() {
		controllerID += 1
		let controller = ViewController()
		let randomColor = UIColor(red: .random(in: 0...1),
								  green: .random(in: 0...1),
								  blue: .random(in: 0...1),
								  alpha: 1.0)

		controller.someView.backgroundColor = randomColor
		controller.modalPresentationStyle = .fullScreen
		self.present(controller, animated: true)
	}
}
