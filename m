Return-Path: <linux-mips+bounces-9130-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BFDAC8F9C
	for <lists+linux-mips@lfdr.de>; Fri, 30 May 2025 15:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 035653A58D7
	for <lists+linux-mips@lfdr.de>; Fri, 30 May 2025 13:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 824E922D9F5;
	Fri, 30 May 2025 12:49:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D702B220F2A;
	Fri, 30 May 2025 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609361; cv=none; b=GQf7a+z8r40kBOiukcwzXeBtj6FljhW7bx+aXRSXdMA4x5e3Dt9eXRYAevkAsMvD9Sd3m4+8tcsgPQClYeEIktrDdUJeJT9mjLLpIApMqjEsrbEyWeHZ3wbsC2oIk5z+agucF0L/7L0K48WVlD6UYunI/4cy/wycuO+foae3Jb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609361; c=relaxed/simple;
	bh=vnZmTsIwG0Mzr4wpC0BNSbc3pPEH2tZSKwSBWJhgShE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoW/rCKtpFlz9G3m8awxtG22j8lAT4GyHUp8LghSnk0qEjjFV/y2Ng+t9nUCuApGPBenHVwhOtCFxYzoJE3oM1hI86G8jQ/XsiDxb+WHX+W07/HW0JRln19gY6eVd6FsgrynscApCikanKNjKwPgWc24GTKflayra7DtKAdnhPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uKyw4-0000cF-00; Fri, 30 May 2025 14:34:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 067FFC076D; Fri, 30 May 2025 14:33:59 +0200 (CEST)
Date: Fri, 30 May 2025 14:33:59 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: loongson2ef: lemote-2f: add missing function
 prototypes
Message-ID: <aDmlt0Wo0gNX5X8e@alpha.franken.de>
References: <20250529032005.4015158-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529032005.4015158-1-rdunlap@infradead.org>

On Wed, May 28, 2025 at 08:20:05PM -0700, Randy Dunlap wrote:
> Add several missing function prototypes for lemote-2f to eliminate
> build warnings:
> 
> arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no previous prototype for 'mach_prom_init_machtype' [-Wmissing-prototypes]
>    10 | void __init mach_prom_init_machtype(void)
> arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous prototype for 'mach_prom_init_machtype' [-Wmissing-prototypes]
>    34 | void __weak __init mach_prom_init_machtype(void)
> arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous prototype for 'setup_wakeup_events' [-Wmissing-prototypes]
>    52 | void setup_wakeup_events(void)
> arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous prototype for 'wakeup_loongson' [-Wmissing-prototypes]
>    90 | int wakeup_loongson(void)
> arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous prototype for 'mach_suspend' [-Wmissing-prototypes]
>   137 | void __weak mach_suspend(void)
> arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous prototype for 'mach_resume' [-Wmissing-prototypes]
>   142 | void __weak mach_resume(void)
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: linux-mips@vger.kernel.org
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-loongson2ef/loongson.h |    9 +++++++++
>  1 file changed, 9 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

