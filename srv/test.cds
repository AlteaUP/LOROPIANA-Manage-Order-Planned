using {test} from '../srv/external/test';

@path: '/test'
service TestService {
  @readonly
  entity ZZTEST_COMBORDERCOMPLIST as projection on test.ZTEST_COMBORDERCOMPLIST;
}
