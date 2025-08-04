Return-Path: <linux-mips+bounces-10014-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8523B1A8F1
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 20:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4209188FF56
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 18:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19A5B229B2E;
	Mon,  4 Aug 2025 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YwFZeR2y"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE651FF1A1;
	Mon,  4 Aug 2025 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754330966; cv=none; b=Xx7pJc6iruAiNCmEYq7p42J6ngh2euBdvNyU94urmvcXhf4GTf0nui4M5hmIEMCHI8Xb5MBRUaJhZaeloHwmShHHebqnab8RUg1brQWHNnfFoPgPAkuLGsNZlwPIJk4p8m0WSL8XaP1FiIlcsaKx1GnQI2yeqocAHWq1rQOToes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754330966; c=relaxed/simple;
	bh=0USMjK4bFmBT5ziPLDKoVgtPQA2WM1TCditG8vsffFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7uaK3A0giO7jQxEHn7zx9dt77HqYYRD4X1GXR0srPZs24bbxO2wbfT7veYUAG5ZR1XelpRYKiRCOc9fOiClOR39swueuhp2ZJWwrqwj0PrFUr0VCDDJNhA8ItdNdjwC98CITdqEmd+7RZd1KAc1GA6eaCztQl/35vAN98cDYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YwFZeR2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14CB2C4CEE7;
	Mon,  4 Aug 2025 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754330965;
	bh=0USMjK4bFmBT5ziPLDKoVgtPQA2WM1TCditG8vsffFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YwFZeR2ylLcX8iKjBZdrv/xsDlU4RzJk5JNW/pE1qNLR3PjUiyCRipLrRS1T2Ks1Q
	 u+1Mad1+GvBVd2ZhwNTNqKa33qXWkgZDKLPA8ngsNPYCjFco/7lKHWiH0x5Z5OwHbA
	 1cRJKHKlGMx7pq//xfetHA8plhXIV8R+XQMRlwgu64bOsXG12bRF/wM1HhURXe8D6g
	 aawxFa1qktm708BX44aw2ghH4wrnNRGYaaNfl94x4+Ss+sTvaJhX2+xtIQPSdy4FWY
	 dSWTO6C/cC+z0/gXR5HahHC8MjdN/sy5wnFovMxE3xyOWYbPezrb70vxOL64E02cV6
	 QQk8qeWV9t7Vg==
Date: Mon, 4 Aug 2025 18:09:23 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250804180923.GA54248@google.com>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>

On Mon, Aug 04, 2025 at 07:42:15PM +0200, Christophe Leroy wrote:
> 
> 
> Le 03/08/2025 à 22:44, Eric Biggers a écrit :
> > MD5 is insecure, is no longer commonly used, and has never been
> > optimized for the most common architectures in the kernel.  Only mips,
> > powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
> > only the powerpc one is actually testable in QEMU.  The mips one works
> > only on Cavium Octeon SoCs.
> > 
> > Taken together, it's clear that it's time to retire these additional MD5
> > implementations, and focus maintenance on the MD5 generic C code.
> 
> Sorry, for me it is not that clear. Even if MD5 is depracated we still have
> several applications that use MD5 for various reasons on our boards.
> 
> I ran the test on kernel v6.16 with following file:
> 
> # ls -l avion.au
> -rw-------    1 root     root      12130159 Jan  1  1970 avion.au
> 
> With CONFIG_CRYPTO_MD5_PPC:
> 
> # time md5sum avion.au
> 6513851d6109d42477b20cd56bf57f28  avion.au
> real    0m 1.02s
> user    0m 0.01s
> sys     0m 1.01s
> 
> Without CONFIG_CRYPTO_MD5_PPC:
> 
> # time md5sum avion.au
> 6513851d6109d42477b20cd56bf57f28  avion.au
> real    0m 1.35s
> user    0m 0.01s
> sys     0m 1.34s
> 
> I think the difference is big enough to consider keeping optimised MD5 code.

But md5sum doesn't use the kernel's MD5 code.  So it's implausible that
it has any effect on md5sum.  The difference you saw must be due to an
unrelated reason like I/O caching, CPU frequency, etc.  Try running your
test multiple times to eliminate other sources of variation.

- Eric

