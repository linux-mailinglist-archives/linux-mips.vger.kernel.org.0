Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEB7C5BE8AF
	for <lists+linux-mips@lfdr.de>; Tue, 20 Sep 2022 16:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbiITOWI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Sep 2022 10:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiITOVn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Sep 2022 10:21:43 -0400
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C4B32D99;
        Tue, 20 Sep 2022 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1663683582;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=uBeEJBLkFCYDy9tyewLPL9Ak1hbYgF4IFlXQI871aZg=;
    b=OIhS2SPPrQOaxBBKZlzAvm2uQhec6l0ChhCjctof+C3m5LKnTgxnlsnWEW0/KvKil5
    2wcFN0EDdZc7QfFcCGj15KSOZN6x4Y2THSLdE1EJWi70xRzJZjwfv8BJbOb2eTZA5nyN
    dAU9UTVuzk71b02C9jN4S/mDTJpXty3+ZSTTW1vpNA9CEr5SMgswshFseB/I+hHNU42X
    giAVExhRkcDXKWDubQJmfFNlsKJRznvgabjCuQi48x8NCFYm3UepBNx03zuytnxvkvP3
    327VmIdocnYBlsnqyIbbRv9T1jkrbwhwIJnHI70jcbt6Ae8EHCpgHsFW/vV45wXvYSyq
    ftPw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGZjzY="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 48.1.1 DYNA|AUTH)
    with ESMTPSA id x6434cy8KEJg1T1
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Tue, 20 Sep 2022 16:19:42 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: Usefulness of CONFIG_MACH_JZ47*
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <DBGIIR.8W0JWG83D6FE2@crapouillou.net>
Date:   Tue, 20 Sep 2022 16:19:41 +0200
Cc:     linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8F8B1125-40FA-464B-B662-F29C3F0AA5E2@goldelico.com>
References: <af10570000d7e103d70bbea590ce8df4f8902b67.1661330532.git.christophe.jaillet@wanadoo.fr>
 <UC07HR.REF39SO0Y5PG2@crapouillou.net>
 <CDEACE3D-5433-457B-AF77-E41F39A04CA4@goldelico.com>
 <H34IIR.IGTU7CQ36OZK3@crapouillou.net>
 <F21B5D44-94D8-4BDB-BB34-9CBFC5F2B891@goldelico.com>
 <DBGIIR.8W0JWG83D6FE2@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 20.09.2022 um 15:33 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
>=20
>=20
> Le mar., sept. 20 2022 at 14:31:38 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>> Hi Paul,
>>> Am 20.09.2022 um 11:09 schrieb Paul Cercueil <paul@crapouillou.net>:
>>> Hi Nikolaus,
>>> Le mar., sept. 20 2022 at 08:31:30 +0200, H. Nikolaus Schaller =
<hns@goldelico.com> a =C3=A9crit :
>>>> Hi Paul,
>>>> it seems as if there aren't many places left over where the =
MACH_JZ47* configs are still in use:
>>>> drivers/char/hw_ramdom/Kconfig
>>>> drivers/clk/ingenic/Kconfig
>>>> drivers/gpu/drm/ingenic/Kconfig
>>>> drivers/pinctrl/pinctrl-ingenic.c
>>>> Is it possible to get rid of them and just have =
CONFIG_MACH_INGENIC_GENERIC?
>>>> This might simplify my defconfig for multiple machines.
>>> CONFIG_MIPS_GENERIC_KERNEL=3Dy
>> This breaks compilation for me, e.g.
>> arch/mips/mm/cache.c:203:6: error: 'cpu_has_tx39_cache' undeclared =
(first use in this function)
>=20
> v6.0-rc does not have 'cpu_has_tx39_cache' anywhere in that file, or =
in arch/mips/ for that matter. It was removed in v5.18.
>=20
> And a v5.17 kernel compiles fine here with these options enabled. So =
it's a problem on your side, I guess.

Ah, you were right.

I have a patch included which was provided by zhouyanjie@wanyeetech.com
("MIPS: mm: Add Ingenic XBurst SoCs specific cache driver.").

It is intended to improve caching and is part of jz4780 SMP support =
which we wanted to have.
AFAIR it was either not posted to lkml or rejected or superseded.

>=20
>>> CONFIG_BOARD_INGENIC=3Dy
>> This config option does not exist (at least in v6.0-rc). Probably you =
refer to CONFIG_INGENIC_GENERIC_BOARD.
>=20
> No, I do not, and yes, it exists.

Ah, I grepped for CONFIG_BOARD_INGENIC but it exists only in one Kconfig =
as BOARD_INGENIC.
But what is then the difference to CONFIG_INGENIC_GENERIC_BOARD and =
CONFIG_MACH_INGENIC_GENERIC?

>=20
>> As far as I see, this does not choose to build any device tree blob.
>> I tried some patch to get the .dtb built, but the resulting kernel =
does not show any activity.
>> If I e.g. switch back from CONFIG_INGENIC_GENERIC_BOARD=3Dy to =
CONFIG_JZ4780_CI20=3Dy the kernel works.
>=20
> Because in the first case you build a generic kernel, which does not =
embed any .dtb, and you are responsible for providing the kernel with =
the blob at boot time; while if you build with CONFIG_JZ4780_CI20=3Dy it =
embeds the .dtb inside the kernel.
>=20
> You can embed the .dtb into the generic kernel at compile-time too, =
have a look at "Kernel type -> Kernel appended dtb support." Not sure =
why you'd want that for a generic kernel, though.

Ah, I remember. Since I usually code 99% of my time for ARM systems with =
separate .dtb files chosen by the boot loader, I forgot that we have to =
append the .dtb on the CI20 and Alpha400. So there is no good solution =
for a "universal" kernel binary either.

>=20
>>> Then you can support all Ingenic-based boards alongside other MIPS =
boards.
>> Yes, I know, but why are the MACH_JZ47* not replaced by =
CONFIG_MACH_INGENIC_GENERIC if they are almost unused or completely =
removed?
>=20
> They *are* used.

Well, only in a handful of places as it looks like.

>=20
>> BTW: there are also seems to be some board specific CONFIGs in =
processor specific code (e.g. CONFIG_JZ4780_CI20 in irqchip code).
>=20
> rgrep CI20 drivers/irqchip/
>=20
> returns nothing for me.

Ah, again an inofficial patch which is part of the SMP stuff ("irqchip: =
Ingenic: Add percpu IRQ support for X2000.").

>=20
>> So selecting a MACH is not sufficient to get these features.
>> All this looks a little fragile and incomplete... Maybe if I find =
some time (which is unfortunately quite unlikely) I can propose some =
fixes.
>=20
> It is not "fragile and incomplete", it works as intended, and it's a =
feature I use often.

Yes, seems as if you are right. We may have added too many useful =
patches which did not go upstreamand get in conflict with upstream =
features.

BR and thanks for helping to better understand,
Nikolaus

>=20
> -Paul
>=20

