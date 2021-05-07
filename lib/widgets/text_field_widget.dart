import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_language_app/theme/dimens.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFieldWidgetState();
  final validator;
  final bool obscure;
  final String hint;
  // final TextEditingController controller;
  final String title;
  final CrossAxisAlignment crossAxisTitle;
  final int? length;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final isEnable;

  var textInputFormatter;

  TextFieldWidget(this.hint,
      {this.validator,
      this.obscure: false,
      this.title: "",
      this.crossAxisTitle: CrossAxisAlignment.start,
      this.length,
      this.suffixIcon,
      this.keyboardType,
      this.isEnable: true,
      this.textInputFormatter});
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: widget.crossAxisTitle,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: smallSize(context)),
            child: Text(widget.title, style: theme.textTheme.headline4),
          ),
          Container(
            margin: EdgeInsets.only(bottom: xSmallSize(context)),
            child: TextFormField(
              inputFormatters: widget.textInputFormatter,
              // inputFormatters: <TextInputFormatter>[
              //   MaskedTextInputFormatter(
              //     mask: 'xxxx-xxx-xxxx',
              //     separator: '-',
              //   ),
              // ],
              maxLength: widget.length,
              // controller: widget.controller,
              keyboardType: widget.keyboardType,
              textDirection: TextDirection.rtl,
              obscureText: widget.obscure,
              validator: widget.validator,
              style: theme.textTheme.bodyText1?.copyWith(color: Colors.black),
              decoration: InputDecoration(
                enabled: widget.isEnable,
                suffixIcon: Icon(
                  widget.suffixIcon,
                  color: theme.primaryColor,
                ),
                counterStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintStyle:
                    theme.textTheme.bodyText1?.copyWith(color: Colors.grey),
                contentPadding: EdgeInsets.all(smallSize(context)),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(xSmallSize(context)),
                  borderSide: BorderSide(
                    color: Color(0xffE6E6E6),
                  ),
                ),
                filled: true,
                fillColor: Color(0xffE6E6E6),
                hintText: widget.hint,
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(xSmallSize(context)),
                    borderSide: BorderSide(
                      color: Color(0xffE6E6E6),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(xSmallSize(context)),
                    borderSide: BorderSide(
                      color: Color(0xffE6E6E6),
                    )),
                errorStyle: TextStyle(color: Color(0xffFF4646)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(xSmallSize(context)),
                    borderSide: BorderSide(color: Color(0xffFF4646))),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(xSmallSize(context)),
                    borderSide: BorderSide(color: Color(0xffFF4646))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
