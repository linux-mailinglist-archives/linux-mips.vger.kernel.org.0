Return-Path: <linux-mips+bounces-9619-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB0AAF7F25
	for <lists+linux-mips@lfdr.de>; Thu,  3 Jul 2025 19:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D1107B3619
	for <lists+linux-mips@lfdr.de>; Thu,  3 Jul 2025 17:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4542D5420;
	Thu,  3 Jul 2025 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0dZv+fn"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB2C22CBD8;
	Thu,  3 Jul 2025 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564369; cv=none; b=ClysAL9BKORFBjnP0qvLaNPLxTzhBr2A/S+27VlqTJo8RcxidZ/in/ImhQYXh+jwbBEK7ARhhpglFr5OYLiVLJ301kvGn0vIR7xKARMhvhmqUyiq+kOBZr/APUi1922AP6GVQrL1v/Y7HFAzwRGdTwvc1bBWGXpvJtjgmEOxoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564369; c=relaxed/simple;
	bh=CjXapFJRn6jr02iNiY/fdYyplTrLIb9R/H97pjZWheY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+ilpelmdOm7rtKw4U7Hns7LGJeL/L5zpOg9XWZDWRhu9agFCKBwh0Lkp6VhQV/wIIfOidSJpQYPr4pkDYjXth/jUSVkcK774X/8PbT07K4moI63zkJdHmVRrzcL/cpPa/Dy8cXf548+t8pODEse8DeHIhsx59HyZcqkPpzYOxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0dZv+fn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A728FC4CEEE;
	Thu,  3 Jul 2025 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751564369;
	bh=CjXapFJRn6jr02iNiY/fdYyplTrLIb9R/H97pjZWheY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O0dZv+fn7ZOGn/n+ubYI9NUTtwxmvb9diBgsUdEhHae7Zutp0YZ/+WA2QVDvdceiE
	 O7nTHh2055ZVNVomkVuKLY51txoTK4sQYkxGKJLuNGWjgzMCqLrTSI5Zrmre6E3N9d
	 fCqJIJIrxGQVxECwKzwOsl0MmJKaXvuoOJBu7JvuajS+a7E5T7s6Jw4u0HPzn2fuBc
	 54A/tyxdEBU9TN8TDN+tWrXb6uTuzTklHPasl0pvtNY3Cpy1Z6/shg/mObJA41LApq
	 X+dBhsWzfe+qFZKn+tPjo/AztvrCYwi/805NTK1OeGQuHpPC0XEgAeQNLWLO7L2VOg
	 LRPocxpDJ4F5w==
Date: Thu, 3 Jul 2025 10:38:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/14] SHA-256 library improvements
Message-ID: <20250703173847.GB2284@sol>
References: <20250630160645.3198-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>

On Mon, Jun 30, 2025 at 09:06:31AM -0700, Eric Biggers wrote:
> This series is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v2
> 
> This series improves the SHA-224 and SHA-256 library code to be
> consistent with what I did for SHA-384 and SHA-512.  This includes:
> 
> - Use stronger typing in the SHA-224 and SHA-256 functions.
> 
> - Add support for HMAC-SHA224 and HMAC-SHA256.  (I'll send a separate
>   patch with KUnit test cases for this.)
> 
> - Make the old-school crypto API's support for sha224 and sha256 just
>   use the actual library API, instead of unsafe low-level functions.
> 
> - Consolidate the CPU-based SHA-224 and SHA-256 code into a single
>   module, with better inlining and dead code elimination.
> 
> - Properly document the SHA-224 and SHA-256 functions.
> 
> - Other changes to synchronize the code with SHA-384 and SHA-512.
> 
> Changed in v2:
> - Dropped sha224_kunit.c changes; it will be added later in the history
> - Dropped some patches that I folded into the SHA-512 series
> - Removed redundant checks of IS_ENABLED(CONFIG_KERNEL_MODE_NEON)
> - Removed obsolete setting of -DARCH for sha256.o
> - Fixed a commit title to mention sha256 instead of sha512
> - Excluded HMAC-SHA{224,256} code from purgatory, where it isn't needed
> 
> Eric Biggers (14):
>   libceph: Rename hmac_sha256() to ceph_hmac_sha256()
>   cxl/test: Simplify fw_buf_checksum_show()
>   lib/crypto: sha256: Reorder some code
>   lib/crypto: sha256: Remove sha256_blocks_simd()
>   lib/crypto: sha256: Add sha224() and sha224_update()
>   lib/crypto: sha256: Make library API use strongly-typed contexts
>   lib/crypto: sha256: Propagate sha256_block_state type to
>     implementations
>   lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
>   crypto: sha256 - Wrap library and add HMAC support
>   crypto: sha256 - Use same state format as legacy drivers
>   lib/crypto: sha256: Remove sha256_is_arch_optimized()
>   lib/crypto: sha256: Consolidate into single module
>   lib/crypto: sha256: Sync sha256_update() with sha512_update()
>   lib/crypto: sha256: Document the SHA-224 and SHA-256 API

FYI, applied to libcrypto-next.  Reviews and acks would be greatly appreciated,
though!

To fix https://lore.kernel.org/r/202507010837.ERX7aWw7-lkp@intel.com/
I applied the following fixup to
"lib/crypto: sha256: Propagate sha256_block_state type to implementations".

diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.c
index c3f844ae0aceb..55f42403d572a 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.c
@@ -26,7 +26,8 @@
  */
 #define MAX_BYTES 1024
 
-extern void ppc_spe_sha256_transform(u32 *state, const u8 *src, u32 blocks);
+extern void ppc_spe_sha256_transform(struct sha256_block_state *state,
+				     const u8 *src, u32 blocks);
 
 static void spe_begin(void)
 {

