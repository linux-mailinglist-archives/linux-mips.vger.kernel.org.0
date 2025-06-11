Return-Path: <linux-mips+bounces-9246-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F0CAD49D6
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 05:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A3C9189A023
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 03:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2226E1CDFCE;
	Wed, 11 Jun 2025 03:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oCI/NgO6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E64EAF9;
	Wed, 11 Jun 2025 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614347; cv=none; b=Ts3JD+ZAwCUjXF0MZ9uZw7eKSgLRGK3Fqzd7q5ylA2J6WRwoPNvM2IqXDCJ47oGQb3cYtVQFajOe+HVpq/8UGgXDo/f/3fx39oFqMGCx1h8tX2iIBNvjLS6C9CxYMlO4IRQhMI6r0/TLpBXiI+saP6UJvEaZgkq9kmFkiarFVxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614347; c=relaxed/simple;
	bh=szt+yu2QyA/QhUjatSBOr43sMK30sECLXWC5HWNvAj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQcD2msF3gO+1V7uQv4b4STuLWSR2qmXqFMLY5SebuM159R5ves8hmgsHWCPlXwMB/Lgwws4DpRMsgChyaqLRUWVNFbw/SdmgPOkBbh1FDBUv9YBRorAYLkRPjrqHBl3XfumE6dmGMg0v6HasOLLzlb4rsXcz7y76oC5FlsJ4Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oCI/NgO6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A1EC4CEEE;
	Wed, 11 Jun 2025 03:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749614346;
	bh=szt+yu2QyA/QhUjatSBOr43sMK30sECLXWC5HWNvAj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oCI/NgO6t82+0dt4rZ58DB+IkwRvjcNZ8pj5AEN6fKZSLEVlNEcF2b+DBphS2gu8/
	 soA6FLw7oMdHnpjUO+8dOJvlRr1p33bXZWdRSPljd2QvQe3FkrsUr+3IlRuy+lY705
	 8OIZGNq6+RStoCDw3miB+z/Emh3WsYmaW7T5NQTVBV/iG//6cY5agrJleSTHWSbuGH
	 eFd8ehhhWiUy0B2yIimmqk8TwvGDygZZ14r7jQYOb7GPEXoSNehfYGl1FkahLvK4x5
	 IGbF4jVwt+BqNJ8PquUrLFiUbiNyU8mcnJGot5yfNv+gOb2msM+oiMu2P4k9vYt2YW
	 nReNvxvHkbt1w==
Date: Tue, 10 Jun 2025 20:58:42 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250611035842.GB1484147@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>

On Wed, Jun 11, 2025 at 11:46:47AM +0800, Herbert Xu wrote:
> On Tue, Jun 10, 2025 at 08:39:57PM -0700, Eric Biggers wrote:
> >
> > Do you have a concrete example (meaning, a specific driver) where this actually
> > matters?  Historically, export and import have always had to be paired for the
> > same transformation object, i.e. import was called only with the output of
> > export.  There is, and has never been, any test that tests otherwise.  This
> > seems like a brand new "requirement" that you've made up unnecessarily.
> 
> It's not just drivers that may be using fallbacks, the ahash API
> code itself now relies on this to provide fallbacks for cases that
> drivers can't handle, such as linear addresses.
> 
> I did add the testing for it, which revealed a few problems with
> s390 so it was reverted for 6.16.  But I will be adding it back
> after the s390 issues have been resolved.

Okay, so it sounds like in practice this is specific to ahash_do_req_chain()
which you recently added.  I'm not sure what it's meant to be doing.

> > I'll add export and import functions if you insist, but it seems pointless.
> >
> > Could you at least provide proper definitions for the legacy structs so that I
> > don't have to do pointer arithmetic to generate them?
> 
> Just expose the sha512 block functions and use them as is.  There
> is no need to do the export/import dance.

We're not going to support direct access to the SHA-512 compression function as
part of the library API.  It's just unnecessary and error-prone.  crypto/ will
just use the same well-documented and well-tested public API as everyone else.

- Eric

