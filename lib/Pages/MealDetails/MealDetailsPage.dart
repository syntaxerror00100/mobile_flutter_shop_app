import 'package:flutter/material.dart';
import '../../dummydata.dart';

class MealDetailsPage extends StatelessWidget {
  static const route = "/meal-details";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealObj = DUMMY_MEALS.firstWhere((x) => x.id == mealId);
    final ingredients = mealObj.ingredients;
    final steps = mealObj.steps;
    return Scaffold(
      appBar: AppBar(
        title: Text(mealObj.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Hero(
                      tag: mealObj.id,
                      child: Image.network(
                        mealObj.imageUrl,
                        fit: BoxFit.cover,
                      ))),
              buildTitle(
                context,
                "Ingredients",
              ),
              buildContainer(
                context: context,
                child: ListView.builder(
                    itemCount: ingredients.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(ingredients[index])),
                      );
                    }),
              ),
              buildTitle(
                context,
                "Steps",
              ),
              buildContainer(
                  context: context,
                  child: ListView.builder(
                      itemCount: steps.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('#${index + 1}'),
                              ),
                              title: Text(steps[index]),
                            ),
                            Divider()
                          ],
                        );
                      })),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: Icon(Icons.delete),
      ),
    );
  }

  Widget buildTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer({BuildContext context, Widget child}) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 150,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: child);
  }
}
