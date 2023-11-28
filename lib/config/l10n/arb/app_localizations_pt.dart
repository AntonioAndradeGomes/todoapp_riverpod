import 'app_localizations.dart';

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get titleHomePage => 'Minha Lista de Tarefas';

  @override
  String get listTaskTodoEmpty => 'Não há tarefa a fazer!';

  @override
  String get listTaskTodoCompletedEmpty => 'Ainda não há tarefa concluída!';

  @override
  String get addNewTask => 'Adicionar Nova Tarefa';

  @override
  String get completed => 'Completas';
}
