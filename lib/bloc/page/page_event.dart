part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object?> get props => [];
}

class GoToHomePage extends PageEvent {}

class GoToChoosePage extends PageEvent {}

class GoToSplashVideoPage extends PageEvent {}

class GoToResultPage extends PageEvent {}