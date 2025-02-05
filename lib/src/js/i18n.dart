// ignore_for_file: non_constant_identifier_names
// ignore_for_file: unnecessary_import
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'dart:js_interop';
import 'chrome.dart';

export 'chrome.dart';

extension JSChromeJSI18nExtension on JSChrome {
  @JS('i18n')
  external JSI18n? get i18nNullable;

  /// Use the `chrome.i18n` infrastructure to implement internationalization
  /// across your whole app or extension.
  JSI18n get i18n {
    var i18nNullable = this.i18nNullable;
    if (i18nNullable == null) {
      throw ApiNotAvailableException('chrome.i18n');
    }
    return i18nNullable;
  }
}

extension type JSI18n._(JSObject _) {
  /// Gets the accept-languages of the browser. This is different from the
  /// locale used by the browser; to get the locale, use [i18n.getUILanguage].
  external JSPromise getAcceptLanguages();

  /// Gets the localized string for the specified message. If the message is
  /// missing, this method returns an empty string (''). If the format of the
  /// `getMessage()` call is wrong - for example, _messageName_ is not a string
  /// or the _substitutions_ array has more than 9 elements - this method
  /// returns `undefined`.
  external String getMessage(
    /// The name of the message, as specified in the <a
    /// href='how-to/ui/localization-message-formats'>`messages.json`</a> file.
    String messageName,

    /// Up to 9 substitution strings, if the message requires any.
    JSAny? substitutions,
    GetMessageOptions? options,
  );

  /// Gets the browser UI language of the browser. This is different from
  /// [i18n.getAcceptLanguages] which returns the preferred user languages.
  external String getUILanguage();

  /// Detects the language of the provided text using CLD.
  external JSPromise detectLanguage(

      /// User input string to be translated.
      String text);
}

/// An ISO language code such as `en` or `fr`. For a complete list of languages
/// supported by this method, see
/// [kLanguageInfoTable](http://src.chromium.org/viewvc/chrome/trunk/src/third_party/cld/languages/internal/languages.cc).
/// For an unknown language, `und` will be returned, which means that
/// [percentage] of the text is unknown to CLD
typedef LanguageCode = String;
extension type GetMessageOptions._(JSObject _) implements JSObject {
  external factory GetMessageOptions(
      {
      /// Escape `<` in translation to `&amp;lt;`. This applies only to the message
      /// itself, not to the placeholders. Developers might want to use this if the
      /// translation is used in an HTML context. Closure Templates used with
      /// Closure Compiler generate this automatically.
      bool? escapeLt});

  /// Escape `<` in translation to `&amp;lt;`. This applies only to the message
  /// itself, not to the placeholders. Developers might want to use this if the
  /// translation is used in an HTML context. Closure Templates used with
  /// Closure Compiler generate this automatically.
  external bool? escapeLt;
}
extension type DetectLanguageCallbackResult._(JSObject _) implements JSObject {
  external factory DetectLanguageCallbackResult({
    /// CLD detected language reliability
    bool isReliable,

    /// array of detectedLanguage
    JSArray languages,
  });

  /// CLD detected language reliability
  external bool isReliable;

  /// array of detectedLanguage
  external JSArray languages;
}
extension type DetectLanguageCallbackResultLanguages._(JSObject _)
    implements JSObject {
  external factory DetectLanguageCallbackResultLanguages({
    LanguageCode language,

    /// The percentage of the detected language
    int percentage,
  });

  external LanguageCode language;

  /// The percentage of the detected language
  external int percentage;
}
