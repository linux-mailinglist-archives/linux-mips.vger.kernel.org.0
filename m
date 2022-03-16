Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1CA4DB3E5
	for <lists+linux-mips@lfdr.de>; Wed, 16 Mar 2022 16:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242351AbiCPPGf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 16 Mar 2022 11:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237785AbiCPPGe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 16 Mar 2022 11:06:34 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C178C13F89
        for <linux-mips@vger.kernel.org>; Wed, 16 Mar 2022 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1647443118; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HrwSOLFNR+9btsbT4xzi1/iiDnsHISBKlQ2I6GfDBDo=;
        b=QRgLClCiqgBbemHnRtNHr9Ps4zzpxu6oZIoMiCS7FRVOPycPHPh7B/z02+YXby7R8JPhzo
        u2ilnJCN3hoqxBU4VNxkqXIV+hdXS8Kt72MIBx7yxcyST+0C/KXZ+SEPPYumfY0Gvb8AyN
        pxCc5LsjvGaU26S1M+zuDPMOeMCAXU8=
Date:   Wed, 16 Mar 2022 15:05:09 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] pinctrl: ingenic: Garbage-collect code paths for SoCs
 disabled by config
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>, od@opendingux.net,
        BROADCOM NVRAM DRIVER <linux-mips@vger.kernel.org>
Message-Id: <L8FU8R.CQQY3F5UYD5O@crapouillou.net>
In-Reply-To: <CAHp75Vfas=H7Vb+mJor-LWckUpE8QUdD8Yauq4mdG4OY+7dfMg@mail.gmail.com>
References: <20220315173922.153389-1-paul@crapouillou.net>
        <CAHp75Vfas=H7Vb+mJor-LWckUpE8QUdD8Yauq4mdG4OY+7dfMg@mail.gmail.com>
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

Hi Andy,

Le mer., mars 16 2022 at 16:47:24 +0200, Andy Shevchenko=20
<andy.shevchenko@gmail.com> a =E9crit :
> On Wed, Mar 16, 2022 at 4:11 AM Paul Cercueil <paul@crapouillou.net>=20
> wrote:
>>=20
>>  By being a bit smarter about how the SoC version checks are=20
>> performed,
>>  it is possible to have all the code paths that correspond to SoCs
>>  disabled in the kernel config automatically marked as dead code by=20
>> the
>>  compiler, and therefore garbage-collected.
>>=20
>>  With this patch, when compiling a kernel that only targets the=20
>> JZ4760
>>  for instance, the driver is now about 4.5 KiB smaller.
>=20
> ...
>=20
>>  +static const u32 enabled_socs =3D
>=20
> If you make it unsigned long, it would be easier to switch to bitmap
> APIs if needed in the future.

Sure, I can make it a unsigned long. But we'd need a lot more entries=20
to justify a switch to bitmap APIs...

>=20
>>  +       IS_ENABLED(CONFIG_MACH_JZ4730) << ID_JZ4730 |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4740) << ID_JZ4740 |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4725B) << ID_JZ4725B |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4750) << ID_JZ4750 |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4755) << ID_JZ4755 |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4760) << ID_JZ4760 |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4770) << ID_JZ4770 |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4775) << ID_JZ4775 |
>>  +       IS_ENABLED(CONFIG_MACH_JZ4780) << ID_JZ4780 |
>>  +       IS_ENABLED(CONFIG_MACH_X1000) << ID_X1000 |
>>  +       IS_ENABLED(CONFIG_MACH_X1500) << ID_X1500 |
>>  +       IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
>>  +       IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
>>  +       IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
>=20
> ...
>=20
>>  +is_soc_or_above(const struct ingenic_pinctrl *jzpc, enum=20
>> jz_version version)
>>  +{
>>  +       return (enabled_socs >> version) &&
>>  +               (!(enabled_socs & GENMASK((unsigned int)version -=20
>> 1, 0))
>=20
> Why casting? Why not use BIT()?

Casting just to be explicit about what we're doing here - I don't like=20
doing arithmetic on enums. But I can certainly remove it.

> But these two lines seem like a very interesting way to reinvent the=20
> test_bit().

I don't use BIT() or test_bit() because I am not checking a bit, but a=20
mask:
- (enabled_socs >> version) checks that the config supports either=20
(version) or anything above;
- !(enabled_socs & GENMASK(version - 1, 0)) checks that the config does=20
not support anything below. If true, the actual version check can be=20
skipped and the operation is a compile-time constant, and GCC will trim=20
the dead branches accordingly.

Cheers,
-Paul

> If I'm mistaken, this all version code needs a good comment.
>=20
>>  +                || jzpc->info->version >=3D version);
>>  +}
>=20
> --
> With Best Regards,
> Andy Shevchenko


