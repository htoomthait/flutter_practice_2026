import 'package:budget_ui_app/data/data.dart';
import 'package:budget_ui_app/models/expense_model.dart';
import 'package:budget_ui_app/widgets/bar_chart.dart';
import 'package:flutter/material.dart';

import '../helpers/color_helper.dart';
import '../models/category_model.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GestureDetector _buildCategory(Category category, double totalAmount) {
    return GestureDetector(
      onTap: ()=>{
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => CategoryScreen(category: category))
        ),
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 100.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    category.name,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '\$${(category.maxAmount - totalAmount).toStringAsFixed(2)}/ \$${category.maxAmount}',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),

                ],
              ),
              SizedBox(height: 10.0,),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints){
                  print(constraints.maxHeight);
                  print(constraints.maxWidth);

                  final double  maxBarWidth = constraints.maxWidth;
                  final double  percent = (category.maxAmount - totalAmount) / category.maxAmount;
                  double barWidth = percent * maxBarWidth;

                  if(barWidth < 0){
                    barWidth = 0;
                  }

                  return Stack(
                    children: <Widget>[
                      Container(
                        height: 30.0,
                        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
                      ),
                      Container(
                        height: 30.0,
                        width: barWidth,
                        decoration: BoxDecoration(
                            color: getColor(context, percent),
                            borderRadius: BorderRadius.circular(15)
                        ),
                      )
                    ],
                  );
                },

              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            pinned: true,
            floating: false,
            expandedHeight: 100.0,
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30.0,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Budget UI App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 30.0,
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              if (index == 0) {
                return Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: BarChart(weeklySpending),
                );
              } else {
                final Category category = categories[index - 1];
                double totalAmountSpent = 0;
                category.expenses.forEach((Expense expense) {
                  totalAmountSpent += expense.cost;
                });
                return _buildCategory(category, totalAmountSpent);
              }
            }, childCount: 1 + categories.length),
          ),
        ],
      ),
    );
  }
}
