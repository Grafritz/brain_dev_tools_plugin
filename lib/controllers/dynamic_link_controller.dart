import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:brain_dev_tools/tools/check_platform.dart';
import 'package:brain_dev_tools/tools/deeplinks_model.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/tools_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:uni_links/uni_links.dart';

class DynamicLinkController extends GetxController implements GetxService {

  //region [ ATTRIBUTS ]
  final navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks appLinks;
  StreamSubscription<Uri>? linkSubscription;
  final UniLinksType _type = UniLinksType.string;
  StreamSubscription? _streamSubscription;
  Uri? _initialUri, _latestUri;
  String? _initialLink='/';
  String latestLink = 'Unknown';
  DeepLinksModel? _deepLinks;
  bool _showProgressBar = false;
  bool get showProgressBar => _showProgressBar;
  bool _initialUriIsHandled = false;
  //endregion

  // @override
  // void initState() {
  //   super.initState();
  //
  //   initDeepLinks();
  // }
  @override
  dispose() {
    if (_streamSubscription != null) _streamSubscription?.cancel();
    if (linkSubscription != null) linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    appLinks = AppLinks();

    // Handle links
    linkSubscription = appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  //region [ UniLinks ]
  Future<void> initPlatformState() async {
    try {
      _handleIncomingLinks();
      await _handleInitialUri();
    }catch (ex, trace) {
      logError(ex, trace: trace);
    }
  }
  void _handleIncomingLinks() {
    if( checkPlatform.isMobile ) {
      logCat('001. _handleIncomingLinks called');
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _streamSubscription = appLinks.uriLinkStream.listen((Uri? uri) {
        //if (!mounted) return;
        logCat('001. _handleIncomingLinks: got uri: $uri');
        //setState(() {
        _latestUri = uri;
        //_err = null;
        //});

        //if (_isLoadDeepLink) {
        //getNavigatorPushNamed();
        //}
      }, onError: (Object? err) {
        //if (!mounted) return;
        logCat('001. _handleIncomingLinks: got err: $err');
        //setState(() {
        _latestUri = null;
        if (err is FormatException) {
          //_err = err;
        } else {
          //_err = null;
        }
        //});
      });
    }
  }

  /// Handle the initial Uri - the one the app was started with
  ///
  /// **ATTENTION**: `getInitialLink`/`getInitialUri` should be handled
  /// ONLY ONCE in your app's lifetime, since it is not meant to change
  /// throughout your app's life.
  ///
  /// We handle all exceptions, since it is called from initState.
  Future<void> _handleInitialUri() async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a weidget that will be disposed of (ex. a navigation route change).
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      logCat('_handleInitialUri called');
      try {
        //final uri = await appLinks.getInitialUri();
        final uri = await appLinks.getInitialLink();
        if (uri == null) {
          logCat('_handleInitialUri: no initial uri');
        } else {
          //logCat('_handleInitialUri: got initial uri: $uri');
          logCat('_handleInitialUri: _handleInitialUri: got uri: ${uri.path} ${uri.queryParametersAll}');
        }
        //if (!mounted) return;
        //setState(() => _ initialUri = uri);
        _latestUri = uri;
      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        logCat('_handleInitialUri: falied to get initial uri');
      } on FormatException catch (err) {
        //if (!mounted) return;
        logCat('_handleInitialUri: malformed initial uri $err');
        //setState(() => _err = err);
      }

      //if (_isLoadDeepLink) {
        //getNavigatorPushNamed();
      //}
    }
  }

  //region [ Plan de Lecture ]
  /*Future<void> getPlanDeLectureForDeepLink( { required String codeLecture }) async {
    showDialogProgress(show: true);
    PdlPlanDeLectureModel pdlObj;
    logCat('02-codeLecture: $codeLecture');
    if (Constant.isCodeLectureListSystem( codeList: Constant.listCodePlanDeLectureLocal, codeLecture: codeLecture)) {
      await Get.find<PdlPlanDeLectureController>().findByCodeLecture( codeLecture: codeLecture).then((value) async {
        if (value != null) { // Si le Plan par default // Et s'il existe sur le telephone
          pdlObj = value;
          await getBooksListPdl(pdlSub: Mappers().mapPdlToSubs(pdlObj));
        }
        if (value == null) { // Si le Plan n'existe sur le telephone | go to Search it online
          await getPlanDeLectureFromServer(codeLecture: codeLecture);
        }
      });
    } else {
      logCat('03-codeLecture: $codeLecture');
      await Get.find<PdlSubscriptionPlanController>().findByCodeLecture( codeLecture: codeLecture).then((value) async {
        logCat('04-codeLecture: $codeLecture');
        if (value != null) { // Si le Plan existe sur le telephone
          logCat('04.1-codeLecture: $codeLecture | value!=null');
          await getBooksListPdl(pdlSub: value);
        }
        if (value == null) { // Si le Plan n'existe sur le telephone | go to Search it online
          logCat('04.2-codeLecture: $codeLecture | value==null');
          await getPlanDeLectureFromServer(codeLecture: codeLecture);
        }
      });
    }
  }*/

  /*Future<void> getBooksListPdl( { required PdlSubscriptionPlanModel pdlSub }) async {
    try {
      //region Lecture Canonique
      if (Constant.isCodeLectureListSystem(codeLecture: pdlSub.codeLecture, codeList: Constant.listCodeLectureCanonique)) {
        pdlSub.booksList = booksController.booksList;
        _deepLinks.objArguments = pdlSub;
        _deepLinks.booksListArg1 = pdlSub.booksList;
        // return row;
      } else
        //endregion
        //region Lecture Chronologique
      if (Constant.isCodeLectureListSystem(codeLecture: pdlSub.codeLecture, codeList: Constant.listCodeLectureChronologique)) {
        // return ordreChronologiqueBooksList;
        pdlSub.booksList = ordreChronologiqueBooksList;
        _deepLinks.objArguments = pdlSub;
        _deepLinks.booksListArg1 = pdlSub.booksList;
        // return row;
      }
      //endregion
      //region Lecture Historique
      if (Constant.isCodeLectureListSystem(codeLecture: pdlSub.codeLecture, codeList: Constant.listCodeLectureHistorique)) {
        pdlSub.booksList = ordreHistoriqueBooksList;
        _deepLinks.objArguments = pdlSub;
        _deepLinks.booksListArg1 = pdlSub.booksList;
        // return row;
      }
      //endregion
      //region Lecture Ancien Testament
      if (Constant.isCodeLectureListSystem(codeLecture: pdlSub.codeLecture, codeList: Constant.listCodeLectureAT)) {
        await booksController.getBooks(isNT: false).then((
            valueBook) async {
          pdlSub.booksList = valueBook;
          _deepLinks.objArguments = pdlSub;
          _deepLinks.booksListArg1 = pdlSub.booksList;
          // return row;
        });
      }
      //endregion
      //region Lecture Nouveau Testament
      if (Constant.isCodeLectureListSystem(codeLecture: pdlSub.codeLecture, codeList: Constant.listCodeLectureNT)) {
        await booksController.getBooks( isAT: false).then((
            valueBook) async {
          pdlSub.booksList = valueBook;
          _deepLinks.objArguments = pdlSub;
          _deepLinks.booksListArg1 = pdlSub.booksList;
          // return row;
        });
      } else {
        //endregion
        if (pdlSub.typePlan == Constant.ordreCanonique || pdlSub.typePlan == Constant.uniquementPourUnLivre) {
          BooksModel bookBegin = booksController.booksList![booksController.booksList!.indexWhere((el) => el.osis == pdlSub.bookBegin)];
          BooksModel bookEnd = booksController.booksList![booksController.booksList!.indexWhere((el) => el.osis == pdlSub.bookEnd)];
          List<BooksModel> valueBooksList = [];
          //region [Loop For]
          int rowIndex = 1;
          for (int i = bookBegin.number; i <= bookEnd.number; i++) {
            BooksModel currentBook = booksController.booksList![booksController.booksList!.indexWhere((el) => el.number == i)];
            if (currentBook.number == bookBegin.number) { // The first row
              valueBooksList.add(BooksModel(
                  number: rowIndex,
                  osis: currentBook.osis,
                  human: currentBook.human,
                  chaptersSelected: pdlSub.chaptersBegin!,
                  chapters: currentBook.chapters,
                  versetSelected: pdlSub.versetBegin!));
            } else if (currentBook.number == bookEnd.number) { // The last Row
              valueBooksList.add(BooksModel(
                  number: rowIndex,
                  osis: currentBook.osis,
                  human: currentBook.human,
                  chaptersSelected: 1,
                  chapters: pdlSub.chaptersEnd!,
                  versetSelected: pdlSub.versetEnd!));
            } else {
              valueBooksList.add(BooksModel(
                  number: rowIndex,
                  osis: currentBook.osis,
                  human: currentBook.human,
                  chaptersSelected: 1,
                  chapters: currentBook.chapters,
                  versetSelected: 1));
            }
            rowIndex++;
          }
          //endregion
          pdlSub.booksList = valueBooksList;
          _deepLinks.objArguments = pdlSub;
          _deepLinks.booksListArg1 = pdlSub.booksList;
          // return row;
        }
        if (pdlSub.typePlan == Constant.monOrdreDeLecture) {
          logCat('04.2-pdlSub.typePlan==Constant.monOrdreDeLecture');
          if (pdlSub.pdlBooksList != null) {
            logCat('04.3- ( pdlSub.pdlBooksList != null ) ');
            pdlSub.pdlBooksList!.sort((a, b) => a.number.compareTo(b.number));
            List<BooksModel> objList = [];
            for (var pdlObj in pdlSub.pdlBooksList!) {
              objList.add(BooksModel(
                  number: pdlObj.number,
                  osis: pdlObj.osis,
                  chaptersSelected: pdlObj.chaptersBegin,
                  chapters: pdlObj.chaptersEnd,
                  versetSelected: pdlObj.versetBegin
              ));
            }
            pdlSub.booksList = objList;
            _deepLinks.objArguments = pdlSub;
            _deepLinks.booksListArg1 = pdlSub.booksList;
            _deepLinks.pdlBooksListArg2 = pdlSub.pdlBooksList;
          } else {
            logCat('04.4- ELSE( pdlSub.pdlBooksList != null ) ');
            await Get.find<PdlSubscriptionBooksController>().getBooksByCodeLectureForHome( idPlanDeLecture: pdlSub.codeLecture).then((valueBook) async {
              if (valueBook != null) {
                PdlBooksEtBooksModel pdlBooksEtBooks = valueBook;
                pdlSub.booksList = pdlBooksEtBooks.booksList;
                pdlSub.pdlBooksList = pdlBooksEtBooks.pdlBooksList;
                _deepLinks.objArguments = pdlSub;
                _deepLinks.booksListArg1 = pdlSub.booksList;
                _deepLinks.pdlBooksListArg2 = pdlBooksEtBooks.pdlBooksList;
              } else {
                //Tools.showSnackBar(_scaffoldStateKey.currentState, '${tr('label_no_record_pdl_book_list')}', marginBottom: 60);
              }
            });
            // await PdlBooksRepository().getBooksByCodeLecture(idPlanDeLecture: pdlSub.codeLecture).then((valueBook) async {
            //   if (valueBook != null) {
            //     PdlBooksEtBooksModel pdlBooksEtBooks = valueBook;
            //     pdlSub.booksList = pdlBooksEtBooks.booksList;
            //     pdlSub.pdlBooksList = pdlBooksEtBooks.pdlBooksList;
            //     _deepLinks.objArguments = pdlSub;
            //     _deepLinks.booksListArg1 = pdlSub.booksList;
            //     _deepLinks.pdlBooksListArg2 = pdlBooksEtBooks.pdlBooksList;
            //   }else{
            //     //Tools.showSnackBar(_scaffoldStateKey.currentState, '${tr('label_no_record_pdl_book_list')}', marginBottom: 60);
            //   }
            // });
          }
        }
      }
    } catch (ex, tr) {
      logError(ex, trace: tr, position: 'getBooksListPdl');
    }
    // return row;
  }*/

  //endregion
  //endregion

  //region [ API PlanDeLecture User ]
  /*Future<PdlPlanDeLectureModel> getPlanDeLectureFromServer( { required String codeLecture }) async {
    try {
      showDialogProgress(show: true);
      String urlApi = '${ApiConstant.urlApiPlanDeLectureGetOne}/$codeLecture';
      Tools.println('urlApiPlanDeLectureGetOne : $urlApi');

      var response = await http.get(Uri.parse(urlApi),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          });
      if (mounted) {
        Tools.println('statusCode : ${response.statusCode}');
        Tools.println('response.body : ${response.body}');
        if (response.statusCode == 200) {
          try {
            var data = json.decode(response.body);
            // Tools.println('data : $data');
            PdlPlanDeLectureModel qfApi = PdlPlanDeLectureModel.fromJson(data);
            await getBooksListPdl(pdlSub: Mappers().mapPdlToSubs(qfApi));
            //logCat('booksListArg1: ${deepLinks.booksListArg1?.length} | chap:${deepLinks.pdlBooksListArg2?.length}');
            showDialogProgress(show: false);
            logCat('05-codeLecture: $codeLecture | value==null');
            return qfApi;
          } catch (ex, trace) {
            showDialogProgress(show: false);
            DialogView.showAlertDialog(msg: '${tr('msg_TraitementImpossible')}');
            logError(ex, trace: trace,
                position: 'catch1::getPlanDeLectureFromServer');
            throw TextEmptyException(tr('msg_TraitementImpossible'));
          }
        } else {
          showDialogProgress(show: false);
          DialogView.showAlertDialog(msg: '${tr('msg_TraitementImpossible')}');
          throw TextEmptyException(tr('msg_TraitementImpossible'));
        }
      } else {
        showDialogProgress(show: false);
        DialogView.showAlertDialog(msg: 'mounted:$mounted');
        throw TextEmptyException(tr('msg_TraitementImpossible'));
      }
    } on SocketException {
      Tools.println(' SocketException');
      showDialogProgress(show: false);
      DialogView.showAlertDialog(msg: tr('msg_No_Internet_connection'));
      throw TextEmptyException(tr('msg_No_Internet_connection'));
    } on Exception catch (ex, trace) {
      showDialogProgress(show: false);
      DialogView.showAlertDialog(msg: tr('msg_TraitementImpossible'));
      logError(ex, trace: trace,
          position: 'Utilities.Exception::getPlanDeLectureFromServer');
      throw TextEmptyException(tr('msg_TraitementImpossible'));
    } catch (ex, trace) {
      showDialogProgress(show: false);
      DialogView.showAlertDialog(msg: tr('msg_TraitementImpossible'));
      logError(
          ex, trace: trace, position: 'catch2::getPlanDeLectureFromServer');
      throw TextEmptyException(tr('msg_TraitementImpossible'));
    }
    //return null;
  }*/

  showDialogProgress({ bool show= true }) {
    _showProgressBar = show; update();
  }
