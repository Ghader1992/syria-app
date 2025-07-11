import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final Widget? see;
  final Widget? dash;
  final Color? background;
  final Function onTap;
  final double? radius;
  final Widget? underlined;
  final EdgeInsetsDirectional? margin;
  final EdgeInsetsDirectional? padding;
  final bool? centerTitle;

  const Heading(
      {Key? key,
      this.leading,
      this.trailing,
      this.title,
      this.see,
      this.dash,
      this.underlined,
      required this.onTap,
      this.background,
      this.margin,
      this.padding,
      this.radius = 25,
      this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Decoration decoration;
    if (background != null && background!.a != 1) {
      decoration = BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.clamp,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [background!, background!],
        ),
      );
    } else {
      decoration = BoxDecoration(
        color: background,
        border: Border.all(width: 0, color: background ?? Colors.transparent),
      );
    }

    return Container(
        margin: margin,
        padding: padding,
        decoration: decoration,
        child: Column(
          children: [
            Row(
              children: [
                if (dash == null)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: centerTitle == true ? MainAxisAlignment.center : MainAxisAlignment.start,
                      children: [
                        if (leading != null)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 8),
                            child: leading ?? Container(),
                          ),
                        Expanded(
                          child: title ?? Container(),
                        )
                      ],
                    ),
                  ),
                if (dash != null)
                  Row(
                      mainAxisAlignment: centerTitle == true ? MainAxisAlignment.center : MainAxisAlignment.start,
                      children: [
                        if (leading != null)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(end: 8),
                            child: leading ?? Container(),
                          ),
                        title ?? Container(),
                      ]),
                if (dash != null)
                  Expanded(
                      child: Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: dash ?? Container())),
                InkResponse(
                    onTap: () => onTap(),
                    radius: see == null ? radius : 0,
                    child: Row(
                      children: [
                        see ?? Container(),
                        if (trailing != null)
                          Padding(padding: const EdgeInsetsDirectional.only(start: 4), child: trailing ?? Container()),
                      ],
                    ))
              ],
            ),
            underlined ?? Container(),
          ],
        ));
  }
}
