Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62639413F74
	for <lists+linux-mips@lfdr.de>; Wed, 22 Sep 2021 04:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhIVCbK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Sep 2021 22:31:10 -0400
Received: from out2.migadu.com ([188.165.223.204]:46836 "EHLO out2.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229465AbhIVCbK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Sep 2021 22:31:10 -0400
Subject: Re: [PATCH v4] MIPS: loongson64: make CPU_LOONGSON64 depends on
 MIPS_FP_SUPPORT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1632277779;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BcrGR2UjT1lcx/KUUkawmP7pCBkRd7mz1LkYmb6ecEg=;
        b=kpuuaio9b+3go3Ns4QxFt89b6YSPeNlnV2zdbXS4N5hZpBXH37NuQaoCeHu78yBXF1J7dl
        e1vIkAddaGiqQp59uKUv1dUxTmxgn54XQp1YKHFkCUldECgnvyPm5EjUCX5ZLD8zEdWIqU
        S5edmsr6jIFo9mHzIKiDRHgHv2zQd0Q=
To:     tsbogend@alpha.franken.de
Cc:     chenhuacai@kernel.org, linux-mips@vger.kernel.org
References: <20210913061908.550030-1-liu.yun@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jackie Liu <liu.yun@linux.dev>
Message-ID: <842effcd-3f1b-e793-fa31-be0023c04cf6@linux.dev>
Date:   Wed, 22 Sep 2021 10:29:32 +0800
MIME-Version: 1.0
In-Reply-To: <20210913061908.550030-1-liu.yun@linux.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ping, would anyone take this patch?

在 2021/9/13 下午2:19, Jackie Liu 写道:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> mach/loongson64 fails to build when the FPU support is disabled:
> 
> arch/mips/loongson64/cop2-ex.c:45:15: error: implicit declaration of function ‘__is_fpu_owner’; did you mean ‘is_fpu_owner’? [-Werror=implicit-function-declaration]
> arch/mips/loongson64/cop2-ex.c:98:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:99:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:131:43: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:137:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:203:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:219:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:283:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:301:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> 
> Fixes: ef2f826c8f2f ("MIPS: Loongson-3: Enable the COP2 usage")
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>
> Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
> Reported-by: k2ci robot <kernel-bot@kylinos.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>   v1->v2:
>   move MIPS_FP_SUPPORT from MACH_LOONGSON64 to CPU_LOONGSON64
> 
>   v2->v3:
>   add Huacai Chen <chenhc@lemote.com>'s suggest label.
> 
>   v3->v4:
>   update Huacai Chen's email address.
> 
>   arch/mips/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 24e374266fdc..aea3aa16a38e 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1408,6 +1408,7 @@ config CPU_LOONGSON64
>   	select MIPS_ASID_BITS_VARIABLE
>   	select MIPS_PGD_C0_CONTEXT
>   	select MIPS_L1_CACHE_SHIFT_6
> +	select MIPS_FP_SUPPORT
>   	select GPIOLIB
>   	select SWIOTLB
>   	select HAVE_KVM
> 
