Return-Path: <linux-mips+bounces-9131-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 183A0AC8FA0
	for <lists+linux-mips@lfdr.de>; Fri, 30 May 2025 15:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F661C05D47
	for <lists+linux-mips@lfdr.de>; Fri, 30 May 2025 13:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644EF22DF99;
	Fri, 30 May 2025 12:49:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9DC22DF87;
	Fri, 30 May 2025 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609367; cv=none; b=JkBYYD01/GT2YDYOHpOGfcIkhie6n8A8g6xqDEf4JqpC0hAaSOCweyVMVDmpQa4EzD45J69gHheoTKCKset8GjhSRBac6IXVXxG7ru53G5zNy0b5zB4I4ohzDpQyz3ouWVgFehHQEP7rkQueOh8l+32euFD/3AfuDXFct565W3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609367; c=relaxed/simple;
	bh=wQV3TRzu2EJQ8Icqq57cO+0WosOKHbrqlyWVi4uEAbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4xxma5ti9HBSKkA+TkmCDliNMEffkI8fg2t4/WMLrqdfoYCGLx1C0yXg84WSvitJEM3s5hxHsUJ8ux1OtWD1U5bHk7CiGqgPshGxFIoEvt86dAYjeWhYhqtsR+YMVZOrjL8gzygs/gMQGi7N2Pi57rbIByMT+ysGxGBN2+OmZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uKyw4-0000cD-00; Fri, 30 May 2025 14:34:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0EA74C05F3; Fri, 30 May 2025 14:33:38 +0200 (CEST)
Date: Fri, 30 May 2025 14:33:38 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: loongson2ef: cs5536: add missing function
 prototypes
Message-ID: <aDmlolSlNS-JkdVq@alpha.franken.de>
References: <20250529031956.3993115-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529031956.3993115-1-rdunlap@infradead.org>

On Wed, May 28, 2025 at 08:19:56PM -0700, Randy Dunlap wrote:
> Add missing function prototypes for cs5536, mostly for PCI functions,
> and for init_mfgpt_clocksource().
> 
> arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:15:6: warning: no previous prototype for 'pci_ide_write_reg' [-Wmissing-prototypes]
>    15 | void pci_ide_write_reg(int reg, u32 value)
> arch/mips/loongson2ef/common/cs5536/cs5536_ide.c:96:5: warning: no previous prototype for 'pci_ide_read_reg' [-Wmissing-prototypes]
>    96 | u32 pci_ide_read_reg(int reg)
> 
> arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:15:6: warning: no previous prototype for 'pci_ehci_write_reg' [-Wmissing-prototypes]
>    15 | void pci_ehci_write_reg(int reg, u32 value)
> arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c:75:5: warning: no previous prototype for 'pci_ehci_read_reg' [-Wmissing-prototypes]
>    75 | u32 pci_ehci_read_reg(int reg)
> 
> arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:15:6: warning: no previous prototype for 'pci_acc_write_reg' [-Wmissing-prototypes]
>    15 | void pci_acc_write_reg(int reg, u32 value)
> arch/mips/loongson2ef/common/cs5536/cs5536_acc.c:62:5: warning: no previous prototype for 'pci_acc_read_reg' [-Wmissing-prototypes]
>    62 | u32 pci_acc_read_reg(int reg)
> 
> arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:15:6: warning: no previous prototype for 'pci_ohci_write_reg' [-Wmissing-prototypes]
>    15 | void pci_ohci_write_reg(int reg, u32 value)
> arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c:70:5: warning: no previous prototype for 'pci_ohci_read_reg' [-Wmissing-prototypes]
>    70 | u32 pci_ohci_read_reg(int reg)
> 
> arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:84:6: warning: no previous prototype for 'pci_isa_write_bar' [-Wmissing-prototypes]
>    84 | void pci_isa_write_bar(int n, u32 value)
> arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:110:5: warning: no previous prototype for 'pci_isa_read_bar' [-Wmissing-prototypes]
>   110 | u32 pci_isa_read_bar(int n)
> arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:134:6: warning: no previous prototype for 'pci_isa_write_reg' [-Wmissing-prototypes]
>   134 | void pci_isa_write_reg(int reg, u32 value)
> arch/mips/loongson2ef/common/cs5536/cs5536_isa.c:228:5: warning: no previous prototype for 'pci_isa_read_reg' [-Wmissing-prototypes]
>   228 | u32 pci_isa_read_reg(int reg)
> 
> arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c:195:12: warning: no previous prototype for 'init_mfgpt_clocksource' [-Wmissing-prototypes]
>   195 | int __init init_mfgpt_clocksource(void)
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: linux-mips@vger.kernel.org
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h |   20 ++++++++++
>  1 file changed, 20 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

