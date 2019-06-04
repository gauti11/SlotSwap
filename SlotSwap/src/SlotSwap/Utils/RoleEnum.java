package SlotSwap.Utils;

public enum RoleEnum {
	Admin(1), User(2);
	private final int index;

	RoleEnum(int index) {
		this.index = index;
	}

	public int index() {
		return index;
	}

}
