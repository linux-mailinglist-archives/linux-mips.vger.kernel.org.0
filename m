Return-Path: <linux-mips+bounces-8612-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B2A8B2E2
	for <lists+linux-mips@lfdr.de>; Wed, 16 Apr 2025 10:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 829E83ADEF1
	for <lists+linux-mips@lfdr.de>; Wed, 16 Apr 2025 08:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E231C2147EF;
	Wed, 16 Apr 2025 08:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="p6rOFRuB"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008061F94C;
	Wed, 16 Apr 2025 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790444; cv=none; b=QMT5cZy+Gvk5p4voLBwErTze+z0Lm/5vZCb7ZWe3Q4ilFDMe5KGbT+4YyX2Y4xKq/8q13k1nwFgkMTQuHRFNk6CDYqAzztl6ULqNrg9Jr3gmtko07ZXatDoiwy2po+Es6FgovOFfiwh8bnT8tTSYh1vzp62294QnlxMKF/89nio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790444; c=relaxed/simple;
	bh=f+0G+mfCas1lJBR/6RHW1V+Gavmz5DoO4HGg92lelWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m6d+xmFHEQCTQ2l2gjCG1GUEqKZS00hayy6+M6h9902M2x1o8fVNKDTGm6/uv1uQe9n/1Do/dq/KfmGDby5znA9S61RzdLBHsImYjn+05gBvLcY1kRbwqcQNfiuvXCuFQnsNuKUHqZgh27QzIGGW7MfmKOTmNOX45lNE3LlTL/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=p6rOFRuB; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CxllXsS7oZKhmgl74o8BLeNmMQKxBZycllNwlO7QoVM=; b=p6rOFRuBNqBL9Vs+KMLwfIwpaW
	yz/TUWI06KiYLjDOWRkW1thUO1NCa0FsczE1IdP8yWQJuNPoj7zLoeTV/bcNnNzwnrrQZxCAF6hWN
	rR3nya2bEWTJ06hsRLUYISaUNvMGmmJL2xQjFg9UXnzbuNs+F3O8tZDTNTPjcwkWcdfZbNyJ4y44h
	MNkHBN0Q6sxrv8XtbZop2V1nmDZtMJY4YBCj2ZV5ufdu+NQuPvRjnUCx6msKVoK7FpDyGaHfZtkeJ
	fVmHWHaHPram2mO/vEo3QW8W7xM+RzwRRrwC4Eq7LpM/nK/62FTZQlA3nyOmTRNvV4g+dWKgbKTzE
	D7ct5GZA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xhH-00G7yK-1U;
	Wed, 16 Apr 2025 16:00:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 16:00:39 +0800
Date: Wed, 16 Apr 2025 16:00:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Subject: Re: [PATCH 0/9] Remove per-architecture poly1305 shash glue code
Message-ID: <Z_9jp6J6YKImbzyg@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

Eric Biggers <ebiggers@kernel.org> wrote:
> This series removes the per-architecture poly1305 shash glue code and
> re-implements the poly1305 shashes on top of the Poly1305 library
> functions.  This ends up being much simpler, and it is how it should
> have been done originally.  This follows similar changes to crc32,
> crc32c, and chacha20.
> 
> This series also makes the Poly1305 library be optimized on PowerPC.
> Previously the PowerPC-optimized Poly1305 code only supported shash.
> 
> Eric Biggers (9):
>  crypto: powerpc/poly1305 - implement library instead of shash
>  crypto: poly1305 - centralize the shash wrappers for arch code
>  crypto: arm/poly1305 - remove redundant shash algorithm
>  crypto: arm64/poly1305 - remove redundant shash algorithm
>  crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
>  crypto: mips/poly1305 - remove redundant shash algorithm
>  crypto: x86/poly1305 - remove redundant shash algorithm
>  crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
>  crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx
> 
> arch/arm/crypto/Kconfig                 |   6 -
> arch/arm/crypto/poly1305-glue.c         | 170 ++----------------------
> arch/arm64/crypto/Kconfig               |   6 -
> arch/arm64/crypto/poly1305-glue.c       | 143 ++------------------
> arch/mips/crypto/Kconfig                |   6 -
> arch/mips/crypto/poly1305-glue.c        | 120 +----------------
> arch/powerpc/crypto/Kconfig             |  11 +-
> arch/powerpc/crypto/poly1305-p10-glue.c | 134 ++++++-------------
> arch/x86/crypto/Kconfig                 |   8 --
> arch/x86/crypto/poly1305_glue.c         |  99 ++------------
> crypto/Makefile                         |   3 +-
> crypto/poly1305.c                       | 153 +++++++++++++++++++++
> crypto/poly1305_generic.c               | 149 ---------------------
> include/crypto/poly1305.h               |  13 +-
> lib/crypto/poly1305.c                   |   2 -
> 15 files changed, 242 insertions(+), 781 deletions(-)
> create mode 100644 crypto/poly1305.c
> delete mode 100644 crypto/poly1305_generic.c
> 
> 
> base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

