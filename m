Return-Path: <linux-mips+bounces-10037-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 204AAB1BCD1
	for <lists+linux-mips@lfdr.de>; Wed,  6 Aug 2025 00:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16CF3AC725
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 22:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4B829B206;
	Tue,  5 Aug 2025 22:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYwwNkRq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF10835959;
	Tue,  5 Aug 2025 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434328; cv=none; b=DbpZMPQNS+6PYb00IQiVN0CVH6RhQS9Xgnn6nx0OFaBPdNoiBczgagiY050qiABOad4IYmIjF0PxMedC9GlILZxt2tLIgYNTVt/Smt9sdW10+1o2Xd9IL1hHvdoUAx5a0hTop0J3NHRC5WaTUQX4t8eZ7QaO6Z5cs0et1tsIMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434328; c=relaxed/simple;
	bh=GsZqt0tWPPDkq9+jV7UyO4mTnui6YmSZ802SMrrKP+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9UEUqQnuYIammHqgc8Imz038Qq4xNK2KT8spicajueoIAsOSsrZes900wgHBnaupbQ5vvTW7Vn8qf0Xmw/+zFo5ahGE9n+h+sStMZHLBHe6dSmdj6kMFdpasX3v1IHxtYN03twwgnFDXGWGN/UQAwoUzZuak6voWZj7Hgz+W1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYwwNkRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF55C4CEF0;
	Tue,  5 Aug 2025 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754434326;
	bh=GsZqt0tWPPDkq9+jV7UyO4mTnui6YmSZ802SMrrKP+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UYwwNkRqx2F/y+hNs7BxUZUMA+MZCclC+LIaiH8KJd1jQ9+EY63br4eqj8HW2UPBK
	 s4TeyASmw68sIbCZ/YqaHyKI2Bp7JaAvJxliF2dbm0D/enTRLfx5QfSk3kXf/M2gfY
	 JvcunQemgW/z4SOBuZCmWriFhml5is2lXTKkAzJihROVprsLtnZWxY45GzUJmLc4LF
	 bvqTi3UbrEwtINTfaMEpt3dnnL2WJjw8AB3J0zSVaeJPEYpoXELtDG3zTbE1neJgF8
	 nbsayJkXBApno2SNSSH2q0lFOWzzU02ikKI3Os29druCQTWYiN5HnDnNB4LSQR1gVa
	 JDlOP+PBPYCtA==
Date: Tue, 5 Aug 2025 15:52:04 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 6/7] crypto: md5 - Wrap library and add HMAC support
Message-ID: <20250805225204.GA9931@quark>
References: <20250805222855.10362-1-ebiggers@kernel.org>
 <20250805222855.10362-7-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805222855.10362-7-ebiggers@kernel.org>

On Tue, Aug 05, 2025 at 03:28:54PM -0700, Eric Biggers wrote:
> Reimplement crypto/md5.c on top of the new MD5 library functions.  Also
> add support for HMAC-MD5, again just wrapping the library functions.
> 
> This closely mirrors crypto/sha1.c.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  crypto/Kconfig            |   2 +-
>  crypto/md5.c              | 359 ++++++++++++++++++--------------------
>  crypto/testmgr.c          |   3 +
>  drivers/crypto/img-hash.c |   2 +-
>  4 files changed, 171 insertions(+), 195 deletions(-)
> 
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 23bd98981ae8e..331c4fbb158b2 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -937,11 +937,11 @@ config CRYPTO_MD4
>  
>  config CRYPTO_MD5
>  	tristate "MD5"
>  	select CRYPTO_HASH
>  	help
> -	  MD5 message digest algorithm (RFC1321)
> +	  MD5 message digest algorithm (RFC1321), including HMAC support.

Correction: there needs to be 'select CRYPTO_LIB_MD5' above.

- Eric

