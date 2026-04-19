Return-Path: <linux-mips+bounces-14198-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EwLJ5wj5GnPRgEAu9opvQ
	(envelope-from <linux-mips+bounces-14198-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 02:36:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DA4422C14
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 02:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98EA530090B7
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2026 00:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FB9212B2F;
	Sun, 19 Apr 2026 00:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="B6ejUd2x"
X-Original-To: linux-mips@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528A11DD877;
	Sun, 19 Apr 2026 00:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776559001; cv=pass; b=acU/cpD+4hu1yQNJeV8zYDmGrTafHbiY0oKA6SBNcCRAZL1zU5V9dXXec05/B/gIWfTHcLokCID66HCyvvylHyz40AbrqTum9kjhL0e8FzR0YM99ZMBDJiXzSUqwm6KokYVebUo20sd/T5C0rt/gNgY+/YnLbwYP0r2UD99N8To=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776559001; c=relaxed/simple;
	bh=3exs+ddTpVpqEQ4Pu3BicOW7rgzcKWc1D9fzn8TYRMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THS6Q8tjg70O9R7YopBNI3kHWMdweK3/O8dX/6TrTINhNY2/PSG8TjLsyxoz89JTtL+4o26FbmZNoT3NidKpCAhP4zWyLSW0JBSVlAPL7sjBIZ9buglQCF2cpJlfbHqY6qX+3RAIU/vUpa/MEA7fMskUcFgRcpzlrdLp4TXVR+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=B6ejUd2x; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (unknown [83.245.248.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyqS36pznzyRb;
	Sun, 19 Apr 2026 03:36:35 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776558997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PWCe8xN4awYR6g3iHR1feUaJdolK1aTOcRHBAQFeYZs=;
	b=B6ejUd2xqNxkrCFSx+wr1uCq+x4+jA1zqkWDfWLIoeRU++0FN0bKeW1wNfkU9lULsplAde
	mQmUG7Y1Vcqzy2M2njQexmMMj7ha1WyIOB1DusKNqY3fD4PjmoZ+mBCYYcyHTydHARQSXJ
	dosvufX0xfLOa3Fq0fmMJCmb3YQwZto=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776558997;
	b=L64Y0vaRUfsqHka1OVWoqvmwWCcQVXx2GS1JjeEUiX1k0FNGABnesvfuMz3QQ78S64Q/EB
	1SiePicvH3l2+5pzMjC1KkzKmIxN6mvcUVRxns0SkUvpJSMe1acHFOfiUrrUGNNG9KxkLT
	TbdoyO0LuMDCO2wcSrL+yZSi4gBv8jA=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776558997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PWCe8xN4awYR6g3iHR1feUaJdolK1aTOcRHBAQFeYZs=;
	b=FnS29HaA3UNktSZvfwIiMK7V9cuwVypHsoe6EX5epgw1B6cP1RDNva+DwF5YRxgzLQLw4z
	SwRQcwvUptM69ZhnczeNKec0xbE3wS/U2zzwug3r81yPh+TcLoyXxhqDLqORam2rdxjWb+
	yTrpmU94Q56s9UAKiAlbOkjSR+/Os3g=
Date: Sun, 19 Apr 2026 03:36:31 +0300
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] lib/crypto: mips: Drop optimized MD5 code
Message-ID: <aeQjj0J1k7siaqOF@darkstar.musicnaut.iki.fi>
References: <20260326204824.62010-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326204824.62010-1-ebiggers@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[iki.fi:s=meesny];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14198-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[iki.fi];
	DKIM_TRACE(0.00)[iki.fi:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aaro.koskinen@iki.fi,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 31DA4422C14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On Thu, Mar 26, 2026 at 01:48:24PM -0700, Eric Biggers wrote:
> MD5 is obsolete.  Continuing to maintain architecture-optimized
> implementations of MD5 is unnecessary and risky.  It diverts resources
> from the modern algorithms that are actually important.
> 
> While there was demand for continuing to maintain the PowerPC optimized
> MD5 code to accommodate userspace programs that are misusing AF_ALG
> (https://lore.kernel.org/linux-crypto/c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu/),
> no such demand has been seen for the MIPS Cavium Octeon optimized MD5
> code.  Note that this code runs on only one particular line of SoCs.
> 
> Thus, let's drop it and focus effort on the more modern SHA algorithms,
> which already have optimized code for the same SoCs.

I don't mind deleting this (I shut down all my MIPS hardware already
in new year 2020 to start a "fresh" decade), but just for the record,
this will probably downgrade the performance of TCP_MD5SIG which I recall
was the original reason this code got added...

Also that PowerPC case about "misusing AF_ALG" is interesting - I often do
similar on small systems (just to save binary space and avoid duplicate
implementation) - why AF_ALG even allows such use if it's considered
a bug?

A.

> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is targeting libcrypto-next
> 
>  lib/crypto/Kconfig    |  1 -
>  lib/crypto/mips/md5.h | 65 -------------------------------------------
>  2 files changed, 66 deletions(-)
>  delete mode 100644 lib/crypto/mips/md5.h
> 
> diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
> index 4b6f593dc72f..9f31f03062f0 100644
> --- a/lib/crypto/Kconfig
> +++ b/lib/crypto/Kconfig
> @@ -132,11 +132,10 @@ config CRYPTO_LIB_MD5
>  	  uses any of the functions from <crypto/md5.h>.
>  
>  config CRYPTO_LIB_MD5_ARCH
>  	bool
>  	depends on CRYPTO_LIB_MD5 && !UML
> -	default y if MIPS && CPU_CAVIUM_OCTEON
>  	default y if PPC
>  	default y if SPARC64
>  
>  config CRYPTO_LIB_MLDSA
>  	tristate
> diff --git a/lib/crypto/mips/md5.h b/lib/crypto/mips/md5.h
> deleted file mode 100644
> index e08e28aeffa4..000000000000
> --- a/lib/crypto/mips/md5.h
> +++ /dev/null
> @@ -1,65 +0,0 @@
> -/*
> - * Cryptographic API.
> - *
> - * MD5 Message Digest Algorithm (RFC1321).
> - *
> - * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
> - *
> - * Based on crypto/md5.c, which is:
> - *
> - * Derived from cryptoapi implementation, originally based on the
> - * public domain implementation written by Colin Plumb in 1993.
> - *
> - * Copyright (c) Cryptoapi developers.
> - * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms of the GNU General Public License as published by the Free
> - * Software Foundation; either version 2 of the License, or (at your option)
> - * any later version.
> - */
> -
> -#include <asm/octeon/crypto.h>
> -#include <asm/octeon/octeon.h>
> -
> -/*
> - * We pass everything as 64-bit. OCTEON can handle misaligned data.
> - */
> -
> -static void md5_blocks(struct md5_block_state *state,
> -		       const u8 *data, size_t nblocks)
> -{
> -	struct octeon_cop2_state cop2_state;
> -	u64 *state64 = (u64 *)state;
> -	unsigned long flags;
> -
> -	if (!octeon_has_crypto())
> -		return md5_blocks_generic(state, data, nblocks);
> -
> -	cpu_to_le32_array(state->h, ARRAY_SIZE(state->h));
> -
> -	flags = octeon_crypto_enable(&cop2_state);
> -	write_octeon_64bit_hash_dword(state64[0], 0);
> -	write_octeon_64bit_hash_dword(state64[1], 1);
> -
> -	do {
> -		const u64 *block = (const u64 *)data;
> -
> -		write_octeon_64bit_block_dword(block[0], 0);
> -		write_octeon_64bit_block_dword(block[1], 1);
> -		write_octeon_64bit_block_dword(block[2], 2);
> -		write_octeon_64bit_block_dword(block[3], 3);
> -		write_octeon_64bit_block_dword(block[4], 4);
> -		write_octeon_64bit_block_dword(block[5], 5);
> -		write_octeon_64bit_block_dword(block[6], 6);
> -		octeon_md5_start(block[7]);
> -
> -		data += MD5_BLOCK_SIZE;
> -	} while (--nblocks);
> -
> -	state64[0] = read_octeon_64bit_hash_dword(0);
> -	state64[1] = read_octeon_64bit_hash_dword(1);
> -	octeon_crypto_disable(&cop2_state, flags);
> -
> -	le32_to_cpu_array(state->h, ARRAY_SIZE(state->h));
> -}
> 
> base-commit: 7ac21b4032e5b9b8a6a312b6f1d54f4ba24d1c16
> -- 
> 2.53.0
> 
> 

