function paging(startPage, endPage, page, totalPage, pagePerBlock, link) {
    let paginationHtml = '<nav aria-label="Page navigation"><ul class="pagination justify-content-center">';
    
    if (endPage > totalPage) {
        endPage = totalPage + 1;
    }
    
    if (startPage > 0) {
        paginationHtml += '<li class="page-item"><a class="page-link" href="./' + link + '?page=' + startPage + '" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
    } else {
        paginationHtml += '<li class="page-item"><a class="page-link disabled" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>';
    }
    
    if (page == 1) {
        paginationHtml += '<li class="page-item"><a class="page-link disabled" aria-label="Previous"><span aria-hidden="true">&lsaquo;</span></a></li>';
    } else {
        paginationHtml += '<li class="page-item"><a class="page-link" href="./' + link + '?page=' + (page - 1) + '" aria-label="Previous"><span aria-hidden="true">&lsaquo;</span></a></li>';
    }
    
    for (let i = startPage + 1; i < endPage; i++) {
        if (page == i) {
            paginationHtml += '<li class="page-item"><span class="page-link">' + i + '</span></li>';
        } else {
            paginationHtml += '<li class="page-item"><a class="page-link" href="./' + link + '?page=' + i + '">' + i + '</a></li>';
        }
    }
    
    if (page == totalPage) {
        paginationHtml += '<li class="page-item"><a class="page-link disabled" href="./' + link + '?page=' + (page + 1) + '" aria-label="Next"><span aria-hidden="true">&rsaquo;</span></a></li>';
    } else {
        paginationHtml += '<li class="page-item"><a class="page-link" href="./' + link + '?page=' + (page + 1) + '" aria-label="Next"><span aria-hidden="true">&rsaquo;</span></a></li>';
    }
    
    if (page <= totalPage + 1) {
        paginationHtml += '<li class="page-item"><a class="page-link disabled" href="./' + link + '?page=' + (startPage + pagePerBlock + 1) + '" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
    } else {
        paginationHtml += '<li class="page-item"><a class="page-link" href="./' + link + '?page=' + (startPage + pagePerBlock + 1) + '" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>';
    }
    
    paginationHtml += '</ul></nav>';
    
    return paginationHtml;
} // generatePageList() ends 
