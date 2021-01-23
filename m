Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6E4E3013CA
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 08:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbhAWHsF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 02:48:05 -0500
Received: from mout.gmx.net ([212.227.17.20]:55115 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbhAWHsE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 02:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611387979;
        bh=jQ9BUg29CDYqnqP5Wx5tkG2n/OoXSri5DdNd3wn/M9c=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=lWd+xgdkwA/wkQh+D3gKPpUlnU1GNEaD8kYkwjDeHUfFKpv3PUxqhQ6sTS67GhgTS
         X9so1KKr/KD9UpwfCpsIrs4Ce4231IamHUjLip7yz7Yux/e57GMmG4Dpr+Qc0gwldb
         2nj/c5SPBXvj4TIz10KbdDmNFlZ33bkn7vYNQCJk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MY6Cb-1lWazH3Gov-00YP2d; Sat, 23
 Jan 2021 08:46:18 +0100
Date:   Sat, 23 Jan 2021 09:47:55 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v10] block: Add n64 cart driver
Message-Id: <20210123094755.fb8b625955554e5c37e436fc@gmx.com>
In-Reply-To: <20210122193824.GA271343@infradead.org>
References: <20210122213346.774020bb9393ebded17e7412@gmx.com>
        <20210122193824.GA271343@infradead.org>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vy/o55XKXWOWpjhXWDvSLJDV8X4NLXogbtQyxHqd0mUviXFKt1/
 W6EkgQjW87L8/z8yzbzT9Wf1D8aHHRY6eNbmXZPcbXniqMX45gUPaO7hRgkG8q9XgM2rPgn
 PKDEW5tfaBaXH/iiKxBdCYCiSOzyE84URaGiJ6ehvLsETvjOQ97jn+jZ+uXEqar2aUJONNK
 //i6yxmS3sErjGoHCBsLA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lU7ZRZeyl98=:MGOoCc8RQCtdKDEdlcwIOD
 03HdrEBCnEZyIRCI5VuP0BJFfrDWygRg1OHeJbrgWVLVFqoWe2XQsnDXAyCT1mXmNY5IpgyJ4
 Kj/W4kpzzXOUErVe+5mfPtZb3pm3Rn8RlwOT0+WuYGhhepTRf8TReko9i0WG0NWSW/fTOSoGK
 Gdr7wWwtPrXwQ2CTRLxmCtlVMoVzD4gK+dbx+CTyaog1Er5D9+JhpPZTzJBtwTU28aXeRQwu9
 nxfQccBgcmBBSyoNtTHpy8sgFDsGn7YYvco2vjtnTlEy0BapYeJxvY3QQKHrLYl08NKA2lGX9
 LyIORkfvc7Q3cW8Lz+7o7lv4ORQtG2V2nszsHMN90euWLStFkM2ERX5FE10l9Si4aqZfPbOoM
 wvSzH7qmKuyfbg7zKX93YXpY5bOFsw4Gt3ci7EtQ52rmUxCTmCasLpSwoSeP8gwZSt92wKCrG
 krJklcQZuNdCy10ufqrXll1eeTes7KThPDtxlxjJK2gdztmAibeik44y+4BkQy9uaJqRmfkqH
 81RDOaQ5pLWC/cs5XSivO6J/jLShu+FdL4n0KNrc/cdLEKwC1EMYtD/8Wf8kCZmNdctdX5SWp
 T6J0LSjxgdC9WMQCx3jKjse8Ded8bHBzVfD7wRASeS8owqoB64yx1wRmamA3muTmf9e7OvcBI
 +37636uivkLN2ZSliniJrAdclY88yLeSYFQ8Dd6nTt14kHpuhRAF3AGbD+gnGAWzzXnJTYwoE
 PZI+XJX7tnAOuT86F3oDs694hNC8iVabf7UeZDa9oXCm7UbDYp7cgJrfUJ94WJTQcfQfooDcK
 OMlmQSVRtxLJ8GL4+nXD9vwqoprrcwiIAyCRHSFagtEBayiJwc2AEnvpHej1csqFmGi9TcJfD
 q7ellznKuuGRFClCLT3A==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 22 Jan 2021 19:38:24 +0000
Christoph Hellwig <hch@infradead.org> wrote:

> > +	bio_for_each_segment(bvec, bio, iter) {
> > +		unsigned int len =3D bvec.bv_len;
> > +		int err;
> > +
> > +		/* Alignment check */
> > +		WARN_ON_ONCE((bvec.bv_offset & (MIN_ALIGNMENT - 1)) ||
> > +				(len & (MIN_ALIGNMENT - 1)));
> > +
> > +		err =3D n64cart_do_bvec(dev, &bvec, len,
> > +				      bvec.bv_offset, pos);
> > +		if (err)
> > +			goto io_error;
> > +		pos +=3D len;
>
> Nit: I'd just pass the bvec to n64cart_do_bvec, calculate pos there
> locally each time, and also move the WARN_ON_ONCE into the helper.

I don't think calculating pos there would work? It doesn't know how
many bio segments were processed and what lengths they were.

- Lauri
