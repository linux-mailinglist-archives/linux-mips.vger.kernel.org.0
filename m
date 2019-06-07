Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12CB38A12
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2019 14:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728606AbfFGMVH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jun 2019 08:21:07 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55907 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727823AbfFGMVH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jun 2019 08:21:07 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190607122105euoutp02217cee07c322f2127d1e39bde020cc7e~l6fC0Rw772939929399euoutp02B
        for <linux-mips@vger.kernel.org>; Fri,  7 Jun 2019 12:21:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190607122105euoutp02217cee07c322f2127d1e39bde020cc7e~l6fC0Rw772939929399euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559910066;
        bh=3PayBcTm4xsVydTVNR1iTIiX9cZXxEzCPaE3eX72fOw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=pOFszqU3wl2rk6c8bgxeVg8L5mEd0n/2KBU/TRhmC8mSneVvNp58ADkKGw7UTE+Lz
         Fjt7RqOfxmo88D7FQhXxQnc6YdFoYvpX/5/HAKBy1JjaroYP57WGADEPfWkYv544WM
         Lo07KjGzSkvHhTjmuMb7n1Jx7dw9msKunTl7epW0=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190607122105eucas1p1e501ffa5165dddb5368c6e11b8b93993~l6fCJ7Flf3080430804eucas1p1S;
        Fri,  7 Jun 2019 12:21:05 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id AF.B9.04377.0B65AFC5; Fri,  7
        Jun 2019 13:21:04 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190607122104eucas1p1e1bd882d9f741fbfb9bba4ef4d1ba088~l6fBbv9jg3080530805eucas1p1W;
        Fri,  7 Jun 2019 12:21:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190607122104eusmtrp1ade58e9fe532679bb3b6a2343c7c24b8~l6fBMOK_v2946729467eusmtrp1p;
        Fri,  7 Jun 2019 12:21:04 +0000 (GMT)
X-AuditID: cbfec7f4-113ff70000001119-61-5cfa56b0bb4a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2E.47.04146.0B65AFC5; Fri,  7
        Jun 2019 13:21:04 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607122103eusmtip1ccd9ab6c9386b2109d0f738b15c42918~l6fA7NoNf1729717297eusmtip1z;
        Fri,  7 Jun 2019 12:21:03 +0000 (GMT)
Subject: Re: [PATCH 3/3] jz4740_fb: fix DMA API abuse
To:     Christoph Hellwig <hch@lst.de>
Cc:     Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <8a149d05-047b-6df1-28fc-184dae9c32df@samsung.com>
Date:   Fri, 7 Jun 2019 14:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509173849.11825-4-hch@lst.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djP87obwn7FGEy8a2OxcvVRJosTfR9Y
        LS7vmsNm0blpK6PFtS+P2B1YPXbOusvusftmA5vH501yAcxRXDYpqTmZZalF+nYJXBlrLpxl
        LTjHU3H7aiNbA+MSri5GTg4JAROJBxP+MXUxcnEICaxglOid/5AZwvnCKHFyxkt2COczo8Tv
        5yuZYVqunZ8OlVjOKLH5Xx8bhPOWUeLizkWsIFXCAqYS98/OZgKxRQSUJJ6+OssIUsQs0MQo
        8ebcfLBRbAJWEhPbVzGC2LwCdhI7nz1iAbFZBFQkHjycA2aLCkRI3D+2gRWiRlDi5MwnYHFO
        AQOJAy39YHFmAXGJW0/mM0HY8hLb386BOnUeu8TRnkQI20Xi3Lwl7BC2sMSr41ugbBmJ05N7
        WECOkxBYxyjxt+MFM4SznVFi+eR/bBBV1hKHj18E2sYBtEFTYv0ufYiwo8Sz233MIGEJAT6J
        G28FIW7gk5i0bTpUmFeio00IolpNYsOyDWwwa7t2rmSewKg0C8lns5B8MwvJN7MQ9i5gZFnF
        KJ5aWpybnlpslJdarlecmFtcmpeul5yfu4kRmF5O/zv+ZQfjrj9JhxgFOBiVeHgdGH7GCLEm
        lhVX5h5ilOBgVhLhLbvwI0aINyWxsiq1KD++qDQntfgQozQHi5I4bzXDg2ghgfTEktTs1NSC
        1CKYLBMHp1QDY8G9eQp5VR9ZlAMci383H/H466dg21G9yetA4TLjMn91xe+K9VtP+U7e/+j8
        98uLmvwPXv55Xvjp1bnXTzpU9jSLvJr5/CKLy6JVZb9DXTvO3TI8GXfqwYq5p6amzeY6deuT
        JMsq/X+uDyZcyDhx+X9TxPOlL+bVVWmXyGx3WHgwTiT5S3PTs24lluKMREMt5qLiRACAW9jZ
        KwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7obwn7FGEyey2OxcvVRJosTfR9Y
        LS7vmsNm0blpK6PFtS+P2B1YPXbOusvusftmA5vH501yAcxRejZF+aUlqQoZ+cUltkrRhhZG
        eoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlrLpxlLTjHU3H7aiNbA+MSri5GTg4J
        AROJa+ens3cxcnEICSxllPg3+xZLFyMHUEJG4vj6MogaYYk/17rYIGpeM0o8WbeEHSQhLGAq
        cf/sbCYQW0RASeLpq7OMIEXMAk2MEr1zl0J1rGSU6N9zGqyKTcBKYmL7KkYQm1fATmLns0cs
        IDaLgIrEg4dzwGxRgQiJM+9XsEDUCEqcnPkEzOYUMJA40NLPCmIzC6hL/Jl3iRnCFpe49WQ+
        E4QtL7H97RzmCYxCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIE
        xtO2Yz8372C8tDH4EKMAB6MSD68Dw88YIdbEsuLK3EOMEhzMSiK8ZRd+xAjxpiRWVqUW5ccX
        leakFh9iNAV6biKzlGhyPjDW80riDU0NzS0sDc2NzY3NLJTEeTsEDsYICaQnlqRmp6YWpBbB
        9DFxcEo1MMbw1avb86y5eld2o2TCM17/bxEMkiI61ya8ypeY/2vqr+sqHM4636Y5rtpm2Ste
        vnnjcrXTj96ey1TTe3WQ/5P20UWz308plU5tTJAMLHhSv6R0s51ISLLFtPZiDf9zC7m+3d8U
        xvHohd+y2M1Xb5Q++b/baL/wEWuFjdae7OWFwi55XxekhCixFGckGmoxFxUnAgBUKKDNvQIA
        AA==
