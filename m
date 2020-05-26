Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09A1F1E3371
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 01:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404605AbgEZXHy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 19:07:54 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:49502 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404604AbgEZXHy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 19:07:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590534471; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DsVrgiSXVHSzcvOifzmpRU8SGUElZ845kNp1oYzac54=;
        b=waIeLlm7GWkzc/Ypg2pPybTh7rbuWaiu9k0ShTLJYs0DneDUZoCN2vbhefLwwrF3nKAP7m
        +TPNRwfcr4YIaGbmd9SRSB4+z2UBo2rytPBkXzIswGereTE8ENpDyFREfqOzcsz9HXiRvY
        fBfcCG/5rmZMLe5UOvKbn+FDDJQ+zvM=
Date:   Wed, 27 May 2020 01:07:41 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: JZ4780 LCD controller initialisation (was Re: [PATCH]
 clocksource: Ingenic: Add high resolution timer support for SMP.)
To:     Paul Boddie <paul@boddie.org.uk>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Message-Id: <T8OYAQ.3TE69K2DB79Z2@crapouillou.net>
In-Reply-To: <6095840.Tg7rQzGjE8@jeremy>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com>
        <2002785.O4FZc3DvTp@jeremy> <4T1YAQ.877BANO14QDY2@crapouillou.net>
        <6095840.Tg7rQzGjE8@jeremy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le mer. 27 mai 2020 =E0 0:44, Paul Boddie <paul@boddie.org.uk> a =E9crit :
> Paul,
>=20
> Thanks for the reply!
>=20
> On Tuesday 26. May 2020 17.03.04 Paul Cercueil wrote:
>>=20
>>  "lcd0pixclk" and "tve" are for LCD0, "lcd1pixclk" and "lcd" are for
>>  LCD1.
>=20
> The 3.0.8 kernel actually uses LCD0 for what the documentation and=20
> 3.18 kernel
> call TVE, and it uses LCD1 for what the others call LCD. That earlier=20
> kernel
> indicates that LCD1 is the parent clock of LCD0.
>=20
> I actually found that you can enable LCD0 and not LCD1 and the LCD=20
> controller
> (LCDC0) still operates to an extent, but without LCD1 enabled I=20
> didn't see a
> DMA command value in the appropriate register, discussed below.

Yes, I was preparing a patch for the clock driver, then I noticed that=20
too.

> [...]
>=20
>>  OK, indeed the BPP and OSD config is read-only, and it's not a doc
>>  typo. How annoying.
>>=20
>>  I tried to configure the LCD controller for a 8-byte descriptor=20
>> without
>>  much success. No IRQs here either.
>=20
> I had a look at the interrupt controller registers to see whether I=20
> was
> missing anything obvious, but the mask was correctly configured to=20
> unmask LCD
> interrupts (bit 31 of ICMR0). I did wonder whether the PDMA=20
> interrupts might
> need unmasking, just in case there is some interaction between the=20
> peripherals
> and that part of the hardware, but unmasking LCD interrupts there=20
> (bit 31 of
> DMR0) didn't make any difference.
>=20
> One observation I can make is that the length or size field of the=20
> LCD command
> register (LCDCMD0) does get initialised to the appropriate value as=20
> set in a
> descriptor. Since I don't set this register explicitly myself=20
> (unlike, I
> think, the current Ingenic DRM driver in the Linux kernel), the value=20
> must
> have been set up appropriately by a DMA transfer, as configured using=20
> the
> descriptor address register (LCDDA0). However, the command flags I=20
> also set in
> the descriptor are not reflected in the register. So, 0x44140000=20
> becomes
> 0x00140000.
>=20
> I thought I should check the interrupt ID register (LCDIID) to see=20
> what it
> reveals. Despite setting a value in the appropriate descriptor field,=20
> the
> register contains only zero.
>=20
> I think I must probably tackle the job of initialising the HDMI=20
> controller to
> see if that makes a difference. If the interrupts are not working but=20
> are also
> not necessary, then maybe I get a visual indication of success.

Don't focus too much on interrupts right now. You don't get interrupts=20
because the data is not flowing. Which in turns is caused either by the=20
LCDC not being correctly configured, or the HDMI not sending=20
hsync/vsync signals.

For now, what seems to be the problem is that the DMA descriptors=20
aren't loaded properly. Whatever I do, the debug registers=20
(LCDSAx/LCDIDx/etc) are still zero here.

-Paul


