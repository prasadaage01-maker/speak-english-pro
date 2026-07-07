import 'dart:convert';

import 'package:http/http.dart' as http;

class AiService {
  // Replace with your actual API key.
  static const String apiKey = '';

  Future<String> generateReply(String prompt) async {
    if (apiKey.isEmpty) {
      return _fallbackReply(prompt);
    }

    final uri = Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {
                'text':
                    'You are a friendly English teacher. Reply in simple English with short Marathi support when helpful. User says: $prompt'
              }
            ]
          }
        ]
      }),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = data['candidates'] as List<dynamic>?;
      final text = candidates?[0]?['content']?['parts']?[0]?['text']?.toString();
      if (text != null && text.trim().isNotEmpty) return text.trim();
    }

    return _fallbackReply(prompt);
  }

  String _fallbackReply(String prompt) {
    return 'Let us practice English.

Prompt: $prompt

Try this:
1. Read it slowly.
2. Say it aloud.
3. Translate it into Marathi.

Example: "I am learning English." = "मी इंग्रजी शिकत आहे."';
  }
}
