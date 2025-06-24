Return-Path: <linux-mips+bounces-9462-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE07AE5A3B
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 04:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B500216E5D6
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 02:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCD7146D6A;
	Tue, 24 Jun 2025 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P8VT+Qfs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA72A6EB79;
	Tue, 24 Jun 2025 02:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733284; cv=none; b=QuXLYDOJf6oTbPdFAbz9zYpRTgIWlx+B6n2uv7IS01/zPmoD3h265EeLJ+edG+baLtqPovmVDCVvUaUzbNO2NeVBTt1bLibTnD+HTXIEHOF69uR3D5d2Z57lljuJTlmS3Q1kbi7sxnHgIFwIPwWsvRZrSFb+LXxzN3d9eBib39o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733284; c=relaxed/simple;
	bh=0ZETP/chWGG4T9JGaFbl9fh8M/SzCRMYDw4aVpfGbeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbuaUd/BvCMNduuI7DSLXRpLzYt1Mht3VdRhHHz/WLWkC77/6Wpof4NKfFbIWNfKvsxT/PUJZ4wJg+WTtV4SHlXzwwEUfT8nDhZWniXDOUs/J530ZRElf7sXPqYMS/FQBbbepINI/3mQ9AsUF2PRtAaRaDrWIkSTWgulrlsySnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P8VT+Qfs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 421FEC4CEEA;
	Tue, 24 Jun 2025 02:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750733284;
	bh=0ZETP/chWGG4T9JGaFbl9fh8M/SzCRMYDw4aVpfGbeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8VT+QfsmFyNCARIa6+zv5GeEdHmGYz4b2CXf2QnLCgg2XjI+QzVHFQwaE54p21fT
	 1LCZ7fSSZ2/nlpVQyeKmcrVqpGzdILXyh4DkrsBuW0Jm2+lMKrL2NYPCa2F1u7qiRq
	 pmGy+v9rQbqcPMJ5c7Ar9+5dM1PmAGXhnP1d40AksQRUnbL04k4TUW/iADQsjNci5R
	 /M7bl9YM8W8DfDHtijhEjzPSFgXIzwYJGmERAy0H9kLYjCZywd5ELycQkRygA06DgI
	 eFstFLW0coTU18586ApXLRLRIQwaVckxTiXEMn3hF5HMSifi0iGk/xafn/MCD06Y2v
	 j10n7GKclAZ1w==
Date: Mon, 23 Jun 2025 19:47:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	=?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
	linux-mips@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] lib/crypto: mips/chacha: Fix clang build and remove
 unneeded byteswap
Message-ID: <20250624024730.GC7127@sol>
References: <20250619225535.679301-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619225535.679301-1-ebiggers@kernel.org>

On Thu, Jun 19, 2025 at 03:55:35PM -0700, Eric Biggers wrote:
> The MIPS32r2 ChaCha code has never been buildable with the clang
> assembler.  First, clang doesn't support the 'rotl' pseudo-instruction:
> 
>     error: unknown instruction, did you mean: rol, rotr?
> 
> Second, clang requires that both operands of the 'wsbh' instruction be
> explicitly given:
> 
>     error: too few operands for instruction
> 
> To fix this, align the code with the real instruction set by (1) using
> the real instruction 'rotr' instead of the nonstandard pseudo-
> instruction 'rotl', and (2) explicitly giving both operands to 'wsbh'.
> 
> To make removing the use of 'rotl' a bit easier, also remove the
> unnecessary special-casing for big endian CPUs at
> .Lchacha_mips_xor_bytes.  The tail handling is actually
> endian-independent since it processes one byte at a time.  On big endian
> CPUs the old code byte-swapped SAVED_X, then iterated through it in
> reverse order.  But the byteswap and reverse iteration canceled out.
> 
> Tested with chacha20poly1305-selftest in QEMU using "-M malta" with both
> little endian and big endian mips32r2 kernels.
> 
> Fixes: 49aa7c00eddf ("crypto: mips/chacha - import 32r2 ChaCha code from Zinc")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505080409.EujEBwA0-lkp@intel.com/
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This applies on top of other pending lib/crypto patches and can be
> retrieved from git at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mips-chacha-fix
> 
>  lib/crypto/mips/chacha-core.S | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