//endregion

  //region [ UniLinks ]
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initUniLinksPlatformState() async {
    if (_type == UniLinksType.string) {
      await initPlatformStateForStringUniLinks();
    } else {
      await initPlatformStateForUriUniLinks();
    }
  }
  Future<void> initPlatformStateForStringUniLinks() async {
    // logCat('IN initPlatformState For String UniLinks');
    // // Attach a listener to the links stream
    // _streamSubscription = appLinks.uriLinkStream.listen((String? link) {
    //   //if (!mounted) return;
    //   //setState(() {});
    //     latestLink = link ?? 'Unknown';
    //     _latestUri = null;
    //     try {
    //       if (link != null) _latestUri = Uri.parse(link);
    //     } on FormatException {
    //       logCat('FormatException... ');
    //     }
    // }, onError: (Object err) {
    //   //if (!mounted) return;
    //   //setState(() { });
    //   latestLink = 'Failed to get latest link: $err.';
    //   _latestUri = null;
    // });
    // // Get the latest link
    // // Platform messages may fail, so we use a try/catch PlatformException.
    // try {
    //   _initialLink = await getInitialLink();
    //   logCat('initial link: $_initialLink');
    //   if (_initialLink != null) {
    //     _initialUri = Uri.parse(_initialLink!);
    //   }
    // } on PlatformException {
    //   _initialLink = 'Failed to get initial link.';
    //   _initialUri = null;
    // } on FormatException {
    //   _initialLink = 'Failed to parse the initial link as Uri.';
    //   _initialUri = null;
    // }
    //
    // // If the widget was removed from the tree while the asynchronous platform
    // // message was in flight, we want to discard the reply rather than calling
    // // setState to update our non-existent appearance.
    // //if (!mounted) return;
    //
    // latestLink = TypeSafeConversion.nullSafeString( _initialLink, defaultValue: 'Unknown' );
    // _latestUri = _initialUri;
    // getNavigatorPushNamed();
  }

  Future<void> initPlatformStateForUriUniLinks() async {
    logCat('IN initPlatformState For Uri UniLinks');
    // Attach a listener to the Uri links stream
    _streamSubscription = appLinks.uriLinkStream.listen((Uri? uri) {
      // if (!mounted) return;
      // setState(() { });
      _latestUri = uri;
      latestLink = uri?.toString() ?? 'Unknown';
    }, onError: (Object err) {
      //if (!mounted) return;
      // setState(() {});
      _latestUri = null;
      latestLink = 'Failed to get latest link: $err.';
    });
    try {
      _initialUri = await appLinks.getInitialLink();
      logCat('initial uri: ${_initialUri?.path} | ${_initialUri?.queryParametersAll}');
      _initialLink = _initialUri?.toString();
    } on PlatformException {
      _initialUri = null;
      _initialLink = 'Failed to get initial uri.';
    } on FormatException {
      _initialUri = null;
      _initialLink = 'Bad parse the initial link as Uri.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;

    //setState(() { });
    _latestUri = _initialUri;
    latestLink = _initialLink!;
    //if (_isLoadDeepLink) {
    //getNavigatorPushNamed();
    //}
  }

  getNavigatorPushNamed2(){
    if( _latestUri!=null ){
      final queryParams = _latestUri?.queryParametersAll.entries.toList();
      logCat('_initialLink: $latestLink');
      logCat('_latestUri: $_latestUri');
      logCat('_latestUri?.path: ${_latestUri?.path}');
      logCat('_queryParams: ${queryParams.toString()}');

      _deepLinks = DeepLinksModel();
      _deepLinks?.initialLink = _initialLink;
      _deepLinks?.latestUri = _latestUri;
      _deepLinks?.latestUriPath = _latestUri?.path;
      _deepLinks?.queryParams = _latestUri?.queryParametersAll.entries.toList();
    }
    if( _deepLinks?.latestUri!=null ){
      Navigator.of(Get.context!).pushNamed( _deepLinks!.latestUriPath!, arguments: _deepLinks );
    }
  }
//endregion

}