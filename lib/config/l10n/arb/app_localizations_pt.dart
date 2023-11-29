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
  String get completed => 'Tarefa completa';

  @override
  String get settings => 'Configurações';

  @override
  String get incompleted => 'Tarefa incompleta';

  @override
  String get toBeCompleted => 'Tarefa a ser concluída em ';

  @override
  String get additionalNote => 'Não há nenhuma nota adicional para esta tarefa';

  @override
  String get delete => 'Tarefa excluída com sucesso';

  @override
  String get question => 'Tem certeza de que deseja excluir esta tarefa?';

  @override
  String get yes => 'Sim';

  @override
  String get no => 'Não';

  @override
  String get category => 'Categoria';

  @override
  String get date => 'Data';

  @override
  String get time => 'Hora/Minutos';

  @override
  String get defineTheme => 'Definir tema:';

  @override
  String get defaultTheme => 'Padrão do sistema';

  @override
  String get dark => 'Escuro';

  @override
  String get light => 'Claro';

  @override
  String get title => 'Título';

  @override
  String get titleTask => 'Título da tarefa';

  @override
  String get note => 'Nota';

  @override
  String get noteTask => 'Nota para tarefa';

  @override
  String get save => 'Salvar';

  @override
  String get created => 'Tarefa criada com Sucesso';

  @override
  String get alertTaskNoCreated => 'Título da tarefa não pode ser vazio';

  @override
  String get selectLanguage => 'Selecione o idioma';
}
