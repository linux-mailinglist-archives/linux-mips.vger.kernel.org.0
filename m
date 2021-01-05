Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26EC2EA5AC
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 08:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbhAEHBd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 02:01:33 -0500
Received: from mout.gmx.net ([212.227.17.22]:40137 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbhAEHBc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 5 Jan 2021 02:01:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609829997;
        bh=BPnPe4Xll1uvRlaWEs88SZYy7WbKRg5xwcLUjIzP8jM=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Q3NYKz1t9Gz1s+hyCUfSMKmcCuspkx5xGmQil7brAr/5ULZjUnvW4w7eLE5iBwS78
         Lq8FHT+dOtSQGGMtIHj7pGIbfMXDrTouiXb6/aENzYyT6x9Rj2D7fk5hSuY3zE8hW2
         6LaZ1N+o4Jk/967kYkzvdnnKyhgxe3xE5uShDorU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MD9T7-1koBzh2vYH-0097bl; Tue, 05
 Jan 2021 07:59:56 +0100
Date:   Tue, 5 Jan 2021 09:01:34 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Keith Busch <kbusch@kernel.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org
Subject: Re: [PATCH 6/6 v2] block: Add n64 cart driver
Message-Id: <20210105090134.3d6b99dc7de924e9d4c86d4a@gmx.com>
In-Reply-To: <20210104183712.GD1024941@dhcp-10-100-145-180.wdc.com>
References: <20210104195611.61997e86092b3559c95f36fc@gmx.com>
        <20210104183712.GD1024941@dhcp-10-100-145-180.wdc.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LjmlZYjSro5h8832hcJ1bH2LKru8DfZhzZl36V3F0j9hQtkaMXb
 d8/hSiXQphlJ6Bon6FaWym9cZ/tzxsdwKsT+CspwgBg9zmbZesupnj/WPzv7cykGVBj4dGT
 XrGZBmDlY6V1wvmJnjOy1pwQpUKdjGVMUCiZmGd00iBH0UXAsKCzkTVM5M7YvxQAzMrTyCX
 tLa1gZQXAw0iC9Wsha1rA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Xq5b4z60SI=:KIMPSt3N9kEvqEoAMGGAvE
 x4N+W2HKGiziE7NA3mLBq7T9O5JeI/g8r2l+ZIT5jyi8m1vjR3fgyUIuML684s9JBnRXKD1S2
 tW/Hd0SMg4jQss7XeS6//Cy9jG9JHFLqhmgEZPdICkHJ+4cp3GBBM4QXqWBIn1PestNuHPLSo
 FQ2ZOSc7gzqB7dwwraNMWSSkRU+zRWLQVKAuTrc2R/i6PH0YHBOe+9jl9zqMhNbZO3Zx4vsWT
 MrHeNExrJhHop3RUtOQv90PWKETkSI04KZ6EZ8rzLv1rIhyzQXC4xpl/uVYFj2DwCQjcY4tcE
 9xIRTWPAsAYQNgBO93KwQd1eB6fk42YixSQxqsqcKNPja4dXJb3eWFo8e1ZpTGBr9ahYMvuZ9
 krL0wI8tUXBOSzU/dCPSKQOVyvuK92Hp2qI4jReJRki3mvWAuL3G5NBkO4sSaEfP4vxN9O6W2
 W7mrR23O/f4UuIMMvvtA8PCni9xhTkwH0BMrJ7HzddX3JaBBbAvZ/p6Jar4crLWhF06Zn07Qc
 /sE8FBZS5jFz3kgTLG5b/2b8JwC3Zbvm3w1ytxtZgbr0jt5XLRWf5m1Y3EYq1WVMp4dmA5QXa
 MmvoE2rutzCi5cjtVxZEt64TBcg2oObdVjwdlxCsTbfeILJwDCRYlRkkyP78bL5m7zb3KKdQM
 wLCgJsjHF/AsWhrUYuLVReMqVOA0CEpevZxnTM1iN3N5LnYRniQRv4xFkjLsdRCfKDsR0U4kr
 1RULR71yAkSVxGDoo4pXJk9rIwCzvJL1Kw6VklBWo/fxUdiaJl5JqpDFtxP5getxkmjV2D+2q
 +58iOIOOh69R1fi4C3SpLRvyrK5L+nQFx4KW/TihQkzGwuzlNJY/M2yp/e5FwHHLQVpccHmTy
 qJa77s7MFf5WISX0UjXA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 4 Jan 2021 10:37:12 -0800
Keith Busch <kbusch@kernel.org> wrote:

> On Mon, Jan 04, 2021 at 07:56:11PM +0200, Lauri Kasanen wrote:
> > +static blk_status_t get_seg(struct request *req)
> > +{
> > +	u32 bstart =3D blk_rq_pos(req) * 512;
> > +	u32 len =3D blk_rq_cur_bytes(req);
> > +	void *dst =3D bio_data(req->bio);
...
> > +		memcpy(dst, buf, curlen);
>
> Is there a reason for using a bounce buffer rather than reading directly
> into the destination?

DMA alignment restrictions, I wasn't sure what guarantees the bio data
buffers have. Or even if they are guaranteed to be X-aligned virtually,
whether it holds physically.

- Lauri
