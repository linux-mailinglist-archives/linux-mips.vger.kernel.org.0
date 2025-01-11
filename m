Return-Path: <linux-mips+bounces-7394-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93702A0A388
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 13:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9984F3A8EA0
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E9F19597F;
	Sat, 11 Jan 2025 12:18:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EECA613BC0C;
	Sat, 11 Jan 2025 12:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736597920; cv=none; b=gxh6p1/cjeQxzNihr2YjFtrNGriTdWRxEOW3Q6M6TCqlAxfTSdw+3j0jTajyjbXk7FUN8vN+KAaQgs0dZLflNfBrwyYl8mHKQ+bSeC0VNMIa2AgnizddZdcVMvfV8lVCgrVgTxor1BT4BGwM13zSZ6e4Ww4x+/iOYlogruytYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736597920; c=relaxed/simple;
	bh=ek4H6zRZpOfFJBTcCsQxktyEeVXezOIY1lmHjJrH2Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKlyIcLQ3dNTqc0zrze/Qp8DC1Pb6BwSPc5oF6dbuu0q3h0dw5aBr1E985I4ZL+zzcYMTJDfh3Hp9Li2Zp0IZb+dIFVGRbOcjzqLV5T23tTRQNwV0nYk9pDWFa/EERtfvmRKMscmJk32p7D96KTph58ION/I4iNPOOnCguNKVTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tWaRL-0006NU-00; Sat, 11 Jan 2025 13:18:07 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 6D80FC06E5; Sat, 11 Jan 2025 13:02:55 +0100 (CET)
Date: Sat, 11 Jan 2025 13:02:55 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Xi Ruoyao <xry111@xry111.site>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH] Revert "MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK
 if SMP && 64BIT"
Message-ID: <Z4Jd7+VqnS5jLvm0@alpha.franken.de>
References: <20241223092041.257941-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223092041.257941-1-xry111@xry111.site>

On Mon, Dec 23, 2024 at 05:20:41PM +0800, Xi Ruoyao wrote:
> This reverts commit 426fa8e4fe7bb914b5977cbce453a9926bf5b2e6.
> 
> The commit has caused two issues on Loongson 3A4000:
> 
> 1. The timestamp in dmesg become erratic, like:
> 
>     [3.736957] amdgpu 0000:04:00.0: ... ...
>     [3.748895] [drm] Initialized amdgpu ... ...
>     [18446744073.381141] amdgpu 0000:04:00:0: ... ...
>     [1.613326] igb 0000:03:00.0 enp3s0: ... ...
> 
> 2. More seriously, some workloads (for example, the test
>    stdlib/test-cxa_atexit2 in the Glibc test suite) triggers an RCU
>    stall and hang the system with a high probably (4 hangs out of 5
>    tests).
> 
> Revert this commit to use jiffie on Loongson MIPS systems and fix these
> issues for now.  The root cause may need more investigation.
> 
> Cc: stable@vger.kernel.org # 6.11+
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
> ---
>  arch/mips/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 467b10f4361a..5078ebf071ec 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1084,7 +1084,6 @@ config CSRC_IOASIC
>  
>  config CSRC_R4K
>  	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
> -	select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
>  	bool
>  
>  config CSRC_SB1250
> -- 
> 2.47.1

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

