import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:godess/widgets/custom_appbar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'ჩვენს შესახებ',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopImageSection(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('მაცნეს შექმნის არსი და მიზნები'),
                  const SizedBox(height: 20),
                  _buildSubSection('მაცნეს იდეის მიზანი'),
                  const SizedBox(height: 20),
                  _buildBulletParagraph(
                    'თუკი ამ თარიღს ქრისტიანულ წელთაღრიცხვაზე გადმოვიტანთ, 1003 წელი გამოდის. ეს წარწერა არის საქართველოში არაბული ციფრების გამოყენების უძველესი ნიმუში.',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletParagraph(
                    'ბაგრატის ტაძარს თავისი მხატვრული და ისტორიულიმნიშვნელობით განსაკუთრებული ადგილი უჭირავს ქართულ ხუროთმოძღვრებაში. ნაგებობის მონუმენტურსა და დიდებულ იერს ერწყმის მრავალფეროვნება და დინამიურობა,',
                  ),
                  const SizedBox(height: 20),
                  _buildSubSection('მაცნეს შექმნის მიზეზი და არსი'),
                  const SizedBox(height: 20),
                  _buildParagraph(
                    'თუკი ამ თარიღს ქრისტიანულ წელთაღრიცხვაზე გადმოვიტანთ, 1003 წელი გამოდის. ეს წარწერა არის საქართველოში არაბული ციფრების გამოყენების უძველესი ნიმუში.',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletParagraph(
                    'ბაგრატის ტაძარს თავისი მხატვრული და ისტორიული მნიშვნელობით განსაკუთრებული ადგილი უჭირავს ქართულ ხუროთმოძღვრებაში. ნაგებობის მონუმენტურსა და დიდებულიერს ერწყმის მრავალფეროვნება და დინამიურობა',
                  ),
                  const SizedBox(height: 10),
                  _buildBulletParagraph(
                      'ბაგრატის ტაძარს თავისი მხატვრული და ისტორიული მნიშვნელობით განსაკუთრებული ადგილი უჭირავს, ბაგრატის ტაძარს თავისი მხატვრული')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopImageSection() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.georgiantravelguide.com/storage/files/kashvetis-kashueti-eklesia-kashveti-church.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 100,
                child: SvgPicture.asset('lib/assets/logo.svg')),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSubSection(String subtitle) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildParagraph(String content) {
    return Text(
      content,
      style: const TextStyle(fontSize: 16),
    );
  }

  Widget _buildBulletParagraph(String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('➤ ', style: TextStyle(fontSize: 16)),
        Expanded(
          child: Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
