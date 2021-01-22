Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80520300890
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 17:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729659AbhAVQYB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 11:24:01 -0500
Received: from mout.gmx.net ([212.227.17.22]:45595 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729537AbhAVQXw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 11:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611332528;
        bh=lbnYttpj+YUm8T3fBuMlC79HLcSf+F23Lqz5zKczuYY=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=H0kOluBzxSnGtUpCeOQyVgX9gk58AlxqNljBxKC63gddOZoknW5GhjwYtaa2fJ9QB
         WS5sJ7fmTpMMX1Z0XTG/uH/kSnGUMXH5khPR1GPrFf2WjHZNpnOzWxIvAYyq6U2S1W
         FaRPiXHEmxAWhBGT6zGGyjr2KhSpzsihBqKMhnDo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1M9Fnj-1l8C7r0OqV-006S10; Fri, 22
 Jan 2021 17:22:08 +0100
Date:   Fri, 22 Jan 2021 18:23:49 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-Id: <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
In-Reply-To: <20210122161804.GA225607@infradead.org>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
        <20210122111727.GA161970@infradead.org>
        <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
        <20210122161804.GA225607@infradead.org>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:U9UQnIrcta7Htyf+cZSfVw8nK5hmI9jZ0T7e105zWF5NPaz0rLy
 ADAOQ08jG/OR7LsChWM5fbKOD3pQc1awSeNU9/kPd9Z5jDhIm3zwDcMd7ULkcbtWqm44GKg
 trqcnVaLlNioJi0n5siA/XRUQaiW3mpFK1vSiavQQoYIlTy+Lqo8kUJvYtSfbUkobp1Tbil
 aM7L7dmpUA+8rzMc8eioQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lkvODuARat8=:WBJ8zUIXvZLSq+zHxXY6wJ
 curIYW+synA9ssrbspj/0KnquC5/vnywd4nnnFQICSW5q7dXGtqGjW7281o3Pcwj9/P3a4l3p
 ktuyG+BU8gmlyl/Z6IUZYUUgu9kNjWdDzJRduDYdZenKd+fV6ft7zmjJeOGTFax7l9K0dcwdT
 GQ/zGIhQl+MvpBcUc80SQth9XhZGvctdk7Y+cmYh+HyDnyPZyEzYGTAYypYOe4h35Esj6hvra
 NnWx3WbbzrhybvFrAe4cxVG8bxePhNENWxKgZXdBYYiynOiRvmg7MHwkBkbKmOJj9JrXav9OB
 eZWUblNw6qHZgaso24WIGP9vdezHe+apgz9Co++0tSZvZN6DWytorV9Ioi44BSNbWvdyhAyQL
 hl6z+S3UwQbXoyi4/VcFrb2Y0meNce0+7EcbYXI9oi4aaPeluhnaJ1KJw64T7ya20+Tx9pfiU
 U8BuRBSYvrAcCu1vQKQOzdlkzuduGWzTRzgnMxzomiHnjcxJRseUN2fprhEz76SDMKnwNKODA
 3eHKixXW4ynyRPzxFyZ546n+vRhZL+9zpUItapFbRxnqn6yC1RtuZ0PIspP5teruTwRcNZhyK
 xYMtmWUBHHNdjVp8dLdi5CwuLdsvXh8GfG4XLInwKuHTOVgfpDaU3HuMk+a1MnDUTmThO3Dfz
 RpLDaDX/ajxKN77UVmD6NOUto8sdlDnRRcwFsilKB/2ahnj2kFsq+1ydrPw/iA3aJvodAZC1M
 aIElvza2k1Gpnx72ORR8nT8+mjVlNxHoBXL7rasG9xV9h6+QsdFd88qemEaJGifmqrTmwfYeO
 sjrXFyw0xlEo0e+ftnLatiu8nYJgYEpFtQJ4Z9f61kcQSKiGBUNncjwDEkBWkt9MlFkHpFbCB
 BsOlWo2EyK/FXCoGVphQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 22 Jan 2021 16:18:04 +0000
Christoph Hellwig <hch@infradead.org> wrote:

> On Fri, Jan 22, 2021 at 03:58:01PM +0200, Lauri Kasanen wrote:
> > On Fri, 22 Jan 2021 11:17:27 +0000
> > Christoph Hellwig <hch@infradead.org> wrote:
> >
> > > Sorry for not noticing this earlier, but why do you need the bounce
> > > buffer vs just mapping the data buffer?
> >
> > I think I've answered this once already a few iterations before. DMA
> > alignment restrictions, not sure what guarantees the bio buffer has.
>
> Your driver can communicate the required alignment using the
> blk_queue_update_dma_alignment API.

Is it guaranteed to be physically contiguous?

- Lauri
