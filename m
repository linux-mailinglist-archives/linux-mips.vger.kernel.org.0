Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6437D214BA2
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jul 2020 11:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgGEJtn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Jul 2020 05:49:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:49396 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgGEJtn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 5 Jul 2020 05:49:43 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1js1HF-0002u8-01; Sun, 05 Jul 2020 11:49:37 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EAED3C077D; Sun,  5 Jul 2020 11:48:11 +0200 (CEST)
Date:   Sun, 5 Jul 2020 11:48:11 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Xingxing Su <suxingxing@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH] MIPS: Do not use smp_processor_id() in preemptible code
Message-ID: <20200705094811.GB4064@alpha.franken.de>
References: <1593749518-16722-1-git-send-email-suxingxing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593749518-16722-1-git-send-email-suxingxing@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 03, 2020 at 12:11:58PM +0800, Xingxing Su wrote:
> Use preempt_disable() to fix the following bug under CONFIG_DEBUG_PREEMPT.
> 
> [   21.915305] BUG: using smp_processor_id() in preemptible [00000000] code: qemu-system-mip/1056
> [   21.923996] caller is do_ri+0x1d4/0x690
> [   21.927921] CPU: 0 PID: 1056 Comm: qemu-system-mip Not tainted 5.8.0-rc2 #3
> [   21.934913] Stack : 0000000000000001 ffffffff81370000 ffffffff8071cd60 a80f926d5ac95694
> [   21.942984]         a80f926d5ac95694 0000000000000000 98000007f0043c88 ffffffff80f2fe40
> [   21.951054]         0000000000000000 0000000000000000 0000000000000001 0000000000000000
> [   21.959123]         ffffffff802d60cc 98000007f0043dd8 ffffffff81f4b1e8 ffffffff81f60000
> [   21.967192]         ffffffff81f60000 ffffffff80fe0000 ffff000000000000 0000000000000000
> [   21.975261]         fffffffff500cce1 0000000000000001 0000000000000002 0000000000000000
> [   21.983331]         ffffffff80fe1a40 0000000000000006 ffffffff8077f940 0000000000000000
> [   21.991401]         ffffffff81460000 98000007f0040000 98000007f0043c80 000000fffba8cf20
> [   21.999471]         ffffffff8071cd60 0000000000000000 0000000000000000 0000000000000000
> [   22.007541]         0000000000000000 0000000000000000 ffffffff80212ab4 a80f926d5ac95694
> [   22.015610]         ...
> [   22.018086] Call Trace:
> [   22.020562] [<ffffffff80212ab4>] show_stack+0xa4/0x138
> [   22.025732] [<ffffffff8071cd60>] dump_stack+0xf0/0x150
> [   22.030903] [<ffffffff80c73f5c>] check_preemption_disabled+0xf4/0x100
> [   22.037375] [<ffffffff80213b84>] do_ri+0x1d4/0x690
> [   22.042198] [<ffffffff8020b828>] handle_ri_int+0x44/0x5c
> [   24.359386] BUG: using smp_processor_id() in preemptible [00000000] code: qemu-system-mip/1072
> [   24.368204] caller is do_ri+0x1a8/0x690
> [   24.372169] CPU: 4 PID: 1072 Comm: qemu-system-mip Not tainted 5.8.0-rc2 #3
> [   24.379170] Stack : 0000000000000001 ffffffff81370000 ffffffff8071cd60 a80f926d5ac95694
> [   24.387246]         a80f926d5ac95694 0000000000000000 98001007ef06bc88 ffffffff80f2fe40
> [   24.395318]         0000000000000000 0000000000000000 0000000000000001 0000000000000000
> [   24.403389]         ffffffff802d60cc 98001007ef06bdd8 ffffffff81f4b818 ffffffff81f60000
> [   24.411461]         ffffffff81f60000 ffffffff80fe0000 ffff000000000000 0000000000000000
> [   24.419533]         fffffffff500cce1 0000000000000001 0000000000000002 0000000000000000
> [   24.427603]         ffffffff80fe0000 0000000000000006 ffffffff8077f940 0000000000000020
> [   24.435673]         ffffffff81460020 98001007ef068000 98001007ef06bc80 000000fffbbbb370
> [   24.443745]         ffffffff8071cd60 0000000000000000 0000000000000000 0000000000000000
> [   24.451816]         0000000000000000 0000000000000000 ffffffff80212ab4 a80f926d5ac95694
> [   24.459887]         ...
> [   24.462367] Call Trace:
> [   24.464846] [<ffffffff80212ab4>] show_stack+0xa4/0x138
> [   24.470029] [<ffffffff8071cd60>] dump_stack+0xf0/0x150
> [   24.475208] [<ffffffff80c73f5c>] check_preemption_disabled+0xf4/0x100
> [   24.481682] [<ffffffff80213b58>] do_ri+0x1a8/0x690
> [   24.486509] [<ffffffff8020b828>] handle_ri_int+0x44/0x5c
> 
> Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
> ---
>  arch/mips/kernel/traps.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
