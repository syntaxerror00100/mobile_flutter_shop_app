import 'package:flutter/material.dart';
import 'package:shop_app/Models/MealModel.dart';
import '../MealDetails/MealDetailsPage.dart';

class MealItem extends StatelessWidget {
  final MealModel mealObj;
  final Function deleteMealHandler;

  const MealItem(this.mealObj, this.deleteMealHandler);

  void navigateMealDetailsHandler(BuildContext ctx) {
    Navigator.pushNamed(ctx, MealDetailsPage.route, arguments: mealObj.id)
        .then((result) {
      if (result != null) deleteMealHandler(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigateMealDetailsHandler(context),
      child: Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Hero(
                      tag: mealObj.id,
                      child: Image.network(
                        mealObj.imageUrl,
                        //alignment: Alignment.center,
                        fit: BoxFit.cover,
                        height: 250,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 1,
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: Colors.black.withOpacity(.54)),
                      child: Text(
                        mealObj.title,
                        //'asdkf jasdkl;j fakl;sdjf jkashdf jahsdfua whioefha lksdifjha wuiehf aksdjfh aiksdf haioseudfhalskdjfhaiksdyfg asdjklhfa ksdyugf ajklsdf hasdfasdf asd',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(5),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text("${mealObj.duration.toString()} min")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(mealObj.complexity.toString().split(".").last)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(mealObj.affordability.toString().split(".").last)
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteMealHandler(mealObj.id);
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.delete),
                          SizedBox(
                            width: 6,
                          ),
                          Text('Delete')
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
