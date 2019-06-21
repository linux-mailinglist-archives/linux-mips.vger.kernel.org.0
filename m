Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD2BB4E720
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 13:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfFULcW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 07:32:22 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47531 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726218AbfFULcV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 07:32:21 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190621113219euoutp01149f21b0070abeedbe3bba1add92967e~qM2dg1YG-1077110771euoutp01Q
        for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2019 11:32:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190621113219euoutp01149f21b0070abeedbe3bba1add92967e~qM2dg1YG-1077110771euoutp01Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561116739;
        bh=Ijmfi8RUSvMgpsjjHQ/yJewJXt4xh1RJuge4v7u+ECk=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=ehX2A7XeV19TIiDly41XBKqRqxZgmW92U9TKI2VQNBs5Wt7GKbute+dqN0PfaKQEi
         eTAvaYgERX05qaJJ8nMQhBd0JLLuS79AGqiI4flP5qd7SzZkLhAiHfgLk/mcMmkWGl
         kI0V4qWaSqnIwyIJ7QvNE1umD9TkiYwm+TGyzaZY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190621113219eucas1p1aeb21479f3091c8d8116abb3defd0e8b~qM2dLOaqb0442904429eucas1p1B;
        Fri, 21 Jun 2019 11:32:19 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 35.5D.04325.340CC0D5; Fri, 21
        Jun 2019 12:32:19 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190621113218eucas1p14650c1edefb2bb338c392714f6893bed~qM2ccSc1u1864218642eucas1p1j;
        Fri, 21 Jun 2019 11:32:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190621113218eusmtrp1e8f98e0a54335937eda7932acfada604~qM2cOQOQJ1786817868eusmtrp1Q;
        Fri, 21 Jun 2019 11:32:18 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-b1-5d0cc043dd0c
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 67.E6.04140.240CC0D5; Fri, 21
        Jun 2019 12:32:18 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190621113218eusmtip1591448ffaa7e94e186e2368a6e2d5eee~qM2b8IEeH1705317053eusmtip1N;
        Fri, 21 Jun 2019 11:32:18 +0000 (GMT)
Subject: Re: [PATCH 3/3] jz4740_fb: fix DMA API abuse
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <16211aea-cd48-2d68-7ba9-d81b126d81cf@samsung.com>
Date:   Fri, 21 Jun 2019 13:32:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8a149d05-047b-6df1-28fc-184dae9c32df@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJKsWRmVeSWpSXmKPExsWy7djPc7rOB3hiDb5t47FYufook8WJvg+s
        Fpd3zWGz6Ny0ldHi2pdH7A6sHjtn3WX32H2zgc3j8ya5AOYoLpuU1JzMstQifbsEroy5nw6z
        Faznq9jyfAdzA+M97i5GTg4JAROJV2svs3QxcnEICaxglGg8fZQZwvnCKHH39yomCOczo8Sb
        R22MMC1vH7RCJZYzSpxb0AnV/5ZR4vasDlaQKmEBU4n7Z2czgdhsAlYSE9tXgXWLCChJPH11
        lhGkgVmgCWjsufnMIAleATuJyZ3H2UBsFgFViR2TH4HZogIREvePbWCFqBGUODnzCQuIzSlg
        L/Hs414wm1lAXOLWk/lMELa8xPa3c8CekBCYxy5xr+0KE8TdLhKv9m2CsoUlXh3fwg5hy0ic
        ntzDAtGwjlHib8cLqO7tjBLLJ/9jg6iyljh8/CLQGRxAKzQl1u/Shwg7Sjy73ccMEpYQ4JO4
        8VYQ4gg+iUnbpkOFeSU62oQgqtUkNizbwAaztmvnSuYJjEqzkLw2C8k7s5C8Mwth7wJGllWM
        4qmlxbnpqcXGeanlesWJucWleel6yfm5mxiBCeb0v+NfdzDu+5N0iFGAg1GJh/fALO5YIdbE
        suLK3EOMEhzMSiK8PDk8sUK8KYmVValF+fFFpTmpxYcYpTlYlMR5qxkeRAsJpCeWpGanphak
        FsFkmTg4pRoYlaao3uSv+iN46nKEkJrVpS3Bl9sDbl5c5xP0RZ+X99N2K4evbhdvBnOb6dwV
        +shqEv4k9fUXC4UeGdnbB+IdLX/Oz9CsDS4o+N/otsn7yO8pu4rr3MPnq1ns3zT/sfztNxck
        T/0+zzh1u8adza1NDvPE96202PqNf/7p1N6/jxR93F7NXDyLS4mlOCPRUIu5qDgRAKzPre8s
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7pOB3hiDabulLNYufook8WJvg+s
        Fpd3zWGz6Ny0ldHi2pdH7A6sHjtn3WX32H2zgc3j8ya5AOYoPZui/NKSVIWM/OISW6VoQwsj
        PUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYy5nw6zFaznq9jyfAdzA+M97i5GTg4J
        AROJtw9amboYuTiEBJYySnR8uszexcgBlJCROL6+DKJGWOLPtS42iJrXjBJdPZPZQRLCAqYS
        98/OZgKx2QSsJCa2r2IEsUUElCSevjrLCNLALNDEKNE7dylU9z1GiXkz5zCDVPEK2ElM7jzO
        BmKzCKhK7Jj8CMwWFYiQOPN+BQtEjaDEyZlPwGxOAXuJZx/3gtnMAuoSf+ZdYoawxSVuPZnP
        BGHLS2x/O4d5AqPQLCTts5C0zELSMgtJywJGllWMIqmlxbnpucVGesWJucWleel6yfm5mxiB
        8bTt2M8tOxi73gUfYhTgYFTi4T0wiztWiDWxrLgy9xCjBAezkggvTw5PrBBvSmJlVWpRfnxR
        aU5q8SFGU6DnJjJLiSbnA2M9ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFM
        HxMHp1QDY8/P3nj79BcPk19GLJmUdfXkUw53ofkzlm/4vkE68nAIU9qh5vkLL8V7vX605rK/
        2I4720x5hW93Xgy90Wy7MrNnznLbi5F7Yz+8u7jzUPopz/Nu8aWXk45Fth0L7bt0ZKJK7JOv
        9Uc29n+/fetg36kOn4jQ7MaNFteu8Tl+2xvjGNZ1cl20mrISS3FGoqEWc1FxIgBc5QvOvQIA
        AA==
