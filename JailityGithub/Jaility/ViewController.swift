
import UIKit
import ZIPFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var DisableLockRespringB: UIButton!
    @IBOutlet weak var SuperviseDeviceB: UIButton!
    @IBOutlet weak var UnsuperviseDeviceB: UIButton!
    @IBOutlet weak var ChangeBadgeColorB: UIButton!
    @IBOutlet weak var ChangeBadgeColorBackB: UIButton!
    @IBOutlet weak var ColorWell: UIColorWell!
    @IBOutlet weak var ChangeIconNB: UIButton!
    @IBOutlet weak var ChangeIconOGB: UIButton!
    @IBOutlet weak var ChangePasswordKeysB: UIButton!
    @IBOutlet weak var RevertPasswordKeysB: UIButton!
    @IBOutlet weak var modernOSDownloadBIB: UIButton!
    @IBOutlet weak var EnableLockRespringB: UIButton!
    @IBOutlet weak var FelicityProDownloadBIB: UIButton!
    @IBOutlet weak var progressViewmodernOS : UIProgressView!
    @IBOutlet weak var progressViewFelicityPro : UIProgressView!
    private var showingError = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isSandboxEscaped() {
            showingError.toggle()
            DisableLockRespringB?.isEnabled = false
            SuperviseDeviceB?.isEnabled = false
            UnsuperviseDeviceB?.isEnabled = false
            ChangeBadgeColorB?.isEnabled = false
            ChangeBadgeColorBackB?.isEnabled = false
            ColorWell?.isEnabled = false
            ChangePasswordKeysB?.isEnabled = false
            ColorWell?.alpha = 0.5
            RevertPasswordKeysB?.isEnabled = false
            modernOSDownloadBIB?.isEnabled = false
            EnableLockRespringB?.isEnabled = false
            FelicityProDownloadBIB?.isEnabled = false
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            ChangeIconNB?.alpha = 0.5
            ChangeIconNB?.isUserInteractionEnabled = false
            ChangeIconOGB?.alpha = 0.5
            ChangeIconOGB?.isUserInteractionEnabled = false
        }
        
        if FileManager.default.fileExists(atPath: "/var/mobile/Library/WebClips/17EBF20D5A7A4CE99EC1A6EF9DD0F2C7.webclip") {
            do {
                modernOSDownloadBIB?.isEnabled = false
                self.modernOSDownloadBIB.setTitle("INSTALLED", for: UIControl.State.normal)
            }
        }
        
        if FileManager.default.fileExists(atPath: "/var/mobile/Library/WebClips/507C7F5EE26E4BB2810F02E44AD7F7D4.webclip") {
            do {
                FelicityProDownloadBIB?.isEnabled = false
                self.FelicityProDownloadBIB.setTitle("INSTALLED", for: UIControl.State.normal)
            }
        }
    }
    
    @IBAction func DisableLockRespringI(_ sender: Any) {
        let alert = UIAlertController(title: "About", message: "Disables locking your device after you respring it.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func EnableLockRespringI(_ sender: Any) {
        let alert = UIAlertController(title: "About", message: "Enables locking your device after you respring it.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func SuperviseDeviceI(_ sender: Any) {
        let alert = UIAlertController(title: "About", message: "Supervises your Device. If you don't know what it is, don't try it.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func UnsuperviseDeviceI(_ sender: Any) {
        let alert = UIAlertController(title: "About", message: "Unsupervises your Device. If you don't know what it is, don't try it.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func ChangeBadgeColorBackI(_ sender: Any) {
        let alert = UIAlertController(title: "About", message: "Changes your notification badge colour back to red.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func ChangePasswordKeysI(_ sender: Any) {
        let alert = UIAlertController(title: "About", message: "Removes the numbers and letters from the password keys.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func RevertPasswordKeysI(_ sender: Any) {
        let alert = UIAlertController(title: "About", message: "Adds the numbers and letters to the password keys back.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func RespringDevice(_ sender: Any) {
        guard let window = UIApplication.shared.windows.first else { return }
        while true {
            window.snapshotView(afterScreenUpdates: false)
        }
    }
    
    @IBAction func ChangeBadgeColorF(_ sender: Any) {
        changeColour(colour: ColorWell.selectedColor!)
    }
    
    @IBAction func EnableLockRespringF(_ sender: Any) {
        writeFileAndConvertFromAscii(asciiStr: "801089799101104111108100101114321161011201163211610497116321199711532101100105116101100329812132749710510810511612146", filepath: "/var/Managed Preferences/mobile/com.apple.springboard.plist")
        let alert = UIAlertController(title: "Success!", message: "The modification was removed successfully. Please, respring your device now.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func DisableLockRespringF(_ sender: Any) {
        writeFileAndConvertFromAscii(asciiStr: "60631201091083211810111411510511111061344946483432101110991111001051101036134117116102455634636232603368796784898069321121081051151163280856676736732344547476511211210810132671111091121171161011144747688468328076738384324946484747697834323497112112108101469911110947688468115478011411111210111411612176105115116454946484610011610034623260112108105115116321181011141151051111106134494648346232601001059911662326010710112162836668111110116761119910765102116101114671149711510460471071011216232601161141171014762326047100105991166232604711210810511511662", filepath: "/var/Managed Preferences/mobile/com.apple.springboard.plist")
        let alert = UIAlertController(title: "Success!", message: "The modification was applied successfully. Please, respring your device now.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func UnsuperviseDeviceF(_ sender: Any) {
        writeFileAndConvertFromAscii(asciiStr: "60631201091083211810111411510511111061344946483432101110991111001051101036134858470455634636232603368796784898069321121081051151163280856676736732344547476511211210810147476884683280767383843249464847476978343234104116116112584747119119119469711211210810146991111094768846811547801141111121011141161217610511511645494648461001161003462326011210810511511632118101114115105111110613449464834623260100105991166232601071011216265108108111119809710511410511010360471071011216232601161141171014762326010710112162671081111171006711111010210510311711497116105111110857367111109112108101116101604710710112162326011611411710147623260107101121626711111010210510311711497116105111110831111171149910160471071011216232601051101161011031011146248604710511011610110310111462326010710112162731158311711210111411810511510110060471071011216232601029710811510147623260107101121628011111511683101116117112801141111021051081018797115731101151169710810810110060471071011216232601161141171014762326047100105991166232604711210810511511662", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
        let alert = UIAlertController(title: "Success!", message: "The modification was removed successfully. Please, reboot your device now.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func SuperviseDeviceF(_ sender: Any) {
        writeFileAndConvertFromAscii(asciiStr: "606312010910832118101114115105111110613449464834321011109911110010511010361348584704556346362326033687967848980693211210810511511632808566767367323445474765112112108101474768846832807673838432494648474769783432341041161161125847471191191194697112112108101469911110947688468115478011411111210111411612176105115116454946484610011610034623260112108105115116321181011141151051111106134494648346232601001059911662326010710112162651081081111198097105114105110103604710710112162326011611411710147623260107101121626710811111710067111110102105103117114971161051111108573671111091121081011161016047107101121623260116114117101476232601071011216267111110102105103117114971161051111108311111711499101604710710112162326010511011610110310111462486047105110116101103101114623260107101121627311583117112101114118105115101100604710710112162326011611411710147623260107101121628011111511683101116117112801141111021051081018797115731101151169710810810110060471071011216232601161141171014762326047100105991166232604711210810511511662", filepath: "/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/CloudConfigurationDetails.plist")
        let alert = UIAlertController(title: "Success!", message: "The modification was applied successfully. Please, reboot your device now.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func ChangePasswordKeysF(_ sender: Any) {
        _ = CustomPassKeys()
        let alert = UIAlertController(title: "Success!", message: "The modification was applied successfully. Please, respring your device now.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func RevertPasswordKeysF(_ sender: Any) {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-0---white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-1---white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-2-A B C--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-3-D E F--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-4-G H I--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-5-J K L--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-6-M N O--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-7-P Q R S--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-8-T U V--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-9-W X Y Z--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-0---white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-1---white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-2-A B C--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-3-D E F--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-4-G H I--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-5-J K L--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-6-M N O--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-7-P Q R S--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-8-T U V--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-9-W X Y Z--white.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-0---mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-1---mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-2-A B C--mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-3-D E F--mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-4-G H I--mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-5-J K L--mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-6-M N O--mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-7-P Q R S--mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-8-T U V--mask.png")
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-9-W X Y Z--mask.png")
            let alert = UIAlertController(title: "Success!", message: "The modification was removed successfully. Please, respring your device now.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        } catch {
            print("error")
        }
    }
    
    @IBAction func ChangeBadgeColourBackF(_ sender: Any) {
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: "/var/mobile/Library/Caches/MappedImageCache/Persistent/SBIconBadgeView.BadgeBackground:26:26.cpbitmap")
            let alert = UIAlertController(title: "Success!", message: "The modification was removed successfully. Please, respring your device now.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        } catch {
            print("error")
        }
    }
    
    @IBAction func ChangeIconN(_ sender: Any) {
        UIApplication.shared.setAlternateIconName(nil)
    }
    
    @IBAction func ChangeIconOG(_ sender: Any) {
        UIApplication.shared.setAlternateIconName("AppIcon-2")
    }
    
    @IBAction func ViewMugunghwaGPLv3License(_ sender: Any) {
        if let url = URL(string: "https://github.com/s8ngyu/Mugunghwa/blob/main/License") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func ViewMugunghwaObjCHelper(_ sender: Any) {
        if let url = URL(string: "https://github.com/s8ngyu/Mugunghwa/blob/main/mugunghwa/ObjcHelper.m") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func ViewZIPFoundationProject(_ sender: Any) {
        if let url = URL(string: "https://github.com/weichsel/ZIPFoundation") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func ViewZIPFoundationLicense(_ sender: Any) {
        if let url = URL(string: "https://github.com/weichsel/ZIPFoundation/blob/development/LICENSE") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @IBAction func modernOSDownloadB(_ sender: Any) {
        let url = URL(string: "https://haxi0-dev.com/assets/modernOS.zip")
        let webClipsPath = URL(string: "/var/mobile/Library/WebClips/modernOS.zip")
        let webClipsDecomP = URL(string: "/var/mobile/Library/WebClips/")
        Bundle.main.path(forResource: "modernOS", ofType: "zip")
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("modernOS.zip")
        self.modernOSDownloadBIB.alpha = 0
        self.progressViewmodernOS.alpha = 1
        FileDownloader.loadFileAsync(url: url!) { (path, error) in
            print(".zip File downloaded to : \(path!)")
            self.progressViewmodernOS.progress += 0.5
            print(webClipsPath!.path)
            print(myurl.path)
            let fileManager = FileManager()
            var sourceURL = URL(fileURLWithPath: webClipsDecomP!.path)
            sourceURL.appendPathComponent("modernOS.zip")
            var destinationURL = URL(fileURLWithPath: webClipsDecomP!.path)
            do {
                        if FileManager.default.fileExists(atPath: myurl.path) {
                            try FileManager.default.moveItem(atPath: myurl.path, toPath: webClipsPath!.path)
                            try fileManager.unzipItem(at: sourceURL, to: destinationURL)
                            self.progressViewmodernOS.progress += 0.5
                            guard let window = UIApplication.shared.windows.first else { return }
                            while true {
                                window.snapshotView(afterScreenUpdates: false)
                            }
                        }
                    } catch {
                        print("oops")
                        let alert = UIAlertController(title: "Error!", message: "An error occured while moving / unzipping the .zip file!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
        }
    }
    
    @IBAction func FelicityProDownloadB(_ sender: Any) {
        let url = URL(string: "https://haxi0-dev.com/assets/FelicityPro.zip")
        let webClipsPath = URL(string: "/var/mobile/Library/WebClips/FelicityPro.zip")
        let webClipsDecomP = URL(string: "/var/mobile/Library/WebClips/")
        Bundle.main.path(forResource: "FelicityPro", ofType: "zip")
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent("FelicityPro.zip")
        self.FelicityProDownloadBIB.alpha = 0
        self.progressViewFelicityPro.alpha = 1
        FileDownloader.loadFileAsync(url: url!) { (path, error) in
            print(".zip File downloaded to : \(path!)")
            self.progressViewFelicityPro.progress += 0.5
            print(webClipsPath!.path)
            print(myurl.path)
            let fileManager = FileManager()
            var sourceURL = URL(fileURLWithPath: webClipsDecomP!.path)
            sourceURL.appendPathComponent("FelicityPro.zip")
            var destinationURL = URL(fileURLWithPath: webClipsDecomP!.path)
            do {
                        if FileManager.default.fileExists(atPath: myurl.path) {
                            try FileManager.default.moveItem(atPath: myurl.path, toPath: webClipsPath!.path)
                            try fileManager.unzipItem(at: sourceURL, to: destinationURL)
                            self.progressViewmodernOS.progress += 0.5
                            guard let window = UIApplication.shared.windows.first else { return }
                            while true {
                                window.snapshotView(afterScreenUpdates: false)
                            }
                        }
                    } catch {
                        print("oops")
                        let alert = UIAlertController(title: "Error!", message: "An error occured while moving / unzipping the .zip file!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
        }
    }
    
    func isSandboxEscaped() -> Bool {
        let fileManager = FileManager.default
        fileManager.createFile(atPath: "/var/mobile/org.haxi0.Jaility", contents: nil)
        if fileManager.fileExists(atPath: "/var/mobile/org.haxi0.Jaility") {
            do {
                try fileManager.removeItem(atPath: "/var/mobile/org.haxi0.Jaility")
            } catch {
                print("Failed to remove sandbox check file")
            }
            return true
        }
        
        return false
    }
    
    func writeFileAndConvertFromAscii(asciiStr: String, filepath: String) {
        var source = asciiStr
        var result = ""
        
        while source.count >= 2 {
            let digitsPerCharacter = source.hasPrefix("1") ? 3 : 2
            let charBytes = source.prefix(digitsPerCharacter)
            source = String(source.dropFirst(digitsPerCharacter))
            let number = Int(charBytes)!
            let character = UnicodeScalar(number)!
            result += String(character)
        }
        
        let fileManager = FileManager.default
        let url = URL(fileURLWithPath: filepath)
        fileManager.createFile(atPath: filepath, contents: nil)
        do {
            try result.write(to: url, atomically: true, encoding: .utf8)
        }
        catch {
            print("error")
        }
    }
    
    func changeColour(colour: UIColor) {
        var badge: UIImage = getRoundImage(12, 24, 24)!
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            badge = getRoundImage(24, 48, 48)!
        }
        
        badge = changeImageColour(badge, colour)!
        
        let savePath = "/var/mobile/SBIconBadgeView.BadgeBackground:26:26.cpbitmap"
        let targetPath = "/var/mobile/Library/Caches/MappedImageCache/Persistent/SBIconBadgeView.BadgeBackground:26:26.cpbitmap"
        
        let helper = ObjCHelper()
        helper.image(toCPBitmap: badge, path: savePath)
        
        let fileManager = FileManager.default
        do {
            try fileManager.removeItem(atPath: targetPath)
        } catch {
            print("error")
        }
        do {
            try fileManager.moveItem(atPath: savePath, toPath: targetPath)
            let alert = UIAlertController(title: "Success!", message: "The modification was applied successfully. Please, respring your device now.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        } catch {
            print("error")
        }
    }
    
    func changeImageColour(_ src_image: UIImage?, _ color: UIColor?) -> UIImage? {
        
        let rect = CGRect(x: 0, y: 0, width: src_image?.size.width ?? 0.0, height: src_image?.size.height ?? 0.0)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        if let CGImage = src_image?.cgImage {
            context?.clip(to: rect, mask: CGImage)
        }
        if let cgColor = color?.cgColor {
            context?.setFillColor(cgColor)
        }
        context?.fill(rect)
        let colorized_image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return colorized_image
    }
    
    func getRoundImage(_ radius: Int, _ width: Int, _ height: Int) -> UIImage? {
        
        let rect = CGRect(x: 0, y: 0, width: CGFloat(width), height: CGFloat(height))
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.black.cgColor)
        context?.fill(rect)
        let src_image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let image_layer = CALayer()
        image_layer.frame = CGRect(x: 0, y: 0, width: src_image?.size.width ?? 0.0, height: src_image?.size.height ?? 0.0)
        image_layer.contents = src_image?.cgImage
        
        image_layer.masksToBounds = true
        image_layer.cornerRadius = CGFloat(radius)
        
        UIGraphicsBeginImageContextWithOptions(src_image?.size ?? CGSize.zero, false, 0.0)
        if let aContext = UIGraphicsGetCurrentContext() {
            image_layer.render(in: aContext)
        }
        let rounded_image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return rounded_image
    }
    
    func CustomPassKeys() -> Bool {
        let fileManager = FileManager.default
        let helper = ObjCHelper()
        if fileManager.fileExists(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-0---white.png") {
            do {
                helper.generateBlankImage()
                let alert = UIAlertController(title: "Success!", message: "The modification was applied successfully. Please, respring your device now.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                if fileManager.fileExists(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/other-0---white.png") {
                    do {
                        helper.generateBlankImageNotEnglish()
                        let alert = UIAlertController(title: "Success!", message: "The modification was applied successfully. Please, respring your device now.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                    if fileManager.fileExists(atPath: "/var/mobile/Library/Caches/TelephonyUI-8/en-0---mask.png") {
                        do {
                            helper.generateBlankImageMask()
                            let alert = UIAlertController(title: "Success!", message: "The modification was applied successfully. Please, respring your device now.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            self.present(alert, animated: true)
                        }
                        return true
                    }
                    
                    return true
                }
                return true
            }
        }
        return false
    }
    
    class FileDownloader {
        
        static func loadFileSync(url: URL, completion: @escaping (String?, Error?) -> Void)
        {
            let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)
            
            if FileManager().fileExists(atPath: destinationUrl.path)
            {
                print("File already exists [\(destinationUrl.path)]")
                completion(destinationUrl.path, nil)
            }
            else if let dataFromURL = NSData(contentsOf: url)
            {
                if dataFromURL.write(to: destinationUrl, atomically: true)
                {
                    print("file saved [\(destinationUrl.path)]")
                    completion(destinationUrl.path, nil)
                }
                else
                {
                    print("error saving file")
                    let error = NSError(domain:"Error saving file", code:1001, userInfo:nil)
                    completion(destinationUrl.path, error)
                }
            }
            else
            {
                let error = NSError(domain:"Error downloading file", code:1002, userInfo:nil)
                completion(destinationUrl.path, error)
            }
        }
        
        static func loadFileAsync(url: URL, completion: @escaping (String?, Error?) -> Void)
        {
            let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            let destinationUrl = documentsUrl.appendingPathComponent(url.lastPathComponent)
            
            if FileManager().fileExists(atPath: destinationUrl.path)
            {
                print("File already exists [\(destinationUrl.path)]")
                completion(destinationUrl.path, nil)
            }
            else
            {
                let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let task = session.dataTask(with: request, completionHandler:
                                                {
                    data, response, error in
                    if error == nil
                    {
                        if let response = response as? HTTPURLResponse
                        {
                            if response.statusCode == 200
                            {
                                if let data = data
                                {
                                    if let _ = try? data.write(to: destinationUrl, options: Data.WritingOptions.atomic)
                                    {
                                        completion(destinationUrl.path, error)
                                    }
                                    else
                                    {
                                        completion(destinationUrl.path, error)
                                    }
                                }
                                else
                                {
                                    completion(destinationUrl.path, error)
                                }
                            }
                        }
                    }
                    else
                    {
                        completion(destinationUrl.path, error)
                    }
                })
                task.resume()
            }
        }
    }
}
