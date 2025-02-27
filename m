Return-Path: <linux-mips+bounces-8011-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DEBA479BF
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 11:05:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C971E3A4439
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 10:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122DB22A4C9;
	Thu, 27 Feb 2025 10:04:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC7B1E833A;
	Thu, 27 Feb 2025 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740650683; cv=none; b=eQFIkPplvCLpjexFgkVo6aaiKCm1Lj5GQS+vtyj1kb42OvZrzJe0oeQfUup3fLhjRHtQUBNgj1Mr+wJ4AAnpI01CELMyV+1aJwJNsXKwxXWufSQAxIMPv5In0sqialHHooRG5SuAJDBvGsqtw/w8FR4SYLQY0KLNPA5ieM892Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740650683; c=relaxed/simple;
	bh=n4mzGGv6ShHRiKG5Zre6il63W6cqZ6MEAUjy2p0IxrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNFeG5bW8XAeJsicAfzbtcKwZX4Utzused+ikzeL+4StGlsg1vJ6eh0RRCQ42BaukfLUzmbF4pc0XdW68YL6fEuYkHvQqOBycYPb58MIiR8yAtmsXbgNKBBFf/e9VRxjvmdUrZlxjQatxyh3jytJt7KOQU3wrRjB+BgFP4jv6z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tnakv-0007xa-00; Thu, 27 Feb 2025 11:04:37 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 38EEEC0423; Thu, 27 Feb 2025 11:00:33 +0100 (CET)
Date: Thu, 27 Feb 2025 11:00:33 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: WangYuli <wangyuli@uniontech.com>
Cc: chenlinxuan@uniontech.com, guanwentao@uniontech.com,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	macro@orcam.me.uk, niecheng1@uniontech.com, zhanjun@uniontech.com
Subject: Re: [PATCH 3/7] MIPS: cevt-ds1287: Add missing ds1287.h include
Message-ID: <Z8A3wdxvNU0aw9ys@alpha.franken.de>
References: <487CE8AA937621E2+20250218125101.663980-1-wangyuli@uniontech.com>
 <6A027EE413E09E1F+20250218125723.666989-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6A027EE413E09E1F+20250218125723.666989-1-wangyuli@uniontech.com>

On Tue, Feb 18, 2025 at 08:57:23PM +0800, WangYuli wrote:
> Address the issue of cevt-ds1287.c not including the ds1287.h header
> file.
> 
> Fix follow errors with gcc-14 when -Werror:
> 
> arch/mips/kernel/cevt-ds1287.c:15:5: error: no previous prototype for ‘ds1287_timer_state’ [-Werror=missing-prototypes]
>    15 | int ds1287_timer_state(void)
>       |     ^~~~~~~~~~~~~~~~~~
> arch/mips/kernel/cevt-ds1287.c:20:5: error: no previous prototype for ‘ds1287_set_base_clock’ [-Werror=missing-prototypes]
>    20 | int ds1287_set_base_clock(unsigned int hz)
>       |     ^~~~~~~~~~~~~~~~~~~~~
> arch/mips/kernel/cevt-ds1287.c:103:12: error: no previous prototype for ‘ds1287_clockevent_init’ [-Werror=missing-prototypes]
>   103 | int __init ds1287_clockevent_init(int irq)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[7]: *** [scripts/Makefile.build:207: arch/mips/kernel/cevt-ds1287.o] Error 1
> make[7]: *** Waiting for unfinished jobs....
> make[6]: *** [scripts/Makefile.build:465: arch/mips/kernel] Error 2
> make[6]: *** Waiting for unfinished jobs....
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  arch/mips/kernel/cevt-ds1287.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/kernel/cevt-ds1287.c b/arch/mips/kernel/cevt-ds1287.c
> index 9a47fbcd4638..de64d6bb7ba3 100644
> --- a/arch/mips/kernel/cevt-ds1287.c
> +++ b/arch/mips/kernel/cevt-ds1287.c
> @@ -10,6 +10,7 @@
>  #include <linux/mc146818rtc.h>
>  #include <linux/irq.h>
>  
> +#include <asm/ds1287.h>
>  #include <asm/time.h>
>  
>  int ds1287_timer_state(void)
> -- 
> 2.47.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

