Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2571E24E7
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:03:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729249AbgEZPDU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:03:20 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:42308 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgEZPDT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 11:03:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590505395; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rUNvo6a1eUCxuMC9mOrYSBNakrGxAp/g3yGZKbgRDN8=;
        b=vvqFZAO3/SuphX4XxeVPDhpnuSbls8QK+in2zw8wpmvtYYUj4r6b1Fc9Zgn3WEt0/vE4Dt
        cje6krW5qArQ+5v4u8Kw33OTKepmcJJDkeoZ42PR+jvMh9I2Hl0pnD12LrYJeAZIxeDSPK
        KgcwvK+C1Q6nJgD3kgsLDhGCzOlGF7g=
Date:   Tue, 26 May 2020 17:03:04 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: JZ4780 LCD controller initialisation (was Re: [PATCH]
 clocksource: Ingenic: Add high resolution timer support for SMP.)
To:     Paul Boddie <paul@boddie.org.uk>
Cc:     "H . Nikolaus Schaller" <hns@goldelico.com>,
        =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Message-Id: <4T1YAQ.877BANO14QDY2@crapouillou.net>
In-Reply-To: <2002785.O4FZc3DvTp@jeremy>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com>
        <RVFQAQ.7WL51YCH3VE1@crapouillou.net> <1902082.ZKqtjM8ATQ@jeremy>
        <2002785.O4FZc3DvTp@jeremy>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Le mar. 26 mai 2020 =E0 1:03, Paul Boddie <paul@boddie.org.uk> a =E9crit :
> On Friday 22. May 2020 21.16.10 Paul Boddie wrote:
>>  On Friday 22. May 2020 14.26.15 Paul Cercueil wrote:
>>  > Hi Paul,
>>  >
>>  > I think the ingenic-drm driver is fine, even though the old 3.8=20
>> kernel
>>  > worked differently, the IP is backwards-compatible so it should=20
>> work no
>>  > problem. I think the problem is somewhere in the Synopsis HDMI=20
>> code or
>>  > the glue code. Because the LCDC does seem to send data, which is=20
>> not
>>  > encoded properly by the HDMI chip.
>>=20
>>  There was one interesting insight related to vertical blank=20
>> interrupts,
>>  where it would appear that the end-of-frame condition does not=20
>> occur, with
>>  this failure then obstructing driver initialisation. I aim to look=20
>> into
>>  that further.
>=20
> Some further experiments indicate that interrupt generation is indeed=20
> a
> problem...
>=20
> [L4Re experimentation]
>=20
>>  So far, I have managed to reproduce EDID retrieval using the HDMI
>>  peripheral's own I2C support, and I plan to reproduce the HDMI=20
>> peripheral
>>  initialisation itself. However, it is perhaps more interesting to=20
>> get the
>>  LCD controller working first and potentially delivering end-of-frame
>>  interrupts: this might help me understand whether this problem is a=20
>> serious
>>  obstacle or not.
>=20
> First of all, I managed to get the HDMI connector hotplug detection=20
> working.
> This was a relatively simple matter of setting the appropriate flags,=20
> binding
> to an interrupt and then waiting for one to arrive. Consequently,=20
> booting
> without the connector inserted means that my program is halted until=20
> the
> interrupt arrives upon insertion; then, the EDID is read, which seems=20
> to work
> reliably.
>=20
> However, I then found that the LCD controller could not be activated.=20
> The
> solution to this involves the TVE clock on the JZ4780 which appears=20
> to be
> necessary in addition to the LCD clock. Ingenic documentation being=20
> what it
> is, I suspect that the LCD clock in the block diagram is really the=20
> pixel
> clock(s), with the TVE clock not even appearing in the diagram. The=20
> 3.18
> kernel's device tree for the JZ4780 plus the CGU code provide the=20
> necessary
> hints, without any explanation, of course.

"lcd0pixclk" and "tve" are for LCD0, "lcd1pixclk" and "lcd" are for=20
LCD1.

> With the LCD controller now willing to retain values stored in its=20
> registers,
> I have been attempting to set up descriptors and do the usual general
> configuration exercise that works on the JZ4720 and JZ4730. However,=20
> I have
> never enabled interrupts on those devices, so I don't know what I=20
> need to do
> other than to set the appropriate control and command (descriptor)=20
> flags.
> Doing so doesn't manage to generate any interrupts, though.
>=20
> The 3.18 kernel driver sets up the "new" 8-word descriptor and other=20
> new
> things. Initially, I ignored these things, but then I thought that=20
> they might
> actually be mandatory. Still, introducing practically the same=20
> details as seen
> in the 3.18 driver seems to have no effect. So, I imagine I am missing
> something pretty obvious: it took me a while to realise that I wasn't=20
> even
> enabling the LCD controller, after all.
>=20
> One thing I would point out is that the operation of the JZ4780 is=20
> not exactly
> the same as earlier products. For example, various configuration=20
> register bits
> related to pixel depths are now read-only. Presumably, the idea is to=20
> set the
> pixel depth in the "new" descriptor fields instead, enabling some=20
> kind of
> mixing of different kinds of pixel data. I also wonder how well=20
> supported some
> of the older functions are in the newer hardware.

OK, indeed the BPP and OSD config is read-only, and it's not a doc=20
typo. How annoying.

I tried to configure the LCD controller for a 8-byte descriptor without=20
much success. No IRQs here either.

-Paul

> Anyway, I'm rather stuck with this at the moment. I don't know=20
> whether I
> should be reproducing the HDMI initialisation in my test environment=20
> under the
> assumption that the LCD controller isn't sending data without some=20
> kind of
> output path, or whether I should fake up some other output path=20
> (maybe a
> serial LCD) by setting GPIO alternate pin functions. But it turns out=20
> not to
> be entirely trivial to just have the LCD controller do its own thing=20
> and
> generate these interrupts all by itself.
>=20
> But again, I may well be overlooking an obvious mistake of my own.
>=20
> Paul


