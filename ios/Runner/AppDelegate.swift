import UIKit
import Flutter
import simple_auth_flutter.SimpleAuthFlutterPlugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print("APPDELEGATE: open url \(url)")
        return SimpleAuthFlutterPlugin.check(url)
    }
    
    override func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return SimpleAuthFlutterPlugin.check(url)
    }
    
    override func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        print("openURL \(url)")
        return SimpleAuthFlutterPlugin.check(url)
    }
}
