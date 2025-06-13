Return-Path: <linux-mips+bounces-9273-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 984BDAD82BD
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 07:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50DFD17090D
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 05:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15FC824DCE8;
	Fri, 13 Jun 2025 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YVzOhHxZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED8E2F4311;
	Fri, 13 Jun 2025 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749794107; cv=none; b=k9jtegYHKCyR96TBUSlldjGR7QTtOWmX4bFOhYnoT4qMuGfq8w5VvAlMpkFjVQMCWpKA7p0inNkxmrzEUCGYiCMvyYyvzU+YE0Asd5kf0rz0f3ProgVLHdccYQ4Gs25RSf6yzRbow2nNgQsdDTE5ihlevuzYkjHtYD+RATizy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749794107; c=relaxed/simple;
	bh=EQinaykufdJiEoc3wJL6eCiS8HSVV69EbKQuUIqZ4A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df/v6ZwYkiTDmqxrQFNbAs5zk/QTtD1wkJdFg7koywhXmf8OzDVEaCNjlIvRfP342v/HbOwjeEqO+95SzDORDVLrsSt3aPsGQax3a8Qs40KkpSq4jIA8f3h8NG3j8qbJH9FAGyrWj+Il9IVGtnFSO/1XEBh1tjL8kg6//Mt+g8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YVzOhHxZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5502C4CEE3;
	Fri, 13 Jun 2025 05:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749794106;
	bh=EQinaykufdJiEoc3wJL6eCiS8HSVV69EbKQuUIqZ4A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVzOhHxZEdRmDryhkzWsTUbgiD80/nGUFYqT/E2H+ztH9dYmB23yyHwGXucNgb2VC
	 Y8Fz2QN/YcPImgTIEsMmi2at1hh7Wusg/Swln8/tybuDvO3yr/9PIT9HrSY4//46t5
	 wtPpMSe6toD4o5BT4+TPQT4O1tvI0PZdKnRtsNZdCUINNq+fm+Z7UIGWhXakpXNeOk
	 F5q+LOT72fea0DA8ZY+ppJ0ZUz+JakkY/jajzT1HCY7f4skIu/5PCji8+056SRLZlm
	 Nfznk/+2lNHXfKpY+IVm0D/dqRpgiSfNfamOFv9YVmEk/vwZgHtnXyp+mDs5EU19PK
	 JVeDVyOn9w/jQ==
Date: Thu, 12 Jun 2025 22:54:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250613055439.GB163131@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEu5cyDOMcKteW_b@gondor.apana.org.au>

On Fri, Jun 13, 2025 at 01:38:59PM +0800, Herbert Xu wrote:
> On Thu, Jun 12, 2025 at 10:36:24PM -0700, Eric Biggers wrote:
> >
> > You do know that most of the sha512 asynchronous hash drivers use custom state
> > formats and not your new one, right?  So your code in ahash_do_req_chain() is
> > broken for most asynchronous hash drivers anyway.
> 
> Every driver needs to be converted by hand.  Once a driver has
> been converted it'll be marked as block-only which activates
> the fallback path in ahash.

Actually, crypto_ahash::base::fb is initialized if CRYPTO_ALG_NEED_FALLBACK,
which many of the drivers already set.  Then crypto_ahash_update() calls
ahash_do_req_chain() if the algorithm does *not* have
CRYPTO_AHASH_ALG_BLOCK_ONLY set.  Which then exports the driver's custom state
and tries to import it into the fallback.

As far as I can tell, it's just broken for most of the existing drivers.

- Eric


