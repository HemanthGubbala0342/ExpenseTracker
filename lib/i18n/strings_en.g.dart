///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get app_title => 'Expense Tracker';
	String get slidable_editButton => 'Edit';
	String get slidable_deleteButton => 'Delete';
	String get name => 'Name';
	String get category => 'Category';
	String get amount => 'Amount';
	String get payment_date => 'PaymentDate';
	String get created_at => 'CreatedAt';
	String get add_expense => 'Add Expense';
	String get recipient_name => 'RecipientName';
	String get select_a_Date => 'Select a Date';
	String get cancel => 'Cancel';
	String get save => 'Save';
	String get update_expense => 'UpdateExpense';
	String get monthly_expense => 'Monthly Expense';
	String get month_and_year => 'Month/Year :';
	String get total_Amount => 'Total Amount';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_title': return 'Expense Tracker';
			case 'slidable_editButton': return 'Edit';
			case 'slidable_deleteButton': return 'Delete';
			case 'name': return 'Name';
			case 'category': return 'Category';
			case 'amount': return 'Amount';
			case 'payment_date': return 'PaymentDate';
			case 'created_at': return 'CreatedAt';
			case 'add_expense': return 'Add Expense';
			case 'recipient_name': return 'RecipientName';
			case 'select_a_Date': return 'Select a Date';
			case 'cancel': return 'Cancel';
			case 'save': return 'Save';
			case 'update_expense': return 'UpdateExpense';
			case 'monthly_expense': return 'Monthly Expense';
			case 'month_and_year': return 'Month/Year :';
			case 'total_Amount': return 'Total Amount';
			default: return null;
		}
	}
}

