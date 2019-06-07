Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C13C3389F3
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jun 2019 14:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728084AbfFGMOn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jun 2019 08:14:43 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53807 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfFGMOn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jun 2019 08:14:43 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190607121441euoutp023b6ad75328966059b7e42d65e4162959~l6ZdEyQ-o2486924869euoutp02L
        for <linux-mips@vger.kernel.org>; Fri,  7 Jun 2019 12:14:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190607121441euoutp023b6ad75328966059b7e42d65e4162959~l6ZdEyQ-o2486924869euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559909681;
        bh=Y0PHswQo3moF+imArv8WDzx/3UV2pAXhOR9DW6vz0jg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kRCIKBb307zWFw/na98wFuhwvVYLSPJ/rXrY7XiaCoMOGw/yjS7jMRsANydCk3FJU
         7XnUhFMGNTNxb7TMceaz0fKH8t3XN1Wgt3rekcftxZVpMBSuNbYqjrVwi37myINP5m
         UyjonA45PuUxT71Xy0wl1zKRBkFsnnjQUpcf3YpA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190607121441eucas1p16ac404b9de39463b748ae21a0b70208b~l6ZcmL9UL1604016040eucas1p1B;
        Fri,  7 Jun 2019 12:14:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 60.73.04298.1355AFC5; Fri,  7
        Jun 2019 13:14:41 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190607121440eucas1p2b3417ac3909535c3f7e24bb37d6b842b~l6ZbvWPHP1479714797eucas1p2z;
        Fri,  7 Jun 2019 12:14:40 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190607121440eusmtrp161e9c4df5d352e1846dd1269b74b758b~l6ZbdAle12590725907eusmtrp1d;
        Fri,  7 Jun 2019 12:14:40 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-6f-5cfa55317db4
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B9.C0.04140.0355AFC5; Fri,  7
        Jun 2019 13:14:40 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190607121439eusmtip14bff059c802953abfab4ff858ea82d7f~l6ZbLUfwE1348713487eusmtip16;
        Fri,  7 Jun 2019 12:14:39 +0000 (GMT)
Subject: Re: [PATCH 2/3] au1200fb: fix DMA API abuse
To:     Manuel Lauss <manuel.lauss@gmail.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux-MIPS <linux-mips@vger.kernel.org>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <76042970-34b0-87a9-6aac-5fa27a113e21@samsung.com>
Date:   Fri, 7 Jun 2019 14:14:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOLZvyG14NvbgX4PA5aafk=reLcHbqDswqS-8j4+7QJMx02d7A@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7djPc7qGob9iDCbdYLZYufook8WJvg+s
        Fpd3zWGz6Ny0ldHi2pdH7A6sHjtn3WX32H2zgc3j8ya5AOYoLpuU1JzMstQifbsErowFHY0s
        BQfYKlqe3GVqYFzI2sXIwSEhYCLRvD+yi5GLQ0hgBaPEzCOPWCGcL4wSrXuOMEI4nxklvq1c
        B+RwgnUcvtPLBJFYziix9sV6dgjnLaPEwvfvmUCqhIGqDp1eywxiiwh4Srz/e5sVxGYWqJWY
        +f0/mM0mYCUxsX0VI8gdvAJ2Eg/e+IKEWQRUJB6tn8EOYosKREjcP7YBrJxXQFDi5MwnLCDl
        nAKBEl83M0NMFJe49WQ+E4QtL7H97RxmkHMkBCazS5zedZMZ4k0XiaVL+CDuF5Z4dXwLO4Qt
        I3F6cg8LRP06Rom/HS+gmrczSiyf/I8Nospa4vDxi+DwYhbQlFi/Sx8i7Chx/dxPqPl8Ejfe
        CkLcwCcxadt0qDCvREebEES1msSGZRvYYNZ27VzJPIFRaRaSx2Yh+WYWkm9mIexdwMiyilE8
        tbQ4Nz212DAvtVyvODG3uDQvXS85P3cTIzCtnP53/NMOxq+Xkg4xCnAwKvHwerD/jBFiTSwr
        rsw9xCjBwawkwlt24UeMEG9KYmVValF+fFFpTmrxIUZpDhYlcd5qhgfRQgLpiSWp2ampBalF
        MFkmDk6pBsY1ihGzf5QUlv3tXbQsx8d/YtgzmZkvZS7WOio7vjXL1/O6nxl4Te1i2Iu3U+/N
        uaJr5fLg5of7xwLzz8W12/pM23T7OKd4RZmZ8ME9acJyc+I8Dht7H+i8EqBfdv7ko84z20pk
        532K62TY3PnklYXRvKWcXGI71qncfzJ/2oXyI6xWn6p6N2UpsRRnJBpqMRcVJwIA11NxWicD
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7oGob9iDDrOsFisXH2UyeJE3wdW
        i8u75rBZdG7aymhx7csjdgdWj52z7rJ77L7ZwObxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaCjkaWggNsFS1P7jI1MC5k7WLk5JAQ
        MJE4fKeXqYuRi0NIYCmjxMnWhyxdjBxACRmJ4+vLIGqEJf5c62KDqHnNKPG99ykzSEIYqPnQ
        6bVgtoiAp8T7v7fBhjIL1Ess6bkA1fCBUeLv3sWMIAk2ASuJie2rGEEW8ArYSTx44wsSZhFQ
        kXi0fgY7iC0qECFx5v0KFhCbV0BQ4uTMJ2D3cAoESnzdzAwxXl3iz7xLULa4xK0n85kgbHmJ
        7W/nME9gFJqFpHsWkpZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzCSth37
        uWUHY9e74EOMAhyMSjy8M5h+xgixJpYVV+YeYpTgYFYS4S278CNGiDclsbIqtSg/vqg0J7X4
        EKMp0G8TmaVEk/OBUZ5XEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNT
        qoHRy8Kz7sXhV0vLLsWoTrp+6VeWldjtQNH6SNXkJQHHiuo/SK8uStipEWp2QM09TfBJpGHG
        BQabPRvrPeW3xx25lPexn9lb7JsR06/pO7YYftx0uW/VHDUF9voJeaKqMco7rXZMv3ggcAXf
        olPNp1acVBE23atwd+t07bP187PSrf8UrbTdWLJJiaU4I9FQi7moOBEAwUW/nboCAAA=
X-CMS-MailID: 20190607121440eucas1p2b3417ac3909535c3f7e24bb37d6b842b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190515111114epcas1p10322ccf505be725a188b664baed2e183
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190515111114epcas1p10322ccf505be725a188b664baed2e183
References: <20190509173849.11825-1-hch@lst.de>
        <20190509173849.11825-3-hch@lst.de>
        <CGME20190515111114epcas1p10322ccf505be725a188b664baed2e183@epcas1p1.samsung.com>
        <CAOLZvyG14NvbgX4PA5aafk=reLcHbqDswqS-8j4+7QJMx02d7A@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 5/15/19 1:10 PM, Manuel Lauss wrote:
> Servus Christoph,
> 
> On Thu, May 9, 2019 at 7:39 PM Christoph Hellwig <hch@lst.de> wrote:
>> Virtual addresses return from dma(m)_alloc_attrs are opaque in what
>> backs then, and drivers must not poke into them.  Similarly caching
>> modes are not supposed to be directly set by the driver.  Switch the
>> driver to use the generic DMA API mmap helper to avoid these problems.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>  drivers/video/fbdev/au1200fb.c | 19 ++++---------------
>>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
> Runs fine on my test system.
> 
> Tested-by: Manuel Lauss <manuel.lauss@gmail.com>

Patch queued for v5.3, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
