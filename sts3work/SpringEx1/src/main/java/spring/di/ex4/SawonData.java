package spring.di.ex4;

public class SawonData {

	private String sawonName;
	private int pay;
	private String ipsaday;
	
	//����Ʈ ������
	public SawonData() {
		// TODO Auto-generated constructor stub
	}
	
	//�����..�����ڷ� ����
	public SawonData(String name) {
		// TODO Auto-generated constructor stub
		this.sawonName=name;
	}
	//�޿�, �Ի絥��..setter����
	public String getSawonName() {
		return sawonName;
	}

	public void setSawonName(String sawonName) {
		this.sawonName = sawonName;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getIpsaday() {
		return ipsaday;
	}

	public void setIpsaday(String ipsaday) {
		this.ipsaday = ipsaday;
	}
	
	
}
