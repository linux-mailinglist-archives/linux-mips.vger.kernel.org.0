Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481F36E9C58
	for <lists+linux-mips@lfdr.de>; Thu, 20 Apr 2023 21:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjDTTQX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Apr 2023 15:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjDTTQW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Apr 2023 15:16:22 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150172705
        for <linux-mips@vger.kernel.org>; Thu, 20 Apr 2023 12:16:21 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 39F4B32001AB;
        Thu, 20 Apr 2023 15:16:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 20 Apr 2023 15:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm1; t=
        1682018177; x=1682104577; bh=pbDnR67Pa+Q38iOPlfqE8mwiOTvo9Nuikap
        uw/p64Lo=; b=yOrMxfK0a2MmAp31iOViwo4xNBnusHSCzcJTNZ9G4gdCgl7ijs2
        7lvKSqZ++OlJ1qDsHPFyI2W722/UR3F1s3NjzJ8awMxqv+UhTsWT+3mrEYDh301x
        s269uN1psuHFWBkFm2wGnXd7XeikdcUgsopxQfXtyU7Z4yrBw9Y/rHIy2sjt3RCV
        9T/hA1uiuuHTYAAd3FYT2GYX3iRtLBbLJ7B303S175Qeyy2hStToqU2Ea0UJjn2R
        ae26+isLh7h3EkQYRkBFwf5R0uUChToiigMMMPMDbjfKAK7lTve+7Ojd6rPOWqyr
        w7wlYnLCaUZL/x3TPyjvKpQ9hKCxHwHuJxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1682018177; x=1682104577; bh=pbDnR67Pa+Q38iOPlfqE8mwiOTvo9Nuikap
        uw/p64Lo=; b=P/TsETXMgMavuHW6rJV/JsznXP9ynOqTLNdMfU60yqdTaG8qrm7
        ZwQNlInSzLlTyJ4fTBrpGm4J08t02rc0hdF/08yowoekEtP7JLX7oUHPgbZ0FtAY
        NXUa3HfG9ckTvnRljzcn1PhDOvYiGKofYY+rAunvAXSlSBrTOAzC9KgGQbngf4Rc
        6nQwsrwFGoIB3my4iXbcoYX8EPm43jQOn1oTMstteNBn+inwp8iqoKbzuceLCA3k
        k8+0KntKqSoGP1nxfBXErUhtZgJvbuziL3FIm4W88BIzZy33kzszk8DatBAKVy5P
        4BqMMSe7QVJ5qZQbQqIBtDuqHo8x6TmP2yA==
X-ME-Sender: <xms:gY9BZODpYhn7iKaHVujRQm2xZX-wGdgZs-JjGfF4_NyV8BZK3PLeew>
    <xme:gY9BZIjwss_VUN4PRhwzf8vRJZLKucc_1hcz5g3XVJNVcjLpXF6UjtvhTSLJyyudH
    kQ9Sfr9C2-rVSfIl3I>
X-ME-Received: <xmr:gY9BZBnyCtjfA3rYZBIeleXdk4-XEdZvVl5liGlwbk4Axad1Vl4zMTbtokTkj4tMxCWE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedtvddgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhi
    rgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeduleefueeggfeitdfgkeeukeetjedvveelieeviedvueek
    ueeljefhleeugefhudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdifihhkihhpvg
    guihgrrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:gY9BZMz2GvQUPnYZAWqMAHMPJrfiX18TGWIu_l2vhq4eQ5dJ4sJMhA>
    <xmx:gY9BZDQhitFUU3BcJPfT_yFnl8vienSEbIBhJkCMoN8UCNP3p_Cnlg>
    <xmx:gY9BZHZ3e4b8k93gEYDBGu8DWJhbJWLZmXgyWlvncNDa2ky1KfXL-w>
    <xmx:gY9BZCGH3tysjKbQpcNzsdsOpQ4MAU8SjdYsKrfiuoM5lmkQUezKZQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Apr 2023 15:16:16 -0400 (EDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if
 unsupported
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <CAKwvOdkZA6DVCbgF=P1xZcHiyGFTnYvGReJZTzVnmeZdsH0L3w@mail.gmail.com>
Date:   Thu, 20 Apr 2023 20:16:05 +0100
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <5EBF3474-13B4-4920-AD14-B3F258303DC4@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com>
 <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
 <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
 <20230419221500.GA17797@alpha.franken.de>
 <CAKwvOdkZA6DVCbgF=P1xZcHiyGFTnYvGReJZTzVnmeZdsH0L3w@mail.gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



> 2023=E5=B9=B44=E6=9C=8820=E6=97=A5 17:32=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, Apr 19, 2023 at 3:15=E2=80=AFPM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
>>=20
>> On Wed, Apr 19, 2023 at 02:35:02PM -0700, Nick Desaulniers wrote:
>>> On Wed, Apr 19, 2023 at 9:50=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>>>=20
>>>>=20
>>>>=20
>>>>> 2023=E5=B9=B44=E6=9C=8818=E6=97=A5 21:07=EF=BC=8CNick Desaulniers =
<ndesaulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang =
<jiaxun.yang@flygoat.com> wrote:
>>>>>>=20
>>>>>> LLVM does not implement some of -march options. However those =
options
>>>>>> are not mandatory for kernel to build for those CPUs.
>>>>>>=20
>>>>>> Fallback -march CFLAG to ISA level if unsupported by toolchain so
>>>>>> we can get those kernel to build with LLVM.
>>>>>>=20
>>>>>> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
>>>>>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>>>=20
>>>>> Thanks for the patch! Maybe it's more obvious to folks who work on
>>>>> mips, but how did you determine that say `p5600` is `mips32r5` or
>>>>> `r10000` is `mips4`?
>>>>=20
>>>> Wikipedia [1] should fit the purpose.
>>>>=20
>>>> [1]: =
https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors
>>>=20
>>> Mostly! Though I was not able to verify:
>>> - p5600
>>=20
>> mips32r5
>>=20
>>> - r5500
>>=20
>> mips4
>>=20
>>> - rm5200
>>=20
>> mips4
>>=20
>>> - sb1
>>=20
>> mips64r1
>=20
> Thomas, thanks for reviewing datasheets to verify this.
>=20
> Jiaxun, for SB1, you have cc-option fall back to -march=3Dmips4, does
> that need to be -march=3Dmips64r1?

Yep, my bad, was reading the manual wrong.

Will fix in next rev.

Thanks.
- Jiaxun=
