import UIKit

enum ButtonBackground {
    case primaryButtonBackground
    case secondaryButtonBackground
    case actionButtonActiveBackground
    case actionButtonNotActiveBackground
    
    var color: UIColor {
        switch self {
        case .primaryButtonBackground:
            return CalcButtonDTO.primaryButton.backgroundColor
        case .secondaryButtonBackground:
            return CalcButtonDTO.secondaryButton.backgroundColor
        case .actionButtonActiveBackground:
            return CalcButtonDTO.actionButtonActive.backgroundColor
        case .actionButtonNotActiveBackground:
            return CalcButtonDTO.actionButtonNotActive.backgroundColor
        }
    }
}

class CalcButton: UIButton {
    var titleToShow: String { setTitleFor(self) }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setTitleFor(_ button: CalcButton) -> String {
        if let buttonTitle = button.title(for: .normal) {
            switch buttonTitle {
            case "0":
                return __("number_0_button_title")
            case "1":
                return __("number_1_button_title")
            case "2":
                return __("number_2_button_title")
            case "3":
                return __("number_3_button_title")
            case "4":
                return __("number_4_button_title")
            case "5":
                return __("number_5_button_title")
            case "6":
                return __("number_6_button_title")
            case "7":
                return __("number_7_button_title")
            case "8":
                return __("number_8_button_title")
            case "9":
                return __("number_9_button_title")
                
            case "addition":
                return __("addition_button_title")
            case "subtraction":
                return __("subtraction_button_title")
            case "multiplication":
                return __("multiplication_button_title")
            case "division":
                return __("division_button_title")
                
            case "squareroot":
                return __("square_root_button_title")
            case "percent":
                return __("percent_button_title")
                
            case "reset":
                return __("reset_button_title")
            case "equals":
                return __("equals_button_title")
            case "decimalpoint":
                return __("decimal_point_button_title")
            case "plusminus":
                return __("plus_minus_button_title")
            default:
                //  TODO: Create Error handling, when current button title was not found in current button titles list
                return "Error2"
            }
        }
        //  TODO: Create Error handling, when buttons title is nil
        return "Error1"
    }
    
    func animateWithPulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.97
        pulse.toValue = 1.0
//        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
//        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    func animateWithFlash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.7
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
}
