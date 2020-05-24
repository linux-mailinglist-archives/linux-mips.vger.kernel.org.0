Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A176C1DFDB0
	for <lists+linux-mips@lfdr.de>; Sun, 24 May 2020 10:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726331AbgEXIf6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 24 May 2020 04:35:58 -0400
Received: from elvis.franken.de ([193.175.24.41]:36814 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728374AbgEXIf5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 24 May 2020 04:35:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jcm6r-0004rA-00; Sun, 24 May 2020 10:35:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B0E58C0183; Sun, 24 May 2020 09:37:26 +0200 (CEST)
Date:   Sun, 24 May 2020 09:37:26 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 1/1] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
Message-ID: <20200524073726.GA4161@alpha.franken.de>
References: <20200523133701.40367-1-git@xen0n.name>
 <20200523133701.40367-2-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200523133701.40367-2-git@xen0n.name>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 23, 2020 at 09:37:01PM +0800, WANG Xuerui wrote:
> CPUCFG is the instruction for querying processor characteristics on
> newer Loongson processors, much like CPUID of x86. Since the instruction
> is supposedly designed to provide a unified way to do feature detection
> (without having to, for example, parse /proc/cpuinfo which is too
> heavyweight), it is important to provide compatibility for older cores
> without native support. Fortunately, most of the fields can be
> synthesized without changes to semantics. Performance is not really big
> a concern, because feature detection logic is not expected to be
> invoked very often in typical userland applications.
> 
> The instruction can't be emulated on LOONGSON_2EF cores, according to
> FlyGoat's experiments. Because the LWC2 opcode is assigned to other
> valid instructions on 2E and 2F, no RI exception is raised for us to
> intercept. So compatibility is only extended back furthest to
> Loongson-3A1000. Loongson-2K is covered too, as it is basically a remix
> of various blocks from the 3A/3B models from a kernel perspective.
> 
> This is lightly based on Loongson's work on their Linux 3.10 fork, for
> being the authority on the right feature flags to fill in, where things
> aren't otherwise discoverable.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Huacai Chen <chenhc@lemote.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/Kconfig                             |  12 +
>  arch/mips/include/asm/cpu-info.h              |   9 +
>  .../include/asm/mach-loongson64/cpucfg-emul.h |  63 +++++
>  arch/mips/kernel/cpu-probe.c                  |   9 +
>  arch/mips/kernel/traps.c                      |  45 ++++
>  arch/mips/loongson64/Makefile                 |   1 +
>  arch/mips/loongson64/cpucfg-emul.c            | 217 ++++++++++++++++++
>  7 files changed, 356 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
>  create mode 100644 arch/mips/loongson64/cpucfg-emul.c

applied to mips-next with a fix to make loongson3_cpucfg_synthesize_data
inline for the not loogson64 case. As this happend the second time, could
you please check next time other platform builds to see, that your changes
don't break them ? Thanks.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
