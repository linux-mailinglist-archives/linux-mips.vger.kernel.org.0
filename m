Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 249EA6DA4AB
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 23:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjDFVan (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 17:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbjDFVam (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 17:30:42 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C5B9012
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 14:30:35 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id C51783200A6A;
        Thu,  6 Apr 2023 17:30:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 06 Apr 2023 17:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680816634; x=1680903034; bh=6WVpbx6zgP8y2bseGHPdug1N1ke5pDhH3B9
        9UC+uihE=; b=kzeAqry5E+Sz5FkvXjM5YclXfrMnu1f4vbBA6id41iuS8GRrNsh
        8Laf4EvUtWNscLoGuPlJK7oblvmS3PtGUwM+49oMDkKMbhhCCv7YLC3wKe5wbuoS
        P+RO/M+ST2AmqqSTVCcj1p6v3EoKqYa88hR5UgvNXvpIma37AtMuws1SvyIhaDTx
        XK5O6ftSalbUW7z10F9waIEKCDkMk+olkXin+kGQkgVgjFvYt6CsJ9NMWdxI60hO
        DobYgVz6NEsLpJPXNVI8qEoTOE/dcDFZOd8bsSpnXJ1WerPF8qwy7vhag1AopceB
        iUdUJUgKXOQinqhoWsqu7yOGpSY8bHZXK+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680816634; x=1680903034; bh=6WVpbx6zgP8y2bseGHPdug1N1ke5pDhH3B9
        9UC+uihE=; b=CMtInbduQrwqcfVeNPU7SD7fti4Kuj4c5tGu5ojEypP3LwV/BAs
        fznSkxJUBvY+MTEZ6AqBM+eAtQserDW8w37InKN7dwcpg/DrKtrE1eybwP8Xqo4p
        hnFcbFEF/I7mvTIVHZkFUdm1KbRzAHBIYV+c+LCqfDunXabOc0ucs/uaWfm/EIHs
        qtJYlplFixmi4Lw9MXxL//D0bEUQ+WDN88cr1zCd7khQHH+0SHfJIWoIJyLZ9ZuU
        ujV37M9x3naue3N23v5/xXpShTENFr81Y2Hxe5RpuhfxL9A22H9atl3q0QmPGI0f
        rBF0o2Zo4V1+DZSsNdETIsNGSdYF7xlMF5g==
X-ME-Sender: <xms:-jkvZC8wtozsqEsf4XlE0PgtoPvJTOlmQQe-EvOlGZH3_j8j7GA_KQ>
    <xme:-jkvZCvaJg5mNUxJQZ-8SjcaxO8ilUwj6N7Po-HEZVK5bt_51AEUGeeVQHqGjZBoJ
    fs8GQd8z2SEfxwPYwg>
X-ME-Received: <xmr:-jkvZIDekU-sUEwKVzhNwn4EUw8o3-1boiwjgPiL7lfAoWAu0zdnAgtu0h1ahDdjF0Y4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeeuhfevudelffegteegiedttdejtdejfedvveeltefgvdev
    udetledtgeejgfeggeenucffohhmrghinheplhhlvhhmrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:-jkvZKco5lFou0GO0o7oHSSrBn0DPoINTb39sZqy1HtEW0C_yIZZsQ>
    <xmx:-jkvZHMdvS-NHZoJDqMtSXY5iWWrxmO4b_Np9NacLnphJC2zPpjJgQ>
    <xmx:-jkvZEl45ZzY4fbs8XXexdWSKUqJm8gvxmotQrk0RgDV86AWVZQBpA>
    <xmx:-jkvZAo-f17elXyFtgZWzmMZNfQXG3uefwLkpkr2he2fFtTHYoeUUg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Apr 2023 17:30:33 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: generic: Do not select CPUs that are unsupported in
 clang
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <EBE3E940-B8EE-4682-A1F6-1CCF98EAC2E6@flygoat.com>
Date:   Thu, 6 Apr 2023 22:30:22 +0100
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, patches@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <6B77736C-1015-45A7-A48A-92E4CBE95ACA@flygoat.com>
References: <20230406-mips-clang-generic-selects-fix-v1-1-811690c9fb69@kernel.org>
 <AAAAB6A1-81EE-42A8-84F7-CF8D0DA16456@flygoat.com>
 <20230406210953.GA53516@dev-arch.thelio-3990X>
 <EBE3E940-B8EE-4682-A1F6-1CCF98EAC2E6@flygoat.com>
To:     Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=886=E6=97=A5 22:19=EF=BC=8CJiaxun Yang =
<jiaxun.yang@flygoat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
>=20
>=20
>> 2023=E5=B9=B44=E6=9C=886=E6=97=A5 22:09=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> On Thu, Apr 06, 2023 at 09:59:45PM +0100, Jiaxun Yang wrote:
>>>=20
>>>=20
>>>> 2023=E5=B9=B44=E6=9C=886=E6=97=A5 21:09=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>=20
>>>> When building allnoconfig with clang after commit de34007751aa =
("MIPS:
>>>> generic: Enable all CPUs supported by virt board in Kconfig"), the
>>>> following error occurs:
>>>>=20
>>>> error: unknown target CPU 'r4600'
>>>> note: valid target CPU values are: mips1, mips2, mips3, mips4, =
mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, =
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
>>>>=20
>>>> Working around that, there are similar errors for 'loongson2e' and
>>>> 'loongson2f'.
>>>>=20
>>>> These CPUs are not supported in clang/LLVM, so do not select =
support for
>>>> them in MIPS_GENERIC_KERNEL when building with clang.
>>>>=20
>>>> Fixes: de34007751aa ("MIPS: generic: Enable all CPUs supported by =
virt board in Kconfig")
>>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>>=20
>>> Thanks for the patch.
>>>=20
>>> Actually there is no need for any special support for those CPUs.
>>> We should be able to build those kernels with -march=3Dmips3.
>>>=20
>>> I think something like:
>>>=20
>>> --- a/arch/mips/Makefile
>>> +++ b/arch/mips/Makefile
>>> @@ -150,7 +150,7 @@ cflags-y +=3D $(call =
cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
>>> #
>>> cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dr3000
>>> cflags-$(CONFIG_CPU_R4300)     +=3D -march=3Dr4300 -Wa,--trap
>>> -cflags-$(CONFIG_CPU_R4X00)     +=3D -march=3Dr4600 -Wa,--trap
>>> +cflags-$(CONFIG_CPU_R4X00)     +=3D $(call =
cc-option,-march=3Dr4600,-march=3Dmips3) -Wa,--trap
>>> cflags-$(CONFIG_CPU_TX49XX)    +=3D -march=3Dr4600 -Wa,--trap
>>> cflags-$(CONFIG_CPU_MIPS32_R1) +=3D -march=3Dmips32 -Wa,--trap
>>> cflags-$(CONFIG_CPU_MIPS32_R2) +=3D -march=3Dmips32r2 -Wa,--trap
>>> @@ -181,8 +181,8 @@ endif
>>> cflags-$(CONFIG_CAVIUM_CN63XXP1) +=3D -Wa,-mfix-cn63xxp1
>>> cflags-$(CONFIG_CPU_BMIPS)     +=3D -march=3Dmips32 -Wa,-mips32 =
-Wa,--trap
>>>=20
>>> -cflags-$(CONFIG_CPU_LOONGSON2E) +=3D -march=3Dloongson2e -Wa,--trap
>>> -cflags-$(CONFIG_CPU_LOONGSON2F) +=3D -march=3Dloongson2f -Wa,--trap
>>> +cflags-$(CONFIG_CPU_LOONGSON2E) +=3D $(call =
cc-option,-march=3Dloongson2e,-march=3Dmips3) -Wa,--trap
>>> +cflags-$(CONFIG_CPU_LOONGSON2F) +=3D $(call =
cc-option,-march=3Dloongson2f,-march=3Dmips3) -Wa,--trap
>>> # Some -march=3D flags enable MMI instructions, and GCC complains =
about that
>>> # support being enabled alongside -msoft-float. Thus explicitly =
disable MMI.
>>> cflags-$(CONFIG_CPU_LOONGSON2EF) +=3D $(call =
cc-option,-mno-loongson-mmi)
>>>=20
>>> Will make them build.
>>=20
>> Thank you for taking a look and the suggestion! I applied it and =
tried
>> to build allnoconfig but I get
>>=20
>> error: ABI 'o32' is not supported on CPU 'mips3'
>>=20
>> immediately, which could certainly be a bug in clang...
>=20
> There is a clang patch:
> https://reviews.llvm.org/D146269
>=20
> I=E2=80=99ve seen this warning with CONFIG_MIPS32_O32 enabled, but I =
think that=E2=80=99s not the case for allnoconfig...


Oh I see, it=E2=80=99s trying to build a o32 kernel.

--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1579,7 +1579,7 @@ config CPU_R4300
config CPU_R4X00
bool "R4x00"
depends on SYS_HAS_CPU_R4X00
- select CPU_SUPPORTS_32BIT_KERNEL
+ select CPU_SUPPORTS_32BIT_KERNEL if CC_SUPPORTS_O32_WITH_64BIT_ARCH
select CPU_SUPPORTS_64BIT_KERNEL
select CPU_SUPPORTS_HUGEPAGES
help
@@ -1743,9 +1743,11 @@ config CPU_MIPS32_R5_XPA
if CPU_LOONGSON2F
config CPU_NOP_WORKAROUNDS
bool
+ depends on $(cc-option,-Wa,-mfix-loongson2f-nop)
config CPU_JUMP_WORKAROUNDS
bool
+ depends on $(cc-option,-Wa,-mfix-loongson2f-jump)
config CPU_LOONGSON2F_WORKAROUNDS
bool "Loongson 2F Workarounds"
@@ -2497,6 +2499,7 @@ config CPU_HAS_SYNC
# "MIPS R4400MC Errata, Processor Revision 1.0", erratum #5
config CPU_DADDI_WORKAROUNDS
bool
+ depends on $(cc-option,-mno-daddi)
# Work around certain R4000 CPU errata (as implemented by GCC):
#
@@ -2518,6 +2521,7 @@ config CPU_DADDI_WORKAROUNDS
# erratum #52
config CPU_R4000_WORKAROUNDS
bool
+ depends on $(cc-option,-mfix-r4000)
select CPU_R4400_WORKAROUNDS
# Work around certain R4400 CPU errata (as implemented by GCC):
@@ -2528,6 +2532,7 @@ config CPU_R4000_WORKAROUNDS
# "MIPS R4400MC Errata, Processor Revision 2.0 & 3.0", erratum #4
config CPU_R4400_WORKAROUNDS
bool
+ depends on $(cc-option,-mfix-r4400)
config CPU_R4X00_BUGS64
bool
@@ -3174,6 +3179,7 @@ config COMPAT
config MIPS32_O32
bool "Kernel support for o32 binaries"
depends on 64BIT
+ depends on CC_SUPPORTS_O32_WITH_64BIT_ARCH
select ARCH_WANT_OLD_COMPAT_IPC
select COMPAT
select MIPS32_COMPAT
@@ -3206,6 +3212,9 @@ config CC_HAS_MNO_BRANCH_LIKELY
config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
def_bool y if CC_IS_CLANG
+config CC_SUPPORTS_O32_WITH_64BIT_ARCH
+ def_bool y if $(cc-option,-march=3Dmips3 -mabi=3Do32)
+
menu "Power management options"
config ARCH_HIBERNATION_POSSIBLE

This will prevent clang build 32bit kernel in case it doesn=E2=80=99t =
support o32 ABI with 64bit CPU.

Thanks
Jiaxun

>=20
> Thanks
> Jiaxun
>=20
>>=20
>> Cheers,
>> Nathan


