Return-Path: <linux-mips+bounces-8795-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE6A9E0C3
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 10:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 519625A1906
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 08:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A78824E4AF;
	Sun, 27 Apr 2025 08:19:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A4F245025;
	Sun, 27 Apr 2025 08:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745741946; cv=none; b=pvc/FmkiYjRPS7g9nxbJYKANnPaktqsX9zijVpMZrkE6yBry6ojLQyX0HJdMcSzhyO6t6RyO67kKMhz6UFYph+psz345s/P/nLfSOUYOZRgR8bhIsfygGUNy4b69WPiLX2Czqf9mCOuqQrMrpYk7YT2cJG/AUp/G5uUPNFtG3YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745741946; c=relaxed/simple;
	bh=A1CWx9yqefNbhEO9vpGa8WQOXqi4+UVxXczhgu15hVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpqUQN1nWRGecc/oQ2ZpnJKy6m8eiPJ0DEsj3IfGrM0Gc0llPWZEbCNzeRzb3tItkAwnTK5gv4JQuLd71woDTrV+KTZAcHSVOAXe4/WA/0Hml2WHciMty/ihZmX2XL7LSplzQQyteuNWqmBMAbOJL+1mER90wvCZS6+JARSanho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u8xE4-0007QT-00; Sun, 27 Apr 2025 10:19:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DD734C0A20; Sun, 27 Apr 2025 10:16:16 +0200 (CEST)
Date: Sun, 27 Apr 2025 10:16:16 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v7 0/2] MIPS: Fix idle VS timer enqueue
Message-ID: <aA3n0Cs42R5I9pJ5@alpha.franken.de>
References: <20250403161143.361461-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403161143.361461-1-marco.crivellari@suse.com>

On Thu, Apr 03, 2025 at 06:11:41PM +0200, Marco Crivellari wrote:
> This patch aims to fix idle routine while the CPU receive an interrupt,
> because __r4k_wait() only checks if TIF_NEED_RESCHED is set before
> going to sleep.
> The same behavior has been changed in LoongArch [1].
> 
> Code (cross) compiled successfully and I manage to test it on a VM
> emulating a malta board. I ran QEMU with:
> 
> qemu-system-mips64el -M malta -m 2G -kernel vmlinux -serial stdio -drive \
> file=rootfs.ext2,format=raw -append "rootwait root=/dev/sda" -cpu 5Kc
> 
> rootfs generated using buildroot (malta default configuration).
> 
> - [1] https://github.com/chenhuacai/linux/commit/a8aa673ea46c03b3f62992ffa4ffe810ac84f6e3
> 
> ---
> Changes in v7:
>  - patch 2 to handle __r4k_wait() moved to .cpuidle.text section
>  - removed .noreorder section from __r4k_wait()
>  - idle region of 32-bytes
>  - removed C wrapper r4k_wait() and renamed __r4k_wait() to r4k_wait()
>  - changes discussed in:
>     https://lore.kernel.org/lkml/20250315194002.13778-1-marco.crivellari@suse.com/T/#m07f2568d9099101637063bd057a497ceb846be3d
> 
> Changes in v6:
>  - typo in comment, capitalise sentences and full stops
> 
> Changes in v5:
>  - comment: idle interrupt region, instead of rollback region
> 
> Changes in v4:
>  - comments: 36 byte region
> 
> Changes in v3:
>  - changed "daddiu k0, 1" with PTR_ADDIU k0, 5
>  - replaced CONFIG_CPU_MICROMIPS with 3 _ssnop followed by _ehb
>  - integrated the commit message with explanation about
>    CONFIG_CPU_MICROMIPS replacement
> 
> Changes in v2:
>  - Changes introduced by Huacai:
>     https://lore.kernel.org/linux-mips/20250214105047.150835-1-marco.crivellari@suse.com/T/#m75d9c587829e15e0d7baec13078be4e65c936408
> 
> Marco Crivellari (2):
>   MIPS: Fix idle VS timer enqueue
>   MIPS: Move __r4k_wait() to .cpuidle.text section
> 
>  arch/mips/include/asm/idle.h |  3 +-
>  arch/mips/kernel/genex.S     | 63 +++++++++++++++++++++---------------
>  arch/mips/kernel/idle.c      |  7 ----
>  3 files changed, 38 insertions(+), 35 deletions(-)

series applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

