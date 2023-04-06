Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424186DA43B
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 23:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbjDFVAH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 17:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjDFVAG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 17:00:06 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42B8C7D8C
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 14:00:03 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E5A66320046E;
        Thu,  6 Apr 2023 16:59:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 06 Apr 2023 16:59:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680814798; x=1680901198; bh=LzMVC3NxIS1wZ9+dcFS3lcTR3V8rRxm6xRh
        y3mczdjo=; b=GA5xsF9bKiWkVkgOl1uZnTYogXy3EKXT0AvlEEHtj6orRhSSBsz
        HTOaHIn1YXR/WJDiHM39NTREbyPlCnFtoyosFKcpWyUtSHv+8ogdffcUzjQvs3zl
        FaR6wrkEoaFBNgaSFcpHUUK0ZKBEY6CwMuAZeIvbM4ju5Ng0xk7vY85A+iaSPXEv
        RCwHuAZjTgEm0+bCdPUxzuqPAE7qLjTMzTUusVsi8lGCvCIUJCHE71HEs+q1x0Y4
        bFtm1Ff2/p6X8Wml3mfaaIXBfQ0ufOEed41Pmer/F5g3n3VXQ9XwFZB/9dbLznG4
        i5AeJlyPz8reswMhxddPVoBeXsoeZaVg+/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680814798; x=1680901198; bh=LzMVC3NxIS1wZ9+dcFS3lcTR3V8rRxm6xRh
        y3mczdjo=; b=UHFGnl7B7NEDR+LnuRmDFfnp413zmSRC72u5gbZA0vMzgoGc0t7
        qbycFu13BMEyOlQzf3ebEdokqWqLC+z+Pv6ibCd+KmiAztZiyWDyYubeHoHmDzQE
        YnpxYUfSXnHbfAN2Ly48s6STy1ukeg4nIPbN7QFZ1I5AolCNAsPoeZNmP70OvoNm
        ymUeFgyuURPq6uJfaLG14QjIfrPSF838H/y9SKQ/XXOcIiAqtG6EEVl9nPT4zfV1
        ELIShuflv9PsQ3rGRu61rW2ef8YpAEFDQsZl39C4k4TRhX6XGGWn2aUGYW3GhWi9
        zMbT4klZn8DJRj3hAUgiM+6I9rtqDm4yLQw==
X-ME-Sender: <xms:zTIvZDw0kIsl2UfTQ6KY1aU0hs_X-81egLVd008L19GwjxDdX_E4tg>
    <xme:zTIvZLRBmnL8jX87XblPlebKsca9y6wKSbpbWwi1KC2cxKlmxP_Dh4REhUWNrn9tQ
    Dh5_6HYWSIcHwl9bls>
X-ME-Received: <xmr:zTIvZNUJBgRxMKNfBjwji6luXHuJqZprN-_6rBxYdnZO-dL09aKc1LU00NJeksPsNXLy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgudehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:zTIvZNj5pi42hVPo61Jq2lw3bWXQtrKllG94IrL6__bsOgE4B6e2Fg>
    <xmx:zTIvZFA19MBlAVL-q-UrcGvZcrDYrdq5UhNiVfCfRkhU7XSVHEY0nw>
    <xmx:zTIvZGIvh5YxKR4AQgKf6xogO9ZTwXr0eTc0todofB4v3VIbj9QdLg>
    <xmx:zjIvZENfrfqNYajb1YHql7D5l_-Hj2uInCnCwJ0m9Y802Kczu3I5Gg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Apr 2023 16:59:56 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: generic: Do not select CPUs that are unsupported in
 clang
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230406-mips-clang-generic-selects-fix-v1-1-811690c9fb69@kernel.org>
Date:   Thu, 6 Apr 2023 21:59:45 +0100
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, patches@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAAAB6A1-81EE-42A8-84F7-CF8D0DA16456@flygoat.com>
References: <20230406-mips-clang-generic-selects-fix-v1-1-811690c9fb69@kernel.org>
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



> 2023=E5=B9=B44=E6=9C=886=E6=97=A5 21:09=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> When building allnoconfig with clang after commit de34007751aa ("MIPS:
> generic: Enable all CPUs supported by virt board in Kconfig"), the
> following error occurs:
>=20
>  error: unknown target CPU 'r4600'
>  note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, =
mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, =
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
>=20
> Working around that, there are similar errors for 'loongson2e' and
> 'loongson2f'.
>=20
> These CPUs are not supported in clang/LLVM, so do not select support =
for
> them in MIPS_GENERIC_KERNEL when building with clang.
>=20
> Fixes: de34007751aa ("MIPS: generic: Enable all CPUs supported by virt =
board in Kconfig")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch.

Actually there is no need for any special support for those CPUs.
We should be able to build those kernels with -march=3Dmips3.

I think something like:

--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -150,7 +150,7 @@ cflags-y +=3D $(call =
cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 #
 cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dr3000
 cflags-$(CONFIG_CPU_R4300)     +=3D -march=3Dr4300 -Wa,--trap
-cflags-$(CONFIG_CPU_R4X00)     +=3D -march=3Dr4600 -Wa,--trap
+cflags-$(CONFIG_CPU_R4X00)     +=3D $(call =
cc-option,-march=3Dr4600,-march=3Dmips3) -Wa,--trap
 cflags-$(CONFIG_CPU_TX49XX)    +=3D -march=3Dr4600 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS32_R1) +=3D -march=3Dmips32 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS32_R2) +=3D -march=3Dmips32r2 -Wa,--trap
@@ -181,8 +181,8 @@ endif
 cflags-$(CONFIG_CAVIUM_CN63XXP1) +=3D -Wa,-mfix-cn63xxp1
 cflags-$(CONFIG_CPU_BMIPS)     +=3D -march=3Dmips32 -Wa,-mips32 =
-Wa,--trap
=20
-cflags-$(CONFIG_CPU_LOONGSON2E) +=3D -march=3Dloongson2e -Wa,--trap
-cflags-$(CONFIG_CPU_LOONGSON2F) +=3D -march=3Dloongson2f -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2E) +=3D $(call =
cc-option,-march=3Dloongson2e,-march=3Dmips3) -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2F) +=3D $(call =
cc-option,-march=3Dloongson2f,-march=3Dmips3) -Wa,--trap
 # Some -march=3D flags enable MMI instructions, and GCC complains about =
that
 # support being enabled alongside -msoft-float. Thus explicitly disable =
MMI.
 cflags-$(CONFIG_CPU_LOONGSON2EF) +=3D $(call =
cc-option,-mno-loongson-mmi)

Will make them build.

Thanks
- Jiaxun=
