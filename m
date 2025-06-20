Return-Path: <linux-mips+bounces-9445-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E77AE2404
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 23:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 104907A684B
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 21:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2412367CF;
	Fri, 20 Jun 2025 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FC6E1Xcs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2ED137E;
	Fri, 20 Jun 2025 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454943; cv=none; b=mGGMcTDqb4OqoPQNZlfsZy/E6rWb0FqSvr41oWXl/OJUZX4LsTs4i4mhCITxhumCdZZG61o3fopkIdtFmW2YYvXFDv0Mra4SSOUI6Wd4+tngMPDzNwH3SRuxsMMiIjyTEymWyiYe5oIDtHFvDn/Imjt6ahtIyLLir3XZNkyllag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454943; c=relaxed/simple;
	bh=ps9ILEhzF10vdX7dPy5yWB5StkYw8T+IpOw27+HOqYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E93KN+uzlrMx2d01annmclsYGMdZ1rHwVxTXA4pgnidLeudc1fCD/1vw96mnN+zXLzFgdMmbn1qyhFAyQEGqvj78gQxCZm5kv0s+yvYwQgqQF/qM6blEdV1MmHcT0GFvX3gGpYUlcCXCdR06TWuOgvAw9aVUy4Q3Za7SgTkyCjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FC6E1Xcs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F16C4CEE3;
	Fri, 20 Jun 2025 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750454943;
	bh=ps9ILEhzF10vdX7dPy5yWB5StkYw8T+IpOw27+HOqYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FC6E1Xcsnro+YOpDn8hTu0nsIFn++h4KBl0QuHYkEldKj/k+d4y6w6M6qTq1srOEb
	 nphAh45+luPlOza9k/LIGiTbnucAbyiaYQKu35fCeF/4UeE6qHizoUNUQ651lcrwy2
	 9B8AsOSU/IbiYESK+VnWwIDmkYyfPuZfhcxVI5jvUSzpyHXAwU3LfPV8cdlkFSPdBF
	 xMjNdQkGjmPO1/cWgdHC1ud81t7SJsdgZ+qBWAEQ83ndAMnkuPMMUOkbXi61DBaRZC
	 OYic/USnxpBjVMFFaIQ2ObMgL4xYVKNxAVGs0qognj4+skHnKSZZYyuLE926HJgkeW
	 3AzWwoBcF1kOA==
Date: Fri, 20 Jun 2025 14:29:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 0/9] lib/crypto: move arch/$(ARCH)/lib/crypto/ to
 lib/crypto/$(ARCH)/
Message-ID: <20250620212901.GC5460@quark>
References: <20250619191908.134235-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>

On Thu, Jun 19, 2025 at 12:18:59PM -0700, Eric Biggers wrote:
> This series applies on top of
> https://lore.kernel.org/r/20250616014019.415791-1-ebiggers@kernel.org/
> and is also available in git at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git arch-to-lib-crypto-v2

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

But as always, additional reviews and acks would be appreciated.

- Eric

