Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 151A371BC5
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2019 17:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733289AbfGWPfl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jul 2019 11:35:41 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:50991 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733053AbfGWPfl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jul 2019 11:35:41 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190723153540euoutp01e841cb3d7c5dbe050fbcd5e60f04bb26~0E0Dm_lhw1173611736euoutp01k
        for <linux-mips@vger.kernel.org>; Tue, 23 Jul 2019 15:35:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190723153540euoutp01e841cb3d7c5dbe050fbcd5e60f04bb26~0E0Dm_lhw1173611736euoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1563896140;
        bh=FW1i9XkqsJ/xfT8yfZ1NJRFGhGEAIPPrdEJR1YIhNcg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=d/g9/XWIPZs5EvTRF8o0FbNYx4PZIV/9wWm9CIL9exS8GrZWOdQxicO7J1G9H0JiQ
         ga6cg3qTIZrL9ghqguS3z/1E/8d6b8FvEWNp8cS3fmVKwZ6+5jiAMNrRjT8j07L+mj
         ovzglDojxFe+W6XxZNpFM8z/U2bDsaJr41fdXXv8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190723153539eucas1p227bf47a237bc2a3ccfac575894a8256f~0E0DSBQEU0206502065eucas1p2m;
        Tue, 23 Jul 2019 15:35:39 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 47.BE.04325.B49273D5; Tue, 23
        Jul 2019 16:35:39 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190723153538eucas1p21d154d9af7375b2fbf49f8c1e83279b1~0E0CkZ2pq2267122671eucas1p2c;
        Tue, 23 Jul 2019 15:35:38 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190723153538eusmtrp1e5cf49713ceaa10cef1e9e38565bb8d9~0E0CWZSkr2233722337eusmtrp1b;
        Tue, 23 Jul 2019 15:35:38 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-a7-5d37294b4103
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 80.C1.04140.A49273D5; Tue, 23
        Jul 2019 16:35:38 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190723153538eusmtip1153a7a1dab9c21e1d540d4b80b245193~0E0CArRqo0775207752eusmtip1T;
        Tue, 23 Jul 2019 15:35:38 +0000 (GMT)
