Return-Path: <linux-mips+bounces-10183-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A896B213CE
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 20:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9770B7A9FEB
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 18:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAC3268C55;
	Mon, 11 Aug 2025 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5EXUN2p"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52138DD3;
	Mon, 11 Aug 2025 18:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754935288; cv=none; b=OGb2gzIvHZUyBVloJIji2ziNtC1KbZsTX2J8Zp7GMTKI6COps0zlIZ5NuianP7T61L0NkXKtgiNvDr+cFYWGjjBbObvkyFrRSeDogeC2ye/xLyFzUe/bFvKbbTJwI8rzcWQ2b6RGPNFG+9QjUtuuHLg2pbKwnl+r/f+Tclaw9+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754935288; c=relaxed/simple;
	bh=oaStqyeej7yqSzgI8HKKqj00CWEPmn5WsFskP+XUK+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixF3yV8c1+uFQKpo1XeDVT8436m9N0na0rNr8t63L6QR5SwzgBVdFAYRmFkSofKMxteFzge3klU0/GEr+mxbK3OAIHSP76gVYc1SFBUlmT2zJ+MC64uThsPfQy1HgJ5posL11RvSENhH5quPiTYn4367GsRalWzyCWJPMMM82T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5EXUN2p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A15AC4CEED;
	Mon, 11 Aug 2025 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754935288;
	bh=oaStqyeej7yqSzgI8HKKqj00CWEPmn5WsFskP+XUK+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5EXUN2pGcp6CPXoxCDazABPuA3K/Ss0elSgvoV3BfFwp7d5jrU5QSyxDUELmOMd2
	 sM4EMfjt4Zp80NM2W42zzXwNk38urPB/VDMqcB99ruw2QxEIbE/jt9IAHtqC9Y84Rh
	 6MEfDvxGuyyB8BbiiRsZBcdtxQkMZnyFQl/XLxG56uNmacJ7XAeKWk76tzsp/j0PUl
	 PYb5DK6m3mxfYIAjxvof4AFHKCQ0Bf/ULogD17GOdSH64J65XFTdvKKiG2IUr1XE5l
	 VUozKpvR83OAufVEPGOiRtZxoMi2WQQrV3lVogX3uzxXDfbhqBKBfe9L88ohsPpeQ3
	 CC+YdkmSomrYQ==
Date: Mon, 11 Aug 2025 11:00:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 0/7] MD5 library functions
Message-ID: <20250811180026.GG1268@sol>
References: <20250805222855.10362-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805222855.10362-1-ebiggers@kernel.org>

On Tue, Aug 05, 2025 at 03:28:48PM -0700, Eric Biggers wrote:
> This series is targeting libcrypto-next and can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git md5-lib-v2
> 
> This series introduces a library API for MD5 and HMAC-MD5 and
> reimplements the crypto_shash "md5" and "hmac(md5)" on top of it.
> 
> The library API will also be usable directly by various in-kernel users
> that are stuck with MD5 due to having to implement legacy protocols.
> 
> This should again look quite boring and familiar, as it mirrors the
> SHA-1 and SHA-2 changes closely.
> 
> Changed in v2:
>   - Kept the architecture-optimized MD5 code, since unfortunately there
>     were objections to removing it.
> 
> Eric Biggers (7):
>   lib/crypto: md5: Add MD5 and HMAC-MD5 library functions
>   lib/crypto: mips/md5: Migrate optimized code into library
>   mips: cavium-octeon: Move octeon-crypto.c into parent dir
>   lib/crypto: powerpc/md5: Migrate optimized code into library
>   lib/crypto: sparc/md5: Migrate optimized code into library
>   crypto: md5 - Wrap library and add HMAC support
>   lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

Reviews and acks still greatly appreciated, of course!

- Eric

