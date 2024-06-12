typedef UserIdCallback = void Function(String userId);
typedef UserProfileCallback = void Function(Map<String, dynamic> profile);
typedef RecommendationCallback = void Function(List<String> recommendations);

// ▼ ユーザーIDを取得
void fetchUserId(UserIdCallback onUserIdReady) {
  print("✅ ユーザーID取得完了");
  onUserIdReady("user_abc123");
}

// ▼ ユーザープロフィールを取得
void fetchUserProfile(String userId, UserProfileCallback onProfileReady) {
  print("✅ プロフィール取得完了 for $userId");
  onProfileReady({
    "name": "田中太郎",
    "age": 30,
    "interests": ["プログラミング", "登山", "コーヒー"],
  });
}

// ▼ おすすめ商品を取得
void fetchRecommendations(
  Map<String, dynamic> profile,
  RecommendationCallback onRecommendationsReady,
) {
  final name = profile["name"];
  print("✅ おすすめ商品取得完了 for $name");
  onRecommendationsReady(["高級ドリッパー", "登山靴", "Flutter本"]);
}

// ▼ 最後に呼ばれる関数（おすすめ表示）
void handleRecommendations(List<String> items) {
  print("🎁 おすすめ商品: $items");
}

// ▼ プロフィール取得後に呼ばれる関数
void handleUserProfile(Map<String, dynamic> profile) {
  fetchRecommendations(profile, handleRecommendations);
}

// ▼ ユーザーID取得後に呼ばれる関数
void handleUserId(String userId) {
  fetchUserProfile(userId, handleUserProfile);
}

// ▼ main関数：流れの出発点
void main() {
  print("🚀 ユーザー情報の取得を開始します...");
  fetchUserId(handleUserId);
  print("📦 処理要求を発行しました（同期版なら即完了）");
}
