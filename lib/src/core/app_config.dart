class AppConfig {
  // WS Channel
  static final String CHANNEL_MOBILE_BANKING = 'CHANEL_MOBILE_BANKING';

  static final String BASE_URL = 'http://66.231.245.91:91';
  static final String TEMP_CULTURE = 'ES-VE';
  static final String KEY_TO_ENCRYPT =
      'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyVN//tVuvXaFJ5+O0mOYWupXcXnZ1T7oy1/nL0BdPxpGcyKjGMRGFHzOzmtsC1CK2eC6Aq8MjCCr3IaZvPOjKjfXrTuFaqRdp72uxaIeC7SCa4dPx+FQATehDlzdcC6bP9mvOdCAviHMdJSom2HuUFlY2mdc7azOryn2BtvDZ513zPXTLwfY97llsaNp3j0b5rfKIRj1R1+1FTlPLBFvamzpzKsIj1Ml2P7a8GQZ0KQ/ENPV+h4qTdCgWbNOpYGvTKcykf4tLWCRC/hQeV8+HCcjbPPOLthmZW1x8q2L7yFMAa6FugRorXqJArJIYB5jT5Av3JZeM8rQVKowFQPchQIDAQAB';

  // METHOD CHANNELS
  static final String ENCRYPT_PASS_METHOD_CHANNEL =
      'accusys.facebank.com/encrypt';
  static final String ID_METHOD_CHANNEL = 'accusys.facebank.com/udid';
  // ACTIONS METHOD CHANNELS
  static final String ENCRYPT_PASS_ACTION = 'e_password';
  static final String ENCRYPT_DATA_ACTION = 'encrypt';
  static final String DECRYPT_DATA_ACTION = 'decrypt';
  static final String UNIQUE_ID_ACTION = 'udid';

  // KEY TO MAP DATA
  static final String SESSION_ID_KEY = 'sessionId';
  static final String DATA_KEY = 'data';
}
