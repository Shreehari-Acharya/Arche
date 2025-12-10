import 'package:flutter/material.dart';

class DocumentViewScreen extends StatelessWidget {
  final String fileName;
  final int sectionsCount;

  const DocumentViewScreen({
    super.key,
    required this.fileName,
    required this.sectionsCount,
  });

  @override
  Widget build(BuildContext context) {
    // SAFETY CHECKS → Prevent null errors
    final safeFileName = fileName.isNotEmpty ? fileName : "Untitled Document";
    final safeSections = sectionsCount >= 0 ? sectionsCount : 0;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F2FF),

      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Back to Documents"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            //
            // DOCUMENT CARD
            //
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ],
              ),

              child: Row(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9B7CFF), Color(0xFF7C9BFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Icon(Icons.menu_book,
                        color: Colors.white, size: 36),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          safeFileName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "$safeSections sections extracted",
                          style: const TextStyle(color: Colors.black54),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "PPTX",
                          style: TextStyle(
                              fontSize: 12, color: Colors.black45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 22),

            //
            // SECTION TITLE
            //
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Document Sections",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),

            const SizedBox(height: 12),

            //
            // SECTION LIST (SAFE)
            //
            Column(
              children: List.generate(
                safeSections,
                (i) => Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple.shade50,
                        child: Text(
                          "${i + 1}",
                          style: const TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                      title: Text("Section ${i + 1} title"),
                      subtitle: Text("Pages ${i * 2 + 1}, ${i * 2 + 2}"),
                      trailing: const Icon(Icons.keyboard_arrow_down),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            //
            // BUTTON → Generate Notes
            //
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // You must pass correct params here
                  Navigator.pushNamed(
                    context,
                    "/generateNotes",
                    arguments: {
                      "fileName": safeFileName,
                      "sectionsCount": safeSections,
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text("Generate Notes",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
