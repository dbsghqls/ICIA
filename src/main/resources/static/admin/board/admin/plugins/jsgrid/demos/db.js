(function() {

    var db = {

        loadData: function(filter) {
            return $.grep(this.clients, function(client) {
                return (!filter.번호 || client.번호.indexOf(filter.번호) > -1)
                    && (!filter.내용 || client.내용.indexOf(filter.내용) > -1)
                    && (!filter.작성자 || client.작성자.indexOf(filter.작성자) > -1)
                    && (!filter.작성일 || client.작성일.indexOf(filter.작성일) > -1)
                    && (!filter.조회수 || client.조회수.indexOf(filter.조회수) > -1);
            });
        },

        insertItem: function(insertingClient) {
            this.clients.push(insertingClient);
        },

        updateItem: function(updatingClient) { },

        deleteItem: function(deletingClient) {
            var clientIndex = $.inArray(deletingClient, this.clients);
            this.clients.splice(clientIndex, 1);
        }

    };

    window.db = db;

    db.clients = [
    {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
        {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        },
                {
            "번호": "Otto Clay",
            "제목": 61,
            "작성자": 6,
            "작성일": 6,
            "조회수": 6
        }
    ];
}());