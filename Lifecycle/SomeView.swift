//
//  SomeView.swift
//  Lifecycle
//
//  Created by Alley Pereira on 15/11/22.
//

import UIKit

protocol SomeViewDelegate: AnyObject {
	func didTapButton()
}

class SomeView: UIView {

	weak var delegate: SomeViewDelegate?

	let button: UIButton = {
		let button = UIButton(type: .system)
		button.backgroundColor = .red
		button.layer.cornerRadius = 10
		button.setTitle("Hello Word 🎉", for: .normal)
		button.tintColor = .white
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		return button
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		print("🏐🎾 \(#function) | State: \(UIApplication.shared.applicationState.toString())")
		style()
		layout()
		configureButton()
	}

	required init?(coder: NSCoder) {
		print("🏐🎾 \(#function) | State: \(UIApplication.shared.applicationState.toString())")
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		print("💃 \(#function) | State: \(UIApplication.shared.applicationState.toString())")
	}

	override func removeFromSuperview() {
		super.removeFromSuperview()
		print("⚠️ \(#function) | State: \(UIApplication.shared.applicationState.toString())")
	}



}

// MARK: - Extensions

extension SomeView {

	func configureButton() {
		button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
	}

	@objc func buttonAction(_ sender: UIButton) {
		self.delegate?.didTapButton()
	}


	func style() {
		self.addSubview(button)
		button.translatesAutoresizingMaskIntoConstraints = false
	}

	func layout() {
		NSLayoutConstraint.activate([
			button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
			button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
			button.widthAnchor.constraint(equalToConstant: 140),
			button.heightAnchor.constraint(equalToConstant: 80)
		])

	}

	override func updateConstraints() {
		super.updateConstraints()
	}
}

