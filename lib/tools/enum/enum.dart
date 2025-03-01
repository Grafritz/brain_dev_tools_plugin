// ignore_for_file: constant_identifier_names
enum EnumRefresh { fetchPaginatedShareByNoChant, fetchPaginatedShareWithMe }

enum EnumCollectionStatus { fetching, done }

enum EnumTabs { songBook, shareWithMe, groupeUser }

enum EnumPositionText { left, center, right }
enum EnumCadreFormat { square, retangle, custom }

enum TtsState { playing, stopped, paused, continued }

enum BackUpActions {
  planDeLecture,
  planDeLectureUser,
  progressionDeLecture,
  chapterRead,
  statisticQR,
  formulaireQuiz,
  note,
  bookmark, none
}

enum MyPageRouteName {
  homePage,
  profilePage,
  quizPage,
  quizDashBoard,
  dashBordForms,
  dashBoardQuizTabs0,
  dashBoardQuizTabs1,
  dashBoardQuizTabs2,
  dashBoardQuizTabs3,
  adminQuestion,
  formPlanDeLectureAddEdit,
  planDeLectureAll,
  planDeLectureTabs0,
  planDeLectureTabs1,
  planDeLectureTabs2
}

enum PlanDeLectureTabEnum {
  category,
  //allPlan,
  mySubPlan,
  myCreationPlan ,
  pdlShare }

enum UniLinksType { string, uri }

enum TypeRecherche { inAllCE, inGroup, inAllBible, oldTestament, newTestament, inBookChoice }

enum TypeRetour { libelleQuestion, explicationReponse, title, description }

enum Position { begin, end }

enum ActionsMenu { add, edit, delete, deleteOnline, see, share, copyLyricShare, editorShare, recherche, parametreDeLecture, active2Version  }

enum FilterQuery { byId, byCodeLecture }

enum TypeField { nbrRecord, streamPage, counterQuestion }

enum Langue { creole, francais, anglais, espagnole }
enum ReloadFunction{ none, userConnected, bookSelected, initData, espagnole }

enum SetActionFunction {
  saveChantUser,
  saveGroupeUser,
  sendUserShare,
  backUpOnlineChantUser,
  none
}

enum EnumDataFieldReturn { nomGroupe, nomGroupeWithBreak, colorGroupe }

enum ReponseChiffre { non, oui }

enum ActionsMenuAlignment { left, center, right }

enum AdsTypeEnum { RewardAds, InterstitialRewardAds }
enum EnumStatusPublish { zero, public, friend, private }

enum EnumEnvironmentType {
  chantchoraleetgroupe,
  chantdesperance,
  chantdesperancelegacy,
  lyricevangelique,
  chantlyric,
  labible,
  legoutduchef,
  planifMax,
  custom,
}
enum EnumEnvironment {
  chantChoraleEtGroupePROD,
  chantChoraleEtGroupeQA,

  chantDesperancePROD,
  chantDesperanceQA,

  chantDesperanceLegacyPROD,
  chantDesperanceLegacyQA,

  lyricEvangeliquePROD,
  lyricEvangeliqueQA,

  chantLyricPROD,
  chantLyricQA,

  labiblePROD,
  labibleQA,

  legoutduchefPROD,
  legoutduchefQA,

  planifMaxPROD,
  planifMaxQA,
}
enum EnumTemplateLogin { template1, template2, template3, template4 }

enum Type { multiple, boolean }
enum DifficultyEnum { easy, medium, hard }
enum TypeView { book, bookPdl, chapter, chapterPdl, verse, versePdl }

enum Availability { loading, available, unavailable }