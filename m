Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E0D1C8244
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 08:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726235AbgEGGNH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 02:13:07 -0400
Received: from [115.28.160.31] ([115.28.160.31]:49798 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725809AbgEGGNG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 02:13:06 -0400
Received: from hanazono.local (unknown [116.236.177.50])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 38953600B4;
        Thu,  7 May 2020 14:13:03 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1588831983; bh=gJE2XOR81V9RBUrOJZ4bBHo/8EGWu7sXJKtaObUFykg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ASCFRiFgISzby0+y0I9EV86uw50rRHR15NPtY3JGhOvGPMVMlCySy5VyaeLWvsra8
         F1QhJwAavWqrUw2hTK1Z+XHTMH5leG/mNry+HiHRhIic4pcMSsHLHzDuZzCmZsVrMi
         vibB4F6aisZjWV0mo4ctMC9woFZdr+I4JSYutcAE=
Subject: Re: [PATCH] MIPS: asm: Use __ASSEMBLY__ to guard some macros to avoid
 build error
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1588830863-30416-1-git-send-email-chenhc@lemote.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <abdd1464-277e-3921-5714-39a8058d06a8@xen0n.name>
Date:   Thu, 7 May 2020 14:13:02 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <1588830863-30416-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020/5/7 13:54, Huacai Chen wrote:

> Use __ASSEMBLY__ to guard definitions of some macros (PANIC and PRINT)
> to avoid build error:
>
> 1, PANIC conflicts with drivers/scsi/smartpqi/smartpqi_init.c
> 2, PRINT conflicts with net/netfilter/nf_conntrack_h323_asn1.c and net/
>     mac80211/debugfs_sta.c
>
> Fixes: d339cd02b888eb8c ("MIPS: Move unaligned load/store helpers to inst.h")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   arch/mips/include/asm/asm.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 934465d..b01762ab 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -74,6 +74,8 @@ symbol:		.insn
>   		.globl	symbol;				\
>   symbol		=	value
>   
> +#ifdef __ASSEMBLY__
> +
>   #define PANIC(msg)					\
>   		.set	push;				\
>   		.set	reorder;			\
> @@ -98,6 +100,8 @@ symbol		=	value
>   #define PRINT(string)
>   #endif
>   
> +#endif
> +
>   #define TEXT(msg)					\
>   		.pushsection .data;			\
>   8:		.asciiz msg;				\

It looks like the whole file is meant for assembly code, not just the 
couple of conflicting definitions that were caught. At least the parts 
containing assembler directives are nothing to be consumed by C code.

Maybe wrap the whole file and see if it correctly builds?

