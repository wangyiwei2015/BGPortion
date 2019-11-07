import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var biasLabel: UILabel!
    var bias: Float = 0.0
    var overallBrightness: Float = 0.5
    var bPortion: Float = 0.25
    @IBAction func sliderBias(_ sender: UISlider) {
        biasLabel.text = String(sender.value)
        bias = sender.value
    }
    @IBOutlet weak var labelB: UILabel!
    @IBOutlet weak var labelP: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelB.text = "Brightness: "
        labelP.text = "G:0  |  B:0"
    }

    @IBAction func sliderB(_ sender: UISlider) {
        overallBrightness = sender.value
        setPortion()
        labelB.text = "oBrightness: " + String(sender.value)
    }
    @IBAction func sliderP(_ sender: UISlider) {
        /*if(sender.value > 0.5) {
            bPortion = sender.value
        } else {
            bPortion = overallBrightness / (1.0 - sender.value)
        }*/
        bPortion = sender.value + (1.0 - sender.value) * bias
        setPortion()
        labelP.text = "G:" + String(overallBrightness / bPortion) + "  |  B:" + String(bPortion)
    }
    func setPortion() {
        if(bPortion > 1) {bPortion = 1}
        var gPortion: Float = 1.0
        if(bPortion != 0) {gPortion = overallBrightness / bPortion}
        UIScreen.main.brightness = CGFloat(bPortion)
        view.backgroundColor = UIColor(white: CGFloat(gPortion), alpha: 1.0)
    }
}

