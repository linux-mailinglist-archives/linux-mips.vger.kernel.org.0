Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A146C1E0927
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 10:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388800AbgEYInZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 04:43:25 -0400
Received: from elvis.franken.de ([193.175.24.41]:38038 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388465AbgEYInZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 May 2020 04:43:25 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jd8hc-0005hs-00; Mon, 25 May 2020 10:43:20 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9337CC01DC; Mon, 25 May 2020 10:42:34 +0200 (CEST)
Date:   Mon, 25 May 2020 10:42:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YuanJunQing <yuanjunqing66@163.com>
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
Subject: Re: [PATCH] MIPS: Fix IRQ tracing when call handle_fpe()
Message-ID: <20200525084234.GA5057@alpha.franken.de>
References: <20200525033123.13114-1-yuanjunqing66@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525033123.13114-1-yuanjunqing66@163.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 25, 2020 at 11:31:23AM +0800, YuanJunQing wrote:
>  Register "a1" is unsaved in this function,
>  when CONFIG_TRACE_IRQFLAGS is enabled,
>  the TRACE_IRQS_OFF macro will call trace_hardirqs_off(),
>  and this may change register "a1".
>  The variment of register "a1" may send SIGFPE signal
>  to task when call do_fpe(),and this may kill the task.
> 
> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
> ---
>  arch/mips/kernel/genex.S | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index 8236fb291e3f..956a76429773 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -480,16 +480,18 @@ NESTED(nmi_handler, PT_SIZE, sp)
>  	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
>  	.set	mips1
>  	SET_HARDFLOAT
> -	cfc1	a1, fcr31
> +	cfc1	s0, fcr31
>  	.set	pop
>  	CLI
>  	TRACE_IRQS_OFF
> +	move    a1,s0
>  	.endm

do we realy need to read fcr31 that early ? Wouldn't it work to
just move the cfc1 below TRACE_IRQS_OFF ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
