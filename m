Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A640C6DB673
	for <lists+linux-mips@lfdr.de>; Sat,  8 Apr 2023 00:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjDGW0h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 18:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjDGW0g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 18:26:36 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B786A5CB;
        Fri,  7 Apr 2023 15:26:32 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 60D1E5C0050;
        Fri,  7 Apr 2023 18:26:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 07 Apr 2023 18:26:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680906389; x=1680992789; bh=gc3XWq5jxArvj2x8fpaY8lG7l6GGRwfF874
        q4v46klg=; b=xDNucmv0vh3gjObDAVZyegTcCVZXlSrmF/U4kwWQe4QK6kUkQJV
        yfutlJZdoQ6v7bh8DaF8GeS9kQlZNO6qzGfFnOpRFjM7cY7jMil6U/qJGCfBP70F
        mvuSO80RalffG4hOxvMZfx0H9sPKmklfBfOh0uF0o1KIcd95zTQYoUSNFSAy8J9K
        NsLWit89YT8faCpyd6s7LczAx2H0kNiif537HWNKc5yWhxcJGH/DixAkNg7DapjL
        vVk52YymI1eJlcuRf57ZWjXiIfXcc4bB7zUBZpTDk3VKqWSNHfllUmHtVeUaUSEK
        RfQ/PfeqZL/wthTPGpomMbUjzwic8W1gNLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680906389; x=1680992789; bh=gc3XWq5jxArvj2x8fpaY8lG7l6GGRwfF874
        q4v46klg=; b=cyXAAkkoYh10vTAECEA3AVLPhD/TikQ2KjG9RjAGGL6nB5rk6ZN
        /aq76nI+P25k/PwGOwq7tJIQzhuGIZ585VXI10RLfnznJCbetIfgwZRSSMIm3CeV
        sOgD+1MdiEdBoFq47ftmo7CrAQiPMtVy+2aR07uW7gyjtCsAUS0QruoQ1ZuKRedM
        1ZY5vfiKSkC8YEoODyvVST+L+uJYR6i44+uKO1coAJ/h9eluS+M4apuvaHSvZzwW
        SScxfwKqgm7vgjFSblRNP032FOob6Kl/ZWloLT0ooUUj8W3Z+bETQlF8jdUhzxLV
        f7ompP8z3JBbABj6FbraHqXtYZmoIUpx/PQ==
X-ME-Sender: <xms:lJgwZHR0BDHcGXHjarZVQ4gFxt5URNKhFLyTStacM8UzATF-YdxcPQ>
    <xme:lJgwZIzpaxp1QI90UZwQ5ClvvG-6VxEbB_21p2ptjBRSVvtBSyNuKXZ-bd9XXGeKM
    7nBUVCqzBpV_KND-2E>
X-ME-Received: <xmr:lJgwZM2QNuDDc346lBwNS2LAqVuy5P4c6ap4vXnKRvzBMYtcuOtDpNaAxIAbM0wdxYix>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejiedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepueetvdettdduhedtfeevteegjefhffelgefhtdejhfefleev
    gfeuuddvleefvdeunecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:lJgwZHBBMwUv8Nve-CZD-khG_OnyBUWFioX-6cUgyk0allFrPKj1Pg>
    <xmx:lJgwZAhBIfN1DkB5bRNmegQlDUoB_U-M_fcbDLJqukzGFYyuQ63YIQ>
    <xmx:lJgwZLp83MncOrxULRmq-b851Q_YSy4EiEYhKkW53BQVt0c_n557qw>
    <xmx:lZgwZKb3EW5LrAesRtKoiPPDeas2L52gveUiJPjOehsSkTqYBYrUKg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 18:26:27 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH 4/5] MIPS: Detect toolchain support of o32 ABI with 64 bit
 CPU
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
Date:   Fri, 7 Apr 2023 23:26:16 +0100
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <959A8C19-2005-4C5A-91A8-F692AACCA329@flygoat.com>
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
 <20230407102721.14814-5-jiaxun.yang@flygoat.com>
 <CAKwvOd=2ChEH1goXpi=nYTcouwLgKP1fnkN31AuqROKj0uc2kg@mail.gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=887=E6=97=A5 23:19=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Fri, Apr 7, 2023 at 3:27=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>=20
>> LLVM is not happy with using o32 ABI on 64 bit CPU, thus build 32 bit
>> kernel is unsupported.
>>=20
>> Detect this in Kconfig to prevent user select 32 bit kernel with
>> unsupported toolchain.
>>=20
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>=20
> I suspect this may fix:
> Link: https://github.com/ClangBuiltLinux/linux/issues/884
>=20
>> ---
>> arch/mips/Kconfig | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>> index d896af492da6..5e399a5ac3b3 100644
>> --- a/arch/mips/Kconfig
>> +++ b/arch/mips/Kconfig
>> @@ -2016,6 +2016,7 @@ choice
>> config 32BIT
>>        bool "32-bit kernel"
>>        depends on CPU_SUPPORTS_32BIT_KERNEL && =
SYS_SUPPORTS_32BIT_KERNEL
>> +       depends on CC_HAS_O32_ABI
>=20
> Does this disable 32b mips builds with clang?

It disable 32bit kernel build for 64bit CPU with clang.

i.e.: 32bit kernel for R4000, 32bit kernel for MIPS64R2 is disabled, but =
you can still build 32 bit
kernel for mips32r2.

>=20
>>        select TRAD_SIGNALS
>>        help
>>          Select this option if you want to build a 32-bit kernel.
>> @@ -3136,7 +3137,7 @@ config COMPAT
>>=20
>> config MIPS32_O32
>>        bool "Kernel support for o32 binaries"
>> -       depends on 64BIT
>> +       depends on 64BIT && CC_HAS_O32_ABI
>>        select ARCH_WANT_OLD_COMPAT_IPC
>>        select COMPAT
>>        select MIPS32_COMPAT
>> @@ -3184,6 +3185,10 @@ config CC_HAS_DADDI_WORKAROUNDS
>> config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
>>        def_bool y if CC_IS_CLANG
>>=20
>> +config CC_HAS_O32_ABI
>> +       def_bool y
>> +       depends on !CPU_SUPPORTS_64BIT_KERNEL || =
$(cc-option,-march=3Dmips3 -mabi=3D32)
>=20
> Should this be
> def_bool $(cc-option,-march=3Dmips3 -mabi=3D32)
> depends on !CPU_SUPPORTS_64BIT_KERNEL

Hmm, the logic is to enable CC_HAS_O32_ABI if CPU is 32bit only =
(!CPU_SUPPORTS_64BIT_KERNEL)
or toolchain supports 64bit CPU with o32 ABI combination.

Thanks
Jiaxun

>=20
> ?
>=20
>> +
>> config AS_HAS_MSA
>>        def_bool $(cc-option,-Wa$(comma)-mmsa)
>>=20
>> --
>> 2.39.2 (Apple Git-143)
>>=20
>=20
>=20
> --=20
> Thanks,
> ~Nick Desaulniers


