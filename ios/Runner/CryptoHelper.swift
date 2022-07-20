//

import Foundation
import CryptoSwift
import CryptoKit


class CryptoHelper{
    static let shared = CryptoHelper()
    
    func getKeyFromPassword(customPassword: String, customSalt: String) throws -> Array<UInt8>{
        let password: Array<UInt8> = Array(customPassword.utf8)
        let salt: Array<UInt8> = Array(customSalt.utf8)
        let key = try PKCS5.PBKDF2(
            password: password,
            salt: salt,
            iterations: 1199,
            keyLength: 16,
            variant: .sha2(.sha256)
        ).calculate()
        return key
    }
    
    func generateIv(iv_hash: String) -> Array<UInt8>{
        return Array(iv_hash.utf8)
    }
    
    func decrypt(cipherText: String, key: Array<UInt8>, iv: Array<UInt8>) -> String?{
        
        do{
            let d=Data(base64Encoded: cipherText)
            
            let aes = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs5)
            
            let decrypted = try aes.decrypt(d!.bytes)
            
            return String(data: Data(decrypted), encoding: .utf8)}
        catch {
            return nil
        }
    }
    
    func encrypt(cipherText: String, key: Array<UInt8>, iv: Array<UInt8>) -> String?{
        do{
            let d=Data(base64Encoded: cipherText)
            let aes = try AES(key: key, blockMode: CBC(iv: iv), padding: .pkcs5)
            let encrypt = try aes.encrypt(d!.bytes)
            
            return String(data: Data(encrypt), encoding: .utf8)
        }catch{
            return nil
        }
        
    }
}
