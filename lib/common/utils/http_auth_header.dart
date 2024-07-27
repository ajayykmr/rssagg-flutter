Map<String, String> getAuthHeader(String authToken) {
  return {
    'Authorization': '$authToken',
  };
}