X-CMS-MailID: 20190607122104eucas1p1e1bd882d9f741fbfb9bba4ef4d1ba088
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190509173943epcas2p27a7106894d5a235a405a94e84340b416
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190509173943epcas2p27a7106894d5a235a405a94e84340b416
References: <20190509173849.11825-1-hch@lst.de>
        <CGME20190509173943epcas2p27a7106894d5a235a405a94e84340b416@epcas2p2.samsung.com>
        <20190509173849.11825-4-hch@lst.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 5/9/19 7:38 PM, Christoph Hellwig wrote:
> Virtual addresses return from dma(m)_alloc_coherent are opaque in what
> backs then, and drivers must not poke into them.  Switch the driver
> to use the generic DMA API mmap helper to avoid these problems.
Change itself looks fine but the patch description doesn't match what
the patch is actually doing (there is no conversion to DMA API helper
because the driver is already using it). Please correct it. Thank you.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/video/fbdev/jz4740_fb.c | 7 -------
>  1 file changed, 7 deletions(-)
> diff --git a/drivers/video/fbdev/jz4740_fb.c b/drivers/video/fbdev/jz4740_fb.c
> index b57df83fdbd3..b95cdfa9e0a1 100644
> --- a/drivers/video/fbdev/jz4740_fb.c
> +++ b/drivers/video/fbdev/jz4740_fb.c
> @@ -466,7 +466,6 @@ static int jzfb_alloc_devmem(struct jzfb *jzfb)
>  {
>  	int max_videosize = 0;
>  	struct fb_videomode *mode = jzfb->pdata->modes;
> -	void *page;
>  	int i;
>  
>  	for (i = 0; i < jzfb->pdata->num_modes; ++mode, ++i) {
> @@ -491,12 +490,6 @@ static int jzfb_alloc_devmem(struct jzfb *jzfb)
>  	if (!jzfb->vidmem)
>  		goto err_free_framedesc;
>  
> -	for (page = jzfb->vidmem;
> -		 page < jzfb->vidmem + PAGE_ALIGN(jzfb->vidmem_size);
> -		 page += PAGE_SIZE) {
> -		SetPageReserved(virt_to_page(page));
> -	}
> -
>  	jzfb->framedesc->next = jzfb->framedesc_phys;
>  	jzfb->framedesc->addr = jzfb->vidmem_phys;
>  	jzfb->framedesc->id = 0xdeafbead;

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
