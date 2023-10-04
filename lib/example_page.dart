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
  LatLng? selected;
  final locations = [
    const LatLng(16.782696, 96.161982),
    const LatLng(16.822956, 96.162953),
    const LatLng(16.832153, 96.189191),
    const LatLng(16.818402, 96.138111),
    const LatLng(17.0535, 96.30624),
    const LatLng(17.03207, 96.30176),
    const LatLng(17.03111, 96.30157),
    const LatLng(
      17.03024,
      96.30146,
    ),
    const LatLng(17.02741, 96.30112)
  ];

  setCtrl(GoogleMapController c) {
    controller = c;
    notifyListeners();
  }

  setSelcted(LatLng l) {
    selected = l;
    moveTo(selected!);
    notifyListeners();
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

class ExamplePage extends HookConsumerWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(exampleStateProvider);
    final locationAnimation = useAnimationController(
        initialValue: 1, duration: const Duration(milliseconds: 1000));
    final menuIconAniCtl = useAnimationController(
        initialValue: 0, duration: const Duration(milliseconds: 700));
    ref.listen(
        myNotifierProvider.select((value) => value.controller), (pre, nex) {});
    final prRef = ref.read(myNotifierProvider);
    print("Rebuld Example page ....");
    return Scaffold(
      key: scaffoldState,
      drawerScrimColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox.expand(
            child: GoogleMap(
              onMapCreated: (c) {
                prRef.setCtrl(c);
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
        width: MediaQuery.of(context).size.width * .5,
        shape: const RoundedRectangleBorder(),
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            final pref = ref.watch(myNotifierProvider);
            print("rebuild drawler");
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "YBS 11",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Row(
                    children: [],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return TimelineTile(
                          indicatorStyle: IndicatorStyle(
                              padding: const EdgeInsets.only(left: 8),
                              width: 30,
                              height: 40,
                              indicator: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.bus_alert_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              )),
                          alignment: TimelineAlign.start,
                          endChild: InkWell(
                            onTap: () {
                              pref.setSelcted(pref.locations[index]);
                            },
                            child: SizedBox(
                                height: 60,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Gate Haung',
                                        style: TextStyle(
                                            color: pref.locations[index] ==
                                                    pref.selected
                                                ? Colors.green
                                                : Colors.black),
                                      ),
                                      Text(
                                        'Bo Hmu Ba Htoo Road',
                                        style: TextStyle(
                                            color: pref.locations[index] ==
                                                    pref.selected
                                                ? Colors.green
                                                : Colors.black,
                                            fontSize: 11),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          isFirst: index == 0,
                          isLast: index == pref.locations.length - 1,
                        );
                      },
                      itemCount: pref.locations.length,
                    ),
                  ),
                ],
              ),
            );
          },
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
