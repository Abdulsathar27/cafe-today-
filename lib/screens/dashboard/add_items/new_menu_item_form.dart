import 'package:flutter/material.dart';

class NewMenuItemForm extends StatelessWidget {
  const NewMenuItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("New Menu Item",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text("Fill in the details for your new menu item"),
            const SizedBox(height: 12),

            // Item Name
            const TextField(
              decoration: InputDecoration(
                labelText: "Item Name *",
                hintText: "e.g., Caramel Macchiato",
              ),
            ),
            const SizedBox(height: 12),

            // Price + Category Row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Price *",
                      hintText: "4.50",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: "Category *"),
                    items: const [
                      DropdownMenuItem(value: "coffee", child: Text("Coffee")),
                      DropdownMenuItem(value: "pastry", child: Text("Pastry")),
                      DropdownMenuItem(value: "food", child: Text("Food")),
                    ],
                    onChanged: (val) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Description
            const TextField(
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Brief description of the item...",
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 12),

            // Image URL
            TextField(
              decoration: InputDecoration(
                labelText: "Image URL",
                hintText: "https://example.com/image.jpg",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Buttons
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("+ Add Item"),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("Clear"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
