import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
=======
import 'ecran_accueil.dart';
>>>>>>> feat/ecran-acceuil

void main() {
  runApp(const PaymentMobileApp());
}

class PaymentMobileApp extends StatelessWidget {
  const PaymentMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
      title: 'Paiement Mobile',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A5276),
          primary: const Color(0xFF1A5276),
          secondary: const Color(0xFFE67E22),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Segoe UI',
      ),
      home: const MobilePaymentPage(),
    );
  }
}

class MobilePaymentPage extends StatefulWidget {
  const MobilePaymentPage({super.key});

  @override
  State<MobilePaymentPage> createState() => _MobilePaymentPageState();
}

class _MobilePaymentPageState extends State<MobilePaymentPage> {
  // Données métiers du paiement mobile.
  final Map<String, _CountryConfig> countries = {
    'Bénin': const _CountryConfig(
      operators: ['Moov', 'MTN', 'Orange Money'],
      digits: 8,
      example: '90123456',
      icon: Icons.phone_android,
    ),
    "Côte d'Ivoire": const _CountryConfig(
      operators: ['Orange', 'MTN', 'Moov'],
      digits: 10,
      example: '0708123456',
      icon: Icons.phone_iphone,
    ),
    'Togo': const _CountryConfig(
      operators: ['Moov', 'Togocom', 'Orange Money'],
      digits: 8,
      example: '90123456',
      icon: Icons.signal_cellular_alt,
    ),
  };

  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final amountController = TextEditingController(text: '1000');

  String? selectedCountry;
  String? selectedOperator;
  String? phoneError;

  @override
  void dispose() {
    phoneController.dispose();
    amountController.dispose();
    super.dispose();
  }