X-CMS-MailID: 20190621113218eucas1p14650c1edefb2bb338c392714f6893bed
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190509173943epcas2p27a7106894d5a235a405a94e84340b416
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190509173943epcas2p27a7106894d5a235a405a94e84340b416
References: <20190509173849.11825-1-hch@lst.de>
        <CGME20190509173943epcas2p27a7106894d5a235a405a94e84340b416@epcas2p2.samsung.com>
        <20190509173849.11825-4-hch@lst.de>
        <8a149d05-047b-6df1-28fc-184dae9c32df@samsung.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Hi,

On 6/7/19 2:21 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> On 5/9/19 7:38 PM, Christoph Hellwig wrote:
>> Virtual addresses return from dma(m)_alloc_coherent are opaque in what
>> backs then, and drivers must not poke into them.  Switch the driver
>> to use the generic DMA API mmap helper to avoid these problems.
> Change itself looks fine but the patch description doesn't match what
> the patch is actually doing (there is no conversion to DMA API helper
> because the driver is already using it). Please correct it. Thank you.

I've just removed the "Switch the driver.." sentence myself from
the patch description and applied the change, thanks!

>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  drivers/video/fbdev/jz4740_fb.c | 7 -------
>>  1 file changed, 7 deletions(-)
>> diff --git a/drivers/video/fbdev/jz4740_fb.c b/drivers/video/fbdev/jz4740_fb.c
>> index b57df83fdbd3..b95cdfa9e0a1 100644
>> --- a/drivers/video/fbdev/jz4740_fb.c
>> +++ b/drivers/video/fbdev/jz4740_fb.c
>> @@ -466,7 +466,6 @@ static int jzfb_alloc_devmem(struct jzfb *jzfb)
>>  {
>>  	int max_videosize = 0;
>>  	struct fb_videomode *mode = jzfb->pdata->modes;
>> -	void *page;
>>  	int i;
>>  
>>  	for (i = 0; i < jzfb->pdata->num_modes; ++mode, ++i) {
>> @@ -491,12 +490,6 @@ static int jzfb_alloc_devmem(struct jzfb *jzfb)
>>  	if (!jzfb->vidmem)
>>  		goto err_free_framedesc;
>>  
>> -	for (page = jzfb->vidmem;
>> -		 page < jzfb->vidmem + PAGE_ALIGN(jzfb->vidmem_size);
>> -		 page += PAGE_SIZE) {
>> -		SetPageReserved(virt_to_page(page));
>> -	}
>> -
>>  	jzfb->framedesc->next = jzfb->framedesc_phys;
>>  	jzfb->framedesc->addr = jzfb->vidmem_phys;
>>  	jzfb->framedesc->id = 0xdeafbead;
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
