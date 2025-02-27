Return-Path: <linux-mips+bounces-8006-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CDAA47815
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 09:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EB493AD218
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 08:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5D7225417;
	Thu, 27 Feb 2025 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="GsRmCFqW"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167C842065;
	Thu, 27 Feb 2025 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740645831; cv=none; b=FXo4mlMpJ7E8Fontngj0/qrBoNnHCNYDefc4hcvW+Ocr5l2wHSYu7+0xID7VyP0sfTUYBv/gSkoUB2n7CP+tsiP9eVYtLJZ48L+lWYO9pJCtJzM3Yc3GhRSuHka3kiqRA5ebQWPHdNqBskKIXS0wflnnqqw4g/l95xFkuhujTh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740645831; c=relaxed/simple;
	bh=EKov/eWUobveVY+0YfO7u9hWNImc86wliXWDLqVpDTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFlHY+2KNJJ5lcL2Zpqp02TWbGS+vfTJSRpbFAqfkgRgvDxEC4qLcC+1alnq0uJHBiw3yHZ2zfAaQEqk8U0EBjOoWE94bVXd3UPk4umkVuoJuxylJtxG2er3LI4WZr/Z6wQF3LivGxSiNdnYfU68pUnUZvjnEYNkD2uMnZyeOIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=GsRmCFqW; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jiPcZapR216itPgDV41PdhwEbp2fRiThI86FlwLZTVA=; b=GsRmCFqWzGCGd5G+zhMOhUMliV
	cvZYzsxKo30kJ+tvuntDdmv1EkdyiT0+RGypU3QuqxpBqjsmnSUpF1KQU6I08bJLDR964dnyF1dg2
	F+hRMofLDZkexeOuz6TJIBgcOgYD9e1FkzFYhTWrW4tOXm3izNYMQIKBiVxOvR9VWbfx2DMLc0209
	2U9reGjCRZC6/5tRtAkyM8XYsb4BO0sGHkWzjsMU2O6Hc8b5CHNlDooaTzPulqLwb1B18CHh17Z7E
	ksxKtGLzPh9rNCN+j9JS2t9utYmWIFsJNWGFUqZfk8XAPqdt5vR9G4T9uNTl71HMzUAzeG3P8/0tE
	oef5neBw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tnZTz-002Cin-38;
	Thu, 27 Feb 2025 16:43:05 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 27 Feb 2025 16:43:03 +0800
Date: Thu, 27 Feb 2025 16:43:03 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [v3 PATCH] crypto: lib/Kconfig - Hide arch options from user
Message-ID: <Z8All3G80gGXzfaU@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
 <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <Z77aFJCVuXeDXRrs@gondor.apana.org.au>
 <Z8AY16EIqAYpfmRI@gondor.apana.org.au>
 <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <134f64aa-65bd-4de0-9ac6-52326e35d6d6@app.fastmail.com>

On Thu, Feb 27, 2025 at 09:32:51AM +0100, Arnd Bergmann wrote:
>
> This looks like a good approach. Once it works correctly,
> it should be possible to clean up the 'select' statements
> in wireguard as well and just 'select CRYPTO_LIB_CHACHA' etc.

Yes that's the idea.

> I think the more common style is to put the 'default'
> lines before 'select'.

It is the customary place in the crypto tree.

> It appears that the two above are missing a
> 'depends on KERNEL_MODE_NEON' line. There is still
> a runtime check that prevents it from being used on
> non-neon machines, but I think you should add these
> lines here since it's no longer possible to turn
> them off individually when building a kernel for a
> non-NEON target.

Good catch.  But I think this was deliberate as it also includes
a non-NEON implementation:

commit b36d8c09e710c71f6a9690b6586fea2d1c9e1e27
Author: Ard Biesheuvel <ardb@kernel.org>
Date:   Fri Nov 8 13:22:14 2019 +0100

    crypto: arm/chacha - remove dependency on generic ChaCha driver
    
    Instead of falling back to the generic ChaCha skcipher driver for
    non-SIMD cases, use a fast scalar implementation for ARM authored
    by Eric Biggers. This removes the module dependency on chacha-generic
    altogether, which also simplifies things when we expose the ChaCha
    library interface from this module.
    
    Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
 
> I'm not sure why we need the extra "_INTERNAL" symbols, but I
> may be missing something here. What problem does this solve
> for you?

Without them Kconfig will bomb out because of a loop centering
on CONFIG_CRYPTO.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

