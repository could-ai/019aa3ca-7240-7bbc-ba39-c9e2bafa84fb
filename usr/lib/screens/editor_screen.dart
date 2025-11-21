import 'package:flutter/material.dart';
import '../l10n/localization_service.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(texts.get('editor_pro')),
        actions: [
          IconButton(icon: const Icon(Icons.undo), onPressed: () {}),
          IconButton(icon: const Icon(Icons.redo), onPressed: () {}),
          const SizedBox(width: 10),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.download, size: 18),
            label: Text(texts.get('export')),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Row(
        children: [
          // Left Toolbar
          Container(
            width: 80,
            color: Theme.of(context).colorScheme.surfaceContainer,
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildToolItem(Icons.text_fields, 'Text'),
                _buildToolItem(Icons.image, 'Image'),
                _buildToolItem(Icons.category, 'Shapes'), // Replaced Icons.shapes with Icons.category
                _buildToolItem(Icons.auto_awesome, 'AI'),
                _buildToolItem(Icons.layers, texts.get('layers')),
                const Spacer(),
                _buildToolItem(Icons.settings, texts.get('settings')),
                const SizedBox(height: 20),
              ],
            ),
          ),
          
          // Main Canvas Area
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Center(
                child: Container(
                  width: 300,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        top: 50,
                        left: 50,
                        child: Text(
                          "Design Canvas",
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        bottom: 100,
                        right: 50,
                        child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.blueAccent.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Right Properties Panel (Hidden on small screens if needed)
          Container(
            width: 200,
            color: Theme.of(context).colorScheme.surfaceContainer,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(texts.get('tools'), style: const TextStyle(fontWeight: FontWeight.bold)),
                const Divider(),
                const SizedBox(height: 10),
                const Text("Opacity"),
                Slider(value: 0.8, onChanged: (v) {}),
                const SizedBox(height: 10),
                const Text("Color"),
                Wrap(
                  spacing: 8,
                  children: [
                    _buildColorDot(Colors.red),
                    _buildColorDot(Colors.blue),
                    _buildColorDot(Colors.green),
                    _buildColorDot(Colors.yellow),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToolItem(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildColorDot(Color color) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
