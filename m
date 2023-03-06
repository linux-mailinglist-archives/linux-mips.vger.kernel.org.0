Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 960176ACE83
	for <lists+linux-mips@lfdr.de>; Mon,  6 Mar 2023 20:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjCFTzk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Mar 2023 14:55:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjCFTzj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Mar 2023 14:55:39 -0500
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA3E064AAE
        for <linux-mips@vger.kernel.org>; Mon,  6 Mar 2023 11:55:37 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 2F3983200950;
        Mon,  6 Mar 2023 14:55:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 06 Mar 2023 14:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1678132536; x=1678218936; bh=wjRFLafO5+UkXxRW7xeQv6nssC0G5qSZ0pi
        M7Nw/R78=; b=T/IvqsShH6d0/yknkhygehYVpXSxAFhL7465GeUQ6ANndtcd/hE
        0UNX6HnBat1ieV2milm+mG3fMeQ1nuzTqmtSlWB5Kl8U5vQDRWGyE+nigo9oUtMb
        DhLuyoJWG4QcfupE5pY2Y3i8+FF0uIVbJBx94u/qvwCq6TKWGZ6kKhW+PWjjMtUS
        hp9ZeUk14uqvgD+Gra0kwdxIhFSRBfWPpqkBiqg2yAOWEMlrhOkP/xgq+APIdAgL
        CUXwA+n8MfSau3HmCtyHuPLA4bZULYIXxlHxB+aJ2NHj5fkPyLGVfOHTCXzCFa4z
        Fn4QH/aynQOTGRHxupGZPsdHH+7WlQ6ZYig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1678132536; x=1678218936; bh=wjRFLafO5+UkXxRW7xeQv6nssC0G5qSZ0pi
        M7Nw/R78=; b=KPavNYHxLz6bsQuSzwYyC6prjVoukFVKHMQt12bu6gm+wGroSk/
        EkYist00A6P1YedDZn18Ri6aBIKi7t2EtXXulkrpAmP5hbaOJJHSZ5Q7D82Lugmh
        VhEII1y7vKJZwFS0L85+ZKqvapQ2qQOpRSEUvmBnQUmx+W0Bn78YNw8qRxYwggsu
        F6EoEze4FnQUJVr2NkQ1EP66N4JNzepamECB5jkP5OBuazAQWTguwVTPwqijgMSO
        q6CKY98zakcMaleyrvezEzYfERC7h93dzbsQqutUikReCS2rcIjHnubJuVi6mdcg
        nrzrUXUUGMNyaFgXl1grUmmPTLjzwjWnMjA==
X-ME-Sender: <xms:OEUGZP9glzXvO2iTG3m9UJL0hYjUgljWBVllnNZZc2OUUTLQrzCm9A>
    <xme:OEUGZLuCo6eKUwosGwXQe03JQxCH3DZigqllRTyOMUeRnP6pTSKiVsnej_q8g7EZI
    F6FfxvX5OjKEa2HBS4>
X-ME-Received: <xmr:OEUGZNAD1-0UyvPuPs5D3Dgxa2tsYzgHJ9T2Fs6vDdN8yabIH57MSKSPocYVNwOITFVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtkedguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefh
    ffelvdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:OEUGZLfrnJrlb3mrFdO6tCnNJvBEe_Tnnafmk_ryk3xodaKPQcpOQw>
    <xmx:OEUGZEOLjgsIk7_r9rSwD2aD4a8sNtDwj_hVsBwq8lFSdsXS8xYnew>
    <xmx:OEUGZNkZevksdvWSWJ-hB_dZw2mgGBN8yP1bq2ru1Hj2ycRGeIHBPQ>
    <xmx:OEUGZNadWIAEnhyF5HgbKAeyBt3MGKtf-EO-uHFe-LAAffoUpZJ0jA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 14:55:35 -0500 (EST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH 04/12] MIPS: Octeon: Opt-out 4k_cache feature
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <b09d488f-ba4c-dba3-e2ee-87b5660dbdda@intel.com>
Date:   Mon, 6 Mar 2023 19:55:23 +0000
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A09E74C0-BA5A-4BAA-B6DD-74109090A153@flygoat.com>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
 <20230304221524.47160-5-jiaxun.yang@flygoat.com>
 <b09d488f-ba4c-dba3-e2ee-87b5660dbdda@intel.com>
To:     Alexander Lobakin <aleksander.lobakin@intel.com>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B43=E6=9C=886=E6=97=A5 14:28=EF=BC=8CAlexander Lobakin =
<aleksander.lobakin@intel.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Date: Sat,  4 Mar 2023 22:15:16 +0000
>=20
>> Octeon has a different cache interface with traditional R4K one,
>> just opt-out this flag for octeon to avoid run R4K cache =
initialization
>> code accidentally.
>>=20
>> Also remove ISA level assumption for 4k cache.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> arch/mips/include/asm/cpu-features.h | 2 +-
>> arch/mips/kernel/cpu-probe.c         | 2 ++
>> 2 files changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/arch/mips/include/asm/cpu-features.h =
b/arch/mips/include/asm/cpu-features.h
>> index c0983130a44c..c613426b0bfc 100644
>> --- a/arch/mips/include/asm/cpu-features.h
>> +++ b/arch/mips/include/asm/cpu-features.h
>> @@ -118,7 +118,7 @@
>> #define cpu_has_3k_cache __isa_lt_and_opt(1, MIPS_CPU_3K_CACHE)
>> #endif
>> #ifndef cpu_has_4k_cache
>> -#define cpu_has_4k_cache __isa_ge_or_opt(1, MIPS_CPU_4K_CACHE)
>> +#define cpu_has_4k_cache __opt(MIPS_CPU_4K_CACHE)
>=20
> This breaks compile-time optimization for this feature =3D> hurts
> performance on non-Octeon machines. Could this be done some other way?
> E.g. could this be defined depending on
> CONFIG_SYS_HAS_CPU_OCTEON_WHATEVER? Via its own cpu-features.h or =
here,
> that's the second question. So that the platforms which 100% can't =
have
> this family of CPUs wouldn't get affected.

Thanks for the comment.

This feature is only checked once during boot and never checked at =
runtime so I think impact
should be negligible.

Just don=E2=80=99t want to have another ifdef here :-)


Thanks
- Jiaxun=
