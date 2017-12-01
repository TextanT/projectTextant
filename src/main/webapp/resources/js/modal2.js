 // 모달창 인스턴트 생성
        var myModal = new Example.Modal({
            id: "modal2" // 모달창 아이디 지정
        });

        // 모달 창 여는 버튼에 이벤트 걸기
        $("#menu1").click(function() {
            myModal.show("slow"); // 모달창 보여주기
        });

        // 모달 창 안에 있는 확인 버튼에 이벤트 걸기
        $("#confirm_button").click(function() {
            alert("나는 모달창이다.");
            myModal.hide(5000); // 모달창 감추기
        });
