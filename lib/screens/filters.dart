import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_option.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreens extends StatefulWidget {
  const FilterScreens({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreens> createState() {
    return _FilterScreensState();
  }
}

class _FilterScreensState extends State<FilterScreens> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filter'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(children: [
          FilterOption(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              value: _glutenFreeFilterSet,
              onSetFilterValue: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              }),
          FilterOption(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              value: _lactoseFreeFilterSet,
              onSetFilterValue: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              }),
          FilterOption(
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
              value: _vegetarianFilterSet,
              onSetFilterValue: (isChecked) {
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              }),
          FilterOption(
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
              value: _veganFilterSet,
              onSetFilterValue: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              }),
        ]),
      ),
    );
  }
}
