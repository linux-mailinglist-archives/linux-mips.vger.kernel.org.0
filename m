Return-Path: <linux-mips+bounces-9027-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9332EABCFEC
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 08:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A84417A6A5D
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 06:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EBDD25D1E6;
	Tue, 20 May 2025 06:56:52 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC7D255E38;
	Tue, 20 May 2025 06:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747724212; cv=none; b=Mu9ucQ5YW5dmVZPnVUXPYxMVEv+xb/IQM1/qlh9Kwb0pKiFaRhAju3r4R3miZ6+cSubhsovTR78oXLkqiCZv0VqxaDR0uAxno7J5lSfIHcAK1eAZBBQVxd9QPOKoq7J98wtPLJfBfFhR+fBFWsvaKjfQ60HK1QCYR93DbkBgtl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747724212; c=relaxed/simple;
	bh=t02HdpVH7bByjCdpHA96IjGXEvuZGH0oFB9tYzj5jyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLTKMwtvI4pwJsMPjxUBwib3uMPcEI3JaeMFIQyUjHw1IcASlDQoVEyM8oiJhCaBEGJNC/OyegH5Zl3e5S/1RRM3OAoj8bHpJcPjkhqrSfGuOVr1vZODG7h8z4hH2WYjImYy1yN/ZLy7CajEZqvtpK9zcSsivESUmGc7exTmpy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uHGu1-0006iT-00; Tue, 20 May 2025 08:56:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A10A6C0609; Tue, 20 May 2025 08:56:11 +0200 (CEST)
Date: Tue, 20 May 2025 08:56:11 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] MIPS: bcm63xx: nvram: avoid inefficient use of
 crc32_le_combine()
Message-ID: <aCwni0qo_2IxfffY@alpha.franken.de>
References: <20250511182836.21611-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511182836.21611-1-ebiggers@kernel.org>

On Sun, May 11, 2025 at 11:28:36AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> bcm963xx_nvram_checksum() was using crc32_le_combine() to update a CRC
> with four zero bytes.  However, this is about 5x slower than just
> CRC'ing four zero bytes in the normal way.  Just do that instead.
> 
> (We could instead make crc32_le_combine() faster on short lengths.  But
> all its callers do just fine without it, so I'd like to just remove it.)
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> 
> Please consider this patch for the mips tree for 6.16.  If it doesn't
> get picked up, I'll take it through the crc tree.
> 
>  include/linux/bcm963xx_nvram.h | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

