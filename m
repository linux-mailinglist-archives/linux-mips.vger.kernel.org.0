Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EEBC6DA490
	for <lists+linux-mips@lfdr.de>; Thu,  6 Apr 2023 23:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240200AbjDFVTy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Apr 2023 17:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239785AbjDFVTv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Apr 2023 17:19:51 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D92E6A26B
        for <linux-mips@vger.kernel.org>; Thu,  6 Apr 2023 14:19:47 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id E308E32009E4;
        Thu,  6 Apr 2023 17:19:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 06 Apr 2023 17:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1680815986; x=1680902386; bh=C+6wu6Roz8iwyNdW+Xkby+I2i2jxag177SX
        g2Mq8VEE=; b=HJqg5FIeluXaiCg+sI8EHHo/TvlfT+mVGF3O8hz/7BQJMnGL8T9
        vKD3sIPnFCs2fnsqPovMpGmDpdHMAxBlElgyztzkF0RC2bLgxqKJmlPUya68hKBf
        G3Pe7LMs40lAqjzIWYNpfjStKWTty2YpjzZD75VgR5MuBX0fln7cHsmdQcQE8FS/
        SvPoC1uESuFgAAMyzexFW1k5VGfC3wdbS2pmdb0UhnFiA99s9qBQEshkBb4cPFAZ
        4BTjK+rJc9RYoyKt9vq5iaZmgx7Ii/Jdp67fT6AZkJWjTv2dW9UWrPX1KV9SFHjn
        nLEIMAmj1KHWpFvvcznj0+lCaPGuQQZWgEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1680815986; x=1680902386; bh=C+6wu6Roz8iwyNdW+Xkby+I2i2jxag177SX
        g2Mq8VEE=; b=P5aVCZoKf1Cs3oKvzexuyEzr56q/f0lMRsd6rxWyPBtqYsmknEB
        hivEF53XLmLvF2ylrrA4/kSARsebNJVoRxdJ3fevVt0cvIxBsWXzDVW9fqoZcEPR
        M/+CX3kO8OipQ2sut57xcZZCEp54IHON6L/J0HRkoVqfNt/IGtQcKCQUvVkwt8eA
        Skdqp5OmJxGseChD+M3MfQBPl4eBqQ1hlA3AvIPjOVC+zBZa1nU+GbQvl3N7q6lB
        OygZUFbzCzyIxt1h1LDNp2d/J+dpcESwPEi/O2SLZnd1cD4Wf6DOZn1aK0AAVJ8Q
        SiqTRGCNc2GY7BZ9bhsS/bFRkkel5VzoiLA==
X-ME-Sender: <xms:cjcvZHV6XSEGxtns6s2k04WqtKCCKafhB90P9hglQa1Kwln1GvEOSg>
    <xme:cjcvZPldpNIkdBM0e_iTTJ8gismu5Yk9jGEMnHO67AWyVd40dRRtamnXgRDHz1qm_
    5BEtr7ZfytBEcmsBSw>
X-ME-Received: <xmr:cjcvZDYRVuOK7L2Y-Chl8vXMWz7bPuXqF3TGS7WtZsT7YGiTfJFJgBBqNT-XGHhNbWuV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgudehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeeuhfevudelffegteegiedttdejtdejfedvveeltefgvdev
    udetledtgeejgfeggeenucffohhmrghinheplhhlvhhmrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:cjcvZCVExxW0oId7YHWXU3CJ792kk3bfYgQ5PRUTmQix29fPt-hsQg>
    <xmx:cjcvZBkGcXH0yETJSceQqvmeI5bLO9RZcULEiCpaHZAp5Hn2fBo9pQ>
    <xmx:cjcvZPeqjKYwjnEJsJ1QUA7hTedzECI9zTo8xjjpw-Pluz4DoJpn6w>
    <xmx:cjcvZHjYrNpgJVDnzFbAaKfINqYMQDelbZFJpJPstjK1pmMYlsy-wQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Apr 2023 17:19:45 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH] MIPS: generic: Do not select CPUs that are unsupported in
 clang
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20230406210953.GA53516@dev-arch.thelio-3990X>
Date:   Thu, 6 Apr 2023 22:19:34 +0100
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, patches@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <EBE3E940-B8EE-4682-A1F6-1CCF98EAC2E6@flygoat.com>
References: <20230406-mips-clang-generic-selects-fix-v1-1-811690c9fb69@kernel.org>
 <AAAAB6A1-81EE-42A8-84F7-CF8D0DA16456@flygoat.com>
 <20230406210953.GA53516@dev-arch.thelio-3990X>
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



