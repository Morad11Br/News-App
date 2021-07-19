import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:news_application/modules/webview_screen.dart';

Widget buildarticleItems(article, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebviewScreen(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage('${article['urlToImage']}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      ' ${article['title']} ',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Text(
                    '${article['publishedAt']}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget myDevider() => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 1,
      ),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[300],
      ),
    );

Widget articleBuilder(list, context) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return buildarticleItems(list[index], context);
        },
        separatorBuilder: (context, index) => myDevider(),
        itemCount: 10,
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

Widget defaultTextField({
  @required TextEditingController controller,
  @required String label,
  @required IconData prefix,
  @required TextInputType textInputType,
  @required Function onValidate,
  Function onChanged,
  Function onSabmitted,
  IconData suffix,
  Function onTap,
  bool isclickabel = true,
}) {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: label,
      prefix: Icon(prefix),
      suffix: Icon(suffix),
    ),
    enabled: isclickabel,
    controller: controller,
    keyboardType: textInputType,
    onFieldSubmitted: onSabmitted,
    onChanged: onChanged,
    validator: onValidate,
    onTap: onTap,
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => widget),
    );
