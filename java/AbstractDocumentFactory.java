
interface Types {
  int NO_TYPE = 0;
  int A_TYPE = 1;
}

abstract class Origin {
  public static int getType() {
    return Types.NO_TYPE;
  }
}

class A extends Origin {
  public static int getType() {
    return Types.A_TYPE;
  }

}

interface Document {
}

class ADocument implements Document {

  ADocument(Origin o) {

  }
}

class AbstractDocumentFactory {
  @FunctionalInterface
  interface DocumentFactory {
    public <T extends Origin> Document createDocument(T obj);
  }

  public <T extends Origin> DocumentFactory getFactory(T o) {
    switch (o.getType()) {
      case Types.A_TYPE:
        return ADocument::new;
    }
    return ADocument::new;
  }
}