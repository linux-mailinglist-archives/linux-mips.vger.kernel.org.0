Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F7D3902B2
	for <lists+linux-mips@lfdr.de>; Tue, 25 May 2021 15:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbhEYNrz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 May 2021 09:47:55 -0400
Received: from elvis.franken.de ([193.175.24.41]:48737 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233184AbhEYNry (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 May 2021 09:47:54 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1llXO3-00079x-00; Tue, 25 May 2021 15:46:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1B01DC10E2; Tue, 25 May 2021 15:38:58 +0200 (CEST)
Date:   Tue, 25 May 2021 15:38:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/2] MIPS: Fix kernel hang under FUNCTION_GRAPH_TRACER
 and PREEMPT_TRACER
Message-ID: <20210525133858.GA11166@alpha.franken.de>
References: <1621076521-22412-1-git-send-email-yangtiezhu@loongson.cn>
 <1621076521-22412-3-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621076521-22412-3-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 15, 2021 at 07:02:01PM +0800, Tiezhu Yang wrote:
> When update the latest mainline kernel with the following three configs,
> the kernel hangs during startup:
> 
> (1) CONFIG_FUNCTION_GRAPH_TRACER=y
> (2) CONFIG_PREEMPT_TRACER=y
> (3) CONFIG_FTRACE_STARTUP_TEST=y
> 
> When update the latest mainline kernel with the above two configs (1)
> and (2), the kernel starts normally, but it still hangs when execute
> the following command:
> 
> echo "function_graph" > /sys/kernel/debug/tracing/current_tracer
> 
> Without CONFIG_PREEMPT_TRACER=y, the above two kinds of kernel hangs
> disappeared, so it seems that CONFIG_PREEMPT_TRACER has some influences
> with function_graph tracer at the first glance.
> 
> I use ejtag to find out the epc address is related with preempt_enable()
> in the file arch/mips/lib/mips-atomic.c, because function tracing can
> trace the preempt_{enable,disable} calls that are traced, replace them
> with preempt_{enable,disable}_notrace to prevent function tracing from
> going into an infinite loop, and then it can fix the kernel hang issue.
> 
> By the way, it seems that this commit is a complement and improvement of
> commit f93a1a00f2bd ("MIPS: Fix crash that occurs when function tracing
> is enabled").
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> ---
>  arch/mips/lib/mips-atomic.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
