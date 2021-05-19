Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E42388FB4
	for <lists+linux-mips@lfdr.de>; Wed, 19 May 2021 16:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241875AbhESOBh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 May 2021 10:01:37 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37055 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231627AbhESOBf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 May 2021 10:01:35 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id D83391ABB;
        Wed, 19 May 2021 10:00:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Wed, 19 May 2021 10:00:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=B
        nbndRIlPAC3lNeO9HvB61BMifoaS36zuFiF7bSK8+M=; b=SYuHWtQQIXUFRy9jc
        eIUVW/RWqSETHBJpPO4r+fILVJQS6oiPyXpBBX6kxmDUplHeLRsf3uHf6kw3wOLy
        K0Q100BPJoIEtBES3ax44LBi4lE42QUeuCxkgYVipYZ+BFOakFSgwIX0G1YJbysF
        9FT4A8jVM5oqyvNjYX5Tga53ucFL/3/Zf4dc+G3QwCyg4okcWTNfu/Ejasqx0s9a
        0gMLhGfBUTtVePHH6aaD1n/Z5AlMRE5pXm81tP1GkqdSTTztYwI+BmE/lbxRyqam
        Xn7P2oFj4xc20VPtSfWV8fPaH9H+WXFLpFTpFoj57LzfBiCF1lBM18M2mobeWa3L
        Sg5gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=BnbndRIlPAC3lNeO9HvB61BMifoaS36zuFiF7bSK8
        +M=; b=VsnZbaYLVkTd+xhU+lKOFvaamQ8+9Xj1x5glGITkpg5n8oCZn5g2x7giz
        Z6VZsrfITcJSF3nd+znmRYzTKnBUE4mhk8QBz9aevWhZ6928/ksjsJ02lw0Wy5OM
        250yV/rvgClyJ37V0brRBT61L6LR0hmpFmV/IGqcPrEi4B61XuXethlZIQaOJzCE
        oXryvP3YaO2qJda0+H+EQoGD08oUJwxiTy/0omyWCpyVfvCmBWdVmFZ7bfGEjJr8
        yO4tfoEQRMgjB/9DS/z8pml1aoMyid7ZElwoaFFmQGF1MSgBIfZbtysh1e/wV07o
        3r60NbzeQyXlFuaR7BXOo0+d3YCtQ==
X-ME-Sender: <xms:7RmlYJovhPjvq_B4bZ5QZ80rvuMt0QzrA_xvTjzxDhcl2H1STJx3UQ>
    <xme:7RmlYLq8-kisLsC3VO1lY57H9KYhiJtK-2ReB1hj6j_7Xtui0Ea_lfryIZ_gJjl_t
    mfVLUJqdhdsGtBQnfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiledgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecukfhppeefledrudeggedr
    geehrddvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:7RmlYGPPKZeiTr_lJoq2-4DHnr1bdHXJBpkgSFeEh9ZP11VWvhzBfQ>
    <xmx:7RmlYE6rRzulUAtxJlVBEQ1_9CUBozV_qOD3DM6z4YLERBc39dXGwg>
    <xmx:7RmlYI7Il21e3jf5MMY3bWBMtzLexT639F7-uAYRCcad0ajPcQM1GQ>
    <xmx:7hmlYIEZclFlns8CKTfoFuQXFNrw-ge2tXJd2WC5f1JZmzn_ngL7RQ>
Received: from [192.168.143.245] (unknown [39.144.45.29])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Wed, 19 May 2021 10:00:11 -0400 (EDT)
Subject: Re: [PATCH] arch/mips/boot/compressed/string.c: Fix build warnings
To:     zhaoxiao <zhaoxiao@uniontech.com>, tsbogend@alpha.franken.de
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210519084405.27364-1-zhaoxiao@uniontech.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <8d01b52e-6687-a624-6a76-97b4b71d999e@flygoat.com>
Date:   Wed, 19 May 2021 22:00:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519084405.27364-1-zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/5/19 16:44, zhaoxiao Ð´µÀ:
> Fixes the following W=1 kernel build warning(s):
> arch/mips/boot/compressed/string.c:11:7: warning: no previous prototype for 'memcpy' [-Wmissing-prototypes]
>   void *memcpy(void *dest, const void *src, size_t n)
>         ^~~~~~
> arch/mips/boot/compressed/string.c:22:7: warning: no previous prototype for 'memset' [-Wmissing-prototypes]
>   void *memset(void *s, int c, size_t n)
>         ^~~~~~
> arch/mips/boot/compressed/string.c:32:15: warning: no previous prototype for 'memmove' [-Wmissing-prototypes]
>   void * __weak memmove(void *dest, const void *src, size_t n)
Hi Xiao,

Are you sure you know what you're doing?

They're supposed to be called by external reference in vmlinuz.
Marking them static makes no sense.

Thanks.

- Jiaxun
>                 ^~~~~~~
>
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> ---
>   arch/mips/boot/compressed/string.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/boot/compressed/string.c b/arch/mips/boot/compressed/string.c
> index 0b593b709228..d28996509f91 100644
> --- a/arch/mips/boot/compressed/string.c
> +++ b/arch/mips/boot/compressed/string.c
> @@ -8,7 +8,7 @@
>   #include <linux/compiler_attributes.h>
>   #include <linux/types.h>
>   
> -void *memcpy(void *dest, const void *src, size_t n)
> +static void *memcpy(void *dest, const void *src, size_t n)
>   {
>   	int i;
>   	const char *s = src;
> @@ -19,7 +19,7 @@ void *memcpy(void *dest, const void *src, size_t n)
>   	return dest;
>   }
>   
> -void *memset(void *s, int c, size_t n)
> +static void *memset(void *s, int c, size_t n)
>   {
>   	int i;
>   	char *ss = s;
> @@ -29,7 +29,7 @@ void *memset(void *s, int c, size_t n)
>   	return s;
>   }
>   
> -void * __weak memmove(void *dest, const void *src, size_t n)
> +static void * __weak memmove(void *dest, const void *src, size_t n)
>   {
>   	unsigned int i;
>   	const char *s = src;

