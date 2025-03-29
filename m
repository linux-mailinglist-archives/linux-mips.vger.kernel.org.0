Return-Path: <linux-mips+bounces-8400-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87276A755A2
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 10:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A81EA1894649
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 09:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16C41AB50D;
	Sat, 29 Mar 2025 09:57:36 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 756BF3597B;
	Sat, 29 Mar 2025 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743242256; cv=none; b=fm2946D+1sFtbBu7yWzZ0Xg0XZZjUPqYg0uodvQ2R62f+DKZTG6jkiWfNiair3G/Q8TMomZllv/tlnrkCOxzAWakNH9p2dQCt/1vASy3oD01eb243w+0nAZ1CVtA6FpMxVp/J3gVpnqkEeaggA9mPuvSLUM8rtgeDdD1rmiWUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743242256; c=relaxed/simple;
	bh=n56iBYJh+619jz44wL6s7DUA0CbNuuQMnW5pkyXaauk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aq8m9lGZbPTSvJQlzjQuSC2zLAy1NxmHyK8qEG40NwjHvT07nlq+1uNMXvV7jlE1EbEyPUUGqAoh1cOWZNMCEhLRZSyfb67Ze9QAtC34QOahwJ4jvd2X9LDKLu5G/hwmL5TnEym8H+DArsMH9wMWV8aR0g4U77AVLMQOFiKNvmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tySwO-0005VP-00; Sat, 29 Mar 2025 10:57:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id BB183C00F0; Sat, 29 Mar 2025 10:57:15 +0100 (CET)
Date: Sat, 29 Mar 2025 10:57:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Kees Cook <kees@kernel.org>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mips: Add '-std=gnu11' to vdso CFLAGS
Message-ID: <Z-fD-584-2L-YAhe@alpha.franken.de>
References: <20250327032436.3600578-1-raj.khem@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327032436.3600578-1-raj.khem@gmail.com>

On Wed, Mar 26, 2025 at 08:24:36PM -0700, Khem Raj wrote:
> GCC 15 changed the default C standard dialect from gnu17 to gnu23,
> which should not have impacted the kernel because it explicitly requests
> the gnu11 standard in the main Makefile. However, mips/vdso code uses
> its own CFLAGS without a '-std=' value, which break with this dialect
> change because of the kernel's own definitions of bool, false, and true
> conflicting with the C23 reserved keywords.
> 
>   include/linux/stddef.h:11:9: error: cannot use keyword 'false' as enumeration constant
>      11 |         false   = 0,
>         |         ^~~~~
>   include/linux/stddef.h:11:9: note: 'false' is a keyword with '-std=c23' onwards
>   include/linux/types.h:35:33: error: 'bool' cannot be defined via 'typedef'
>      35 | typedef _Bool                   bool;
>         |                                 ^~~~
>   include/linux/types.h:35:33: note: 'bool' is a keyword with '-std=c23' onwards
> 
> Add '-std=gnu11' to the decompressor and purgatory CFLAGS to eliminate
> these errors and make the C standard version of these areas match the
> rest of the kernel.

please adapt subject and description.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