  // Validation stricte selon le pays sélectionné.
  String? _validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez saisir un numéro.';
    }

    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length != countries[selectedCountry]! .digits) {
      return 'Le numéro doit contenir ${countries[selectedCountry]!.digits} chiffres pour $selectedCountry.';
    }

    return null;
  }

  // Masquage partiel du numéro pour l'affichage récapitulatif.
  String _maskPhone(String value) {
    if (value.length <= 4) {
      return value;
    }
    final digits = value.replaceAll(RegExp(r'\D'), '');
    if (digits.length <= 4) {
      return digits;
    }
    return '${digits.substring(0, 2)}****${digits.substring(digits.length - 2)}';
  }

  // Réinitialise l'opérateur et le numéro lorsque le pays change.
  void _onCountrySelected(String? country) {
    setState(() {
      selectedCountry = country;
      selectedOperator = null;
      phoneController.clear();
      phoneError = null;
    });
  }

  // Vérifie si le formulaire peut être soumis.
  bool get _isFormReady {
    if (selectedCountry == null || selectedOperator == null) {
      return false;
    }
    final phoneValidation = _validatePhone(phoneController.text);
    return phoneValidation == null;
  }

  // Affichage de la modale de confirmation.
  Future<void> _submitPayment() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final amount = amountController.text.trim();
    final maskedPhone = _maskPhone(phoneController.text.replaceAll(RegExp(r'\D'), ''));

    if (!mounted) return;

    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Color(0xFFE67E22)),
              SizedBox(width: 8),
              Text('Paiement initié'),
            ],
          ),
          content: Text(
            '✅ Paiement de $amount FCFA initié via $selectedOperator pour $selectedCountry au numéro $maskedPhone.',
            style: const TextStyle(height: 1.5),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E86C1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width >= 700;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF8F9FA), Color(0xFFEAF6FF), Color(0xFFFFF4E8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // En-tête de l'interface.
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF1A5276), Color(0xFF2E86C1)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 28,
                              backgroundColor: Color(0x33FFFFFF),
                              child: Icon(Icons.payment, color: Colors.white, size: 30),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Paiement mobile sécurisé',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Sélectionnez votre pays, votre opérateur et validez votre paiement.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white.withOpacity(0.95)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Formulaire principal.
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Choisissez votre pays'),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: countries.keys.map((country) {
                                final isSelected = selectedCountry == country;
                                return ChoiceChip(
                                  label: Text(country),
                                  selected: isSelected,
                                  onSelected: (_) => _onCountrySelected(country),
                                  selectedColor: const Color(0xFFEAF6FF),
                                  backgroundColor: Colors.white,
                                  side: BorderSide(
                                    color: isSelected ? const Color(0xFFE67E22) : const Color(0xFFD8DEE9),
                                    width: isSelected ? 2 : 1,
                                  ),
                                  labelStyle: TextStyle(
                                    color: isSelected ? const Color(0xFF1A5276) : const Color(0xFF23374D),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  avatar: Icon(
                                    countries[country]!.icon,
                                    color: isSelected ? const Color(0xFFE67E22) : const Color(0xFF2E86C1),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),

                            _buildSectionTitle('Choisissez votre opérateur'),
                            if (selectedCountry == null)
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8F9FA),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: const Text('Sélectionnez d’abord un pays pour afficher les opérateurs disponibles.'),
                              )
                            else
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: countries[selectedCountry]!.operators.map((operator) {
                                  final isSelected = selectedOperator == operator;
                                  return AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          selectedOperator = operator;
                                        });
                                      },
                                      icon: Icon(
                                        isSelected ? Icons.check_circle : Icons.account_balance_wallet,
                                        color: isSelected ? Colors.white : const Color(0xFFE67E22),
                                      ),
                                      label: Text(operator),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: isSelected ? const Color(0xFFE67E22) : Colors.white,
                                        foregroundColor: isSelected ? Colors.white : const Color(0xFF1A5276),
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                                        elevation: isSelected ? 3 : 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                          side: BorderSide(
                                            color: isSelected ? const Color(0xFFE67E22) : const Color(0xFFD8DEE9),
                                            width: isSelected ? 2 : 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            const SizedBox(height: 20),

                            _buildSectionTitle('Numéro de téléphone'),
                            Semantics(
                              label: 'Numéro de téléphone',
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                maxLength: selectedCountry == null
                                    ? 10
                                    : countries[selectedCountry]!.digits,
                                decoration: InputDecoration(
                                  labelText: 'Numéro de téléphone',
                                  hintText: selectedCountry == null
                                      ? 'Sélectionnez un pays'
                                      : 'Ex. ${countries[selectedCountry]!.example}',
                                  prefixIcon: const Icon(Icons.phone_android, color: Color(0xFF2E86C1)),
                                  filled: true,
                                  fillColor: const Color(0xFFF8F9FA),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    borderSide: const BorderSide(color: Color(0xFF2E86C1), width: 2),
                                  ),
                                ),
                                validator: _validatePhone,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                onChanged: (_) {
                                  setState(() {});
                                },
                              ),
                            ),
                            const SizedBox(height: 16),

                            _buildSectionTitle('Montant'),
                            TextFormField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              decoration: InputDecoration(
                                labelText: 'Montant (FCFA)',
                                hintText: '1000',
                                prefixIcon: const Icon(Icons.attach_money, color: Color(0xFF2E86C1)),
                                filled: true,
                                fillColor: const Color(0xFFF8F9FA),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                              ),
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Veuillez saisir un montant.';
                                }
                                final amount = int.tryParse(value);
                                if (amount == null || amount <= 0) {
                                  return 'Le montant doit être supérieur à 0.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),

                            // Récapitulatif.
                            Container(
                              padding: const EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8F9FA),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  _summaryRow('Pays', selectedCountry ?? '—'),
                                  const SizedBox(height: 8),
                                  _summaryRow('Opérateur', selectedOperator ?? '—'),
                                  const SizedBox(height: 8),
                                  _summaryRow('Numéro', phoneController.text.isEmpty ? '—' : _maskPhone(phoneController.text)),
                                  const SizedBox(height: 8),
                                  _summaryRow('Montant', '${amountController.text.isEmpty ? '1000' : amountController.text} FCFA'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Bouton de paiement.
                            SizedBox(
                              width: isWide ? 220 : double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: _isFormReady ? _submitPayment : null,
                                icon: const Icon(Icons.lock_outline),
                                label: const Text('Payer'),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 14),
                                  backgroundColor: const Color(0xFFE67E22),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                  elevation: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A5276),
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xFF6B7280))),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF23374D)),
          ),
        ),
      ],
    );
  }
}

class _CountryConfig {
  final List<String> operators;
  final int digits;
  final String example;
  final IconData icon;

  const _CountryConfig({
    required this.operators,
    required this.digits,
    required this.example,
    required this.icon,
  });
}
=======
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
>>>>>>> feat/ecran-acceuil
