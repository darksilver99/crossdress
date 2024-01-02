import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'swipeableStackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: Offset(60.0, 60.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                _model.swipe,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Expanded(
                child: StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'status',
                      isEqualTo: 1,
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> swipeableStackUsersRecordList =
                        snapshot.data!;
                    return FlutterFlowSwipeableStack(
                      onSwipeFn: (index) async {
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList[index];
                        setState(() {
                          _model.swipe = '1';
                        });
                      },
                      onLeftSwipe: (index) async {
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList[index];
                        setState(() {
                          _model.swipe = '2';
                        });
                      },
                      onRightSwipe: (index) async {
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList[index];
                        setState(() {
                          _model.swipe = '3';
                        });
                      },
                      onUpSwipe: (index) async {
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList[index];
                        setState(() {
                          _model.swipe = '4';
                        });
                      },
                      onDownSwipe: (index) async {
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList[index];
                        setState(() {
                          _model.swipe = '5';
                        });
                      },
                      itemBuilder: (context, swipeableStackIndex) {
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList[swipeableStackIndex];
                        return Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1595068759218-8d4c38be4e86?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyMnx8bmlnaHQlMjBza3l8ZW58MHx8fHwxNzA0MDczMjQwfDA&ixlib=rb-4.0.3&q=80&w=1080',
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: Color(0x67FFFFFF),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        swipeableStackUsersRecord.displayName,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Space Grotesk',
                                              fontSize: 22.0,
                                            ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        swipeableStackUsersRecord.phoneNumber,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Space Grotesk',
                                              fontSize: 22.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: swipeableStackUsersRecordList.length,
                      controller: _model.swipeableStackController,
                      loop: true,
                      cardDisplayCount: 3,
                      scale: 0.9,
                    ).animateOnPageLoad(
                        animationsMap['swipeableStackOnPageLoadAnimation']!);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
