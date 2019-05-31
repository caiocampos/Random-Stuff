enum DocumentType {
	NO_TYPE,
	A_TYPE;
}

abstract class Origin {
	public static DocumentType getType() {
		return DocumentType.NO_TYPE;
	}
}

class A extends Origin {
	public static DocumentType getType() {
		return DocumentType.A_TYPE;
	}

}

interface Document {
}

class ADocument implements Document {

	ADocument(Origin o) {

	}
}

@FunctionalInterface
interface DocumentFactory {
	<T extends Origin> Document createDocument(T obj);
}

abstract class AbstractDocumentFactory {
	public static <T extends Origin> DocumentFactory getFactory(T o) {
		switch (o.getType()) {
			case A_TYPE:
				return ADocument::new;
		}
		return ADocument::new;
	}
}
