Return-Path: <linux-mips+bounces-9444-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC3CAE23FB
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 23:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E26351C203BD
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 21:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9D82367B8;
	Fri, 20 Jun 2025 21:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ds5LwgI/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE95B137E;
	Fri, 20 Jun 2025 21:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454866; cv=none; b=ixaAlfHumRd+qSevKVilDFfGrInbEvyto9RFl6TiV58ypoxCBwKT6wOUWp4yyoane6Q4DUKVeXVZtqy5Yy0YbnWIVBmoscxeVhWX1yOI97/+IOuF5W0/trul+vZOs5Z701PxW3jNomyPYSnlU3I+IQzyyyVM5WigMVIsu+fMwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454866; c=relaxed/simple;
	bh=p+s2U0fmyhm9d55BemGKbD2X2i9CJZsBrPbvF4f3HF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EvB/MkAsjS9fWOEgxjPmsjh7QV5xAQjTSYMFnTVugEiOXZKVoNkgHBZjZEFArkRRvnBlB5WoTfceTZlnbj9o+eaLa8Ug5S+YqejFX2yRcdIsr82VvLr8oUVJ7rs1wcl8btDHlSIEw0l3QqAEvMiBJPZmjEv3AKVcA5Nx013Nk9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ds5LwgI/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BFEC4CEE3;
	Fri, 20 Jun 2025 21:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750454864;
	bh=p+s2U0fmyhm9d55BemGKbD2X2i9CJZsBrPbvF4f3HF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ds5LwgI/bYZ6UOF1Y/q/iX9FiABAyMDbuJLEnx5x38j/VZwT3Ng9Z3m65OW2qs2fM
	 JucWLQfkRXHRF/k4xkXgc07zo5nqDSEsaGDhRAW2uKqEJ0Ya22MmmxFlNewsXkBIGl
	 G+FrikxHSQuYMlAzbqYH+w0a5m65Yj5TmMy8Wu6+YllIXCPIU1jTnIceE5RS4SchJa
	 oBIu6H2ACmQVFniDwWpxpEctn78VfYHZ2rcoLF9+LAON4EWnajq8hfdkbyH/1wWxLc
	 ATqrJrOS8V2VAvOYGKlyvJN5Nwm3eIMmt0692knVIoBUkOSjluJwa2mKRrsTgnI61b
	 ysFwAcUy8QOXw==
Date: Fri, 20 Jun 2025 14:27:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250620212742.GB5460@quark>
References: <20250616014019.415791-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>

On Sun, Jun 15, 2025 at 06:40:02PM -0700, Eric Biggers wrote:
> This series applies to v6.16-rc1 and is targeting the libcrypto-next
> tree.  It is also available at:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v2
> 
> This series adds support for SHA-384, SHA-512, HMAC-SHA384, and
> HMAC-SHA512 to lib/crypto/.  The new functions take advantage of the
> kernel's existing architecture-optimized implementations of the SHA-512
> compression function.  The new functions are fully tested using KUnit.

FYI, applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

Additional reviews and acks would be greatly appreciated, though!

As per Linus's request, I reordered the KUnit tests (patches 4-5) to be last.
I'll try to keep them last as additional non-test patches get applied.

I also adjusted commit titles slightly to match what I'm planning to use for
lib/crypto and lib/crc going forwards:
    
        lib/(crypto|crc): ((algorithm|arch|arch/algorithm):)? Subject

    e.g.

        lib/crypto: sha512: Add KUnit tests for SHA-384 and SHA-512
        lib/crypto: x86: Move arch/x86/lib/crypto/ into lib/crypto/
        lib/crypto: x86/sha512: Migrate optimized SHA-512 code to library
        lib/crypto: Explicitly include <linux/export.h>

- Eric

