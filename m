Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75A82689C9
	for <lists+linux-mips@lfdr.de>; Mon, 14 Sep 2020 13:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725968AbgINLN2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Sep 2020 07:13:28 -0400
Received: from elvis.franken.de ([193.175.24.41]:38262 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725977AbgINLMW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 14 Sep 2020 07:12:22 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kHmOg-0003Bp-01; Mon, 14 Sep 2020 13:11:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 823AEC0FAF; Mon, 14 Sep 2020 13:11:18 +0200 (CEST)
Date:   Mon, 14 Sep 2020 13:11:18 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH V6 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200914111118.GB8974@alpha.franken.de>
References: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
 <1599473169-6599-2-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1599473169-6599-2-git-send-email-chenhc@lemote.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 07, 2020 at 06:06:08PM +0800, Huacai Chen wrote:
> 
> diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
> index 409cb48..9fc88ec 100644
> --- a/arch/mips/boot/compressed/head.S
> +++ b/arch/mips/boot/compressed/head.S
> @@ -14,11 +14,16 @@
>  
>  #include <asm/asm.h>
>  #include <asm/regdef.h>
> +#include <asm/mipsregs.h>
>  
>  	.set noreorder
>  	.cprestore
>  	LEAF(start)
>  start:
> +	mfc0    t0, CP0_STATUS
> +	or	t0, ST0_KERNEL_CUMASK
> +	mtc0    t0, CP0_STATUS
> +
>  	/* Save boot rom start args */
>  	move	s0, a0
>  	move	s1, a1

please to compiler flags in arch/mips/boot/compressed/Makefile to
disable generation of instruction not supported, if CU2 is disabled
(and don't forget about 2ef).

Rest of the patch LGTM.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
