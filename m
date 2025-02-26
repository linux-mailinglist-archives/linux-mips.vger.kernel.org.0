Return-Path: <linux-mips+bounces-7980-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D12A45860
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 09:33:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEE9A1893728
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 08:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF4F224247;
	Wed, 26 Feb 2025 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="hRaTwBlo"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A315827702;
	Wed, 26 Feb 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740558733; cv=none; b=SzxpUAxgF1NpzeNpAcUWql+OFLVOAirK7eiGRUoRgv4JLKx1DMYg4mLJljMJrRFuvKmiIkKd47zEVoppHzGLHYuMte7ySsS+NXz/iMiIJCC8mo85CFe1gbjesO2YJH1x3lLc6ABCBsgPp2XgiOH44lRhQM9I9gFM9tzy1nGLOYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740558733; c=relaxed/simple;
	bh=Od3moOeApKcecZ1xY2/PF5TE/S/y/kMeXQg5mTQgWF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O778RrL02LYIT5NTHU+SWt6wvOHpBlwBDlFmbk+cQYSwbc//PxMMVB2nnLttyc2vFLOGpJXKDs4rMB2KcHjNA9LcyJqZEw7SxNoyiXZqtP+vkaOu2Wmq5dp03g5gzqz401KvIAVZL+6D7yd7se+Oz3FjQ7k2Rb7pvn5ZlQ7DQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=hRaTwBlo; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WG/BZB8dw3KJbqJYA4MeEP90bt5qmYBoQ2VtcFkN6bQ=; b=hRaTwBlonDtEs5WWJDXcbJm7MU
	d4V9ZU6gHuJhkoi+hhZkS5kWAh65aYIBJTcW3+buIGJCXhqkaXgQ9PDIyPPhzH3nHEL5s0BMo74Ay
	ZQ1g0YhnFjKc7xk8lbHvBTR1rIBGK96J+TfAXWfTK4R7NRj8VBy/UjHmYuTO/b84eyf6qdI6Wfr+Y
	+baf0BP/9ndb6/emmAdd/YEU8pr6wLK4fIYy3EYMBtbaCqZ/jyeKA6m/D8Y1Nxa/jz+FksG6aR4IB
	/e3yhBCDN1MtgDD5i2uJvxQjkjgJPUPoFkAMvzVh58O+wk5F75j/yVAw4ngML9BIE98ykuLrredB9
	wHmg+PfA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tnCpM-001sM7-0Y;
	Wed, 26 Feb 2025 16:31:37 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 26 Feb 2025 16:31:36 +0800
Date: Wed, 26 Feb 2025 16:31:36 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Will Deacon <will@kernel.org>,
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
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] crypto: lib/Kconfig - Select and hide arch options
Message-ID: <Z77RaBFMc7u4EEIc@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
 <Z75xKexTUNm_FnSK@gondor.apana.org.au>
 <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
 <20250226060725.GA41090@sol.localdomain>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226060725.GA41090@sol.localdomain>

On Tue, Feb 25, 2025 at 10:07:25PM -0800, Eric Biggers wrote:
>
> There's no need to have a select for every architecture, with the dependencies
> redundantly listed.  Instead just 'default' each of the arch-optimized options
> to CRYPTO_LIB_CHACHA.

Good point.

> The way it should work is that CRYPTO_CHACHA20 should just select
> CRYPTO_LIB_CHACHA (and thus also the optimized code).

Good catch.  I'll add them.

> And similarly for the other algorithms, which should be in their patches.

It's best to keep everything together as if done separately they
may introduce bisection issues between the patches.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

