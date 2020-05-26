Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EEE1E22B3
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgEZNHQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 09:07:16 -0400
Received: from elvis.franken.de ([193.175.24.41]:39894 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728061AbgEZNHP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 09:07:15 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jdZIW-00088o-01; Tue, 26 May 2020 15:07:12 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id ACC34C041A; Tue, 26 May 2020 15:04:41 +0200 (CEST)
Date:   Tue, 26 May 2020 15:04:41 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     yuanjunqing <yuanjunqing66@163.com>
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
Subject: Re: [PATCH] MIPS: Fix IRQ tracing when call handle_fpe()
Message-ID: <20200526130441.GB8487@alpha.franken.de>
References: <20200525033123.13114-1-yuanjunqing66@163.com>
 <20200525084234.GA5057@alpha.franken.de>
 <76f2c756-0ae4-83f5-becf-6f1b3319f6fd@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76f2c756-0ae4-83f5-becf-6f1b3319f6fd@163.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 26, 2020 at 03:07:16PM +0800, yuanjunqing wrote:
> 
> 在 2020/5/25 下午4:42, Thomas Bogendoerfer 写道:
> > On Mon, May 25, 2020 at 11:31:23AM +0800, YuanJunQing wrote:
> >>  Register "a1" is unsaved in this function,
> >>  when CONFIG_TRACE_IRQFLAGS is enabled,
> >>  the TRACE_IRQS_OFF macro will call trace_hardirqs_off(),
> >>  and this may change register "a1".
> >>  The variment of register "a1" may send SIGFPE signal
> >>  to task when call do_fpe(),and this may kill the task.
> >>
> >> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
> >> ---
> >>  arch/mips/kernel/genex.S | 6 ++++--
> >>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> >> index 8236fb291e3f..956a76429773 100644
> >> --- a/arch/mips/kernel/genex.S
> >> +++ b/arch/mips/kernel/genex.S
> >> @@ -480,16 +480,18 @@ NESTED(nmi_handler, PT_SIZE, sp)
> >>  	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
> >>  	.set	mips1
> >>  	SET_HARDFLOAT
> >> -	cfc1	a1, fcr31
> >> +	cfc1	s0, fcr31
> >>  	.set	pop
> >>  	CLI
> >>  	TRACE_IRQS_OFF
> >> +	move    a1,s0
> >>  	.endm
> > do we realy need to read fcr31 that early ? Wouldn't it work to
> > just move the cfc1 below TRACE_IRQS_OFF ?
> >
> 
>  yes, it can work when we just move the cfc1 below TRACE_IRQS_OFF,
>  and the code is written as follows.
> 
>  	CLI
>  	TRACE_IRQS_OFF
>  	.set	mips1
>  	SET_HARDFLOAT
> 	cfc1	a1, fcr31
>  	.set	pop
>        .endm

good, could we do the same with _cfcmsa	a1, MSA_CSR in the msa case ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
