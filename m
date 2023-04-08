Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A693D6DBA04
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 12:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjDHKKr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Apr 2023 06:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjDHKKq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Apr 2023 06:10:46 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430DEAF30
        for <linux-mips@vger.kernel.org>; Sat,  8 Apr 2023 03:10:45 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 9A15832008FE;
        Sat,  8 Apr 2023 06:10:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 08 Apr 2023 06:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680948644; x=1681035044; bh=W8MivDAX2Jc8usDHneNxmw/HaFm8FQ3HPSr
        JtA32ibQ=; b=bPm5BzQPhvon1HK+U9kbU0T3ZAcd5h3eYh1iAomXWVVX5oRyWjD
        NVUw5Atbx/v3gRCBPz+eU81SXCl2+uy250N3rd8ly4w9vQNV4Id60eYMb/tnpFkg
        wB37Tde5NHpI83ZZVtfD+niGOJm1LMgiNkkKnXKP17LQGm3XBjUaVQOT5i05d39Y
        eaDg10HlnbQswb0/AL0CMXmfRM9VArJrk/2Yzm/qk3Ti38ZuhzHEUsjvFJp3HvIW
        3S2+eXIwVRykK8JbIINh1xe97ubAynHC8aarzwJwHa2n0dbS26MUuIowSQwVogH/
        2tevrOjVhE4FShF0FCxRinfr1Ud2Zo5uzJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680948644; x=1681035044; bh=W8MivDAX2Jc8usDHneNxmw/HaFm8FQ3HPSr
        JtA32ibQ=; b=kMjivV9jQLKpkahxFm67Gj1FKsGq8x8h0Xf+9R2ushVevNZOC2S
        KMnXiHLFZYT6ce3JJjCb9QkmqLkEPw2Ao/vZzHWqYroBMrsH+KMwThUFs4M0iJz+
        Y61+qq/QbgShtqsIZw7Vma0gFVMVLJuttu63KTnQ341+uKlbeyo6JQV7GMz9ltwa
        YMZssRrUsp3ZUFHUNaReKt+VysVKPuQxAywPfvW3Cdt7ogmIne73OXel1A9Kq07Q
        mm8qGJStm3GT1UpuASTcU1X+suHiDOYjtVuisHgZlXSF8c7FsfxR0NHAX41cK+IG
        nTZ7OMkB2CIjd7Y5PB1x2arECyq02sYJAxw==
X-ME-Sender: <xms:oz0xZPs1to8YgP55Ep8aa31_rRFN7lr6H5Q8kxVVmwOzHRQg8UScLA>
    <xme:oz0xZAeabppf8Kqz6cjx5YZAuVw7LPP5V7RcRd9bCX-g1HRJKcWOS6j499IYSQeF6
    IMQlZXUg6rqjP6N_IE>
X-ME-Received: <xmr:oz0xZCw3TifLvCG3gHJ-tkV9OU3id1mRWxktfOgQc5Abbr10u9JeSL69xI_tMG71VLai>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejjedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepuddtjeffteetfeekjeeiheefueeigeeutdevieejveeihfff
    ledvgfduiefhvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:pD0xZONxUktX2Fns_fw5_dgEFpBY8ofiWeKDNTch4F0Aem6_qePGLg>
    <xmx:pD0xZP8z9DchzAi5Vv0-XFVEdAUJjzN2XKcKaCgDarJsBuPUTo_dXQ>
    <xmx:pD0xZOXZq8vo6R3O4wOcnOgKRpTe_KL_Fp_UST-tTf01N8uE0PSeOQ>
    <xmx:pD0xZJm2gnjmLOOyuv_05JCli0IU2bMrgSIzknSyAtxnJCeZO_K07w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Apr 2023 06:10:43 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: Limit MIPS_MT_SMP support by ISA reversion
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <984bbd06-0fbf-3c97-32a1-a6b60af4b3d3@roeck-us.net>
Date:   Sat, 8 Apr 2023 11:10:32 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CD810353-41E9-46ED-AEFB-902B6A4FFD6F@flygoat.com>
References: <20230407223532.7981-1-jiaxun.yang@flygoat.com>
 <984bbd06-0fbf-3c97-32a1-a6b60af4b3d3@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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



> 2023=E5=B9=B44=E6=9C=888=E6=97=A5 01:30=EF=BC=8CGuenter Roeck =
<linux@roeck-us.net> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 4/7/23 15:35, Jiaxun Yang wrote:
>> MIPS MT ASE is only available on ISA between Release 1 and Release 5.
>> Add ISA level dependency to Kconfig to fix build.
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>=20
> With this patch in place, I still get the second build failure.

+ Thomas

Seems like PTE bits are overflowing again.

Last time we trade PTE special against RIXI, now I think we need to =
decide between PTE special
and hugepage?

>=20
> In file included from <command-line>:
> arch/mips/mm/init.c: In function 'mem_init':
> ././include/linux/compiler_types.h:397:45: error: call to =
'__compiletime_assert_437' declared with attribute error: BUILD_BUG_ON =
failed: IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT)
>  397 |         _compiletime_assert(condition, msg, =
__compiletime_assert_, __COUNTER__)
>      |                                             ^
> ././include/linux/compiler_types.h:378:25: note: in definition of =
macro '__compiletime_assert'
>  378 |                         prefix ## suffix();                     =
        \
>      |                         ^~~~~~
> ././include/linux/compiler_types.h:397:9: note: in expansion of macro =
'_compiletime_assert'
>  397 |         _compiletime_assert(condition, msg, =
__compiletime_assert_, __COUNTER__)
>      |         ^~~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:39:37: note: in expansion of macro =
'compiletime_assert'
>   39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
>      |                                     ^~~~~~~~~~~~~~~~~~
> ./include/linux/build_bug.h:50:9: note: in expansion of macro =
'BUILD_BUG_ON_MSG'
>   50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " =
#condition)
>      |         ^~~~~~~~~~~~~~~~
> arch/mips/mm/init.c:454:9: note: in expansion of macro 'BUILD_BUG_ON'
>  454 |         BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > =
PAGE_SHIFT));
>=20
> Also, MIPS_MT_SMP is disabled, CONFIG_TARGET_ISA_REV=3D0, and =
CPU_MIPSR{1,2,6}
> is not set. Prior to "MIPS: generic: Enable all CPUs supported by virt =
board
> in Kconfig", the configuration was
>=20
> CONFIG_CPU_MIPS32_R1=3Dy
> CONFIG_CPU_MIPS32=3Dy
> CONFIG_CPU_MIPSR1=3Dy
> CONFIG_TARGET_ISA_REV=3D1
> CONFIG_MIPS_MT_SMP=3Dy
>=20
> Ultimately it is not my decision to make what should be enabled with
> mips:allmodconfig, but to me it looks like "MIPS: generic: Enable all =
CPUs
> supported by virt board in Kconfig" doesn't enable but disable various
> configurations.

Indeed, as R4000 has less features so it must disable more options.

To get maximum coverage on allmodconfig I think we=E2=80=99d better set =
default CPU to MIPS64R2
which have more features and wider user base.

Also default to build 64 bit kernel if it=E2=80=99s supported by CPU.

Thanks.
Jiaxun


>=20
> Thanks,
> Guenter
>=20

