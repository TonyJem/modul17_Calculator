import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets:
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [CalcButton]!
    
    // MARK: Properties:
    private let appBackgroundColor: UIColor = .black
    
    private let labelFontColor: UIColor = .white
    private let labelFontSize: CGFloat = 70
    
    private let buttonFontColor: UIColor = .blue
    private let buttonFontSize: CGFloat = 42
    
    private let buttonBorderWidth: CGFloat = 3
    private let buttonBorderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
    private let buttonBorderCornerRadius: CGFloat = 20
    
    private let allPrimaryButtonTags = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 19]
    private let allActionButtonTags = [11, 12, 13, 14, 15]
    private let allSecondaryButtonTags = [16, 17, 18]
    
    private let colorSchemeForPrimaryButtons: ButtonColorScheme = .primaryButton
    private let colorSchemeForActionButtons: ButtonColorScheme = .actionButton
    private let colorSchemeForSecondaryButtons: ButtonColorScheme = .secondaryButton
    
    // MARK: Starting Here:
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods:
    private func setupUI() {
        backView.backgroundColor = appBackgroundColor
        setupResultLabelUI()
        for button in allButtons {
            setupButtonUI(for: button)
        }
    }
    
    private func setupButtonUI(for button: CalcButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: buttonFontSize)
        button.setTitleColor(buttonFontColor, for: .normal)
        
        setupButtonBorders(for: button)

        if allPrimaryButtonTags.contains(button.tag) {
            button.backgroundColor = colorSchemeForPrimaryButtons.buttonBackgroundColor
        }

        if allActionButtonTags.contains(button.tag) {
            button.backgroundColor = colorSchemeForActionButtons.buttonBackgroundColor
        }

        if allSecondaryButtonTags.contains(button.tag) {
            button.backgroundColor = colorSchemeForSecondaryButtons.buttonBackgroundColor
        }
    }
    
    private func setupButtonBorders(for button: CalcButton){
        button.layer.borderWidth = buttonBorderWidth
        button.layer.borderColor = buttonBorderColor.cgColor
        button.layer.cornerRadius = buttonBorderCornerRadius
    }
    
    private func setupResultLabelUI(){
        resultLabel.textColor = labelFontColor
        resultLabel.font = UIFont.boldSystemFont(ofSize: labelFontSize)
    }
    
    // MARK: Actions:
    @IBAction func someButtonTapped(_ sender: CalcButton) {
        sender.animateWithPulsate()
        sender.animateWithFlash()
    }
}
