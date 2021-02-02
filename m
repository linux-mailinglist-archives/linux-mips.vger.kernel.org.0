Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC8630CE79
	for <lists+linux-mips@lfdr.de>; Tue,  2 Feb 2021 23:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhBBWLU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 2 Feb 2021 17:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhBBWLQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 2 Feb 2021 17:11:16 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE0B6C061573;
        Tue,  2 Feb 2021 14:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=VGx6dp8E3MiOEGg9sTAA8kLGERnxuvnuYwx86Z5fJIU=; b=WwGoFXdGMKbPB6P+VM9Wb11IaM
        WdHX2U2hoBuF1+OUPcQZrjzrlmAC04ZF3oVEZE0Qi+ev37TEfSCUB1Xx8xm4e63KBwOGmIfub+QbX
        W3ArGOn+OJ9eIwI9a1rcNZndAZjNyhnxI7tWUqwTJQriZcohXFpuaM84R45BTtkOfWpHI8WY4Rk9R
        KehzFvCd5iAV0t0AcIIk31b/sLLKYEjwO6mgOsb6WwQD5BhWIfb6izl43R5lStNT9UEcA0AzE2w+R
        pmTqhbPSiFDpHIDDIMz8bWL8HJbcPGIg0afTS1ZQQcM/OL82M49nbebUyaUgzGU4YyrtUYpT7A6wk
        iVORklZA==;
Received: from [2601:1c0:6280:3f0::2a53]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l73sW-0007CK-Fr; Tue, 02 Feb 2021 22:10:32 +0000
Subject: Re: [PATCH V2] arch: mips: kernel: Fix two spelling in smp.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        tsbogend@alpha.franken.de, peterz@infradead.org,
        frederic@kernel.org, peterx@redhat.com, afzal.mohd.ma@gmail.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210202091811.21057-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <48d97448-ae8c-4a2e-15e9-b7cdfe4f1746@infradead.org>
Date:   Tue, 2 Feb 2021 14:10:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210202091811.21057-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/2/21 1:18 AM, Bhaskar Chowdhury wrote:
> s/logcal/logical/
> s/intercpu/inter-CPU/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Changes from V1 :
>    Bart point out actual sentence construction was right,so keep it as it is.
>    Randy suggested to put better spelling casing,so inducted
>    Subject line adjusted accoring to the change
>  arch/mips/kernel/smp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 74b9102fd06e..ef86fbad8546 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -59,7 +59,7 @@ static DECLARE_COMPLETION(cpu_starting);
>  static DECLARE_COMPLETION(cpu_running);
> 
>  /*
> - * A logcal cpu mask containing only one VPE per core to
> + * A logical cpu mask containing only one VPE per core to
>   * reduce the number of IPIs on large MT systems.
>   */
>  cpumask_t cpu_foreign_map[NR_CPUS] __read_mostly;
> @@ -510,8 +510,8 @@ static inline void smp_on_each_tlb(void (*func) (void *info), void *info)
>   * address spaces, a new context is obtained on the current cpu, and tlb
>   * context on other cpus are invalidated to force a new context allocation
>   * at switch_mm time, should the mm ever be used on other cpus. For
> - * multithreaded address spaces, intercpu interrupts have to be sent.
> - * Another case where intercpu interrupts are required is when the target
> + * multithreaded address spaces, inter-CPU interrupts have to be sent.
> + * Another case where inter-CPU interrupts are required is when the target
>   * mm might be active on another cpu (eg debuggers doing the flushes on
>   * behalf of debugees, kswapd stealing pages from another process etc).
>   * Kanoj 07/00.
> --
> 2.26.2
> 


-- 
~Randy

