Return-Path: <linux-mips+bounces-9243-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7BAD48D8
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 04:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0443A7A7C46
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D7D176FB0;
	Wed, 11 Jun 2025 02:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="TMQWHPrT"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A0286A9;
	Wed, 11 Jun 2025 02:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608689; cv=none; b=Mg/pld+U9UFsWZ4qwd2HL31BrN1H842sw3C/VjVTAylTZqCFIznW3xHWyR0/IRxLxsbIdhR9u6HV4iYJ6uhbAadESfeUwPLYn/sILq5KMqaQCPwvfbaBdEWOq7FsWsUHSZ3QuF6g0PWy2RJkh4sknmqar7UAZ0urBGdGfHfPptM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608689; c=relaxed/simple;
	bh=5126qvlOcZBH+/w4a0h5hlElOM3Qf80MfDsMTsmVkkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uWozHNUXlEBQU06FMgS0GnSB82E1PTbM/nqTBshL3CtxQCq6114a9G5XyX5jxDDFzWm0ijYrijHwmsBzV8jsQ09RsD3UrQ1HI7usmqPhVW4sLkIa/SELNDqRbY+aJWjXgDZsiwG/RkjOFUvewfJrrVY1aMPs48ufDt3Pj04ucl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=TMQWHPrT; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WZVREpLjDbDWGkNX0co8NLJSuDCKSkP1OqgirQElB6U=; b=TMQWHPrTX3Fx+ENfQm6BAshHcE
	a9cvrMqulk98YyB590WJKrLkMlmaLaieZYlrFtoqASdEJn2XmNVMB+API98+sbhBEXqPTV5mhL7eJ
	QSb7cT3mQgJJ6Rm5ou9iCOzEceGw5lA/FE4hfXkAqxKRg09dWM3ZvHjh5I0x4UMST1LsaYrEh8O0K
	zH3diIcMUpZ6KCkjdHIIZBkGu1IXM87/5M/SjvpXedbtvdxQsV0iIMcvUDlyI6M74N1SR3ZRivvK7
	ZDbR5Ylq9hWF/4VSmBf3oQo8DuKzfQT+dXB/1hYY/oKiJHU/jXPioKY8GDnouEukzMujBuSdMB/0k
	Tja+Xzkw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPB8r-00CEkN-06;
	Wed, 11 Jun 2025 10:24:42 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 11 Jun 2025 10:24:41 +0800
Date: Wed, 11 Jun 2025 10:24:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611020923.1482701-8-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

Eric Biggers <ebiggers@kernel.org> wrote:
>
> +       {
> +               .base.cra_name          = "sha512",
> +               .base.cra_driver_name   = "sha512-lib",
> +               .base.cra_priority      = 100,
> +               .base.cra_blocksize     = SHA512_BLOCK_SIZE,
> +               .base.cra_module        = THIS_MODULE,
> +               .digestsize             = SHA512_DIGEST_SIZE,
> +               .init                   = crypto_sha512_init,
> +               .update                 = crypto_sha512_update,
> +               .final                  = crypto_sha512_final,
> +               .digest                 = crypto_sha512_digest,
> +               .descsize               = sizeof(struct sha512_ctx),
> +       },

This changes the export format which breaks fallback support
for ahash drivers.

You need to retain the existing export format.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