Subject: Re: [PATCH] au1200fb: don't use DMA_ATTR_NON_CONSISTENT
To:     Manuel Lauss <manuel.lauss@gmail.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Linux-MIPS <linux-mips@vger.kernel.org>,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <3fb07ff6-fd89-a42a-607a-1bce6a300805@samsung.com>
Date:   Tue, 23 Jul 2019 17:35:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOLZvyF0NsB6_e0=Vat48Mq1r-Qy45z509jAgQczG7RoaOqjBA@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djP87remuaxBk92y1isXH2UyeJE3wdW
        i8u75rBZdG7aymhx7csjdgdWj52z7rJ77L7ZwObxeZNcAHMUl01Kak5mWWqRvl0CV8a+htUs
        BRM5KjacncHcwHicrYuRk0NCwETixbc9QDYXh5DACkaJNzM6WSCcL4wS59ZPYIJwPjNKvL0+
        hQWm5dKHC1Aty4ESD7rZIZy3jBJ/37axdjFycAgLOEic3VAN0iAi4Cnx/u9tVhCbWaBWYub3
        /2A2m4CVxMT2VYwgNq+AnUTro1PMIDaLgKrErFPbwe4TFYiQuH9sAytEjaDEyZlPwI7gFAiU
        uH2pjwliprjErSfzoWx5ie1v5zCD3CMh0M8usfrlMVaIq10kJh3/CvWBsMSr41vYIWwZidOT
        e1ggGtYBPdDxAqp7O6PE8sn/oMFkLXH4+EWwz5gFNCXW79KHCDtKHPp0ECwsIcAnceOtIMQR
        fBKTtk1nhgjzSnS0CUFUq0lsWLaBDWZt186VzBMYlWYheW0WkndmIXlnFsLeBYwsqxjFU0uL
        c9NTi43zUsv1ihNzi0vz0vWS83M3MQKTy+l/x7/uYNz3J+kQowAHoxIPbwWTeawQa2JZcWXu
        IUYJDmYlEd7ABrNYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJM
        HJxSDYzcurbNVafaJN7r/nXyfv2f4S03a/LEP73CuxflXZdwMcqMaPk2LeqmdJ6owW5tR3aF
        ZdKf9h6UM3hmbDIpsvWl3bur/XwP44O72vt6rnewn5i3tjLgnsM57oqXuzR2nrG6ZX6owDSb
        S8Tuh/2VHVOFxGMffpjsWMNs7NDc+kesLefChQrmQCWW4oxEQy3mouJEAHHA640qAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRmVeSWpSXmKPExsVy+t/xu7pemuaxBhvfqFqsXH2UyeJE3wdW
        i8u75rBZdG7aymhx7csjdgdWj52z7rJ77L7ZwObxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsa+htUsBRM5KjacncHcwHicrYuRk0NC
        wETi0ocLYLaQwFJGifczC7sYOYDiMhLH15dBlAhL/LnWBVTCBVTymlHi3p1PbCA1wgIOEmc3
        VIPUiAh4Srz/e5sVxGYWqJdY0nMBqv4Uo8Se7XvB5rMJWElMbF/FCGLzCthJtD46xQxiswio
        Ssw6tR2sRlQgQuLM+xUsEDWCEidnPgGzOQUCJW5f6mOCWKAu8WfeJWYIW1zi1pP5UHF5ie1v
        5zBPYBSahaR9FpKWWUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMwkrYd+7ll
        B2PXu+BDjAIcjEo8vBVM5rFCrIllxZW5hxglOJiVRHgDG8xihXhTEiurUovy44tKc1KLDzGa
        Aj03kVlKNDkfGOV5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtSi2D6mDg4pRoY
        p/1o+/z/y4JECbdpyU695RcWcCVfuc9tdti+asYKzeW6n1k1mA8nuUtuORE8PVKrlHGDvvTs
        9Glv1xq+7q/bweVytGvjjFnh+tu//NO4uMX33sUn03Ps/VNZfD5sXD65Ze7smwKXN03u28XA
        Z7C11Mj62tar5tN0zQVP2xz7frHJ6V5IqZo1mxJLcUaioRZzUXEiAOleaIa6AgAA
X-CMS-MailID: 20190723153538eucas1p21d154d9af7375b2fbf49f8c1e83279b1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190626071727epcas1p137bdd191d49ab127eb92458848a06efb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190626071727epcas1p137bdd191d49ab127eb92458848a06efb
References: <20190625121321.10197-1-hch@lst.de>
        <CGME20190626071727epcas1p137bdd191d49ab127eb92458848a06efb@epcas1p1.samsung.com>
        <CAOLZvyF0NsB6_e0=Vat48Mq1r-Qy45z509jAgQczG7RoaOqjBA@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 6/26/19 9:16 AM, Manuel Lauss wrote:
> On Tue, Jun 25, 2019 at 2:13 PM Christoph Hellwig <hch@lst.de> wrote:
>>
>> au1200fb allocates DMA memory using DMA_ATTR_NON_CONSISTENT, but never
>> calls dma_cache_sync to synchronize the memory between the CPU and the
>> device.  If it was use on a not cache coherent bus that would be fatal,
>> but as far as I can tell from the naming and the mips platform
>> implementation it always is used in cache coherent systems.  Remove
>> the DMA_ATTR_NON_CONSISTENT flag, which is a no-op in that case.
> 
> Very early au1200 chips, on which this driver apparently was developed on,
> had issues with cache coherency, but this was fixed in a later step,
> none of the 3 steppings I have access to exhibit any problems
> with this patch applied.
> 
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-By: Manuel Lauss <manuel.lauss@gmail.com>

Patch queued for v5.4, thanks.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
