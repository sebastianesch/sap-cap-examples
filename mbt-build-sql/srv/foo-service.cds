using { com.example as example } from '../db/schema';
service FooService {
  entity Foo as projection on example.Foo;
}