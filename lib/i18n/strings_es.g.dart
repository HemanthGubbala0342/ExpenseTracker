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
class TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEs _root = this; // ignore: unused_field

	// Translations
	@override String get app_title => 'Rastreador de Gastos';
	@override String get slidable_editButton => 'Editar';
	@override String get slidable_deleteButton => 'Eliminar';
	@override String get name => 'Nombre';
	@override String get category => 'Categoría';
	@override String get amount => 'Cantidad';
	@override String get payment_date => 'Fecha de Pago';
	@override String get created_at => 'Creado En';
	@override String get add_expense => 'Agregar Gasto';
	@override String get recipient_name => 'Nombre del Destinatario';
	@override String get select_a_Date => 'Seleccionar una Fecha';
	@override String get cancel => 'Cancelar';
	@override String get save => 'Guardar';
	@override String get update_expense => 'Actualizar Gasto';
	@override String get monthly_expense => 'Gasto Mensual';
	@override String get month_and_year => 'Mes/Año :';
	@override String get total_Amount => 'Cantidad Total';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'app_title': return 'Rastreador de Gastos';
			case 'slidable_editButton': return 'Editar';
			case 'slidable_deleteButton': return 'Eliminar';
			case 'name': return 'Nombre';
			case 'category': return 'Categoría';
			case 'amount': return 'Cantidad';
			case 'payment_date': return 'Fecha de Pago';
			case 'created_at': return 'Creado En';
			case 'add_expense': return 'Agregar Gasto';
			case 'recipient_name': return 'Nombre del Destinatario';
			case 'select_a_Date': return 'Seleccionar una Fecha';
			case 'cancel': return 'Cancelar';
			case 'save': return 'Guardar';
			case 'update_expense': return 'Actualizar Gasto';
			case 'monthly_expense': return 'Gasto Mensual';
			case 'month_and_year': return 'Mes/Año :';
			case 'total_Amount': return 'Cantidad Total';
			default: return null;
		}
	}
}

