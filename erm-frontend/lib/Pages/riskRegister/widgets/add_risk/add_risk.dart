import 'package:flutter/material.dart';

class AddRiskModal extends StatelessWidget {
  const AddRiskModal({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (BuildContext ctx) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Add Risk',style: TextStyle(fontSize: 20,color: Colors.black54),),
                   const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: TextField(decoration: InputDecoration(labelText:'Name'))),
                      Expanded(child: TextField(decoration: InputDecoration(labelText:'Risk ID'))),
                    ],
                  ),
                  const SizedBox(height : 10),
                   const Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: RiskPriorityDropdown()),
                      Expanded(child: RiskPriorityDropdown()),
                    ],
                  ),
                    const SizedBox(height :20),
                      ElevatedButton(onPressed :(){},child :const Text('Submit'))
                ],
              ),
            );
          },
        );
      },
      child: Icon(Icons.add,color: Colors.grey.shade600,),
    );
  }
}




class RiskPriorityDropdown extends StatefulWidget {
  const RiskPriorityDropdown({super.key});

  @override
  _RiskPriorityDropdownState createState() => _RiskPriorityDropdownState();

}

class _RiskPriorityDropdownState extends State<RiskPriorityDropdown> {
  
  int selectedValue = 0;

  List<DropdownMenuItem> items = [
     const DropdownMenuItem(value: 0,enabled: false, child: Text('Risk Priority'),),
        const DropdownMenuItem(value:2 ,child :Text('Option B')),
         const DropdownMenuItem(value :3 ,child :Text ('Option C') ), 
          const DropdownMenuItem (value :4 ,child : Text ('Option D'),),
  ];

  @override
  Widget build(BuildContext context) {

    return DropdownButton(
      value: selectedValue,
      items: items,
     onChanged:(newValue){
       setState((){
       selectedValue=newValue!;
       });
   
   },
    isExpanded: true,
    hint: const Text('Set Risk Priority'),
    disabledHint: const Text('Set Risk Priority'),
    alignment: Alignment.bottomCenter,
    icon: const Icon(Icons.arrow_drop_down),
    iconSize: 24,
    elevation: 16,
    style: const TextStyle(color: Colors.black87),
    underline: Container(
      height: 2,
      color: Colors.transparent,
    ),
);
}
}