> 2023=E5=B9=B44=E6=9C=886=E6=97=A5 22:09=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Thu, Apr 06, 2023 at 09:59:45PM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>>> 2023=E5=B9=B44=E6=9C=886=E6=97=A5 21:09=EF=BC=8CNathan Chancellor =
<nathan@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> When building allnoconfig with clang after commit de34007751aa =
("MIPS:
>>> generic: Enable all CPUs supported by virt board in Kconfig"), the
>>> following error occurs:
>>>=20
>>> error: unknown target CPU 'r4600'
>>> note: valid target CPU values are: mips1, mips2, mips3, mips4, =
mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, =
mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
>>>=20
>>> Working around that, there are similar errors for 'loongson2e' and
>>> 'loongson2f'.
>>>=20
>>> These CPUs are not supported in clang/LLVM, so do not select support =
for
>>> them in MIPS_GENERIC_KERNEL when building with clang.
>>>=20
>>> Fixes: de34007751aa ("MIPS: generic: Enable all CPUs supported by =
virt board in Kconfig")
>>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>=20
>> Thanks for the patch.
>>=20
>> Actually there is no need for any special support for those CPUs.
>> We should be able to build those kernels with -march=3Dmips3.
>>=20
>> I think something like:
>>=20
>> --- a/arch/mips/Makefile
>> +++ b/arch/mips/Makefile
>> @@ -150,7 +150,7 @@ cflags-y +=3D $(call =
cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
>> #
>> cflags-$(CONFIG_CPU_R3000)     +=3D -march=3Dr3000
>> cflags-$(CONFIG_CPU_R4300)     +=3D -march=3Dr4300 -Wa,--trap
>> -cflags-$(CONFIG_CPU_R4X00)     +=3D -march=3Dr4600 -Wa,--trap
>> +cflags-$(CONFIG_CPU_R4X00)     +=3D $(call =
cc-option,-march=3Dr4600,-march=3Dmips3) -Wa,--trap
>> cflags-$(CONFIG_CPU_TX49XX)    +=3D -march=3Dr4600 -Wa,--trap
>> cflags-$(CONFIG_CPU_MIPS32_R1) +=3D -march=3Dmips32 -Wa,--trap
>> cflags-$(CONFIG_CPU_MIPS32_R2) +=3D -march=3Dmips32r2 -Wa,--trap
>> @@ -181,8 +181,8 @@ endif
>> cflags-$(CONFIG_CAVIUM_CN63XXP1) +=3D -Wa,-mfix-cn63xxp1
>> cflags-$(CONFIG_CPU_BMIPS)     +=3D -march=3Dmips32 -Wa,-mips32 =
-Wa,--trap
>>=20
>> -cflags-$(CONFIG_CPU_LOONGSON2E) +=3D -march=3Dloongson2e -Wa,--trap
>> -cflags-$(CONFIG_CPU_LOONGSON2F) +=3D -march=3Dloongson2f -Wa,--trap
>> +cflags-$(CONFIG_CPU_LOONGSON2E) +=3D $(call =
cc-option,-march=3Dloongson2e,-march=3Dmips3) -Wa,--trap
>> +cflags-$(CONFIG_CPU_LOONGSON2F) +=3D $(call =
cc-option,-march=3Dloongson2f,-march=3Dmips3) -Wa,--trap
>> # Some -march=3D flags enable MMI instructions, and GCC complains =
about that
>> # support being enabled alongside -msoft-float. Thus explicitly =
disable MMI.
>> cflags-$(CONFIG_CPU_LOONGSON2EF) +=3D $(call =
cc-option,-mno-loongson-mmi)
>>=20
>> Will make them build.
>=20
> Thank you for taking a look and the suggestion! I applied it and tried
> to build allnoconfig but I get
>=20
>  error: ABI 'o32' is not supported on CPU 'mips3'
>=20
> immediately, which could certainly be a bug in clang...

There is a clang patch:
https://reviews.llvm.org/D146269

I=E2=80=99ve seen this warning with CONFIG_MIPS32_O32 enabled, but I =
think that=E2=80=99s not the case for allnoconfig...

Thanks
Jiaxun

>=20
> Cheers,
> Nathan


