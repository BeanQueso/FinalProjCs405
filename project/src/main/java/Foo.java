public class Foo {
    public static void main(String[] args){
        Foo[] foos = new Foo[5];
        foos[0] = new Foo();
        foos[1] = new Foo();
        for (int i = 0; i < foos.length; i++) {
        foos[i].bar();
    }
}

    public void bar(){
        System.out.println("foobar");
    }
}
