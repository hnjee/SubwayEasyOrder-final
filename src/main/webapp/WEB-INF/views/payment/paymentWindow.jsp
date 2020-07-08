<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>

<script type="text/javascript">
        	
			BootPay.request({
				price: '5000', //���� �����Ǵ� ����
				application_id: "5ef3ffe48f07510027eed6d3",
				name: '��ǰ��', //����â���� ������ �̸�
				pg: '',
				method: '', //��������, �Է����� ������ �������� ���ú��� ȭ���� �����մϴ�.
				show_agree_window: 0, // ��Ʈ���� ���� ���� â ���̱� ����
				items: [
					{
						item_name: '���� ������', //��ǰ��
						qty: 1, //����
						unique: '123', //�ش� ��ǰ�� �������� primary key
						price: 5000, //��ǰ �ܰ�
						cat1: 'TOP', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
						cat2: 'Ƽ����', // ��ǥ ��ǰ�� ī�װ� ��, 50���� �̳�
						cat3: '���� Ƽ', // ��ǥ��ǰ�� ī�װ� ��, 50���� �̳�
					}
				],
				user_info: {
					username: '����� �̸�',
					email: '����� �̸���',
					addr: '����� �ּ�',
					phone: '010-1234-4567'
				},
				order_id: '����order_id_1234', //���� �ֹ���ȣ��, �����Ͻ� ���� �����ּž� �մϴ�.
				params: {callback1: '�״�� �ݹ���� ���� 1', callback2: '�״�� �ݹ���� ���� 2', customvar1234: '������ �������'},
				account_expire_at: '2018-05-25', // ������� �ԱݱⰣ ���� ( yyyy-mm-dd �������� �Է����ּ���. ������¸� ����˴ϴ�. )
				extra: {
				    start_at: '2019-05-10', // ���� ���� ������ - �������� �������� ������ �� �� ���Ϸκ��� ������ ������ Billing key ����
					end_at: '2022-05-10', // ������� ������ -  �Ⱓ ���� - ������
			        vbank_result: 1, // ������� ���� ���, ������� ���â�� ����(1), ����(0), �̼����� ��(1)
			        quota: '0,2,3' // �����ݾ��� 5���� �̻�� �Һΰ��� �������� ������ �� ����, [0(�Ͻú�), 2����, 3����] ���, �̼����� 12�������� ���
				}
			})
			
			.error(function (data) {
				//���� ����� ������ �߻��ϸ� ����˴ϴ�.
				console.log(data);
			})
			
			.cancel(function (data) {
				//������ ��ҵǸ� ����˴ϴ�.
				console.log(data);
			})
			
			
			.ready(function (data) {
				// ������� �Ա� ���¹�ȣ�� �߱޵Ǹ� ȣ��Ǵ� �Լ��Դϴ�.
				console.log(data);
			})
			
			.confirm(function (data) {
				//������ ����Ǳ� ���� ����Ǹ�, �ַ� ��� Ȯ���ϴ� ������ ���ϴ�.
				//���� - ī�� ��������� ��� �� �κ��� ������� �ʽ��ϴ�.
				console.log(data);
				var enable = true; // ��� ���� ���� ���� Ȥ�� �ٸ� ó��
				if (enable) {
					BootPay.transactionConfirm(data); // ������ ������ ���� ó���� �Ѵ�.
				} else {
					BootPay.removePaymentWindow(); // ������ ���� ������ ���� â�� �ݰ� ������ �������� �ʴ´�.
				}
			})
			
			.close(function (data) {
			    // ����â�� ������ ����˴ϴ�. (����,����,��ҿ� ������� ��� �����)
			    console.log(data);
			})
			
			.done(function (data) {
				//������ ���������� �Ϸ�Ǹ� ����˴ϴ�
				//����Ͻ� ������ �����ϱ� ���� ���� ��ȿ�� ������ �Ͻñ� ��õ�մϴ�.
				console.log(data);
			});

		</script>
		
		
		<!-- // ����  â -->