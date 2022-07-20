import UIKit
import Flutter
import CryptoSwift
import SwiftyRSA

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    let COMMON_HASH = "Facebank_2022_Mobile"
    let IV_HASH = "*Face!Bank_2022!"
    
    let ENCRYPT_PASS_METHOD_CHANNEL = "accusys.facebank.com/encrypt"
    let ID_METHOD_CHANNEL = "accusys.facebank.com/udid"
    
    let ENCRYPT_PASS_ACTION = "e_password"
    let ENCRYPT_DATA_ACTION = "encrypt"
    let DECRYPT_DATA_ACTION = "decrypt"
    let UNIQUE_ID_ACTION = "udid"
    
    // KEY TO MAP DATA
    let SESSION_ID_KEY = "sessionId"
    let DATA_KEY = "data"
    
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController
        
        let encryptChannel = FlutterMethodChannel(name: ENCRYPT_PASS_METHOD_CHANNEL, binaryMessenger: controller.binaryMessenger)
        let udidChannel = FlutterMethodChannel(name: ID_METHOD_CHANNEL, binaryMessenger: controller.binaryMessenger)
        
        
        encryptChannel.setMethodCallHandler({
            [weak self] (call:FlutterMethodCall, result: @escaping FlutterResult)-> Void in
            guard let args = call.arguments as? [String : Any] else {
                result(FlutterMethodNotImplemented)
                return
                
            }
            switch call.method {
                case self?.ENCRYPT_PASS_ACTION:
                self?.encryptPasswordOrAlias(args: args, result: result)
            case self?.ENCRYPT_DATA_ACTION:
                self?.encryptData(args: args, result: result)
            case self?.DECRYPT_DATA_ACTION:
                self?.decryptData(args: args, result: result)
                
                default:
                    result(FlutterMethodNotImplemented)
            }
            
        
        })
        
        udidChannel.setMethodCallHandler({
            [weak self] (call:FlutterMethodCall, result: @escaping FlutterResult)-> Void in
            
            guard call.method == self?.UNIQUE_ID_ACTION else {
                result(FlutterMethodNotImplemented)
                return
            }
            
            let udid = UIDevice.current.identifierForVendor!.uuidString
            result(udid)
        })
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func encryptData(args: [String: Any], result: FlutterResult){
        do{
            let sessionId = args[self.SESSION_ID_KEY] as! String
            let data = args[self.DATA_KEY] as! String
            
            let keySpec = try CryptoHelper.shared.getKeyFromPassword(customPassword: sessionId, customSalt: self.COMMON_HASH)
            let iv = CryptoHelper.shared.generateIv(iv_hash: self.IV_HASH)
            
            let encryptedData = CryptoHelper.shared.encrypt(cipherText: data, key: keySpec, iv: iv)
            
            if encryptedData != nil {
                result(encryptedData)
            }else {
                result(FlutterMethodNotImplemented)
            }
        }catch{
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func decryptData(args: [String: Any], result: FlutterResult){
        do{
            let sessionId = args[self.SESSION_ID_KEY] as! String
            let data = args[self.DATA_KEY] as! String
            
            let keySpec = try CryptoHelper.shared.getKeyFromPassword(customPassword: sessionId, customSalt: self.COMMON_HASH)
            let iv = CryptoHelper.shared.generateIv(iv_hash: self.IV_HASH)
            
            let decryptedData = CryptoHelper.shared.decrypt(cipherText: data, key: keySpec, iv: iv)
            
            if decryptedData != nil {
                result(decryptedData)
            }else {
                result(FlutterMethodNotImplemented)
            }
        }catch{
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func encryptPasswordOrAlias(args: [String: Any], result: FlutterResult){
        
        let PUBLIC_KEY = args["key"] as! String
        let passOrAlias = args["password"] as! String
        
        let clear = try! ClearMessage(string: passOrAlias, using: .utf8)
        let publicKey = try! PublicKey(base64Encoded: PUBLIC_KEY)
        let encrypted = try! clear.encrypted(with: publicKey, padding: .PKCS1)
        
       result(encrypted.base64String)
    }
}
