Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D216F32E2A5
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 07:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCEG76 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 01:59:58 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:38047 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229446AbhCEG76 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 01:59:58 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 4A57A278D;
        Fri,  5 Mar 2021 01:59:57 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 05 Mar 2021 01:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=f
        aHJ/HZCgMSrhWbdGfXwMkj6STWLsowbnJ92MMdABQw=; b=R1t/W4DONx0KTPzJs
        Lx6KhALUg6awjFWfFc0IPagupj88KE2laVqlgKkSH3RI6A/F6LLuGtLVW7KSjbXh
        Q6j/YMEQ3e6hzTY3y9kCoOJApn8KHbPkilzMmizmGY6M9yGY8TDqzST7XRTBQYLf
        0WcLkwboSR2u7jP4YtG/oIWW15JqzOUbTTlnPYp5hxoh6V+Vuk2/ouURSSQCVWVH
        Nq4htlE9Ttj3sKkYCMRpAirPLrDBH362UBUFd82y1wvVnJkAQO9cXiqcy1b0b2Vo
        rThv06KTDomLQc3RE4+bMoBqlWPqhm32Q6Lt6re9/023/Q50sjiYTIT3u1AoLEfz
        JvlUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=faHJ/HZCgMSrhWbdGfXwMkj6STWLsowbnJ92MMdAB
        Qw=; b=FefBIcnwNaHiDWcWbY79Mqr3tBnImYBnMN08N/yr0NII2d7x2fkJGjpQw
        DXCwN4mgh5qUqbJyzJDS75Hqw2BtdH82CW7Rnh9q/MRu5yP4xmgU17WO7DIx4z9H
        LDYyNwKuAnrDprvDZ6Nu9TnihlHTe41GkAwEdFWfaAY2zkEYFT11y5mq76uAIYZQ
        i3bkydHHKTzW45Mwn3aeSSOvGfJEwnCt/lRR4CKTqzwZmZqbYz76PEICXzgdDUZT
        Fn/wb/2J8B5FbZyatbXtpw7RdiBA7M0ljEjoDuHtn5ao99e4WOF4xtq4L14D0W2E
        ahIJJ9JOcnT1XnbJ3+GV1Rit4gPqg==
X-ME-Sender: <xms:6tZBYApjF6cM7XL3f580xx4R9UONPUvinb8X0nhIaSeTXyDZ19xx8A>
    <xme:6tZBYGpDHmkhVkDQ6C6h1z5-JJWfojK4mpUazC3u5XvFKSinSnmq-01pVu7xOYnbi
    ZD6MozlzkP_hu8tZCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddthedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnheptdehgfeukeeiffevfe
    eiheekfeelfefgvdffieffveffgfduieeigfehvddvteefnecuffhomhgrihhnpehgvghn
    vgigrdhssgenucfkphepudduhedrvddvjedrudeihedrudehvdenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:6tZBYFNIjPsgMBUEKMYuxbB2f7akh3aDK3W7RBz2tDg8l4Doyo7nzg>
    <xmx:6tZBYH7JHA843xkfJTT0xPKTT0nytCqXkC4c7N-6O3u0ZGg-uW6Psg>
    <xmx:6tZBYP7CtIxE8lykCqpFAN0Qz64tNWSb2wPUTemaJYLbg42qJMN10Q>
    <xmx:7NZBYFRiYOUJsHNE0VwdtprQC5ExynZu829gkb8AKiDzuFNpg25-DQ>
Received: from [192.168.1.205] (unknown [115.227.165.152])
        by mail.messagingengine.com (Postfix) with ESMTPA id 82FC91080054;
        Fri,  5 Mar 2021 01:59:37 -0500 (EST)
Subject: Re: [PATCH] MIPS: Support large stack.
To:     HongJieDeng <deng.hongjie@h3c.com>, tsbogend@alpha.franken.de
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn, denghongjie@h3c.com
References: <20210305031257.14936-1-deng.hongjie@h3c.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <54185bbe-907e-2e0b-8498-8214128d7847@flygoat.com>
Date:   Fri, 5 Mar 2021 14:59:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305031257.14936-1-deng.hongjie@h3c.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/3/5 11:12, HongJieDeng Ð´µÀ:
> From: Hongjie Deng <deng.hongjie@h3c.com>
>
> We need more stack space, xori/ori no longer apply when
>   _THREAD_MASK exceeds 16 bits
>
> Signed-off-by: Hongjie Deng <deng.hongjie@h3c.com>
> ---
>   arch/mips/include/asm/stackframe.h | 8 ++++++++
>   arch/mips/kernel/genex.S           | 6 ++++++
>   2 files changed, 14 insertions(+)
>
> diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
> index aa430a6..6ebc39f 100644
> --- a/arch/mips/include/asm/stackframe.h
> +++ b/arch/mips/include/asm/stackframe.h
> @@ -278,8 +278,16 @@
>   		sll	k0, 3		/* extract cu0 bit */
>   		bltz	k0, 9f
>   
> +#if    _THREAD_MASK  < (1 << 16 - 1)
>   		ori	$28, sp, _THREAD_MASK
>   		xori	$28, _THREAD_MASK
> +#else
> +		li      $28,   _THREAD_MASK
> +		or  $28,  sp,  $28
> +		li  $24, _THREAD_MASK
> +		xor   $28, $28, $24

Hi Hongjie,

li breaks MIPS64, please try PTR_LI instead.
Also loading immediate cost a lot on MIPS,
you may save a unnecessary li by:

+		PTR_LI  v1,   _THREAD_MASK
+		or      gp,  sp,  v1
+		xor     gp,  gp,  v1

Also clobber v0/v1 seems much more reasonable than $24 here....

> +#endif
> +
>   #ifdef CONFIG_CPU_CAVIUM_OCTEON
>   		.set    mips64
>   		pref    0, 0($28)       /* Prefetch the current pointer */
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index bcce32a..5ea4fe4 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -662,8 +662,14 @@ isrdhwr:
>   #endif
>   	MTC0	k0, CP0_EPC
>   	/* I hope three instructions between MTC0 and ERET are enough... */
> +#if    _THREAD_MASK  < (1 << 16 - 1)
>   	ori	k1, _THREAD_MASK
>   	xori	k1, _THREAD_MASK
> +#else
> +	li  $24 ,_THREAD_MASK
> +	or   k1, k1, $24
> +	xor   k1, k1, $24
> +#endif
Ditto.

Actually another possible solution could be `.set at=v1` around it
and let aeembler to decide if it needs a extra register.

Thanks.

- Jiaxun
>   	LONG_L	v1, TI_TP_VALUE(k1)
>   	.set	push
>   	.set	arch=r4000

