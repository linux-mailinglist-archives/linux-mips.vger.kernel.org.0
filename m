Return-Path: <linux-mips+bounces-9333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF8ADA709
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 06:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 917823AFF2E
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 04:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D80155C88;
	Mon, 16 Jun 2025 04:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="Dkr31hJx"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE5A748D;
	Mon, 16 Jun 2025 04:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750046965; cv=none; b=lGrPN1l4+3G5Q/OHI5sxgUInm3UXfB9W2OnqzydekI/dFp2nQB5ADCQG1rsFqlawVr45BDCzsjFUZgTahfLS9fTe0otobNdZXP/BsyWjukNaP48LOhPOiMM/FFfHWpij+gNTOzOLwWrH1kTk1oJy+CNZMFNt1z0h57RXK5zArZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750046965; c=relaxed/simple;
	bh=djI8g1JpgsRAjUj8Dc2+uUnKHr91231GLP6XPF8dB3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WOJnvsuNjiD1QroWhQmK1O+iGYcMXo64n/hd81Ec9SjrRnEJlnhEVRj95eD3AvaEoX7YCnfQBV5Z8Ll93HEcXEiLtYkdxucXM8UPUXIjP8CUyokk2YzNHa3TKd1L7Aq6BXhxZRo57jkGriSW0c8zVx1iZZFCFsOc/0Ae6nLVQzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=Dkr31hJx; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I38ai5ionxBMkBimwgLTi73TMk2JcKNFvw44Vez0IHg=; b=Dkr31hJxvLQnMX0CfUojD5ZoE7
	MusiFgiCS4vFeeOt6FIPojpyxxSZVMUfETa4aO4WEzxp0Mjc4uOXbiK6zlntrb0LOL3eEZ//QO29I
	1QPx96pD1ghlO3yPOzExTtEJ5KpKXOeEsJUbu9oED8EkTc2ABJC59nNNWQkr7t49qgLqu0Lo/4O/P
	N0MTEVx+OkOxgm2Y6507kpc/JUHsMWiIi16uANk6vdK8E/qCV5C7q+Vr8nWeOmcYUJU5QmOg1pypW
	TRIDx0faC1zS86z9Bm8sHbovNm2tMcfNbZQLNicr/kkjQ66KlAP2x2YVqG2HcJI6DnWoKnUoeXe+8
	BToQgXOw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uR0uf-000JCI-2h;
	Mon, 16 Jun 2025 12:09:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 16 Jun 2025 12:09:17 +0800
Date: Mon, 16 Jun 2025 12:09:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: [PATCH] crypto: ahash - Fix infinite recursion in ahash_def_finup
Message-ID: <aE-Y7VzdJTDJHsy_@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <aEvmmr0huGGd2Psv@gondor.apana.org.au>
 <20250615031807.GA81869@sol>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615031807.GA81869@sol>

On Sat, Jun 14, 2025 at 08:18:07PM -0700, Eric Biggers wrote:
>
> Even with your patch applied, it overflows the stack when running the crypto
> self-tests, apparently due to crypto/ahash.c calling into itself recursively:

Thanks for the report.  This driver doesn't provide a finup function
which triggered a bug in the default finup implementation:

---8<---
Invoke the final function directly in the default finup implementation
since crypto_ahash_final is now just a wrapper around finup.

Reported-by: Eric Biggers <ebiggers@kernel.org>
Fixes: 9d7a0ab1c753 ("crypto: ahash - Handle partial blocks in API")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/ahash.c b/crypto/ahash.c
index bd9e49950201..3878b4da3cfd 100644
--- a/crypto/ahash.c
+++ b/crypto/ahash.c
@@ -603,12 +603,14 @@ static void ahash_def_finup_done2(void *data, int err)
 
 static int ahash_def_finup_finish1(struct ahash_request *req, int err)
 {
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+
 	if (err)
 		goto out;
 
 	req->base.complete = ahash_def_finup_done2;
 
-	err = crypto_ahash_final(req);
+	err = crypto_ahash_alg(tfm)->final(req);
 	if (err == -EINPROGRESS || err == -EBUSY)
 		return err;
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

