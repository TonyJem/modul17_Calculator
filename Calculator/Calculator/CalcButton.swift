import UIKit

enum ButtonColorScheme {
    case primaryButton, secondaryButton, actionButtonNormal

    var buttonBackgroundColor: UIColor{
        switch self {
        case .primaryButton:
            return Colors.primaryButton
        case .secondaryButton:
            return Colors.secondaryButton      
        case .actionButtonNormal:
            return Colors.actionButtonNormal
        }
    }
}

class CalcButton: UIButton {
    var titleToShow: String = "TTT"
    var colorScheme: ButtonColorScheme = .primaryButton
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
