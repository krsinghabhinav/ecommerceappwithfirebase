
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils/comman/custom_shap/rounded_container.dart';

class CustomPromoCodeField extends StatelessWidget {
  const CustomPromoCodeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: CustomeRoundedContainer(
        radius: 15,
        showBorder: true,
        backgroundColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 8.0, // ✅ You can adjust this value as needed
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Have a promo code? Enter now",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height:
                    double
                        .infinity, // ✅ Match height of TextFormField
                width: 80,
                child: ElevatedButton(
                  onPressed: null,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text("Apply"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
