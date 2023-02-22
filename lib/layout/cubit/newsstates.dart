abstract class NewsStates {}
class InitialState extends NewsStates {}
class ButtonNavState extends NewsStates {}
class GetBusinessLoadingState extends NewsStates {}
class GetBusinessSuccessState extends NewsStates {}
class GetBusinessErorrState extends NewsStates {
  final String  ? error ; 
  GetBusinessErorrState(this.error);
}
class GetScinceLoadingState extends NewsStates {}
class GetScinceSuccessState extends NewsStates {}
class GetScinceErorrState extends NewsStates {
  final String  ? error ; 
  GetScinceErorrState(this.error);
}
class GetSportsLoadingState extends NewsStates {}
class GetSportsSuccessState extends NewsStates {}
class GetSportsErorrState extends NewsStates {
  final String  ? error ; 
  GetSportsErorrState(this.error);
}
class GetSearchLoadingState extends NewsStates {}
class GetSearchSuccessState extends NewsStates {}
class GetSearchErorrState extends NewsStates {
  final String  ? error ; 
  GetSearchErorrState(this.error);
}
class ChangeThemeModeState extends NewsStates {}