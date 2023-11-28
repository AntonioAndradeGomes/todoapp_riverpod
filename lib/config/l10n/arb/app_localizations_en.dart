import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get titleHomePage => 'My Todo List';

  @override
  String get listTaskTodoEmpty => 'There is no task todo!';

  @override
  String get listTaskTodoCompletedEmpty => 'There is no completed task yet!';

  @override
  String get addNewTask => 'Add New Task';

  @override
  String get completed => 'Completed';
}
