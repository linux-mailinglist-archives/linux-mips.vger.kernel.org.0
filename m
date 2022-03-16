Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1574A4DB591
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 17:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344433AbiCPQEx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 12:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbiCPQEw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 12:04:52 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 965275883E
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1647446616; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=N2D2+ldc332SYM4j1aOuDluvDaE2My/euUq8SoF/9R8=;
        b=b8wVKIJsJet4BhlOErwI3FrAzbsOHmBg+v3UMskqKIwEy6dymL3nu1fFgSPbBpide+0bfh
        g0ljy/w0duXHt5ixBvpsCFPcQ22CRE6U5rcK/vIGL5o1naPkVElBBtWfIRGwfmZbfCDstr
        kWxEbMOzVZy7fu4k4jHmMBDb+kVkri8=
Date:   Wed, 16 Mar 2022 16:03:27 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Garbage-collect code paths for SoCs
 disabled by config
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@opendingux.net,
        BROADCOM NVRAM DRIVER <linux-mips@vger.kernel.org>
Message-Id: <RXHU8R.MCIBF6I07ISV@crapouillou.net>
In-Reply-To: <CAHp75Vca-Fnm3ddeB9=Nh6-B+CKwSruBykgt9M=s6hi=go5Zdw@mail.gmail.com>
References: <20220315173922.153389-1-paul@crapouillou.net>
        <CAHp75Vfas=H7Vb+mJor-LWckUpE8QUdD8Yauq4mdG4OY+7dfMg@mail.gmail.com>
        <L8FU8R.CQQY3F5UYD5O@crapouillou.net>
        <CAHp75Vca-Fnm3ddeB9=Nh6-B+CKwSruBykgt9M=s6hi=go5Zdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer., mars 16 2022 at 17:37:37 +0200, Andy Shevchenko=20
<andy.shevchenko@gmail.com> a =E9crit :
> On Wed, Mar 16, 2022 at 5:05 PM Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>  Le mer., mars 16 2022 at 16:47:24 +0200, Andy Shevchenko
>>  <andy.shevchenko@gmail.com> a =E9crit :
>>  > On Wed, Mar 16, 2022 at 4:11 AM Paul Cercueil=20
>> <paul@crapouillou.net>
>>  > wrote:
>=20
> ...
>=20
>>  >>  +static const u32 enabled_socs =3D
>>  >
>>  > If you make it unsigned long, it would be easier to switch to=20
>> bitmap
>>  > APIs if needed in the future.
>>=20
>>  Sure, I can make it a unsigned long. But we'd need a lot more=20
>> entries
>>  to justify a switch to bitmap APIs...
>=20
> It was given below, i.e. using test_bit().

Again, I am not checking a bit, but a mask.

>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4730) << ID_JZ4730 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4740) << ID_JZ4740 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4725B) << ID_JZ4725B |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4750) << ID_JZ4750 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4755) << ID_JZ4755 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4760) << ID_JZ4760 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4770) << ID_JZ4770 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4775) << ID_JZ4775 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_JZ4780) << ID_JZ4780 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_X1000) << ID_X1000 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_X1500) << ID_X1500 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
>>  >>  +       IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
>=20
> ...
>=20
>>  >>  +is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum
>>  >> jz_version version)
>>  >>  +{
>>  >>  +       return (enabled_socs >> version) &&
>>  >>  +               (!(enabled_socs & GENMASK((unsigned int)version=20
>> -
>>  >> 1, 0))
>>  >
>>  > Why casting? Why not use BIT()?
>>=20
>>  Casting just to be explicit about what we're doing here - I don't=20
>> like
>>  doing arithmetic on enums. But I can certainly remove it.
>>=20
>>  > But these two lines seem like a very interesting way to reinvent=20
>> the
>>  > test_bit().
>>=20
>>  I don't use BIT() or test_bit() because I am not checking a bit,=20
>> but a
>>  mask:
>>  - (enabled_socs >> version) checks that the config supports either
>>  (version) or anything above;
>>  - !(enabled_socs & GENMASK(version - 1, 0)) checks that the config=20
>> does
>>  not support anything below. If true, the actual version check can be
>>  skipped and the operation is a compile-time constant, and GCC will=20
>> trim
>>  the dead branches accordingly.
>=20
> You can still simplify the code, no? Calling ffs() (or similar, I
> don't remember by heart all of the details) will give you the result
> in one op. And it may also be optimized away by the compiler.

ffs() gives me the first bit set, this is absolutely not what I want.

Let's say that my kernel supports the JZ4750, JZ4755, JZ4760 SoCs.
That means that I have enabled_socs =3D=3D 0x38.

Calling is_soc_or_above(jzpc, ID_JZ4740) would resolve to:
(0x38 >> 1) && (!(0x38 & GENMASK(0, 0)) || jzpc->info->version >=3D=20
version);
=3D=3D 1 && (1 || jzpc->info->version >=3D version)

Which is a compile-time constant equal to 1.

Calling is_soc_or_above(jzpc, ID_JZ4755) would resolve to:
(0x38 >> 4) && (!(0x38 & GENMASK(3, 0)) || jzpc->info->version >=3D=20
version);
=3D=3D 1 && (0 || jzpc->info->version >=3D version)

which is not a compile-time constant, so the jzpc->info->version must=20
be checked.

Calling is_soc_or_above(jzpc, ID_JZ4770) would resolve to:
(0x38 >> 6) && (!(0x38 & GENMASK(5, 0)) || jzpc->info->version >=3D=20
version);
=3D=3D 0 && ...

which is a compile-time constant equal to 0.

Cheers,
-Paul


>>  > If I'm mistaken, this all version code needs a good comment.
>>  >
>>  >>  +                || jzpc->info->version >=3D version);
>>  >>  +}
>=20
> --
> With Best Regards,
> Andy Shevchenko


