Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69CE54DB6A3
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 17:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355703AbiCPQrC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 12:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357609AbiCPQqw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 12:46:52 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229302DD5E
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1647449129; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wucA9pjxcxOuczo9OyhizDhA5ZqwQsyjipT49Nr2McM=;
        b=wiPHdTKkhkXvRSOHvi6Vb8q7zvz2Skf3JNrwf2yQi2paj474eSEuB4dsYykjxU3nKXY2Xc
        8h0xrKZMIOQ47uthi4K8TYtuhZq7BJ0WyIkqcy/Q0lBqd4n0YRNUsh11DGCTTEqOHlwVcC
        JloHUGIOFxnzGfOPjrVBXCIBB7WgnW0=
Date:   Wed, 16 Mar 2022 16:45:20 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Garbage-collect code paths for SoCs
 disabled by config
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@opendingux.net,
        BROADCOM NVRAM DRIVER <linux-mips@vger.kernel.org>
Message-Id: <KVJU8R.0NUG0BM0DRAL@crapouillou.net>
In-Reply-To: <CAHp75Vez_9CGa6RY5iPrdzTQ79c8OBT7=UOY5w69reM1TLcHkA@mail.gmail.com>
References: <20220315173922.153389-1-paul@crapouillou.net>
        <CAHp75Vfas=H7Vb+mJor-LWckUpE8QUdD8Yauq4mdG4OY+7dfMg@mail.gmail.com>
        <L8FU8R.CQQY3F5UYD5O@crapouillou.net>
        <CAHp75Vca-Fnm3ddeB9=Nh6-B+CKwSruBykgt9M=s6hi=go5Zdw@mail.gmail.com>
        <RXHU8R.MCIBF6I07ISV@crapouillou.net>
        <CAHp75Vez_9CGa6RY5iPrdzTQ79c8OBT7=UOY5w69reM1TLcHkA@mail.gmail.com>
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



Le mer., mars 16 2022 at 18:20:27 +0200, Andy Shevchenko=20
<andy.shevchenko@gmail.com> a =E9crit :
> On Wed, Mar 16, 2022 at 6:03 PM Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>  Le mer., mars 16 2022 at 17:37:37 +0200, Andy Shevchenko
>>  <andy.shevchenko@gmail.com> a =E9crit :
>>  > On Wed, Mar 16, 2022 at 5:05 PM Paul Cercueil=20
>> <paul@crapouillou.net>
>>  > wrote:
>>  >>  Le mer., mars 16 2022 at 16:47:24 +0200, Andy Shevchenko
>>  >>  <andy.shevchenko@gmail.com> a =E9crit :
>>  >>  > On Wed, Mar 16, 2022 at 4:11 AM Paul Cercueil
>>  >> <paul@crapouillou.net>
>>  >>  > wrote:
>=20
> ...
>=20
>>  > It was given below, i.e. using test_bit().
>>=20
>>  Again, I am not checking a bit, but a mask.
>=20
> Yes, that's why "was".
>=20
> ...
>=20
>>  >>  >>  +       return (enabled_socs >> version) &&
>>  >>  >>  +               (!(enabled_socs & GENMASK((unsigned=20
>> int)version
>>  >> -
>>  >>  >> 1, 0))
>>  >>  >
>>  >>  > Why casting? Why not use BIT()?
>>  >>
>>  >>  Casting just to be explicit about what we're doing here - I=20
>> don't
>>  >> like
>>  >>  doing arithmetic on enums. But I can certainly remove it.
>>  >>
>>  >>  > But these two lines seem like a very interesting way to=20
>> reinvent
>>  >> the
>>  >>  > test_bit().
>>  >>
>>  >>  I don't use BIT() or test_bit() because I am not checking a bit,
>>  >> but a
>>  >>  mask:
>>  >>  - (enabled_socs >> version) checks that the config supports=20
>> either
>>  >>  (version) or anything above;
>>  >>  - !(enabled_socs & GENMASK(version - 1, 0)) checks that the=20
>> config
>>  >> does
>>  >>  not support anything below. If true, the actual version check=20
>> can be
>>  >>  skipped and the operation is a compile-time constant, and GCC=20
>> will
>>  >> trim
>>  >>  the dead branches accordingly.
>>  >
>>  > You can still simplify the code, no? Calling ffs() (or similar, I
>>  > don't remember by heart all of the details) will give you the=20
>> result
>>  > in one op. And it may also be optimized away by the compiler.
>>=20
>>  ffs() gives me the first bit set, this is absolutely not what I=20
>> want.
>>=20
>>  Let's say that my kernel supports the JZ4750, JZ4755, JZ4760 SoCs.
>>  That means that I have enabled_socs =3D=3D 0x38.
>>=20
>>  Calling is_soc_or_above(jzpc, ID_JZ4740) would resolve to:
>>  (0x38 >> 1) && (!(0x38 & GENMASK(0, 0)) || jzpc->info->version >=3D
>>  version);
>>  =3D=3D 1 && (1 || jzpc->info->version >=3D version)
>>=20
>>  Which is a compile-time constant equal to 1.
>>=20
>>  Calling is_soc_or_above(jzpc, ID_JZ4755) would resolve to:
>>  (0x38 >> 4) && (!(0x38 & GENMASK(3, 0)) || jzpc->info->version >=3D
>>  version);
>>  =3D=3D 1 && (0 || jzpc->info->version >=3D version)
>>=20
>>  which is not a compile-time constant, so the jzpc->info->version=20
>> must
>>  be checked.
>>=20
>>  Calling is_soc_or_above(jzpc, ID_JZ4770) would resolve to:
>>  (0x38 >> 6) && (!(0x38 & GENMASK(5, 0)) || jzpc->info->version >=3D
>>  version);
>>  =3D=3D 0 && ...
>>=20
>>  which is a compile-time constant equal to 0.
>=20
> And what's wrong with
>=20
>   ffs(enabled_socs) >=3D BIT(version)
>=20
> ?

Well, for starters you're comparing a bit position [0:31] with a bit=20
mask (1 << [0:31])
;)

I believe you meant:
ffs(enabled_socs) >=3D version

With my former example, the first case (ID_JZ4740) would give you a=20
compile-time constant of 1, so it works.

The second case (ID_JZ4755) would cause the jzpc->info->version to be=20
checked, which works too.

The third case (ID_JZ4770) however, would also cause the=20
jzpc->info->version to be checked, which is not the wanted behaviour.=20
Since in my example we only support up to JZ4760, this should instead=20
resolve to a compile-time constant 0.

Cheers,
-Paul


