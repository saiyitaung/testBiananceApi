import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timeline_tile/timeline_tile.dart';

part 'example_page.g.dart';

enum ExampleStates { init, search, map, locationPick }

@riverpod
class ExampleState extends _$ExampleState {
  @override
  ExampleStates build() => ExampleStates.init;
}

final myNotifierProvider =
    ChangeNotifierProvider.autoDispose((ref) => MyNotifier());

class MyNotifier extends ChangeNotifier {
  GoogleMapController? controller;

  setCtrl(GoogleMapController c) {
    controller = c;
  }

  moveTo(LatLng l) {
    controller?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: l, zoom: 15),
    ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller?.dispose();
  }
}

GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
final locations = [
  const LatLng(16.782696, 96.161982),
  const LatLng(16.822956, 96.162953),
  const LatLng(16.832153, 96.189191),
  const LatLng(16.818402, 96.138111),
  const LatLng(16.802103, 96.175357)
];

class ExamplePage extends HookConsumerWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exampleStateProvider);
    final locationAnimation = useAnimationController(
        initialValue: 1, duration: const Duration(milliseconds: 1000));
    final menuIconAniCtl = useAnimationController(
        initialValue: 0, duration: const Duration(milliseconds: 700));
    final myNotifier = ref.watch(myNotifierProvider);
    return Scaffold(
      key: scaffoldState,
      drawerScrimColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox.expand(
            child: GoogleMap(
              onMapCreated: (c) {
                myNotifier.setCtrl(c);
              },
              initialCameraPosition: const CameraPosition(
                  target: LatLng(16.837591, 96.172914), zoom: 15),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  scaffoldState.currentState?.openDrawer();
                },
                icon: Lottie.asset("assets/menu.json",
                    controller: menuIconAniCtl, height: 40, width: 40)),
          ),
        ],
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * .45,
        shape: const RoundedRectangleBorder(),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: const Color(0xff252525),
          child: Column(
            children: [
              Container(
                height: 150,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return TimelineTile(
                      alignment: TimelineAlign.start,
                      endChild: InkWell(
                        onTap: () {
                          myNotifier.moveTo(locations[index]);
                        },
                        child: SizedBox(
                            height: 80,
                            child: Center(
                              child: Text(
                                'Demo $index',
                                style: const TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
                      isFirst: index == 0,
                      isLast: index == locations.length - 1,
                    );
                  },
                  itemCount: locations.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (locationAnimation.isDismissed) {
            locationAnimation.forward();
          } else if (locationAnimation.isCompleted) {
            locationAnimation.reset();
            locationAnimation.forward();
          }
        },
        child: LottieBuilder.asset(
          "assets/location.json",
          controller: locationAnimation,
        ),
      ),
    );
  }
}
