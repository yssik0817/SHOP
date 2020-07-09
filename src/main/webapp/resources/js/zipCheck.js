 function zipCheck() {
        new daum.Postcode(
                {
                    oncomplete : function(data) {
                        // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
                        // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                        // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                        var fullAddr = ''; // ���� �ּ� ����
                        var extraAddr = ''; // ������ �ּ� ����
 
                        // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                        if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                            fullAddr = data.roadAddress;
 
                        } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                            fullAddr = data.jibunAddress;
                        }
 
                        // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                        if (data.userSelectedType === 'R') {
                            //���������� ���� ��� �߰��Ѵ�.
                            if (data.bname !== '') {
                                extraAddr += data.bname;
                            }
                            // �ǹ����� ���� ��� �߰��Ѵ�.
                            if (data.buildingName !== '') {
                                extraAddr += (extraAddr !== '' ? ', '
                                        + data.buildingName : data.buildingName);
                            }
                            // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                            fullAddr += (extraAddr !== '' ? ' (' + extraAddr
                                    + ')' : '');
                        }
 
                        // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                        document.getElementById('sample6_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                        document.getElementById('sample6_address').value = fullAddr;
 
                        // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                        document.getElementById('sample6_address2').focus();
                    }
                }).open();
    }