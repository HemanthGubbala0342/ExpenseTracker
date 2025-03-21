///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsTe implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsTe({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.te,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <te>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsTe _root = this; // ignore: unused_field

	// Translations
	@override String get app_title => 'ఖర్చుల ట్రాకర్';
	@override String get slidable_editButton => 'మార్చు';
	@override String get slidable_deleteButton => 'తొలగించు';
	@override String get name => 'పేరు';
	@override String get category => 'కేటగరీ';
	@override String get amount => 'ఖర్చు';
	@override String get payment_date => 'చెల్లింపు తేదీ';
	@override String get created_at => 'సృష్టించిన తేదీ';
	@override String get add_expense => 'ఖర్చు జోడించు';
	@override String get recipient_name => 'పేరు';
	@override String get select_a_Date => 'తేదీ ఎంచుకోండి';
	@override String get cancel => 'రద్దు చేయి';
	@override String get save => 'సేవ్ చేయి';
	@override String get update_expense => 'ఖర్చును నవీకరించు';
	@override String get monthly_expense => 'నెలవారీ ఖర్చు';
	@override String get month_and_year => 'నెల/సంవత్సరం :';
	@override String get total_Amount => 'మొత్తం';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsTe {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_title': return 'ఖర్చుల ట్రాకర్';
			case 'slidable_editButton': return 'మార్చు';
			case 'slidable_deleteButton': return 'తొలగించు';
			case 'name': return 'పేరు';
			case 'category': return 'కేటగరీ';
			case 'amount': return 'ఖర్చు';
			case 'payment_date': return 'చెల్లింపు తేదీ';
			case 'created_at': return 'సృష్టించిన తేదీ';
			case 'add_expense': return 'ఖర్చు జోడించు';
			case 'recipient_name': return 'పేరు';
			case 'select_a_Date': return 'తేదీ ఎంచుకోండి';
			case 'cancel': return 'రద్దు చేయి';
			case 'save': return 'సేవ్ చేయి';
			case 'update_expense': return 'ఖర్చును నవీకరించు';
			case 'monthly_expense': return 'నెలవారీ ఖర్చు';
			case 'month_and_year': return 'నెల/సంవత్సరం :';
			case 'total_Amount': return 'మొత్తం';
			default: return null;
		}
	}
}

