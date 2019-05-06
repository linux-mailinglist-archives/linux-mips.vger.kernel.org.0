Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C360414B2D
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 15:49:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfEFNtj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 May 2019 09:49:39 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38676 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726329AbfEFNtj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 May 2019 09:49:39 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190506134938euoutp01f45416601a476ecd096337d40aafb145~cHDNg2IdD0884508845euoutp01E
        for <linux-mips@vger.kernel.org>; Mon,  6 May 2019 13:49:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190506134938euoutp01f45416601a476ecd096337d40aafb145~cHDNg2IdD0884508845euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1557150578;
        bh=P7VhdfKau4WWhvUvStqz4ZpxoPa4I41d5iy+2lZ2Xkg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=kX1s+ufcvcRsmDBuqrwJuACTAaMXoXkWYIr7441w8teJTNTovsA0NLzmq+6ehmxe1
         PMOUMg5H3HUaNYDwjGxuGgrZOdHBHAwThZMlWym29CcVzQuU9itzFA04k0LvMuzS48
         XuBBVJdLH/cTby4+FW/qAofWcPS1RJNhI8d2eKX4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190506134937eucas1p29e237a8ab0f697f175a0afa018f1909b~cHDM2ZcY_2976629766eucas1p2t;
        Mon,  6 May 2019 13:49:37 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8D.28.04298.17B30DC5; Mon,  6
        May 2019 14:49:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190506134936eucas1p2bc1a530cb7ec454d489f04c1d17a1747~cHDMInob-1945619456eucas1p2f;
        Mon,  6 May 2019 13:49:36 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190506134936eusmtrp216ef39ffea283ca81041002d4039c9ff~cHDL6UHf62143621436eusmtrp2D;
        Mon,  6 May 2019 13:49:36 +0000 (GMT)
X-AuditID: cbfec7f2-f2dff700000010ca-06-5cd03b71f187
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.02.04140.07B30DC5; Mon,  6
        May 2019 14:49:36 +0100 (BST)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190506134935eusmtip2dd0c9c67ac2900917d7e4ab75aabb56e~cHDLbjmJb1830718307eusmtip2W;
        Mon,  6 May 2019 13:49:35 +0000 (GMT)
Subject: Re: [PATCH 2/7] au1100fb: fix DMA API abuse
To:     Christoph Hellwig <hch@lst.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-fbdev@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <7a63eeae-4ec3-c82e-c497-8adc7bcb3cea@samsung.com>
Date:   Mon, 6 May 2019 15:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
        Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20190430110032.25301-3-hch@lst.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjt3d3u7oaT69R8UDEclhBpChHXDLGQuNWfsD9hUq28qOQ223Wa
        FeWPLJ0wv/qwYWiCmotU5rdl5pxT8Ss1TNNIUUuUqamRRbPc7gT/ned5znnPOfASmPSdwJtI
        VKYwaqU8SYaL+Y2W34NBN8I/xIbM6MVU1asuHlXaHk7l96zxqfm8KZzq0a0KqNHWYpzKNjYg
        au5HH5/SLVkwauRtQKSYzmzLw2mjIRunu6pe8+jC8UpEv5nIwOkl8wyftmkfYfS60e8cESM+
        HsckJaYy6sMRV8QJQ4XlWPIX7GZ2bYMwA+VgWiQigDwC3ZkdSIvEhJR8iUA3bMO4YQOB2fgC
        54Z1BA35Y2hHMlm0IeQOlQj6LctOiRXB/WUDz85y32Y1Fm86FB6kDOYXBxwmGFnNA52uwHHA
        yWOQ/9DgwBIyAuYraoR2zCcD4Ilet/0qQXiSFyC3P5CjuEHvszm+HYvIEChvNgnsGNvG5rJi
        J94HTdZiRyAgB4XwuE0n5GJHQVO93tnaHRa76517X/jXUsLjBNUIbFkLTnUTgsrCLZxjhUNn
        97CAwyfgY2cubk8HpCuMW904Z1coaHyKcWsJZD2QcuwDUFtRi+94aVuqnBloaF+14HnIX7+r
        m35XH/2uPqUIMyAvRsMq4hk2VMmkBbNyBatRxgdfUymMaPtX9W11rzWjnyNXTYgkkMxFQsuG
        YqUCeSqbrjAhIDCZh0T+bTBWKomTp99i1KrLak0Sw5qQD8GXeUlu75m+KCXj5SnMdYZJZtQ7
        Vx4h8s5Ap7UTM12ncqyW53H5nr6rQUWj/X+ss6k8ZB5pvZOoEb03hbXaPvkrL9kCzTAW0VO2
        d2tlUVpEbqoUX3tZ3hwznZVWM5F1MsHlrndUmI/qlzRvtrpSbfz+OW2/nzJacL76TMzkvbMr
        qZF/ZVMLqujpuoWOAYXKfMgMJeV1RzUyPpsgDz2IqVn5f8RVZkNRAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xe7oF1hdiDD5/FbFYufook8WC/dYW
        E098YrF4OuEOm8WJvg+sFpd3zWGz6Ny0ldHiycfTLBZ9r48xW1zao+LA5dG6dwKbx6ZVnWwe
        R1euZfKYfGM5o8fumw1sHq+PPGTx+Ns1hdnj8ya5AI4oPZui/NKSVIWM/OISW6VoQwsjPUNL
        Cz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzzk5cyF9xlrujcsJW9gbGbuYuRk0NCwETi
        9owv7F2MXBxCAksZJU5vPcTWxcgBlJCROL6+DKJGWOLPtS42iJrXjBJv921mBEkIAzVvm/MD
        zBYRUJJ4+uosI0TRSkaJxf/OsIA4zALrmCRaTs0Bq2ITsJKY2L4KzOYVsJN4umw9O4jNIqAi
        MW1WH9hJogIRErcedrBA1AhKnJz5BMzmFDCQWLrjECuIzSygJ7Hj+i8oW15i+9s5zBMYBWch
        aZmFpGwWkrIFjMyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAuNv27GfW3Ywdr0LPsQowMGo
        xMProXQ+Rog1say4MvcQowQHs5IIb+KzczFCvCmJlVWpRfnxRaU5qcWHGE2BnpjILCWanA9M
        DXkl8YamhuYWlobmxubGZhZK4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhhTCi9XsvsLf3Ps
        dAw7oqGvrl3fYZuq4P5NL/XZV/U/S69P3vzomrDV3/mRZUUGj3n+v44/uT4l8Pf0T3FlT05O
        f+t3+VVL561lPI9/5LP9PHx6XfP8I7d+MW9rXMMZf0rqrvzt6cdZpPZG86jnmt/wYa8025MX
        9MTuV80qE6n2F48NZFoDufcqsRRnJBpqMRcVJwIAhi4zqNUCAAA=
X-CMS-MailID: 20190506134936eucas1p2bc1a530cb7ec454d489f04c1d17a1747
X-Msg-Generator: CA
X-RootMTR: 20190430110118epcas2p24019c7551331cc6390e5b5e07b381dd9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190430110118epcas2p24019c7551331cc6390e5b5e07b381dd9
References: <20190430110032.25301-1-hch@lst.de>
        <CGME20190430110118epcas2p24019c7551331cc6390e5b5e07b381dd9@epcas2p2.samsung.com>
        <20190430110032.25301-3-hch@lst.de>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 04/30/2019 01:00 PM, Christoph Hellwig wrote:
> Virtual addresses return from dma(m)_alloc_coherent are opaque in what
> backs then, and drivers must not poke into them.  Switch the driver
> to use the generic DMA API mmap helper to avoid these games.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
