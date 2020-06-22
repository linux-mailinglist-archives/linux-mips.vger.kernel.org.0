Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0951D203B8C
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jun 2020 17:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgFVPvW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Jun 2020 11:51:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:33900 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729571AbgFVPvS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Jun 2020 11:51:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jnOj4-0002AG-01; Mon, 22 Jun 2020 17:51:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2BBEEC06F0; Mon, 22 Jun 2020 17:45:28 +0200 (CEST)
Date:   Mon, 22 Jun 2020 17:45:28 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lichao Liu <liulichao@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS:Loongson-2EF:disable fix-loongson3-llsc in compiler
Message-ID: <20200622154528.GB17294@alpha.franken.de>
References: <20200611095924.29910-1-liulichao@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611095924.29910-1-liulichao@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 11, 2020 at 05:59:24PM +0800, Lichao Liu wrote:
> Firstly, Loongson-2EF support ll/sc instructions, but
> doesn't need fix-loongson3-llsc compile option.
> 
> Secondly, fix-loongson3-llsc will cause kernel startup
> fail at futex_init, because compiler will add 'sync' before
> 'll', which will affect __ex_table.
> futex_init will pass NULL uaddr parameter to
> futex_atomic_cmpxchg_inatomic.
> futex_atomic_cmpxchg_inatomic will access uaddr directly,
> which will cause page fault exception, the exception should be
> handled by __ex_table's nextinsn if the exception insn exsit in
> __ex_table. Because __ex_table is affected by compiler,
> the exception can not be handled, and
> futex_atomic_cmpxchg_inatomic will crash.
> 
> Error code as below:
> __ex_table.insn = 1b, which is 'sync' compiled with
> fix-loongson3-llsc, but the actual exception instrction is ll.
> So, do_page_fault will not find the correct inst in __ex_table, and
> can not handle this exception.
> 
>         "1: "user_ll("%1", "%3")"               \n"
>         "   bne %1, %z4, 3f             \n"
>         "   .set    pop                 \n"
>         "   move    $1, %z5                 \n"
>         "   .set    "MIPS_ISA_ARCH_LEVEL"           \n"
>         "2: "user_sc("$1", "%2")"               \n"
>         "   beqz    $1, 1b                  \n"
>         "3: " __SYNC_ELSE(full, loongson3_war, __WEAK_LLSC_MB) "\n"
>         "   .insn                       \n"
>         "   .set    pop                 \n"
>         "   .section .fixup,\"ax\"              \n"
>         "4: li  %0, %6                  \n"
>         "   j   3b                  \n"
>         "   .previous                   \n"
>         "   .section __ex_table,\"a\"           \n"
>         "   "__UA_ADDR "\t1b, 4b                \n"
>         "   "__UA_ADDR "\t2b, 4b                \n"
>         "   .previous
> 
> Signed-off-by: Lichao Liu <liulichao@loongson.cn>
> ---
>  arch/mips/loongson2ef/Platform | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
