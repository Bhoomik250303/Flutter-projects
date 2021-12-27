import 'package:flutter/material.dart';
import 'package:servicezz_clone/models/costumer_testimonial_model.dart';

class CostumerTestimonials extends StatefulWidget {
  const CostumerTestimonials({Key? key}) : super(key: key);

  @override
  _CostumerTestimonialsState createState() => _CostumerTestimonialsState();
}

class _CostumerTestimonialsState extends State<CostumerTestimonials> {
  List<TestimonialClass> _listOfTestimonial = [
    TestimonialClass(
        constumerName: 'Prakash Shetty',
        review:
            'THat suaocin viubekj eocoe weoiwej aocinnowiefn ceoaufhej oecinaoeifweo ccakjcb ocnwoeinwpi cpiemcpcepci cpqimcqp peiepke cpqecmpqocma; c.,a cakdcpvz ;d dvpompo',
        rating: 5,
        profilePicUrl: 'skjbs'),
    TestimonialClass(
        constumerName: 'Prakash Shetty',
        review:
            'THat suaocin viubekj eocoe weoiwej aocinnowiefn ceoaufhej oecinaoeifweo c',
        rating: 5,
        profilePicUrl: 'skjbs'),
    TestimonialClass(
        constumerName: 'Prakash Shetty',
        review:
            'THat suaocin viubekj eocoe weoiwej aocinnowiefn ceoaufhej oecinaoeifweo c',
        rating: 5,
        profilePicUrl: 'skjbs'),
    TestimonialClass(
        constumerName: 'Prakash Shetty',
        review:
            'THat suaocin viubekj eocoe weoiwej aocinnowiefn ceoaufhej oecinaoeifweo c',
        rating: 5,
        profilePicUrl: 'skjbs'),
    TestimonialClass(
        constumerName: 'Prakash Shetty',
        review:
            'THat suaocin viubekj eocoe weoiwej aocinnowiefn ceoaufhej oecinaoeifweo c',
        rating: 5,
        profilePicUrl: 'skjbs'),
  ];
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          itemCount: _listOfTestimonial.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 0.0, 8.0),
              child: SizedBox(
                width: widthScreen - 45,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.orange,
                                // here comes the profile image.
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12.0, 0, 0, 0),
                                child: Column(children: <Widget>[
                                  Text(_listOfTestimonial[index].constumerName),
                                  Image.asset('asset/image/fivestarimage.jpeg'),
                                ]),
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: Text(_listOfTestimonial[index].review)),
                      ],
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
