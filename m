Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 744A217BF87
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 14:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726240AbgCFNtL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 08:49:11 -0500
Received: from elvis.franken.de ([193.175.24.41]:53471 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726090AbgCFNtK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Mar 2020 08:49:10 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jADLf-0006oD-00; Fri, 06 Mar 2020 14:49:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1F769C0F60; Fri,  6 Mar 2020 14:48:58 +0100 (CET)
Date:   Fri, 6 Mar 2020 14:48:58 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     YunQiang Su <syq@debian.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2] Use ELF_BASE_PLATFORM to pass ISA level
Message-ID: <20200306134858.GA11459@alpha.franken.de>
References: <20200302022209.82874-1-syq@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302022209.82874-1-syq@debian.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Mar 02, 2020 at 10:22:10AM +0800, YunQiang Su wrote:
> Some userland application/program runtime/dynamic loaded need to
> know about the current ISA level to use the best runtime.
> While kernel doesn't provides this info.
> 
> ELF_PLATFORM only provides some info about the CPU, with very few info,
> for example, the value is "mips" for both 24Kc and P6600.
> 
> Currently ELF_BASE_PLATFORM is not used by MIPS (only by powerpc).
> So we cant set its value as:
>   mips2, mips3, mips4, mips5,
>   mips32, mips32r2, mips32r6
>   mips64, mips64r2, mips64r6
> Then in userland, we can get it by:
>   getauxval(AT_BASE_PLATFORM)
> 
> The only problem is that it seems has different defination than ppc:
>   on ppc, it is the mircoarchitecture
> while now we use it as ISA level on MIPS.

while I see how this could be used, it feels incomplete to me. What
about implemented ASEs ? Can't you just use information already present
in /proc/cpuinfo ?

> diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
> index f8f44b1a6cbb..5aa29ced6970 100644
> --- a/arch/mips/include/asm/elf.h
> +++ b/arch/mips/include/asm/elf.h
> @@ -2113,6 +2130,7 @@ EXPORT_SYMBOL(__ua_limit);
>  
>  const char *__cpu_name[NR_CPUS];
>  const char *__elf_platform;
> +const char *__elf_base_platform = NULL;

no need to init static data with 0

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
