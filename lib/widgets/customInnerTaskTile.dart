import 'package:flutter/material.dart';
import 'package:productivitycompanion/widgets/popupmenu.dart';
import 'package:provider/provider.dart';
import '../provider/homepageProvider.dart';
import '../utils/colors.dart';

class CustomInnerTaskTile extends StatefulWidget {
  final int serialNumber;

  const CustomInnerTaskTile({super.key, required this.serialNumber});

  @override
  State<CustomInnerTaskTile> createState() => _CustomInnerTaskTileState();
}

class _CustomInnerTaskTileState extends State<CustomInnerTaskTile> {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, provider, child) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 200),
          opacity: provider.isSelected[widget.serialNumber] ? 1.0 : 0.8,
          child: AnimatedContainer(
            height: provider.isSelected[widget.serialNumber] ? 305 : 300,
            width: provider.isSelected[widget.serialNumber] ? 405 : 400,
            duration: Duration(
              milliseconds: 200,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: taskTileBorderColor,
                    width: provider.isSelected[widget.serialNumber] ? 2 : 0
                  ),
                  color: provider.isSelected[widget.serialNumber]
                      ? activatedTaskTileColor
                      : deActivatedTaskTileColor,
                ),

                duration: Duration(
                  milliseconds: 200,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.leading[widget.serialNumber],
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          MyPopUpMenu(serialNumber: widget.serialNumber),
                        ],
                      ),
                      Text(
                        provider.subTitle[widget.serialNumber],
                        style: TextStyle(
                          color: textColor,
                          fontSize: 20,
                        ),
                      ),
                      provider.isSelected[widget.serialNumber]
                          ? SizedBox(
                              height: 30,
                            )
                          : SizedBox(
                              height: 25,
                            ),
                      provider.isSelected[widget.serialNumber]
                          ? Text(
                              '${provider.formatTime(provider.seconds[widget.serialNumber])}',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            )
                          : Text(
                              '${provider.formatTime(provider.seconds[widget.serialNumber])}',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                      SizedBox(
                        height: provider.isSelected[widget.serialNumber] ? 20 : 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.onTap(widget.serialNumber);
                            },
                            child: provider.isSelected[widget.serialNumber] ?
                            Align(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.pause,
                                size: 60,
                                color: iconColor,
                              ),
                            ) : Icon(
                              Icons.play_arrow,
                              size: 60,
                              color: iconColor,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
