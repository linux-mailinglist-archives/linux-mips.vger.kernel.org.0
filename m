Return-Path: <linux-mips+bounces-9805-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0EB03235
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 18:54:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD79D177F62
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 16:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72237278774;
	Sun, 13 Jul 2025 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="psBeNjv+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4BE69D2B;
	Sun, 13 Jul 2025 16:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752425645; cv=none; b=rwXt3cJb6r6/fKKuY9r7/VFsUhzr3nt0LRhygW8imb76mfh+kiTpsgGplSq8bSQ3f/E4MuZVjKbimVvy4mXLL1w5JGn22ZdfSF8kZ3IPdSN6jlttYEgb/yTvRB9DfafuVilP4zdR+xnAihN5qkkDl8VztgMJSZo25lgMcAoYjtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752425645; c=relaxed/simple;
	bh=Ow06yQH+u1TUlWbbAwuQ6n6w8NZPq6HcKp1HGVfdQHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNO5I2m+DIFo+x83XRuYCNWlFGD4IoMPBPqeemLjQ3fXGw8mlXL9W2klykq75DEgeQSQAgnv6QQ8t6egBSxv1VppPb2eehRJ5IMB8dNo0glaV5hx9g+gkuxvVEtRYyqXZ9cWs6YnFks54/GI8IYkzdZbjE+pMfNQUDqfmIvkleA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=psBeNjv+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECB5CC4CEE3;
	Sun, 13 Jul 2025 16:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752425644;
	bh=Ow06yQH+u1TUlWbbAwuQ6n6w8NZPq6HcKp1HGVfdQHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=psBeNjv+mOu40r53jPAVUKkDWtOk29oQIjMtjuLacb0tSv7EYhwPGGy6ZIDNaeC5J
	 KLGDmHHNB6+CME4dLYfequUVCrgryGgkQH3/ZtSzl4Yh3rWI+TLRdtDli+cU7oBIR9
	 zTOcoykL/TuRZrmJp07fl9qyX5HaP+gNdLKl1Qkj21ZJxQ4c34NFHgWsvkF1Yvqpac
	 eXeBG/x7hXS2z+QMZ9oYTXXdBknoip3I9nOkH1YdWeRxSH9ljLerT2DjATvVmjB0kV
	 z3v7vio7962xSabdWzzE4DRFI1u18UTLVjtmdSYnSdykM0mDtU6xhHaZqh0NBwhRGn
	 IFi7rHIUzSk7Q==
Date: Sun, 13 Jul 2025 09:54:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
Message-ID: <20250713165401.GA1773@quark>
References: <20250712232329.818226-1-ebiggers@kernel.org>
 <20250712232329.818226-4-ebiggers@kernel.org>
 <IA4PR84MB4011819C07CD123FEDD4EC75AB55A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA4PR84MB4011819C07CD123FEDD4EC75AB55A@IA4PR84MB4011.NAMPRD84.PROD.OUTLOOK.COM>

On Sun, Jul 13, 2025 at 03:05:16PM +0000, Elliott, Robert (Servers) wrote:
> > -----Original Message-----
> > From: Eric Biggers <ebiggers@kernel.org>
> > Sent: Saturday, July 12, 2025 6:23 PM
> > Subject: [PATCH 03/26] lib/crypto: sha1: Add SHA-1 library functions
> ...
> > +static void __maybe_unused sha1_blocks_generic(struct sha1_block_state
> > *state,
> > +					       const u8 *data, size_t nblocks)
> > +{
> > +	u32 workspace[SHA1_WORKSPACE_WORDS];
> > +
> > +	do {
> > +		sha1_transform(state->h, data, workspace);
> > +		data += SHA1_BLOCK_SIZE;
> > +	} while (--nblocks);
> > +
> > +	memzero_explicit(workspace, sizeof(workspace));
> > +}
> 
> That assumes the caller will never pass nblocks of 0... should that be
> checked first?

No.  This is a static function, and it's easy to verify that all callers
pass a positive nblocks.  All these code paths are also well-covered by
sha1_kunit.  Also, lib/crypto/sha256.c and lib/crypto/sha512.c do the
exact same thing.  Also, most of the architecture-specfiic
implementations of sha{1,256,512}_blocks() assume positive nblocks too.

- Eric

