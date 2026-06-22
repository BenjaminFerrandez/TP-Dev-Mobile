import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:supabase_flutter/supabase_flutter.dart'; 
import '../models/game.dart'; 

final gamesProvider = FutureProvider<List<Game>>((ref) async {
  final List<dynamic> response = await Supabase.instance.client
      .from('games')
      .select();

  return response.map((gameJson) => Game.fromJson(gameJson as Map<String, dynamic>)).toList();
});