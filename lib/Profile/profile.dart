import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(context) async {
    DateTime? picked = await showDatePicker(
        context: context, firstDate: DateTime(1900), lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Navigate back to the previous screen by popping the current route
                  Navigator.of(context).pop();
                },
              ),
            ),
            body: Container(
                margin: const EdgeInsets.all(24),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _avatar(context),
                        const GenderField(['Male', 'Female', 'Other']),
                        datePicker(context),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      "Contact Information",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 250,
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Street Address',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        CountryListPick(
                          appBar: AppBar(
                            backgroundColor: Colors.blue,
                            title: const Text('Pick your country'),
                          ),
                          theme: CountryTheme(
                            isShowFlag: true,
                            isShowTitle: true,
                            isShowCode: false,
                            isDownIcon: true,
                            showEnglishName: true,
                            labelColor: Colors.blueAccent,
                          ),
                          initialSelection: 'US',
                        ),
                        const SizedBox(
                          width: 250,
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'State',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 250,
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'City',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Zip Code',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Mobile No.',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          height: 60,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Alternative No.',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Insurance Provider",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Row(
                      children: [
                        Expanded(
                            child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            SizedBox(
                              width: 250,
                              height: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Policy Holder',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Group ID',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Insurance ID',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Insurance Type',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ))));
  }

  SizedBox datePicker(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: TextField(
        controller: _dateController,
        decoration: const InputDecoration(
            labelText: 'Date of Birth',
            prefixIcon: Icon(Icons.calendar_today),
            border: OutlineInputBorder(),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
        readOnly: true,
        onTap: () {
          _selectDate(context);
        },
      ),
    );
  }
}

_avatar(context) {
  return const CircleAvatar(
    radius: 58,
    backgroundImage:
        NetworkImage("https://avatars.githubusercontent.com/u/7953936?v=4"),
    child: Stack(children: [
      Align(
        alignment: Alignment.bottomRight,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white70,
          child: Icon(Icons.camera),
        ),
      ),
    ]),
  );
}

class GenderField extends StatelessWidget {
  final List<String> genderList;

  const GenderField(this.genderList);

  @override
  Widget build(BuildContext context) {
    String? select = "Male";
    Map<int, String> mappedGender = genderList.asMap();

    return StatefulBuilder(
      builder: (_, StateSetter setState) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Gender : ',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          ...mappedGender.entries.map(
            (MapEntry<int, String> mapEntry) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio(
                    activeColor: Theme.of(context).primaryColor,
                    groupValue: select,
                    value: genderList[mapEntry.key],
                    onChanged: (value) => setState(() => select = value),
                  ),
                  Text(mapEntry.value)
                ]),
          ),
        ],
      ),
    );
  }
}
