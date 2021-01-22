Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4BDD300942
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 18:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729307AbhAVRIA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 12:08:00 -0500
Received: from mout.gmx.net ([212.227.15.15]:35695 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729702AbhAVRGp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 12:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1611335099;
        bh=i8AlmvmcFI/Qxol88A5rstmImds1ILCafn76AKz1rmk=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
        b=iPdz6ZBLx1aaFHlruqxbx4cmxhs/pncvAV2mbVg93qH3XR/hft7NphQNN67HZ/4Mz
         lr/xa/AZOixzcEHzM9cOafB1Gvc9sONcqV8+dNydZrnJFG811lQHek6eKVAtSIeAdE
         b1YmYSWXHHPwi+wM53w7UcunDjmSrzwNGOq2vY10=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MQMuR-1lOnok1IXJ-00MIyE; Fri, 22
 Jan 2021 17:54:39 +0100
Date:   Fri, 22 Jan 2021 18:56:19 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v9] block: Add n64 cart driver
Message-Id: <20210122185619.980fa4f713b8f57528c3af9e@gmx.com>
In-Reply-To: <20210122163913.GA227449@infradead.org>
References: <20210122110043.f36cd22df1233754753518c1@gmx.com>
        <20210122111727.GA161970@infradead.org>
        <20210122155801.a24c328b7aefdcffb7d68576@gmx.com>
        <20210122161804.GA225607@infradead.org>
        <20210122182349.c98d8599f7593afefa43c9dd@gmx.com>
        <20210122163913.GA227449@infradead.org>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bofvDUa1+ADtnwXPN2gUPtk9nO6HaejYTkDzW1g61mubgB3ZES6
 Bx+4qEwjvSy+lzUwU7SkI+i2DKXsOdFD2Kv2ZiCNMny8jqQYkMz/0/a1HtASHvebbfy1T8F
 jV02A6oHiF+fOtj6VgCy68pSY05z1NDHThixga5on9ttAhzfhzq4NFr6qXwD4BNogIWbrDe
 nhC5CLX2y9Y9dwClhRaRw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RevUbB9Rk7s=:tci408hxeQHFdyODg61svc
 TS1NrNTh7pz5NTzHGOhQhbdiNQi8yN7W8RDkJ0fU4aDdY5DjMSTTxQAM6Qn9o92yc/9yilrdv
 58o3WF3Bi4+IcP2tzQrExWr2tp3Kl2WFtWAqsYin2qUrktAlniVBnY/0fMl/1H9P809b4uU7z
 hT9Nup7LRraRIBXCLcA8uySB69T/EdmP1GjbnJiXbuUC5EfwQBrqTCWCH5zrN7cR+vCfecvK1
 O0yQSne0pCy6wfnb4U+xI9SmQyNRgWflg36OsIgqcmCA3n5WPosn6v+wRXNSWJoB6E/86x2kS
 qw+9njuj05tO46trCtxJg+EC73OfDILhnvDEV/B4jeTcyA0zFnDxAcFlUVOlUc8iUV040Wvpj
 YCFRrVLN5q7onkNqHJv875SltqYO8zAU6k5SNaPwwOfhW1xCvjLedqwSRTLottQQ7aG4QQzYy
 pJAAzKHOXWd2U5SLBRxjCn8NMLJRKTMARxl0d4Tbz2XUKrkjJ5Y2VVHZTUaaSIMBzanx3AVJR
 mgivyBe1Zj3KxG4WzO9LQnznvAV/RS+d6fSm21T/wUypUXhOZyr1IYyRcql4l0KOIlbsQU4Id
 IhSqwuBo7JRaFeHe/uf1NQj+FQCWF0z809zjKy69Hr2tvSG5GaethtE9ld5MnizTPrI2CdPlD
 Hw7oTd05TQ3QLOvyIqqeMmSuDt9knc4hi8MPpiiwuq9wz9BrwUtDFp1iVWqJvQecdFIQ8e2wp
 gOZI+iXDpOyjmWxa1MviMxrD5sZO4iTwBCAecUsO4iwVU7zDj5gS5nnuOMFgnYm+vaTp3eNY9
 lreA/dv4kf4+dyjDkZ1GtBsK+i1AiOklTn4rvnsyZ4vjOflp8szgd+R4gXXGSmc5lnyx7B4TM
 I/6pgWdPCDgIMLpUo3Uw==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 22 Jan 2021 16:39:13 +0000
Christoph Hellwig <hch@infradead.org> wrote:

> On Fri, Jan 22, 2021 at 06:23:49PM +0200, Lauri Kasanen wrote:
> > > Your driver can communicate the required alignment using the
> > > blk_queue_update_dma_alignment API.
> >
> > Is it guaranteed to be physically contiguous?
>
> The alignment requirement applies to each bio_vec.
>
> What alignment does the hardware require?

It requires 8-byte alignment, but the buffer must also be physically
contiguous.

I grepped around, but apparently no driver under drivers/block does
direct DMA to the bio buffer. They all use their own buffer and memcpy,
like this patch. ps3vram, ps3disk, amiflop, etc etc.

If all existing drivers use their own buffer, why is a different
approach required for new drivers?

- Lauri
