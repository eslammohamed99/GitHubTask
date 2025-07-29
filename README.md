# GitHubTask (SwiftUI + MVVM)

This is a SwiftUI app that fetches **public GitHub repositories** and displays them in a list.  
It follows the **MVVM architecture** and uses `URLSession` with `async/await` for networking.

---

## Features
1. Fetches public repositories using the GitHub API endpoint:  
2. Displays:
- Repository **name**.
- Repository **owner name**.
- Owner **avatar image**.
- Repository **creation date**, formatted as:
  - `"Thursday, Oct 22, 2025"` if created within the last 6 months.
  - `"8 months ago"`, `"2 years ago"`, etc., otherwise.

3. **Tap on a repository** to view more details:
- Description (if available).
- repo link and redirect to it 

4. **No third-party libraries** for:
- Networking.
- Image loading (uses `AsyncImage`).
5. **Unit tests** included (5+).

---

## Architecture
- **MVVM**:
- `Models`: Codable structures for API data.
- `ViewModels`: Handle API calls and date formatting.
- `Views`: SwiftUI views for list and detail screens.
- **Networking**:  
- Uses `URLSession` + `async/await`.
- Simple error handling and decodable responses.

---

## How to Run
1. Clone the repo:
```bash
git clone https://github.com/eslammohamed99/GitHubTask.git
cd GitHubTask
