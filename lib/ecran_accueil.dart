import 'package:flutter/material.dart';

class EcranAccueil extends StatelessWidget {
  const EcranAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),

      body: Column(
        children: [

          const SizedBox(height: 50),

          // 🔍 BARRE DE RECHERCHE
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Color.fromARGB(255, 14, 87, 177)),
                SizedBox(width: 10),
                Text("Où allons-nous ?"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 🧩 SERVICES
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [

                  _card(
                    context,
                    Icons.local_taxi,
                    "Taxi",
                    Colors.amber,
                    () {
                      _snack(context, "Taxi");
                    },
                  ),

                  _card(
                    context,
                    Icons.delivery_dining,
                    "Livraison",
                    Colors.blue,
                    () {
                      _snack(context, "Livraison");
                    },
                  ),

                  _card(
                    context,
                    Icons.account_balance_wallet,
                    "Transactions",
                    Colors.blue,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const PageTransactions(),
                        ),
                      );
                    },
                  ),

                  _card(
                    context,
                    Icons.person,
                    "Profil",
                    Colors.purple,
                    () {
                      _snack(context, "Profil");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // 🔻 NAV BAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF16213E),
        selectedItemColor: const Color.fromARGB(255, 0, 47, 177),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.local_taxi), label: "Taxi"),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: "Livraison"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }

  Widget _card(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF16213E),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 55),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  void _snack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }
}

 
class PageTransactions extends StatelessWidget {
  const PageTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      appBar: AppBar(title: const Text("Transactions")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  Text("SOLDE", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Text(
                    "25 000 FCFA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PageDepot()),
                );
              },
              child: const Text("Dépôt"),
            ),

            const SizedBox(height: 15),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PageRetrait()),
                );
              },
              child: const Text("Retrait"),
            ),
          ],
        ),
      ),
    );
  }
}

 
class PageDepot extends StatefulWidget {
  const PageDepot({super.key});

  @override
  State<PageDepot> createState() => _PageDepotState();
}

class _PageDepotState extends State<PageDepot> {
  final controller = TextEditingController();
  String methode = "Flooz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dépôt")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Montant"),
            ),

            RadioListTile(
              value: "Flooz",
              groupValue: methode,
              onChanged: (v) => setState(() => methode = v!),
              title: const Text("Flooz"),
            ),

            RadioListTile(
              value: "TMoney",
              groupValue: methode,
              onChanged: (v) => setState(() => methode = v!),
              title: const Text("TMoney"),
            ),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Dépôt ${controller.text} via $methode"),
                  ),
                );
              },
              child: const Text("Valider"),
            ),
          ],
        ),
      ),
    );
  }
}


class PageRetrait extends StatefulWidget {
  const PageRetrait({super.key});

  @override
  State<PageRetrait> createState() => _PageRetraitState();
}

class _PageRetraitState extends State<PageRetrait> {
  final controller = TextEditingController();
  String methode = "Flooz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Retrait")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Montant"),
            ),

            RadioListTile(
              value: "Flooz",
              groupValue: methode,
              onChanged: (v) => setState(() => methode = v!),
              title: const Text("Flooz"),
            ),

            RadioListTile(
              value: "TMoney",
              groupValue: methode,
              onChanged: (v) => setState(() => methode = v!),
              title: const Text("TMoney"),
            ),

            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Retrait ${controller.text} via $methode"),
                  ),
                );
              },
              child: const Text("Valider"),
            ),
          ],
        ),
      ),
    );
  }
}