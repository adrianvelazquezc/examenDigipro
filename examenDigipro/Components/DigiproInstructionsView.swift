import UIKit

class DigiproInstructionsView: UIViewController {
    
    private let screen = UIScreen.main.bounds
    private lazy var alertHeight: CGFloat = screen.height / 3 * 2.5
    
    private lazy var alertTerminalView: DigiproInstructionsViewUI = {
        let view = DigiproInstructionsViewUI(frame: CGRect(x: 0, y: screen.height, width: screen.width, height: alertHeight))
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupBackground()
        setupGesture()
        buildUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAlertView()
    }
    
    private func setupBackground() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func buildUI() {
        alertTerminalView.clipsToBounds = true
        self.view.addSubview(alertTerminalView)
    }
    
    private func showAlertView() {
        UIView.animate(withDuration: 0.5) {
            self.alertTerminalView.frame.origin.y = self.screen.height - self.alertHeight
        }
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer) {
        hideAlertView(completionHandler: {
                UserDefaults.standard.set(true, forKey: "instructionsShowed")
        })
    }
    
    public func hideAlertView(completionHandler: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5) {
            self.alertTerminalView.frame.origin.y = self.screen.height
        } completion: { isFinished in
            if isFinished {
                self.dismiss(animated: false) {
                    completionHandler()
                }
            }
        }
    }
}

extension DigiproInstructionsView: DigiproInstructionsViewUIDelegate {
    func didTapOkButton() {
        self.hideAlertView {
            UserDefaults.standard.set(true, forKey: "instructionsShowed")
        }
    }
}
