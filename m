Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7A6320900
	for <lists+linux-mips@lfdr.de>; Sun, 21 Feb 2021 07:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhBUGyb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 21 Feb 2021 01:54:31 -0500
Received: from mout.gmx.net ([212.227.17.20]:34485 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229685AbhBUGya (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 21 Feb 2021 01:54:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1613890361;
        bh=LgwThxy8MMlowZ/SirLakbUxTacLUv1YTQ2H4UZTdDw=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=IRCZi7n0+S3zqf5rDlI3PPaOemSVKYdi00wqdw4IXnSSMBLs9TZpoiSfdd62dYOrU
         WZzt6uMVshylfzfPPJAjb8XVi7E9bRNl8qYFqSsM4cduUkgdySRbYeEiBn2ro6uMM9
         vAjljTmY+gzEPzbpJwRLBiU5HedgmTOeB2i83C98=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([87.94.110.98]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MLR1f-1lV6le0XeF-00ISST; Sun, 21
 Feb 2021 07:52:41 +0100
Date:   Sun, 21 Feb 2021 08:54:21 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Message-Id: <20210221085421.882c8f0b8b51f44272beb471@gmx.com>
In-Reply-To: <20210211102314.GD7985@alpha.franken.de>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
        <20210123124210.GB458363@infradead.org>
        <20210206192837.5ecec54cc5ac120ade1d5060@gmx.com>
        <20210211102314.GD7985@alpha.franken.de>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/pZRpuinlpMACajZrOCJ9JDhbAWry3u4QWsdFcitATR9AttRK1L
 XbUxxCdcVLWRrWnn9jaPrwSyMi6PtcgTPHLbR5qpCXKPLwppAQw1A55yKNHGn6ZiRdWLvRo
 sodsymfAiZb5OiK0ipXQYnwCr7WsEyfNW5xt+gYKwjyzV8lpqlOQeM5ZV79FPyEmTgAMra0
 PxFvh4edGUMP8gCv97dKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4YO572L1tIc=:iQNZXyAwgsjZhtZ7f113G2
 +MipF6D3P7MI94OmimShsLNQKUh1DRJU6f493fEAsKX0lKPXXbmghd6/XtlvBA1h3cXd1jE5r
 uwoTRy9Hlj33ehYCWowI64W+wtFiNKQ39HDelQfPQ4FNJRDNmqvIKZ20gVQOFVMg+wou3A3N+
 JLVUYnpsuyoZwVtZaNCS6zDU0IUalW+ecL2NB3RwpF3ehyKSeE/WFgTiJjjM6rK5KweggYQhk
 s0UAiO68VPWx+OPtv0VVdBaFNDwHMcrSwH3KDa7WGJ04+VtnFHlw4cEJKsvtIfrhwgaaFD8y4
 6l49UtEOj8Tei3NKg1Op87DqnbCeMwn8b54OJbkDlsNTf/36P/eAHn4gUm8bBy3DPHIO7L44/
 RgVawJV1Oketc9COyU+KFN3B9zjdlWWrfGN5RaL7W/H9nrAjtx71URGWepzX71fMxM8wkFgPU
 MXuRd+DUt6w1vWNEjGUr3Pdt0aZQHllDYWiL56jNFTaYJ5/IR2l6Ci+6kFRd/mCGLKD28V8O+
 ubmuLjVRcdRSBOBTyt0OvR6zj6rVdvA/OtqHSSePRjJE6UfTz0Xu9/2q7o90VahD3nSIWV6A3
 GbrFatjfGjW6z7P2mwOIOsZrBcyhqyqiyCeRK4JU9lU4qeEi3rd5r4UJZv2S74fBaC/3Tqi2b
 GYPxqYfr3quUgioNL3tz0QEQUdxJneAk58mSvapxO48UF92VYk5lnJvYHNgwT5V5Jo+tyBlXn
 9b9r1Fvd0S/PygELAEeeBGTY/MPAO5OaLbBA6TMezhma6VstArG9oVG73rXi9ebXTpeJA7Fn/
 57gpz90gy8qfynyvxvoV3KhTxEPBhzJYvMQb2jKhmPCD8EgJQzXM37HO6m4AMhgo9pGCb74N/
 n2lq7cHFV4po2qneMyKA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 11 Feb 2021 11:23:14 +0100
Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:

> On Sat, Feb 06, 2021 at 07:28:37PM +0200, Lauri Kasanen wrote:
> > On Sat, 23 Jan 2021 12:42:10 +0000
> > Christoph Hellwig <hch@infradead.org> wrote:
> >
> > > Looks good,
> > >
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> >
> > Hi,
> >
> > Ping on this patch. Thomas, do you want to pick it up?
>
> well that's up to the block maintainer. I'm open to take it
> trhough mips-next, but then I need an acked-by for it.

Hi,

Ping 2. Jens, I know you're busy, but just a mention this is on your
TODO list would be fine.

- Lauri
