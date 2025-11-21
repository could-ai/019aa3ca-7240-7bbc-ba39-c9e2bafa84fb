import 'package:flutter/material.dart';
import '../l10n/localization_service.dart';

class AiWizardScreen extends StatefulWidget {
  const AiWizardScreen({super.key});

  @override
  State<AiWizardScreen> createState() => _AiWizardScreenState();
}

class _AiWizardScreenState extends State<AiWizardScreen> {
  final TextEditingController _promptController = TextEditingController();
  bool _isGenerating = false;

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(texts.get('ai_magic')),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.auto_awesome, size: 80, color: Colors.purpleAccent),
                const SizedBox(height: 24),
                Text(
                  texts.get('ai_desc'),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 40),
                TextField(
                  controller: _promptController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: texts.get('describe_idea'),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.all(20),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: _isGenerating
                        ? null
                        : () {
                            setState(() {
                              _isGenerating = true;
                            });
                            // Simulate generation
                            Future.delayed(const Duration(seconds: 3), () {
                              if (mounted) {
                                setState(() {
                                  _isGenerating = false;
                                });
                                Navigator.pushNamed(context, '/editor');
                              }
                            });
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.purpleAccent,
                    ),
                    icon: _isGenerating
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                          )
                        : const Icon(Icons.stars),
                    label: Text(
                      _isGenerating ? "Generating..." : texts.get('generate'),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildSuggestionChip("Presentation about AI"),
                    _buildSuggestionChip("Instagram Post for Coffee Shop"),
                    _buildSuggestionChip("Resume for Developer"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionChip(String label) {
    return ActionChip(
      label: Text(label),
      onPressed: () {
        _promptController.text = label;
      },
      avatar: const Icon(Icons.lightbulb_outline, size: 16),
    );
  }
}
