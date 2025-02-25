Return-Path: <linux-mips+bounces-7961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C7BA44EF4
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 22:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B20661890C79
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 21:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D866220E31F;
	Tue, 25 Feb 2025 21:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUVwHF4i"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A818320E32A;
	Tue, 25 Feb 2025 21:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519233; cv=none; b=ROjxot/a8Mo5u5cjMJ13OgEufzvd+J5AnfTFVPDGWccVbKiox7TY4tTTu22NrDkgr6UbzpwrkLd+9G5RvhPMgY/wiq84E61tofeVxdDSxaKfpFanJLwRcYJ59DUd97UTt2oCWUXeffcGdGyG/NUeT+hQnqckrhz0opLpp1dn3FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519233; c=relaxed/simple;
	bh=tkbCqHo/M713wubuDMEEG8+yMclhPNrm1rcQ6FSts+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOGREpC+LS9DK0+kOA+5DJ5DDIcuEzpMaH42PTFCORld2ba/pGPQRPX9bhY/ayPPpidDaODoyjGIyXc3bqqRWqLQanaewioEH+I7xMnAu0dCSZyhN2B1I+q1Q7DNiKTSHyqbXQVi5+5spvdnq0x2JjeCVC8C1d3IJn7+X0iynYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUVwHF4i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60A96C4CEDD;
	Tue, 25 Feb 2025 21:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740519233;
	bh=tkbCqHo/M713wubuDMEEG8+yMclhPNrm1rcQ6FSts+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUVwHF4idDLldp3ni+zD6Po2mDLxrhVLakNSqszU3zbQtr5e9xIGitGwChQE8DPty
	 Yz5Z37+uCs+Ag6oqZaPNV16ZccNfN5Q0NGjkBbjLSJxGUWhLG8dunPdnf9aDZAVFDN
	 A5ppwCURBwrA67y0QNq46iqUHnKNlS11WU9CS4WWrXccACpiwlVjkMplEN0ODd+rSG
	 xU2XqCOFIf7BkBuk9hMdGE3pZrB4Ib5RNgWAkCry50jaInzT1QvI5AnzbpWx681fOl
	 HWkmPI2rPNkN6tN+yOuiTpX11ZVDTedYmiMJHHye4PL5SuRN6osuO4UC9Pvo0C3cF4
	 8x/2FoVjESVYg==
Date: Tue, 25 Feb 2025 21:33:46 +0000
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] crypto: lib/Kconfig - fix chacha/poly1305 dependencies
 more more
Message-ID: <20250225213344.GA23792@willie-the-truck>
References: <20250225164216.4807-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225164216.4807-1-arnd@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Feb 25, 2025 at 05:42:07PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A recent change tries to fix Kconfig dependencies, but introduced
> two problems in the process:
> 
>  - only arm, powerpc and x86 are changed, while mips, arm64 and s390
>    are now broken
> 
>  - there are now configurations where the architecture enables its
>    own helper functions as loadable modules, but they remain silently
>    unused because CRYPTO_LIB_* falls back to the generic helpers
> 
> Address both by changing the logic again: the architecture functions
> select CRYPTO_ARCH_MAY_HAVE_LIB_CHACHA, which may be a loadable
> module or built-in, and this controls whether the library is
> also built-in.
> 
> Fixes: 04f9ccc955c7 ("crypto: lib/Kconfig - Fix lib built-in failure when arch is modular")

Which tree contains this change? I can't seem to resolve the SHA locally.

Will

