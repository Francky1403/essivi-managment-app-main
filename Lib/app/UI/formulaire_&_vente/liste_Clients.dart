import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:water/app/UI/formulaire_&_vente/details_Client.dart';
import 'package:water/app/UI/shared/config.dart';
import 'package:water/app/controllers/client_controller.dart';

class listClient extends StatelessWidget {
  ClientController clientController = Get.put(ClientController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      backgroundColor: Color.fromARGB(255, 219, 219, 219),
      color: Colors.black87,
      strokeWidth: 3,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () => clientController.getClients(),
      child: Scaffold(
        body: GetBuilder<ClientController>(
          init: ClientController(),
          id: 1,
          builder: (_) => ListView.builder(
            itemCount: clientController.clients.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Container(
              width: MediaQuery.of(context).size.width,
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
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
                            clientController.clients[index].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(3)),
                                const Icon(
                                  Icons.phone,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                TextButton(
                                  onPressed: () {
                                    Config.makePhoneCall(
                                        clientController.clients[index].phone);
                                  },
                                  child: Text(
                                    clientController.clients[index].phone,
                                    style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                IconButton(
                                  padding: const EdgeInsets.only(left: 150),
                                  onPressed: () {
                                    Get.to(detailsCli(),
                                        transition: Transition.rightToLeft,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        arguments:
                                            clientController.clients[index],
                                        fullscreenDialog: true);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color.fromARGB(255, 10, 40, 63),
                                    size: 20,
                                  ),
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
