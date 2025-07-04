import 'package:dog_breeds_mobile_app/data/services/api/breeds_api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'breeds_api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('BreedsListService', () {
    late BreedsListService service;
    late MockClient mockClient;

    setUp(() {
      mockClient = MockClient();
      service = BreedsListService();
    });

    group('fetchBreeds', () {
      test(
        'returns list of breeds when http call completes successfully',
        () async {
          when(
            mockClient.get(Uri.parse('https://dog.ceo/api/breeds/list/all')),
          ).thenAnswer(
            (_) async => http.Response(
              '{"message":{"affenpinscher":[],"african":[],"airedale":[],"akita":[],"appenzeller":[],"australian":["kelpie","shepherd"],"bakharwal":["indian"],"basenji":[],"beagle":[],"bluetick":[],"borzoi":[],"bouvier":[],"boxer":[],"brabancon":[],"briard":[],"buhund":["norwegian"],"bulldog":["boston","english","french"],"bullterrier":["staffordshire"],"cattledog":["australian"],"cavapoo":[],"chihuahua":[],"chippiparai":["indian"],"chow":[],"clumber":[],"cockapoo":[],"collie":["border"],"coonhound":[],"corgi":["cardigan"],"cotondetulear":[],"dachshund":[],"dalmatian":[],"dane":["great"],"danish":["swedish"],"deerhound":["scottish"],"dhole":[],"dingo":[],"doberman":[],"elkhound":["norwegian"],"entlebucher":[],"eskimo":[],"finnish":["lapphund"],"frise":["bichon"],"gaddi":["indian"],"germanshepherd":[],"greyhound":["indian","italian"],"groenendael":[],"havanese":[],"hound":["afghan","basset","blood","english","ibizan","plott","walker"],"husky":[],"keeshond":[],"kelpie":[],"kombai":[],"komondor":[],"kuvasz":[],"labradoodle":[],"labrador":[],"leonberg":[],"lhasa":[],"malamute":[],"malinois":[],"maltese":[],"mastiff":["bull","english","indian","tibetan"],"mexicanhairless":[],"mix":[],"mountain":["bernese","swiss"],"mudhol":["indian"],"newfoundland":[],"otterhound":[],"ovcharka":["caucasian"],"papillon":[],"pariah":["indian"],"pekinese":[],"pembroke":[],"pinscher":["miniature"],"pitbull":[],"pointer":["german","germanlonghair"],"pomeranian":[],"poodle":["medium","miniature","standard","toy"],"pug":[],"puggle":[],"pyrenees":[],"rajapalayam":["indian"],"redbone":[],"retriever":["chesapeake","curly","flatcoated","golden"],"ridgeback":["rhodesian"],"rottweiler":[],"saluki":[],"samoyed":[],"schipperke":[],"schnauzer":["giant","miniature"],"segugio":["italian"],"setter":["english","gordon","irish"],"sharpei":[],"sheepdog":["english","indian","shetland"],"shiba":[],"shihtzu":[],"spaniel":["blenheim","brittany","cocker","irish","japanese","sussex","welsh"],"spitz":["indian","japanese"],"springer":["english"],"stbernard":[],"terrier":["american","australian","bedlington","border","cairn","dandie","fox","irish","kerryblue","lakeland","norfolk","norwich","patterdale","russell","scottish","sealyham","silky","tibetan","toy","welsh","westhighland","wheaten","yorkshire"],"tervuren":[],"vizsla":[],"waterdog":["spanish"],"weimaraner":[],"whippet":[],"wolfhound":["irish"]},"status":"success"}',
              200,
            ),
          );

          final result = await service.fetchBreeds();
          expect(result, [
            'affenpinscher',
            'african',
            'airedale',
            'akita',
            'appenzeller',
            'australian',
            'bakharwal',
            'basenji',
            'beagle',
            'bluetick',
            'borzoi',
            'bouvier',
            'boxer',
            'brabancon',
            'briard',
            'buhund',
            'bulldog',
            'bullterrier',
            'cattledog',
            'cavapoo',
            'chihuahua',
            'chippiparai',
            'chow',
            'clumber',
            'cockapoo',
            'collie',
            'coonhound',
            'corgi',
            'cotondetulear',
            'dachshund',
            'dalmatian',
            'dane',
            'danish',
            'deerhound',
            'dhole',
            'dingo',
            'doberman',
            'elkhound',
            'entlebucher',
            'eskimo',
            'finnish',
            'frise',
            'gaddi',
            'germanshepherd',
            'greyhound',
            'groenendael',
            'havanese',
            'hound',
            'husky',
            'keeshond',
            'kelpie',
            'kombai',
            'komondor',
            'kuvasz',
            'labradoodle',
            'labrador',
            'leonberg',
            'lhasa',
            'malamute',
            'malinois',
            'maltese',
            'mastiff',
            'mexicanhairless',
            'mix',
            'mountain',
            'mudhol',
            'newfoundland',
            'otterhound',
            'ovcharka',
            'papillon',
            'pariah',
            'pekinese',
            'pembroke',
            'pinscher',
            'pitbull',
            'pointer',
            'pomeranian',
            'poodle',
            'pug',
            'puggle',
            'pyrenees',
            'rajapalayam',
            'redbone',
            'retriever',
            'ridgeback',
            'rottweiler',
            'saluki',
            'samoyed',
            'schipperke',
            'schnauzer',
            'segugio',
            'setter',
            'sharpei',
            'sheepdog',
            'shiba',
            'shihtzu',
            'spaniel',
            'spitz',
            'springer',
            'stbernard',
            'terrier',
            'tervuren',
            'vizsla',
            'waterdog',
            'weimaraner',
            'whippet',
            'wolfhound',
          ]);
        },
      );
    });

    group('fetchBreedSubBreeds', () {
      test(
        'returns list of sub breeds when http call completes successfully',
        () async {
          const breedName = 'hound';
          when(
            mockClient.get(
              Uri.parse('https://dog.ceo/api/breed/$breedName/list'),
            ),
          ).thenAnswer(
            (_) async => http.Response(
              '{"message": ["afghan", "basset", "blood", "english", "ibizan", "plott", "walker"], "status": "success"}',
              200,
            ),
          );

          final result = await service.fetchBreedSubBreeds(breedName);
          expect(result, [
            'afghan',
            'basset',
            'blood',
            'english',
            'ibizan',
            'plott',
            'walker',
          ]);
        },
      );
    });

    group('fetchBreedImage', () {
      test(
        'returns list of image urls when http call completes successfully',
        () async {
          const breedName = 'australian';
          when(
            mockClient.get(
              Uri.parse('https://dog.ceo/api/breed/$breedName/images'),
            ),
          ).thenAnswer(
            (_) async => http.Response(
              '{"message": ["url1", "url2", "url3"], "status": "success"}',
              200,
            ),
          );

          final result = await service.fetchBreedImage(breedName);
          expect(result, [
            'https://images.dog.ceo/breeds/australian-kelpie/IMG_2599.jpg',
            'https://images.dog.ceo/breeds/australian-kelpie/IMG_3675.jpg',
            'https://images.dog.ceo/breeds/australian-kelpie/IMG_4918.jpg',
            'https://images.dog.ceo/breeds/australian-kelpie/IMG_7387.jpg',
            'https://images.dog.ceo/breeds/australian-kelpie/Resized_20200214_191118_346649120350209.jpg',
            'https://images.dog.ceo/breeds/australian-kelpie/Resized_20200303_233358_108952253645051.jpg',
            'https://images.dog.ceo/breeds/australian-kelpie/Resized_20200416_142905_108884348190285.jpg',
            'https://images.dog.ceo/breeds/australian-kelpie/Resized_20201114_133404_109264920155921.jpg',
            'https://images.dog.ceo/breeds/australian-shepherd/forest.jpg',
            'https://images.dog.ceo/breeds/australian-shepherd/leroy.jpg',
            'https://images.dog.ceo/breeds/australian-shepherd/pepper.jpg',
            'https://images.dog.ceo/breeds/australian-shepherd/pepper2.jpg',
            'https://images.dog.ceo/breeds/australian-shepherd/sadie.jpg',
          ]);
        },
      );
    });
  });
}
