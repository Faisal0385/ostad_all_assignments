import 'package:flutter/material.dart';
import 'package:smart_calculator/screens/home_page_screen.dart';
import 'package:smart_calculator/model/cash_flow_model.dart';
import 'package:smart_calculator/services/database_helper.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  var display_num = [];
  var display_array = [];
  var final_values = [];
  double total_amount = 0.0;

  String str1 = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CalculaC"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              displayInputResult(),
              operatorsButton(),
              numberButtonFirstRow(),
              numberButtonSecondRow(),
              equalToButton(),
              listItemSection(),
              const SizedBox(
                height: 50,
              ),
              totalAmount(),
              const SizedBox(
                height: 10,
              ),
              cashInButton(),
              cashOutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cashOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // <-- Radius
          ),
          backgroundColor: Colors.red,
        ),
        onPressed: () async {
          DateTime now = DateTime.now();
          final CashFlow model = CashFlow(
              cash: total_amount.toString(),
              status: "Cash Out",
              date: now.toString());
          await DatabaseHelper.addCash(model);
          if (mounted) {
            setState(() {});
          }
          const snackBar = SnackBar(
            content: Text(
              "Transition Added Successfully!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePageScreen(),
            ),
          );
        },
        child: const Text("Cash Out"),
      ),
    );
  }

  Widget cashInButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // <-- Radius
          ),
          backgroundColor: Colors.green,
        ),
        onPressed: () async {
          DateTime now = DateTime.now();
          final CashFlow model = CashFlow(
              cash: total_amount.toString(),
              status: "Cash In",
              date: now.toString());
          await DatabaseHelper.addCash(model);
          if (mounted) {
            setState(() {});
          }
          const snackBar = SnackBar(
            content: Text(
              "Transition Added Successfully!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePageScreen(),
            ),
          );
        },
        child: const Text("Cash In"),
      ),
    );
  }

  Widget totalAmount() {
    return Text(
      "Total Amount - ${total_amount.toString()}",
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget listItemSection() {
    return Expanded(
      child: ListView.builder(
        itemCount: display_array.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              onTap: () {
                display_array.removeAt(index);
                totalAmountFunc(index);
                if (mounted) {
                  setState(() {});
                }
              },
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text("Item ${index + 1}"),
              subtitle: Text(
                display_array[index],
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.remove_circle),
            ),
          );
        },
      ),
    );
  }

  Widget equalToButton() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.greenAccent),
            onPressed: () {
              RegExp regex =
                  RegExp(r'^(?!(\d+/\*|\d+\*)$)(\d+\*\d+|\d+/\d+|\d+)$');
              if (regex.hasMatch(result)) {
                display_array.add(result);
                check(result);
                result = '';
                if (mounted) {
                  setState(() {});
                }
              } else {
                const snackBar = SnackBar(
                  content: Text(
                    "Pls Enter Valid Input Pattern",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  backgroundColor: Colors.redAccent,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                result = '';
                if (mounted) {
                  setState(() {});
                }
              }
            },
            child: const Text(
              "=",
              style: TextStyle(color: Colors.black45),
            ),
          )
        ]);
  }

  Widget numberButtonSecondRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        numberFunc(6),
        numberFunc(7),
        numberFunc(8),
        numberFunc(9),
        numberFunc(0),
      ],
    );
  }

  Widget numberButtonFirstRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        numberFunc(1),
        numberFunc(2),
        numberFunc(3),
        numberFunc(4),
        numberFunc(5),
      ],
    );
  }

  Widget operatorsButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.redAccent,
            shape: const CircleBorder(),
          ),
          onPressed: () {
            display_array = [];
            final_values = [];
            total_amount = 0.0;
            result = '';
            if (mounted) {
              setState(() {});
            }
          },
          child: const Text(
            "AC",
            style: TextStyle(color: Colors.white),
          ),
        ),
        operatorsFunc("*"),
        operatorsFunc("/"),
      ],
    );
  }

  Widget displayInputResult() {
    return Text(
      result,
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget operatorsFunc(operator) => Padding(
        padding: const EdgeInsets.all(2),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepOrangeAccent,
          ),
          onPressed: () {
            result += str1 + operator;
            if (mounted) {
              setState(() {});
            }
          },
          child: Text(
            operator,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget numberFunc(num) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueGrey,
        ),
        onPressed: () {
          result += str1 + num.toString();
          if (mounted) {
            setState(() {});
          }
        },
        child: Text(
          num.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  check(inputString) {
    RegExp regexm = RegExp(r'\*');
    RegExp regexd = RegExp(r'\/');
    if (regexm.hasMatch(inputString)) {
      final splitted = inputString.split('*');
      final value = double.parse(splitted[0]) * double.parse(splitted[1]);
      final_values.add(value);
    } else if (regexd.hasMatch(inputString)) {
      final splitted = inputString.split('/');
      final value = double.parse(splitted[0]) / double.parse(splitted[1]);
      final_values.add(value);
    } else {
      final_values.add(double.parse(inputString));
    }
    total_amount = final_values.fold(0, (a, b) => a + b);
    print(total_amount);
    print(final_values);
  }

  totalAmountFunc(index) {
    final_values.removeAt(index);
    total_amount = final_values.fold(0, (a, b) => a + b);
  }
}
