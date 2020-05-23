Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41811DF4DD
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 06:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgEWEnK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 00:43:10 -0400
Received: from [115.28.160.31] ([115.28.160.31]:55914 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725294AbgEWEnK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 May 2020 00:43:10 -0400
Received: from [192.168.9.172] (unknown [112.65.48.98])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 74F286006D;
        Sat, 23 May 2020 12:42:58 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590208978; bh=NKGbDzbUCGnrOJgcFJwa9jUjh2FkZQIHObKoPn+oUxw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GQ3uy2qMEtqGvtnvR5jlzI8VvuXmhMC/u3aUSaCkYtDy+lRbtrza/kUJoe13Q1Obh
         JXBSJvyXizS8cW5hKfzLnDwz0uXqs4bpWy9HctGECmhCBDBwocxUx/IOsoeA0PSO0L
         md2IMQrYxHjf+cVw4SC4avbd8AgiMiqx2RqG4Oc4=
Subject: Re: [PATCH] MIPS: Tidy up CP0.Config6 bits definition
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1590207940-20157-1-git-send-email-chenhc@lemote.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <7e1a0ef8-6feb-3440-9e30-45cd912194a3@xen0n.name>
Date:   Sat, 23 May 2020 12:42:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <1590207940-20157-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Huacai,

On 5/23/20 12:25 PM, Huacai Chen wrote:
> CP0.Config6 is a Vendor-defined register whose bits definitions are
> different from one to another. Recently, Xuerui's Loongson-3 patch and
> Serge's P5600 patch make the definitions inconsistency and unclear. To
> make life easy, this patch tidy the definition up.
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   arch/mips/include/asm/mipsregs.h | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
> index fe6293f..e89eeb9 100644
> --- a/arch/mips/include/asm/mipsregs.h
> +++ b/arch/mips/include/asm/mipsregs.h
> @@ -690,6 +690,12 @@
>   #define MIPS_CONF6_JRCD		(_ULCAST_(1) << 0)
>   /* MIPSr6 extensions enable */
>   #define MIPS_CONF6_R6		(_ULCAST_(1) << 2)
> +/* Loongson-3 internal timer bit */
> +#define MIPS_CONF6_INTIMER	(_ULCAST_(1) << 6)
> +/* Loongson-3 external timer bit */
> +#define MIPS_CONF6_EXTIMER	(_ULCAST_(1) << 7)

These two are not present before, maybe split into two patches?

Also, actually this register is called GSConfig in Loongson's manuals; 
the register bears no resemblance to the actual Config6 on P5600 and the 
likes, it just happens to occupy the same position. So maintaining the 
sorting order actually hurts readability and maintainability IMO.

Maybe reflect this (sad or not, but things happen) truth through naming, 
and group the Loongson bits together?

> +/* Loongson-3 SFB on/off bit */
> +#define MIPS_CONF6_SFBEN	(_ULCAST_(1) << 8)
This bit is called "STFill" in Loongson 3A3000/3B3000 User Manual Volume 
2. Is Loongson renaming things between releases?
>   /* IFU Performance Control */
>   #define MIPS_CONF6_IFUPERFCTL	(_ULCAST_(3) << 10)
>   #define MIPS_CONF6_SYND		(_ULCAST_(1) << 13)
> @@ -697,16 +703,16 @@
>   #define MIPS_CONF6_SPCD		(_ULCAST_(1) << 14)
>   /* proAptiv FTLB on/off bit */
>   #define MIPS_CONF6_FTLBEN	(_ULCAST_(1) << 15)
> +/* Loongson-3's LL on exclusive cacheline */
> +#define MIPS_CONF6_LLEXC	(_ULCAST_(1) << 16)
> +/* Loongson-3's SC has a random delay */
> +#define MIPS_CONF6_SCRAND	(_ULCAST_(1) << 17)
>   /* Disable load/store bonding */
>   #define MIPS_CONF6_DLSB		(_ULCAST_(1) << 21)
>   /* Loongson-3 FTLB on/off bit */
>   #define MIPS_CONF6_FTLBDIS	(_ULCAST_(1) << 22)
>   /* FTLB probability bits */
>   #define MIPS_CONF6_FTLBP_SHIFT	(16)
> -/* Loongson-3 feature bits */
> -#define MIPS_CONF6_LOONGSON_SCRAND	(_ULCAST_(1) << 17)
> -#define MIPS_CONF6_LOONGSON_LLEXC	(_ULCAST_(1) << 16)
> -#define MIPS_CONF6_LOONGSON_STFILL	(_ULCAST_(1) << 8)
>   
>   #define MIPS_CONF7_WII		(_ULCAST_(1) << 31)
>   
