Return-Path: <linux-mips+bounces-9276-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3511AD8616
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 10:52:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C7F43ACDCF
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 08:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7474E291C10;
	Fri, 13 Jun 2025 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="ejeNYxJx"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A57291C0A;
	Fri, 13 Jun 2025 08:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804706; cv=none; b=Qgg9pjw78Zz5oe/Z+hcCfuugAgFN9M01PhgTHhaXOu9aMuIu//GaiyisZxCu3eBubBUih2ffsm/wmXDoDZHA0OpX7q8HPieMpWc0YNvyMydVvm5QZvPO5LH3eKtZoRlYYkNiKfmFgQvtI38ZqnKlHLimWqdbQmGgtC8Wn4D065o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804706; c=relaxed/simple;
	bh=XjnRFn+DLVFoTo5zHOySZabgyaoUWVbhHCCtwku0/2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ec4Ul/uqug03vfAwxsekUQA4LY2U+Fx6GNBJlDF7c8zDIkJ/RlmbTptrLQamru+Qj0YdTSgPO+/d56xw2FB2mWl2oPXKYqt6ohj9dALoQdcXx/zkYCih/GP9OPZRV1cqSrOCz4+C23bxDeRiaK8u+ulhK+Svn0XdxQBfY0qjako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=ejeNYxJx; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=wMKt/wPLq9KRfU6Jf04/z1jGFWH/wF4jH0NXJm6Bhlo=; b=ejeNYxJxjqQkEf+Qtb4/A1GtfZ
	b7jAaCx+igD/opjcpb3XKwVwchdM/PXR4tiwHprFmt4/L2Xs+ZpChWQHUuX2LYsCxrUU+eiustbeA
	ZKVolER6TWQLfjepmarO/P1DHA89vwzY7ArJk9gDAzisKwslfsuuBqb/Wg3/aWQPZOOjQoyMRELCP
	8Xbl2WNglxWI/mZ9MWHvlGbxuFigF+67XenNjqAmRVolrvDDN1QbLFg2RHZ/qe/i3LN+yRpvaWrJm
	DTsKHT9mnfmMylzfbbw6eoUAmVq33jZS3a+a6lk6aGGMWMPA7TQxzmLPlMLIij5j0NMLYobmukZhv
	QJp9aG1g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uQ08Q-00CsF4-2w;
	Fri, 13 Jun 2025 16:51:39 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jun 2025 16:51:38 +0800
Date: Fri, 13 Jun 2025 16:51:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: [PATCH] crypto: ahash - Stop legacy tfms from using the set_virt
 fallback path
Message-ID: <aEvmmr0huGGd2Psv@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613055439.GB163131@sol>

On Thu, Jun 12, 2025 at 10:54:39PM -0700, Eric Biggers wrote:
>
> Actually, crypto_ahash::base::fb is initialized if CRYPTO_ALG_NEED_FALLBACK,
> which many of the drivers already set.  Then crypto_ahash_update() calls
> ahash_do_req_chain() if the algorithm does *not* have
> CRYPTO_AHASH_ALG_BLOCK_ONLY set.  Which then exports the driver's custom state
> and tries to import it into the fallback.
> 
> As far as I can tell, it's just broken for most of the existing drivers.

This fallback path is only meant to be used for drivers that have
been converted.  But you're right there is a check missing in there.

Thanks,

---8<---
Ensure that drivers that have not been converted to the ahash API
do not use the ahash_request_set_virt fallback path as they cannot
use the software fallback.

Reported-by: Eric Biggers <ebiggers@kernel.org>
Fixes: 9d7a0ab1c753 ("crypto: ahash - Handle partial blocks in API")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/ahash.c b/crypto/ahash.c
index e10bc2659ae4..992228a9f283 100644
--- a/crypto/ahash.c
+++ b/crypto/ahash.c
@@ -347,6 +347,9 @@ static int ahash_do_req_chain(struct ahash_request *req,
 	if (crypto_ahash_statesize(tfm) > HASH_MAX_STATESIZE)
 		return -ENOSYS;
 
+	if (crypto_hash_no_export_core(tfm))
+		return -ENOSYS;
+
 	{
 		u8 state[HASH_MAX_STATESIZE];
 
diff --git a/include/crypto/internal/hash.h b/include/crypto/internal/hash.h
index 0f85c543f80b..f052afa6e7b0 100644
--- a/include/crypto/internal/hash.h
+++ b/include/crypto/internal/hash.h
@@ -91,6 +91,12 @@ static inline bool crypto_hash_alg_needs_key(struct hash_alg_common *alg)
 		!(alg->base.cra_flags & CRYPTO_ALG_OPTIONAL_KEY);
 }
 
+static inline bool crypto_hash_no_export_core(struct crypto_ahash *tfm)
+{
+	return crypto_hash_alg_common(tfm)->base.cra_flags &
+	       CRYPTO_AHASH_ALG_NO_EXPORT_CORE;
+}
+
 int crypto_grab_ahash(struct crypto_ahash_spawn *spawn,
 		      struct crypto_instance *inst,
 		      const char *name, u32 type, u32 mask);
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

