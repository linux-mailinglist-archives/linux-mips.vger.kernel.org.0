Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912422DFC91
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 15:11:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgLUOKq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 21 Dec 2020 09:10:46 -0500
Received: from aposti.net ([89.234.176.197]:59550 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725807AbgLUOKp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Dec 2020 09:10:45 -0500
Date:   Mon, 21 Dec 2020 14:09:53 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: zboot: head.S clean up
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Message-Id: <HO0PLQ.1VZP0U76MARY1@crapouillou.net>
In-Reply-To: <20201221130048.7753-1-jiaxun.yang@flygoat.com>
References: <20201221130048.7753-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

Le lun. 21 déc. 2020 à 21:00, Jiaxun Yang <jiaxun.yang@flygoat.com> a 
écrit :
> .cprestore is removed as we don't except Position Independent
> zboot ELF.
> 
> .noreorder is also removed and rest instructions is massaged
> to improve readability.
> 
> t9 register is used to indirect jump as MIPS ABI requirement.
> 
> Reported-by: Paul Cercueil <paul@crapouillou.net>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/boot/compressed/head.S | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/mips/boot/compressed/head.S 
> b/arch/mips/boot/compressed/head.S
> index 409cb483a9ff..977218c90bc8 100644
> --- a/arch/mips/boot/compressed/head.S
> +++ b/arch/mips/boot/compressed/head.S
> @@ -15,8 +15,6 @@
>  #include <asm/asm.h>
>  #include <asm/regdef.h>
> 
> -	.set noreorder
> -	.cprestore
>  	LEAF(start)
>  start:

You can also remove the 'start' label, since it's declared inside the 
LEAF() macro as well. GNU's assembler won't mind, but LLVM will choke 
on that.

Cheers,
-Paul

>  	/* Save boot rom start args */
> @@ -35,21 +33,20 @@ start:
>  	PTR_LA	a0, (.heap)	     /* heap address */
>  	PTR_LA	sp, (.stack + 8192)  /* stack address */
> 
> -	PTR_LA	ra, 2f
> -	PTR_LA	k0, decompress_kernel
> -	jr	k0
> -	 nop
> +	PTR_LA	t9, decompress_kernel
> +	jalr	t9
> +
>  2:
>  	move	a0, s0
>  	move	a1, s1
>  	move	a2, s2
>  	move	a3, s3
> -	PTR_LI	k0, KERNEL_ENTRY
> -	jr	k0
> -	 nop
> +	PTR_LI	t9, KERNEL_ENTRY
> +	jalr	t9
> +
>  3:
>  	b	3b
> -	 nop
> +
>  	END(start)
> 
>  	.comm .heap,BOOT_HEAP_SIZE,4
> --
> 2.29.2
> 


