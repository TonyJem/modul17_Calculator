import UIKit

// TODO -1. Label can contain max: "999 999 999", if number is bigger it has to be turned into "7.901235e29" and operate with it. If anything wrong, just frop error to screen, that possible to delete with AC. As bigger number as smaller Fonts size comes <- need to do it flexible

class ViewController: UIViewController {
    
    // MARK: Outlets:
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [CalcButton]!
    
    // MARK: Properties:
    private let labelFontSize: CGFloat = 65
    private let buttonFontSize: CGFloat = 42
    
    private let buttonBorderWidth: CGFloat = 3
    private let buttonBorderCornerRadius: CGFloat = 20
    
    private let allPrimaryButtonTags = [21, 22, 23, 31, 32, 33, 41, 42, 43, 51, 52, 53]
    private let allActionButtonTags = [14, 24, 34, 44, 54]
    private let allSecondaryButtonTags = [11, 12, 13]
    
    private let colorSchemeForPrimaryButtons: ButtonColorScheme = .primaryButton
    private let colorSchemeForActionButtons: ButtonColorScheme = .actionButtonNormal
    private let colorSchemeForSecondaryButtons: ButtonColorScheme = .secondaryButton
    
    private var currentOperation: Operation? = nil
    private var operand1: Double = 0
    private var operand2: Double = 0
    
    private var currentTextInResultLabel = "0" {
        didSet {
            setupResultLabelUI()
        }
    }
    
    private func resultOfOperation(operation: Operation,
                                   _ number1: Double,
                                   and number2: Double) -> Double {
        switch operation {
        case .plus:
            return number1 + number2
            
        case .minus:
            return number1 - number2
            
        case .divide:
            return number1 / number2
            
        case .multiply:
            return number1 * number2
        }
    }
    
    private func operationButtonPressed(for pressedOperation: Operation) {
        guard currentOperation != nil else {
            operand1 = Double(currentTextInResultLabel) ?? 0
//            TODO: Refactor below next doubled code's rows:
            resultLabel.textColor = Colors.labelFontColorFrozen
            currentOperation = pressedOperation
            return
        }
        operand2 = Double(currentTextInResultLabel) ?? 0
        let result = resultOfOperation(operation: currentOperation!, operand1, and: operand2)
        operand1 = result
        resultLabel.text = String(result)
        resultLabel.textColor = Colors.labelFontColorFrozen
        currentOperation = pressedOperation
    }
    
    // MARK: Starting Here:
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods:
    private func setupUI() {
        backView.backgroundColor = Colors.applicationBackgroundColor
        setupResultLabelUI()
        for button in allButtons {
            setupAllButtonsUI(for: button)
        }
    }
    
    private func setupAllButtonsUI(for button: CalcButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: buttonFontSize)
        button.setTitleColor(Colors.buttonFontColor, for: .normal)
        
        setupButtonBorders(for: button)
        
        if allPrimaryButtonTags.contains(button.tag) {
            button.backgroundColor = colorSchemeForPrimaryButtons.buttonBackgroundColor
        }
        
        // "Square Root" Button:
        if button.tag == 12 {
            button.setTitle("\u{221A}x", for: .normal)
        }
        
        // "Devision" Button:
        if button.tag == 14 {
            button.setTitle("\u{00F7}", for: .normal)
        }
        
        // "Multiplication" Button:
        if button.tag == 24 {
            button.setTitle("\u{00D7}", for: .normal)
        }
        
        // "Minus" Button:
        if button.tag == 34 {
            button.setTitle("\u{2212}", for: .normal)
        }
        
        // "PlusMinus" Button:
        if button.tag == 51 {
            button.setTitle("\u{207A}\u{2215}\u{208B}", for: .normal)
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
        button.layer.borderColor = Colors.buttonBorderColor.cgColor
        button.layer.cornerRadius = buttonBorderCornerRadius
    }
    
    private func setupResultLabelUI(){
        resultLabel.textColor = Colors.labelFontColorNormal
        resultLabel.font = UIFont.systemFont(ofSize: labelFontSize)
        resultLabel.text = currentTextInResultLabel
    }
    
    // MARK: Actions:
    @IBAction func someButtonTapped(_ sender: CalcButton) {
        
        switch sender.tag {
        // AC button:
        case 11:
            currentTextInResultLabel = "0"
            currentOperation = nil
            operand1 = 0
            operand2 = 0
            for button in allButtons {
                setupAllButtonsUI(for: button)
                button.isUserInteractionEnabled = true
            }
        
        // squareRoot button:
        case 12:
            return
        
        // percentage button:
        case 13:
            return
        
        // divide button:
        case 14:
            operationButtonPressed(for: .divide)
                        
        // Numeric buttons:
        case 21, 22, 23, 31, 32, 33, 41, 42, 43, 52:
            guard resultLabel.textColor != Colors.labelFontColorFrozen else {
                resultLabel.textColor = Colors.labelFontColorNormal
                currentTextInResultLabel = ""
                currentTextInResultLabel += sender.currentTitle ?? ""
                return
            }
            
            guard currentTextInResultLabel != "0" else {
                currentTextInResultLabel = sender.currentTitle ?? ""
                return
            }
            currentTextInResultLabel += sender.currentTitle ?? ""
        
        // multiply button:
        case 24:
            operationButtonPressed(for: .multiply)
            
        // minus button:
        case 34:
            operationButtonPressed(for: .minus)
            
        // plus button:
        case 44:
            guard sender.backgroundColor != Colors.actionButtonFrozen else { return }
            sender.isUserInteractionEnabled = false
            sender.animateWithPulsate()
            sender.animateWithFlash()
            sender.backgroundColor = Colors.actionButtonFrozen
            operationButtonPressed(for: .plus)
            
        // PlusMinus button:
        case 51:
            guard currentTextInResultLabel != "0" else { return }
            
            guard currentTextInResultLabel.first != "\u{2212}" else {
                currentTextInResultLabel.removeFirst()
                return
            }
            currentTextInResultLabel = "\u{2212}" + currentTextInResultLabel
        
        // Comma button:
        case 53:
            guard !currentTextInResultLabel.contains(sender.currentTitle!) else { return }
            currentTextInResultLabel += sender.currentTitle ?? ""
            
        // Result (Equal) button:
        case 54:
            guard currentOperation != nil else {
                return
            }
            operand2 = Double(currentTextInResultLabel) ?? 0
            let result = resultOfOperation(operation: currentOperation!, operand1, and: operand2)
            operand1 = result
            
            resultLabel.text = String(result)
            resultLabel.textColor = Colors.labelFontColorFrozen
            currentOperation = nil
            
        default:
            break
        }
    }
}
