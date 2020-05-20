Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6766E1DA736
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 03:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgETBah (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 21:30:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:37712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726352AbgETBah (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 May 2020 21:30:37 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 26B8F207C4;
        Wed, 20 May 2020 01:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589938236;
        bh=Q+HLMRBkV81Dtycxf/UG3MwTuvd1l4W3KcQWQmxVgpI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=awov3PGX2b1xdAq+Fd2ysLtpcuRL7gqWYS9iV/ORyLPpLp3z6n/+yLSqxETSZjQX/
         IoAB5v6EjrALy705CHPCkeejbmQ4lAiP0x9j+wtZz4IwF66wu17BSyM2C0Vj6bP1Uj
         iRQi+0cB0ZutE5nc8k0Ul8Kp0sbBREAbhX2Uu+gI=
Date:   Tue, 19 May 2020 18:30:35 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 3/4] mm/memory.c: Add memory read privilege on page
 fault handling
Message-Id: <20200519183035.14fc56ba957266dde87a7778@linux-foundation.org>
In-Reply-To: <1589882610-7291-3-git-send-email-maobibo@loongson.cn>
References: <1589882610-7291-1-git-send-email-maobibo@loongson.cn>
        <1589882610-7291-3-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 19 May 2020 18:03:29 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> Here add pte_sw_mkyoung function to make page readable on MIPS
> platform during page fault handling. This patch improves page
> fault latency about 10% on my MIPS machine with lmbench
> lat_pagefault case.
> 
> It is noop function on other arches, there is no negative
> influence on those architectures.
> 
> --- a/arch/mips/include/asm/pgtable.h
> +++ b/arch/mips/include/asm/pgtable.h
> @@ -414,6 +414,8 @@ static inline pte_t pte_mkyoung(pte_t pte)
>  	return pte;
>  }
>  
> +#define pte_sw_mkyoung	pte_mkyoung
> +
>  #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
>  static inline int pte_huge(pte_t pte)	{ return pte_val(pte) & _PAGE_HUGE; }
>  
> --- a/include/asm-generic/pgtable.h
> +++ b/include/asm-generic/pgtable.h
> @@ -227,6 +227,21 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
>  }
>  #endif
>  
> +/*
> + * On some architectures hardware does not set page access bit when accessing
> + * memory page, it is responsibilty of software setting this bit. It brings
> + * out extra page fault penalty to track page access bit. For optimization page
> + * access bit can be set during all page fault flow on these arches.
> + * To be differentiate with macro pte_mkyoung, this macro is used on platforms
> + * where software maintains page access bit.
> + */
> +#ifndef pte_sw_mkyoung
> +static inline pte_t pte_sw_mkyoung(pte_t pte)
> +{
> +	return pte;
> +}
> +#endif

Yup, that's neat enough.  Thanks for making this change.  It looks like
all architectures include asm-generic/pgtable.h so that's fine.

It's conventional to add a

#define pte_sw_mkyoung pte_sw_mkyoung

immediately above the #endif there, so we can't try to implement
pte_sw_mkyoung() twice if this header gets included twice.  But the
header has #ifndef _ASM_GENERIC_PGTABLE_H around the whole thing so
that should be OK.

