package com.example.facebank

import android.annotation.SuppressLint
import android.os.Build
import android.provider.Settings
import android.util.Base64
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.nio.charset.StandardCharsets
import java.security.KeyFactory
import java.security.spec.X509EncodedKeySpec
import javax.crypto.Cipher

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "accusys.facebank.com/encrypt"
        private const val COMMON_HASH = "Facebank_2022_Mobile"
        private const val IV_HASH = "*Face!Bank_2022!"
        private const val ALGORITHM = "AES/CBC/PKCS5Padding"
        private const val ENCRYPT_PASS_ACTION = "e_password"
        private const val ENCRYPT_DATA = "encrypt"
        private const val DECRYPT_DATA = "decrypt"

        // ANDROID ID
        private const val CHANNEL_ID = "accusys.facebank.com/udid"
        private const val ID_ACTION = "udid"


    }

    @SuppressLint("HardwareIds")
    @RequiresApi(Build.VERSION_CODES.O)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_ID).setMethodCallHandler { call, result ->
            when(call.method){
                ID_ACTION -> {
                    val udid = Settings.Secure.getString(contentResolver, Settings.Secure.ANDROID_ID);
                    result.success(udid)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->

            val mapData = call.arguments as HashMap<*,*>
            when (call.method) {
                ENCRYPT_PASS_ACTION -> {
                    val key = mapData["key"] as String
                    val password = mapData["password"] as String
                    val resultEncrypt = encryptPassword(key, password)
                    result.success(resultEncrypt)
                }
                ENCRYPT_DATA -> {
                    val sessionId = mapData["sessionId"] as String
                    val data = mapData["data"] as String

                    val key = CryptoHelper.getKeyFromPassword(sessionId, COMMON_HASH)

                    val ivParameterSpec = CryptoHelper.generateIv(IV_HASH)

                    val encryptResult = CryptoHelper.encrypt(ALGORITHM,data,key,ivParameterSpec)
                    result.success(encryptResult)

                }
                DECRYPT_DATA -> {
                    val sessionId = mapData["sessionId"] as String
                    val data = mapData["data"] as String

                    val key = CryptoHelper.getKeyFromPassword(sessionId, COMMON_HASH)

                    val ivParameterSpec = CryptoHelper.generateIv(IV_HASH)

                    val decryptResult = CryptoHelper.decrypt(ALGORITHM,data,key,ivParameterSpec)
                    result.success(decryptResult)
                }
                else ->{
                 result.notImplemented()
                }
            }
        }

    }

    fun encryptPassword(PUBLIC_KEY: String, password: String): String? {

        return try {
            val keyBytes: ByteArray = Base64.decode(PUBLIC_KEY, Base64.DEFAULT)
            val publicSpec = X509EncodedKeySpec(keyBytes)
            val keyFactory: KeyFactory = KeyFactory.getInstance("RSA")
            val publicKey = keyFactory.generatePublic(publicSpec)

            val cipher: Cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding")
            cipher.init(Cipher.ENCRYPT_MODE, publicKey)
            val encryptedBytes = cipher.doFinal(password.toByteArray(StandardCharsets.UTF_8))
            return Base64.encodeToString(encryptedBytes, Base64.DEFAULT)
        } catch (e: Exception) {
            e.printStackTrace()
            null
        }
    }
}
