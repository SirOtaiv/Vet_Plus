import 'package:flutter/material.dart';

class CheckboxTile extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;
  final double? iconSize;
  final Color? checkColor;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final bool isError;
  final bool? enabled;
  final Color? tileColor;
  final Widget? title;
  final Widget? subtitle;
  final Widget? secondary;
  final bool selected;
  final ListTileControlAffinity controlAffinity;
  final bool tristate;
  final OutlinedBorder? checkboxShape;
  final Color? selectedTileColor;

  const CheckboxTile({
    Key? key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.iconSize,
    this.checkColor,
    this.shape,
    this.side,
    this.isError = false,
    this.enabled,
    this.tileColor,
    this.title,
    this.subtitle,
    this.secondary,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.platform,
    this.tristate = false,
    this.checkboxShape,
    this.selectedTileColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget control = Transform.scale(
      scale: iconSize != null ? iconSize! / 24.0 : 1.0,
      child: Checkbox(
        value: value,
        onChanged: enabled ?? true ? onChanged : null,
        activeColor: activeColor,
        checkColor: checkColor,
        shape: checkboxShape ?? shape,
        side: side,
        tristate: tristate,
        isError: isError,
      ),
    );

    final Widget? leading, trailing;

    switch (controlAffinity) {
      case ListTileControlAffinity.leading:
        leading = control;
        trailing = secondary;
        break;
      case ListTileControlAffinity.trailing:
      case ListTileControlAffinity.platform:
      default:
        leading = secondary;
        trailing = control;
        break;
    }

    return MergeSemantics(
      child: ListTile(
        leading: leading,
        title: title,
        contentPadding: const EdgeInsets.only(top: 2),
        subtitle: subtitle,
        trailing: trailing,
        selected: selected,
        tileColor: selected ? selectedTileColor : tileColor,
        enabled: enabled ?? onChanged != null,
        onTap: onChanged != null ? () => onChanged!(!value) : null,
        shape: shape,
      ),
    );
  }
}
