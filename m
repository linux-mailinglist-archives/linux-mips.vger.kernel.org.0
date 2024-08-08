Return-Path: <linux-mips+bounces-4819-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADF94CA7B
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2024 08:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BB451F21063
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2024 06:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8B116D315;
	Fri,  9 Aug 2024 06:28:57 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A98A16CD1A;
	Fri,  9 Aug 2024 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723184937; cv=none; b=Esul6B2AyxeboG5OO3qZgJg5HT02Jw45iYJxb7LTToF/bEX9xlQjDxqQjmZXV4/G33ACNRe1nquR7sMLCF3XcZJnE2x3xeTH5Odof/A6k/24qKcNK8a9UtaN3x6auVUT109+12icag+8eIKr9ylKPF0YIBKiRTwMabd9QXKcQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723184937; c=relaxed/simple;
	bh=8gWESIod1mxQfva6n/2hb/tIdrqIw1m4+uiG4XkLFrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZ+Fn6Lu7w2AninsQ44eZzL7Nnif7c05oJgJO287UY5u7nJgj/wo7HqkFgxyOiIC3ushRfNa0P9g6ZkXZakM//P1g5nKV7GeMh3Y4KR8hL/IeYpla0ci20Rgb4P3BlnnFP83JyGul4aq3ziDGbOuYtnBv5uKZ4md4+EMCskeH/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1scIZm-0006p0-00; Fri, 09 Aug 2024 07:54:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 93196C014D; Thu,  8 Aug 2024 23:42:28 +0200 (CEST)
Date: Thu, 8 Aug 2024 23:42:28 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Set timer mode in cpu-probe
Message-ID: <ZrU7xIaKVL+27r6x@alpha.franken.de>
References: <20240723-loongson-exttimer-v1-1-974bef8c2f88@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723-loongson-exttimer-v1-1-974bef8c2f88@flygoat.com>

On Tue, Jul 23, 2024 at 05:15:44PM +0800, Jiaxun Yang wrote:
> Loongson64 C and G processors have EXTIMER feature which
> is conflicting with CP0 counter.
> 
> Although the processor resets in EXTIMER disabled & INTIMER
> enabled mode, which is compatible with MIPS CP0 compare, firmware
> may attempt to enable EXTIMER and interfere CP0 compare.
> 
> Set timer mode back to MIPS compatible mode to fix booting on
> systems with such firmware before we have an actual driver for
> EXTIMER.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Please take this patch via fixes (or second 6.11 PR) tree so it can
> reach stable faster.
> 
> Thansks!
> ---
>  arch/mips/kernel/cpu-probe.c | 4 ++++
>  1 file changed, 4 insertions(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

