import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water/app/UI/connectez-vous/account.dart';
import 'package:water/app/UI/formulaire_&_vente/detailsCom.dart';
import 'package:water/app/UI/shared/config.dart';
import 'package:water/app/controllers/commande_controller.dart';

class commande extends GetView<CommandeController> {
  CommandeController commandeController = Get.put(CommandeController());

  commande({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Color.fromARGB(255, 219, 219, 219),
      color: Colors.black87,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () => commandeController.getCommandes(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(Account());
                },
                icon: Icon(Icons.account_circle_rounded))
          ],
          automaticallyImplyLeading: false,
          elevation: 2,
          backgroundColor: const Color.fromARGB(255, 20, 62, 93),
          title: Text(
            "Commande",
            style: GoogleFonts.poppins(
                color: const Color.fromARGB(255, 252, 251, 251), fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<CommandeController>(
          init: controller,
          id: 1,
          builder: (_) => commandeController.Commandes.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vous n'avez pas de commande pour l'instant. Rafraichissez dans quelques instants",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextButton(
                          onPressed: () {
                            commandeController.getCommandes();
                          },
                          child: Text("Rafraichir"),
                        )
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: commandeController.Commandes.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 7.0),
                    child: Card(
                      elevation: 20.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //Text(id[index], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),

                                Text(
                                  commandeController
                                      .Commandes[index].nom_client,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),

                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Padding(padding: EdgeInsets.all(5)),
                                      const Icon(
                                        Icons.phone,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      TextButton(
                                        onPressed: () {
                                          Config.makePhoneCall(
                                              commandeController
                                                  .Commandes[index].num_client);
                                        },
                                        child: Text(
                                          commandeController
                                              .Commandes[index].num_client,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      IconButton(
                                        padding:
                                            const EdgeInsets.only(left: 200),
                                        onPressed: () {
                                          Get.to(const detailsCom(),
                                              transition:
                                                  Transition.rightToLeft,
                                              duration:
                                                  const Duration(seconds: 1),
                                              arguments: commandeController
                                                  .Commandes[index],
                                              fullscreenDialog: true);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios,
                                          color:
                                              Color.fromARGB(255, 10, 40, 63),
                                          size: 20,
                                        ),
                                      ),
                                    ]),
                                const SizedBox(height: 5),
                                /* Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.access_alarm_rounded,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                Text(
                                  today.toString(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),*/
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Padding(padding: EdgeInsets.all(5)),
                                      const Icon(
                                        Icons.calendar_month,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        commandeController
                                            .Commandes[index].date,
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                const SizedBox(height: 9),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Padding(padding: EdgeInsets.all(5)),
                                      const FaIcon(
                                        FontAwesomeIcons.boxArchive,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        commandeController
                                            .Commandes[index].reference,
                                        style: const TextStyle(
                                            fontSize: 18, color: Colors.grey),
                                      ),
                                    ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
