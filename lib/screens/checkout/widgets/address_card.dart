import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cafebooking/constants/app_colors.dart';
import 'package:cafebooking/models/address_model.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({super.key});

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  int? selectedIndex;

  Future<void> _addAddressDialog(BuildContext context) async {
    final nameController = TextEditingController();
    final detailsController = TextEditingController();

    await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Add New Address"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: detailsController,
              decoration: const InputDecoration(labelText: "Address Details"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty &&
                  detailsController.text.isNotEmpty) {
                final newAddress = Address(
                  name: nameController.text,
                  details: detailsController.text,
                );
                await Hive.box<Address>('addressBox').add(newAddress);
              }
              Navigator.pop(ctx);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteAddress(int index) async {
    final box = Hive.box<Address>('addressBox');
    await box.deleteAt(index);

    if (selectedIndex == index) {
      setState(() => selectedIndex = null); // reset selection if deleted
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.badgeBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Address>('addressBox').listenable(),
          builder: (context, Box<Address> addressBox, _) {
            final addresses = addressBox.values.toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Delivery Address",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: AppColors.primary),
                      onPressed: () => _addAddressDialog(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                if (addresses.isEmpty)
                  const Text(
                    "No saved addresses.\nPlease add one using + button.",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                else
                  ...List.generate(addresses.length, (index) {
                    final addr = addresses[index];
                    return ListTile(
                      title: Text(addr.name),
                      subtitle: Text(addr.details),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<int>(
                            value: index,
                            groupValue: selectedIndex,
                            activeColor: AppColors.primary,
                            onChanged: (val) {
                              setState(() => selectedIndex = val);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteAddress(index),
                          ),
                        ],
                      ),
                    );
                  }),

                if (selectedIndex != null && addresses.isNotEmpty) ...[
                  const Divider(),
                  Text(
                    "Selected: ${addresses[selectedIndex!].name}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
