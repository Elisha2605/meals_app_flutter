import 'package:flutter/material.dart';

class FilterOption extends StatelessWidget {
  const FilterOption(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.onSetFilterValue});

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onSetFilterValue;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      onChanged: (isChecked) {
        onSetFilterValue(isChecked);
      },
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(subtitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground)),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
