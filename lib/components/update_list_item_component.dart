import 'package:aufgabe/components/artikel.dart';
import 'package:aufgabe/components/bezeichnung_component.dart';
import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/update_controller.dart';
import 'package:aufgabe/models/update_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class UpdateListItemComponent extends StatelessWidget {
  final double width;
  final int index;
  final UpdateModel update;
  UpdateListItemComponent(
      {super.key,
      required this.width,
      required this.update,
      required this.index});

  final updateController = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: Key(index.toString()),
      endActionPane: ActionPane(motion: BehindMotion(), children: [
        SlidableAction(
            backgroundColor: error,
            label: "Reject",
            icon: Icons.close,
            onPressed: (context) => rejectUpdate())
      ]),
      startActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
            backgroundColor: success,
            label: "Accept",
            icon: Icons.check,
            onPressed: (context) => acceptUpdate())
      ]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Material(
          elevation: 3,
          child: Container(
            width: width,
            // height: width > 600 ? 100 : 160,
            height: 120,
            color: update.accepted == "N" ? error : success,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                  child: Text("IDN : ${update.idn}",
                      style: sArtikelText.copyWith(
                        letterSpacing: 0.9,
                        fontSize: 12,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // BezeichnungComponent(update: update),
                    // width > 600?

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Artikel(
                          isNew: true,
                          update: update,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Artikel(isNew: false, update: update),
                      ],
                    )
                    // : Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Artikel(isNew: true, update: update),
                    //       const SizedBox(
                    //         width: 20,
                    //       ),
                    //       Artikel(isNew: false, update: update)
                    //     ],
                    //   )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  acceptUpdate() {
    print("accepted");
    updateController.updateUpdateByIdn(update.change!, "J", update.idn);
  }

  rejectUpdate() {
    print("rejected");
    updateController.updateUpdateByIdn(update.change!, "N", update.idn);
  }
}
