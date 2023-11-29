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
  String get completed => 'Task completed';

  @override
  String get settings => 'Settings';

  @override
  String get incompleted => 'Task incompleted';

  @override
  String get toBeCompleted => 'Task to be completed on ';

  @override
  String get additionalNote => 'There is no additional note for this task';

  @override
  String get delete => 'Task delete successfully';

  @override
  String get question => 'Are you sure you want to delete this task?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get category => 'Category';

  @override
  String get date => 'Date';

  @override
  String get time => 'Time';

  @override
  String get defineTheme => 'Define Theme:';

  @override
  String get defaultTheme => 'System default';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Ligth';

  @override
  String get title => 'Title';

  @override
  String get titleTask => 'Task title';

  @override
  String get note => 'Note';

  @override
  String get noteTask => 'Task note';

  @override
  String get save => 'Save';

  @override
  String get created => 'Task created Successfully';

  @override
  String get alertTaskNoCreated => 'Task title cannot be empty';

  @override
  String get selectLanguage => 'Select language';
}
