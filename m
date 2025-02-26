Return-Path: <linux-mips+bounces-7969-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 237E0A45253
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 02:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E27AF18845E3
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 01:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4258419CC3E;
	Wed, 26 Feb 2025 01:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="CvN5XUDJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157B018801A;
	Wed, 26 Feb 2025 01:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740534098; cv=none; b=OHFDF8ISjo0+1c30r+cEFs5m4hj1l4yv/7DWUv8C1DOY+JK9VaPwl6H6puC/ZNHzeC14bak0NjQuPRwb4L3Vl52XBp7CSVDM+es46JvpCrj2WBUPCi9+lFsyK1ec09P69hm0bBULt7ODwh7SmbMszQ3giu7UI4qqUynDSNTWJ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740534098; c=relaxed/simple;
	bh=58ZMG8/1/Uh1xkS5yKwRQCg82oBoxBK2uJYcSHkp4rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLOsXc77hwhzFJV7vbWYxOA3ZrfGnanKdx9DptQmxPCLNwbKBIhFpRfqXBjClTdWGCQG0CEC+41Udpkh+CGKGQ+GOxSIV/mg38qLzBxQ0+qmhQSE8PLYLHvFOiZUxKOV+UyzltFg3GPT4Dq6heATUUV8UUo5aBFiNhD4YQ3whpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=CvN5XUDJ; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jdo3/IxMwB8Q6RAm8ZwQFpjzIGffxAXyzhXHZ3RcNYQ=; b=CvN5XUDJLLlwrhy2yvZ3JOn+mA
	66llyxU9BmPbO5yXQyiku1NmjCiS1kuS9BFF8Yp06Eqq24WFuOy39micBVHNgX3ViXpXs19PthvR/
	Wn9fLbmpxq9kdrF/dni3e0lPtym++ScEocHEK8MLciUAsI6lsVqr//2bFdZX5STFbLXwXndIoKsVO
	PZQ6MhZXoT/BiTrKcnlI/OL350i3vgAWwJmB8o8De+KtnrV2a6lTFKQ/ouDwLkRElW691cwJl0YRk
	/SiR5VaATjvDIh1KOZqglSm6ktFZm7wqGo36ulqjhlizNZB/3F21vRn8vd7OKxW/bwYZ5ZOJXuLL1
	sUyRl2ag==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tn6Px-001nh1-2C;
	Wed, 26 Feb 2025 09:40:58 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 26 Feb 2025 09:40:57 +0800
Date: Wed, 26 Feb 2025 09:40:57 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
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
Subject: Re: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies
 more more
Message-ID: <Z75xKexTUNm_FnSK@gondor.apana.org.au>
References: <20250225164216.4807-1-arnd@kernel.org>
 <20250225213344.GA23792@willie-the-truck>
 <f7c298b8-7989-49e7-90a2-5356029a6283@app.fastmail.com>
 <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4896a12-8abe-4fe6-b381-86b23d32b332@app.fastmail.com>

On Tue, Feb 25, 2025 at 10:50:10PM +0100, Arnd Bergmann wrote:
>
> After looking at the original 0day report, I think the fix for
> that problem would have been
> 
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -94,6 +94,7 @@ config WIREGUARD
>         select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
>         select CRYPTO_POLY1305_MIPS if MIPS
>         select CRYPTO_CHACHA_S390 if S390
> +       select CRYPTO_CURVE25519_PPC64 if PPC64 && CPU_LITTLE_ENDIAN
>         help
>           WireGuard is a secure, fast, and easy to use replacement for IPSec
>           that uses modern cryptography and clever networking tricks. It's

Thanks.  I wasn't aware wireguard was doing this.

Let me see if I can replicate this select matrix in lib/crypto
instead.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

