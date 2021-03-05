Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A72F032DF99
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 03:22:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhCECWz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 21:22:55 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:43009 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229436AbhCECWy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 21:22:54 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 3A4515C00E2;
        Thu,  4 Mar 2021 21:22:54 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Thu, 04 Mar 2021 21:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=y
        GZQWgk++k5ZUwyk5li/KQ2k0+Ulpks2gEIK7gYVqIU=; b=V1IPfGZ8WIKliZwKR
        wZbJshwv7oaYfCmTwINOiDHlwMJMerf3jZAKQvzN2VkNUDQjuR8sUoYdeXHroUnv
        VFcBcnSYUPEps1eWEOAZiJPDRCbEyqxHHITtPt0aW2x4weAPv4CqAB8xgSL5qTwi
        tmvr6IRvmCUp8rvmvoo60dBDZeuR/LBGyCjdTGOzn2kKrscjAKze5kFRjRh9Pi5f
        rcuUroxdQVtjo25U4RTWyvpYbBPNFW/TrF7cSRi9MeV6USoWkwinotJT9gC+OiAQ
        zce4J/I1p/IDiG3KHrk171MfUdgRjPJQCyKpJUAB49fdSPOl9leYYQY3fglB0dLO
        4/J+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=yGZQWgk++k5ZUwyk5li/KQ2k0+Ulpks2gEIK7gYVq
        IU=; b=lzMzkV5CHrXJhqhHZTUsDKt+W2rQ983DO5YiMZMIB8I2WyTg+yBiludDY
        dgCMLijkwjSk3rkXk/tgalLgXH0VoLNZGqZOSBFNt+sXgZZZHULwgof3FIiKL4sG
        gwLwoesOY9J+URSoX3gGoJDiiOczAZwGXOoeW14EAgOVofFNOW7HxUf1UEzsAJsW
        dXCSQxsfr+VW0K7HPkBG4r0C1oShLt/ApizVCT3mf4NZFyQqb1xRCaC6UHQx3XYR
        G4q3Z31cYs1JTGQ+Q/pro5peshuhfzo6BJI4XZfG5cytR09EG/kj9dZhqPhLbRbG
        i+1puWle/hyDkxCvumApiXU+Zj/dQ==
X-ME-Sender: <xms:_JVBYKa1T7ufOuT1dBa2qi9mn3B8r4G02PEWj81KpjbM7bMGJd5fVw>
    <xme:_JVBYNaXIQ_IOZnQw3ze13-6FJE20GDoFxxg4HE6-38Hwq8ZhnOMjP7xbJQiiqXx1
    06BuhF4uQSq618M7f8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:_JVBYE9CYCTDsFLmHtr0KOZ4M_qzUwbHosYTsUt_Pw9JOGduiMuboQ>
    <xmx:_JVBYMqhRuCIgG7Hn-_hMrJDpjmTDY_yQzTkgkSXfR1qs3J2FihhFQ>
    <xmx:_JVBYFoj6oEolZ9WQAzOP4fvC67ZDQ8xCT2uY5u7k42Dk-0XnkYtiw>
    <xmx:_pVBYGfQTWm7EvxJKYtbrZC88eN64zSuOfHDpRauX35JONlSZ2UOMg>
Received: from [127.0.0.1] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id CB92B24005E;
        Thu,  4 Mar 2021 21:22:49 -0500 (EST)
Subject: Re: [PATCH] MIPS: Add comment about CONFIG_MIPS32_O32 in
 loongson3_defconfig when build with Clang
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1614820544-10686-1-git-send-email-yangtiezhu@loongson.cn>
 <alpine.DEB.2.21.2103042356150.51127@angie.orcam.me.uk>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d4802e65-52a0-f927-3e7c-80044c5bba80@flygoat.com>
Date:   Fri, 5 Mar 2021 10:22:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2103042356150.51127@angie.orcam.me.uk>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/3/5 ÉÏÎç7:08, Maciej W. Rozycki Ð´µÀ:
> On Thu, 4 Mar 2021, Tiezhu Yang wrote:
> 
>> This is a known bug [2] with Clang, as Simon Atanasyan said,
>> "There is no plan on support O32 for MIPS64 due to lack of
>> resources".
> 
>   Huh?  Is that a joke?  From the o32 psABI's point of view a MIPS64 CPU is
> exactly the same as a MIPS32 one (for whatever ISA revision), so there's
> nothing to support there really other than the CPU/ISA name.

Clang treat MIPS32 as a different backend so we may need some extra 
effort....

TBH it is a toolchain issue and kernel workaround seems bogus.

 From my point view we can "s/mips64r2/mips32r2" when doing syscall checks
to workaround clang issue instead of disable it for kernel.

Thanks.

- Jiaxun

> 
>   As much as I dislike all the hacks the Clang community seems to come up
> with for the shortcomings of their tool there has to be a saner workaround
> available rather than forcibly disabling support for the o32 ABI with
> CONFIG_64BIT kernels, but the report is missing the compiler invocation
> line triggering the issue (V=1 perhaps?), which should be included with
> any commit description anyway, so I can't suggest anything based on the
> limited information provided.
> 
>    Maciej
> 
