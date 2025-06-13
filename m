Return-Path: <linux-mips+bounces-9272-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F2AD82A6
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 07:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 284231898FD3
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 05:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE6B248F6F;
	Fri, 13 Jun 2025 05:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="MpUKvseY"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A8239E63;
	Fri, 13 Jun 2025 05:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749793154; cv=none; b=rT6Ka2ERA/o4dyksisuglQ+n4aiDKI1unnjwIIYNQyVos+IY+ujShHZHuD1A9PPx9x5PsNSLCwWGTNJDl7JAJltjtjQTxCDczEhvaqXLZr19VA/mXNBUt1dQUFAfDC19HKoVnPtnWanc4F+hNkEmVQ0KJwcDyxXJvBCdlmwjwbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749793154; c=relaxed/simple;
	bh=7B7yoeYh4JXhEB6FOG5rUo2gxfyGlGRg1Xmz2DCnG14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzN3yVSSKoeimBvgQN/ar+5DSCzjeYo7H1l14yUh7yeqa6NkIPkeZ+qSUuxnPRsK7g+IBTHKifDJz4yxNIZRr1HNMSvhlr7tbhZZY66uiwjsVhEMEkiw0NSSyv1lpSXjOZG0YcRkj+Fy5HtaIczztJTTn3W3EB6uz7F4Kjz1pKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=MpUKvseY; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oTmKBJlMorLr5a5LInNozxhvLN2jsh96HUsPIOSges8=; b=MpUKvseYkq6vJrGW2wEeJYJbyd
	9erfk9k/OIelxhqtST2G63Etxjf/l4waEtio+lwGS/YvJWxHfrgBi7vT90612S2yjiaqZg1yp15VQ
	+0/WMgh/vWFN+5EgWp3ePM0JPWxCCpPWUI0u5QyzgQ4rkMbrihzPy4P6vEiyqF0fdglweaZbKgPz3
	lcGc8LrVFasnavMmSFfunXd6iOB/a1rCbFuV0dhbTYtYvRyMxWPlr/CehCMPWOA2oG4goBifYOIWq
	IzJcLJ6dtEyg2eFqAxj8/SFtUE7Z7jjo6CbGdNHcee5UbceM6xFGgNpq2B+CHnWG+fWFvlVe4T6VL
	vyjVaA/w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPx7z-00CqA6-2c;
	Fri, 13 Jun 2025 13:39:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jun 2025 13:38:59 +0800
Date: Fri, 13 Jun 2025 13:38:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEu5cyDOMcKteW_b@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613053624.GA163131@sol>

On Thu, Jun 12, 2025 at 10:36:24PM -0700, Eric Biggers wrote:
>
> You do know that most of the sha512 asynchronous hash drivers use custom state
> formats and not your new one, right?  So your code in ahash_do_req_chain() is
> broken for most asynchronous hash drivers anyway.

Every driver needs to be converted by hand.  Once a driver has
been converted it'll be marked as block-only which activates
the fallback path in ahash.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

