 import 'package:flutter/material.dart';

// ===== COULEURS =====
const kBleu = Color(0xFF1565C0);
const kBleuClair = Color(0xFF42A5F5);
const kBleuPale = Color(0xFFE3F2FD);
const kBlanc = Colors.white;
const kTexte = Color(0xFF1A237E);
const kGris = Color(0xFF78909C);

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkZem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBleu),
        scaffoldBackgroundColor: kBlanc,
        fontFamily: 'Roboto',
      ),
      home: const EcranAccueil(),
    );
  }
}

// ===== ECRAN ACCUEIL =====
class EcranAccueil extends StatelessWidget {
  const EcranAccueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlanc,
      body: SafeArea(
        child: Column(
          children: [

            // ===== HEADER BLEU =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kBleu, kBleuClair],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // LIGNE HAUT : bonjour + cloche
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bonjour 👋',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Où vas-tu aujourd\'hui ?',
                            style: TextStyle(
                              color: kBlanc,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: kBlanc,
                          size: 24,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // BARRE DE RECHERCHE BLANCHE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: kBlanc,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: kBleu, size: 22),
                        SizedBox(width: 12),
                        Text(
                          'Où allons-nous ?',
                          style: TextStyle(
                            color: kGris,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ===== CONTENU SCROLLABLE =====
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 8),

                    // TITRE SECTION
                    const Text(
                      'Nos services',
                      style: TextStyle(
                        color: kTexte,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    // GRILLE 2x2
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.05,
                      children: [
                        _card(
                          context,
                          Icons.local_taxi,
                          'Taxi',
                          kBleu,
                          () => _snack(context, 'Taxi bientôt disponible'),
                        ),
                        _card(
                          context,
                          Icons.delivery_dining,
                          'Livraison',
                          const Color(0xFF00897B),
                          () => _snack(context, 'Livraison bientôt disponible'),
                        ),
                        _card(
                          context,
                          Icons.account_balance_wallet,
                          'Transactions',
                          const Color(0xFF7B1FA2),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const PageTransactions(),
                            ),
                          ),
                        ),
                        _card(
                          context,
                          Icons.person,
                          'Profil',
                          const Color(0xFFE64A19),
                          () => _snack(context, 'Profil bientôt disponible'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // BANNIERE PROMO
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: kBleuPale,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: kBleuClair, width: 1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '🎉 Offre de bienvenue',
                                  style: TextStyle(
                                    color: kTexte,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                const Text(
                                  '50% de réduction sur\nvotre premier trajet !',
                                  style: TextStyle(
                                    color: kGris,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 14),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kBleu,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'En profiter →',
                                    style: TextStyle(
                                      color: kBlanc,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.local_taxi,
                            color: kBleuClair,
                            size: 70,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // ===== BARRE NAVIGATION =====
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: kBlanc,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: kBlanc,
          selectedItemColor: kBleu,
          unselectedItemColor: kGris,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_taxi_outlined),
              activeIcon: Icon(Icons.local_taxi),
              label: 'Taxi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining_outlined),
              activeIcon: Icon(Icons.delivery_dining),
              label: 'Livraison',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }

  // ===== CARTE DE SERVICE =====
  Widget _card(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: kBlanc,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, color: color, size: 34),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _snack(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: kBleu,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// ===== PAGE TRANSACTIONS =====
class PageTransactions extends StatelessWidget {
  const PageTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlanc,
      appBar: AppBar(
        backgroundColor: kBleu,
        foregroundColor: kBlanc,
        elevation: 0,
        title: const Text(
          'Transactions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            // CARTE SOLDE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kBleu, kBleuClair],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: kBleu.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Text(
                    'SOLDE DISPONIBLE',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '25 000 FCFA',
                    style: TextStyle(
                      color: kBlanc,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Mis à jour aujourd\'hui',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // BOUTONS DEPOT ET RETRAIT
            Row(
              children: [
                Expanded(
                  child: _bouton(
                    context,
                    'Dépôt',
                    Icons.arrow_downward_rounded,
                    const Color(0xFF00897B),
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PageDepot(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _bouton(
                    context,
                    'Retrait',
                    Icons.arrow_upward_rounded,
                    kBleu,
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PageRetrait(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bouton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: kBlanc,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== PAGE DEPOT =====
class PageDepot extends StatefulWidget {
  const PageDepot({super.key});

  @override
  State<PageDepot> createState() => _PageDepotState();
}

class _PageDepotState extends State<PageDepot> {
  final controller = TextEditingController();
  String methode = 'Flooz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlanc,
      appBar: AppBar(
        backgroundColor: kBleu,
        foregroundColor: kBlanc,
        elevation: 0,
        title: const Text(
          'Dépôt',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Montant à déposer',
              style: TextStyle(
                color: kTexte,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),

            // CHAMP MONTANT
            Container(
              decoration: BoxDecoration(
                color: kBleuPale,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: kBleuClair.withOpacity(0.5)),
              ),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Ex: 5000',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  suffixText: 'FCFA',
                  suffixStyle: TextStyle(
                    color: kBleu,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Méthode de paiement',
              style: TextStyle(
                color: kTexte,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 12),

            _methodeRadio('Flooz'),
            const SizedBox(height: 10),
            _methodeRadio('TMoney'),

            const SizedBox(height: 32),

            // BOUTON VALIDER
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Dépôt de ${controller.text} FCFA via $methode effectué !',
                      ),
                      backgroundColor: const Color(0xFF00897B),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBleu,
                  foregroundColor: kBlanc,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Valider le dépôt',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _methodeRadio(String value) {
    final bool selected = methode == value;
    return Container(
      decoration: BoxDecoration(
        color: selected ? kBleuPale : kBlanc,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? kBleu : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: RadioListTile(
        value: value,
        groupValue: methode,
        onChanged: (v) => setState(() => methode = v!),
        title: Text(
          value,
          style: TextStyle(
            color: kTexte,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        activeColor: kBleu,
      ),
    );
  }
}

// ===== PAGE RETRAIT =====
class PageRetrait extends StatefulWidget {
  const PageRetrait({super.key});

  @override
  State<PageRetrait> createState() => _PageRetraitState();
}

class _PageRetraitState extends State<PageRetrait> {
  final controller = TextEditingController();
  String methode = 'Flooz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlanc,
      appBar: AppBar(
        backgroundColor: kBleu,
        foregroundColor: kBlanc,
        elevation: 0,
        title: const Text(
          'Retrait',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Montant à retirer',
              style: TextStyle(
                color: kTexte,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: kBleuPale,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: kBleuClair.withOpacity(0.5)),
              ),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Ex: 5000',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                  suffixText: 'FCFA',
                  suffixStyle: TextStyle(
                    color: kBleu,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Méthode de retrait',
              style: TextStyle(
                color: kTexte,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 12),

            _methodeRadio('Flooz'),
            const SizedBox(height: 10),
            _methodeRadio('TMoney'),

            const SizedBox(height: 32),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Retrait de ${controller.text} FCFA via $methode effectué !',
                      ),
                      backgroundColor: kBleu,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBleu,
                  foregroundColor: kBlanc,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Valider le retrait',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _methodeRadio(String value) {
    final bool selected = methode == value;
    return Container(
      decoration: BoxDecoration(
        color: selected ? kBleuPale : kBlanc,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? kBleu : Colors.grey.shade300,
          width: 1.5,
        ),
      ),
      child: RadioListTile(
        value: value,
        groupValue: methode,
        onChanged: (v) => setState(() => methode = v!),
        title: Text(
          value,
          style: TextStyle(
            color: kTexte,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        activeColor: kBleu,
      ),
    );
  }
}import 'package:flutter/material.dart';
import 'ecran_accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WorkZem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const EcranAccueil(),
    );
  }
}