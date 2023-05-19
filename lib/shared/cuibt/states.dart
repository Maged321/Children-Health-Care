
abstract class ChildernStates{}

class ChildernGetUserInitialiState extends ChildernStates{}
class ChildernGetUserLoadingState extends ChildernStates{}
class ChildernGetUserSucccessState extends ChildernStates{}
class ChildernGetUserErrorState extends ChildernStates{
  final String error;

  ChildernGetUserErrorState(this.error);
}

class ChildernGetHomeDataLoadingState extends ChildernStates{}
class ChildernGetHomeDataSucccessState extends ChildernStates{}
class ChildernGetHomeDataErrorState extends ChildernStates{
  final String error;

  ChildernGetHomeDataErrorState(this.error);
}

class ChildernGetPregrancyDataLoadingState extends ChildernStates{}
class ChildernGetPregrancyDataSucccessState extends ChildernStates{}
class ChildernGetPregrancyDataErrorState extends ChildernStates{
  final String error;

  ChildernGetPregrancyDataErrorState(this.error);
}

class ChildernGetCategoryDataLoadingState extends ChildernStates{}
class ChildernGetCategoryDataSucccessState extends ChildernStates{}
class ChildernGetCategoryDataErrorState extends ChildernStates{
  final String error;

  ChildernGetCategoryDataErrorState(this.error);
}

class ChildernGetArticlesDataLoadingState extends ChildernStates{}
class ChildernGetArticlesDataSucccessState extends ChildernStates{}
class ChildernGetArticlesDataErrorState extends ChildernStates{
  final String error;

  ChildernGetArticlesDataErrorState(this.error);
}
class ChildernGetVidoesDataLoadingState extends ChildernStates{}
class ChildernGetVidoesDataSucccessState extends ChildernStates{}
class ChildernGetVidoesDataErrorState extends ChildernStates{
  final String error;

  ChildernGetVidoesDataErrorState(this.error);
}
class GetSubtitlesVideoLoadingState extends ChildernStates{}
class GetSubtitlesVideoSucccessState extends ChildernStates{}
class GetSubtitlesVideoErrorState extends ChildernStates{
  final String error;

  GetSubtitlesVideoErrorState(this.error);
}
class AppChangeModeDarkState extends ChildernStates{}




