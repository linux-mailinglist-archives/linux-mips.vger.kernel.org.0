Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708671E1A7C
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 06:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgEZEu1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 00:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgEZEu1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 00:50:27 -0400
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5300::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A96C061A0E
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2020 21:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1590468623;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=VyspLebKaUtg7P5CKT+Ymy0onDzOdkUyeOEk1nGK9zE=;
        b=o5kV+vtxTVLYmwYcFhWxa4Uphln0q4EmZRvI/a8xaBptP5gDU0119SlziPlguCIsiU
        4K8CUPDzT5+sE+CHNRjKVDG+QAbbmj1A//pDuTVyxnBKrThvLkXgdSdE95vTQTvmU0mW
        /6xscyOFH2xCnHsHcVY7WyHMMb2xlDbEeem+RQi1NMx9AJeoeRie271LB99Jko0bPRJn
        H3TdDKcotodMjmkBq/aU54RTOlGOcrjxryk9uTy1ylZE4TZ/N1Xhe/8HzaN5RHcAyXZs
        L5QkkXZzso4tpR6YuiChQbcUFKWrGwE7s4NiJIzUzcdak5W7mIiBicD0HhuKy5hVgf2x
        N/8g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAuw47vUig="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.7.0 DYNA|AUTH)
        with ESMTPSA id D0a7c0w4Q4mGO6M
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 26 May 2020 06:48:16 +0200 (CEST)
Subject: Re: JZ4780 LCD controller initialisation (was Re: [PATCH] clocksource: Ingenic: Add high resolution timer support for SMP.)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <2002785.O4FZc3DvTp@jeremy>
Date:   Tue, 26 May 2020 06:48:15 +0200
Cc:     Paul Cercueil <paul@crapouillou.net>,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-mips <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9708AFDC-D53D-4173-A334-72A51823D8FC@goldelico.com>
References: <1589898923-60048-5-git-send-email-zhouyanjie@wanyeetech.com> <RVFQAQ.7WL51YCH3VE1@crapouillou.net> <1902082.ZKqtjM8ATQ@jeremy> <2002785.O4FZc3DvTp@jeremy>
To:     Paul Boddie <paul@boddie.org.uk>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 26.05.2020 um 01:03 schrieb Paul Boddie <paul@boddie.org.uk>:
>=20
> On Friday 22. May 2020 21.16.10 Paul Boddie wrote:
>> On Friday 22. May 2020 14.26.15 Paul Cercueil wrote:
>>> Hi Paul,
>>>=20
>>> I think the ingenic-drm driver is fine, even though the old 3.8 =
kernel
>>> worked differently, the IP is backwards-compatible so it should work =
no
>>> problem. I think the problem is somewhere in the Synopsis HDMI code =
or
>>> the glue code. Because the LCDC does seem to send data, which is not
>>> encoded properly by the HDMI chip.
>>=20
>> There was one interesting insight related to vertical blank =
interrupts,
>> where it would appear that the end-of-frame condition does not occur, =
with
>> this failure then obstructing driver initialisation. I aim to look =
into
>> that further.
>=20
> Some further experiments indicate that interrupt generation is indeed =
a=20
> problem...
>=20
> [L4Re experimentation]
>=20
>> So far, I have managed to reproduce EDID retrieval using the HDMI
>> peripheral's own I2C support, and I plan to reproduce the HDMI =
peripheral
>> initialisation itself. However, it is perhaps more interesting to get =
the
>> LCD controller working first and potentially delivering end-of-frame
>> interrupts: this might help me understand whether this problem is a =
serious
>> obstacle or not.
>=20
> First of all, I managed to get the HDMI connector hotplug detection =
working.=20
> This was a relatively simple matter of setting the appropriate flags, =
binding=20
> to an interrupt and then waiting for one to arrive. Consequently, =
booting=20
> without the connector inserted means that my program is halted until =
the=20
> interrupt arrives upon insertion; then, the EDID is read, which seems =
to work=20
> reliably.

Well, with Linux my hack to set dev->mode_config.poll_enabled =3D true;
in drm_probe_helper.c seems to make it works in all cases without =
halting.

And what I observed is that interrupts are generated and arriving. They =
are
just not properly delivered because dev->mode_config.poll_enabled =3D =
false
has some wrong side-effect.

So I think there must be a simpler solution (for Linux).

>=20
> However, I then found that the LCD controller could not be activated.

In my tests the code to setup the LCDC was never called so I could never
debug anything there.

I still have to digest the mail "DRM interaction problems on Ingenic =
CI20 / jz4780 with dw-hdmi and ingenic-drm"
from Paul.

> The=20
> solution to this involves the TVE clock on the JZ4780 which appears to =
be=20
> necessary in addition to the LCD clock. Ingenic documentation being =
what it=20
> is, I suspect that the LCD clock in the block diagram is really the =
pixel=20
> clock(s), with the TVE clock not even appearing in the diagram. The =
3.18=20
> kernel's device tree for the JZ4780 plus the CGU code provide the =
necessary=20
> hints, without any explanation, of course.
>=20
> With the LCD controller now willing to retain values stored in its =
registers,=20
> I have been attempting to set up descriptors and do the usual general=20=

> configuration exercise that works on the JZ4720 and JZ4730. However, I =
have=20
> never enabled interrupts on those devices, so I don't know what I need =
to do=20
> other than to set the appropriate control and command (descriptor) =
flags.=20
> Doing so doesn't manage to generate any interrupts, though.
>=20
> The 3.18 kernel driver sets up the "new" 8-word descriptor and other =
new=20
> things. Initially, I ignored these things, but then I thought that =
they might=20
> actually be mandatory. Still, introducing practically the same details =
as seen=20
> in the 3.18 driver seems to have no effect. So, I imagine I am missing=20=

> something pretty obvious: it took me a while to realise that I wasn't =
even=20
> enabling the LCD controller, after all.
>=20
> One thing I would point out is that the operation of the JZ4780 is not =
exactly=20
> the same as earlier products. For example, various configuration =
register bits=20
> related to pixel depths are now read-only.

And what I observed is that there are additional registers compared to a
JZ4740 LCDC. My assumption would be that leaving them 0x00 would be ok.

> Presumably, the idea is to set the=20
> pixel depth in the "new" descriptor fields instead, enabling some kind =
of=20
> mixing of different kinds of pixel data. I also wonder how well =
supported some=20
> of the older functions are in the newer hardware.
>=20
> Anyway, I'm rather stuck with this at the moment. I don't know whether =
I=20
> should be reproducing the HDMI initialisation in my test environment =
under the=20
> assumption that the LCD controller isn't sending data without some =
kind of=20
> output path, or whether I should fake up some other output path (maybe =
a=20
> serial LCD) by setting GPIO alternate pin functions. But it turns out =
not to=20
> be entirely trivial to just have the LCD controller do its own thing =
and=20
> generate these interrupts all by itself.
>=20
> But again, I may well be overlooking an obvious mistake of my own.
>=20
> Paul

BR,
Nikolaus

