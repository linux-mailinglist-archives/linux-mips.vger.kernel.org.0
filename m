Return-Path: <linux-mips+bounces-9843-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01914B07CC4
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 20:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26F907B237F
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 18:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFC72BE64E;
	Wed, 16 Jul 2025 18:21:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51392BE04D;
	Wed, 16 Jul 2025 18:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690118; cv=none; b=MSJaDVyb7gxGrF7lBejBBfsrAfs8kUoM8xaWXAeunht2M0f3V9rUI6DC6RV4/MbcVU4PqVjHKkg5da5/uQ0lf+8z7jIl/z1QOF6JgrBpoeu8K5zAg5syQs+FnwZRJ+8o3Iy0gS218d6JyQwwEEPJduIUj0nuCx8lXnzs+RHkiRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690118; c=relaxed/simple;
	bh=D8Hv4OGHZrVMgoVJluQ3bHG8biIF97yJJYH9uaRD7k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BLyo5fL+inu6qtRevfZQVDqMHLwqphOOMeNuazRtKIoRCpEr2nVyjzpQFobWs2YB3fWSxLLXVToU+FKxRd+Jh5XCEdx2Mc80rz5sxIrNcIAQQPPpbL3ehdUu/xwsakVitlEF0QfmXNHQSBLZGw/ApEPBCcYfIhGHnOfC9mELWCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uc6ZW-0006DP-00; Wed, 16 Jul 2025 20:09:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id F2E65C0B44; Wed, 16 Jul 2025 20:07:00 +0200 (CEST)
Date: Wed, 16 Jul 2025 20:07:00 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-mips@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 0/4] mips: CMOS RTC refactoring
Message-ID: <aHfqRH7vwcjmamMd@alpha.franken.de>
References: <20250713100434.699843-1-mat.jonczyk@o2.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250713100434.699843-1-mat.jonczyk@o2.pl>

On Sun, Jul 13, 2025 at 12:04:30PM +0200, Mateusz Jończyk wrote:
> Hello,
> 
> A while ago I wrote some patches that refactor a bit the RTC CMOS support on the
> MIPS architecture. These were in response to a bug report about locking
> problems during suspend / resume:
> 
> Link: https://lore.kernel.org/all/CAP-bSRZ0CWyZZsMtx046YV8L28LhY0fson2g4EqcwRAVN1Jk+Q@mail.gmail.com/
> 
> Back then, I was trying to convert the rtc_lock to a raw spinlock. This proved
> to be unnecessary and harmful, but in the process I removed some dead and
> duplicated code that touches the MC146818 (the chip of the CMOS RTC) for
> the MIPS architecture.
> 
> These patches were tested only in an emulator, as I don't have the hardware.
> They are roughly in the order of increasing risk.
> 
> Greetings,
> Mateusz
> 
> Mateusz Jończyk (4):
>   mips: remove unused function mc146818_set_rtc_mmss
>   mips/mach-rm: remove custom mc146818rtc.h file
>   mips: remove redundant macro mc146818_decode_year
>   mips/malta,loongson2ef: use generic mc146818_get_time function
> 
>  arch/mips/Kconfig                             |   2 +
>  .../include/asm/mach-generic/mc146818rtc.h    |   4 -
>  arch/mips/include/asm/mach-jazz/mc146818rtc.h |   2 -
>  .../mips/include/asm/mach-malta/mc146818rtc.h |   2 -
>  arch/mips/include/asm/mach-rm/mc146818rtc.h   |  21 ----
>  arch/mips/include/asm/mc146818-time.h         | 105 ++----------------
>  6 files changed, 9 insertions(+), 127 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-rm/mc146818rtc.h
> 
> 
> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> -- 
> 2.25.1

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

