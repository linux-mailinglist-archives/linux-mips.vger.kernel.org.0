Return-Path: <linux-mips+bounces-8641-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8CBA930BC
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 05:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4151B65E10
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 03:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E071DAC81;
	Fri, 18 Apr 2025 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="Ez6H9+ae"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D875F101E6;
	Fri, 18 Apr 2025 03:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744946650; cv=none; b=XtfGehiEAS80zjQ+1vfpY0TKS6uHExndW7jngC/AYHlJqEdp9VJ2dNrozY/huyjbELInF0wiFSQ+o2YYOEtoZZyp63PpzzVLMcBAC+IyBUVnaF1odMAXlfwM3a+Nfi4Qdk78AAN1h+du8I4Uddpsv7Fbh7A2+D5/K1tkbiYFtI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744946650; c=relaxed/simple;
	bh=mWuGbazfnR1UFMc9SC/03ndtQ8TMPbGHHSxlfU1xvD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Zwa0VTrShwXPoo8T8YTCjKLm7nyz9cjJecTJLJ3wn1c3euXHy0rZ3UeyNSFe8xMDXWKrE5YpoWulDYSE5MpQoCFXvCs/2NE/0/G49ZnwanGcTQOoxvdaGkc643QbuiSUn/R84ZOPlXF/EdrPBHkAKQ/M4T0CCfn2s9ohNdiaJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=Ez6H9+ae; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Knan138NdmDVR2CPp6B1Qzbr7MQKu8dC2FLjkzzbmvI=; b=Ez6H9+aeRufRaBW4KKs6TPV5rc
	/oGb4UfCcPzduHjQnNyKHxy1droB9vh99WEubgJTKYlrwvLCjkkgjHxnJvGSHFEaDyNsclRpwc1Qs
	Cff94MmADxhIheCuAX3VjYAbtcKNwLjxn8YHYFZmQthiylFdl7PKYwOcyZUqwFbEznpb/pqqHww24
	acLyNI3vutChyZ5dcDugMElCr+iaDZqZGGzOMWF1E3KrL2c9R/ivnrdJPpi1EHCbMgucJtJiv4WjA
	/lmyWUibeMw+8o8sNujxq/GZWsvpcObxg73E3FjEzh76LAPfRp9q6WsuheEUa8W3mPwpRoLiAxFLw
	MiZJjYEQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cKf-00Gebr-1J;
	Fri, 18 Apr 2025 11:24:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:24:01 +0800
Date: Fri, 18 Apr 2025 11:24:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405182609.404216-9-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel

Eric Biggers <ebiggers@kernel.org> wrote:
>
> -static void __exit chacha_simd_mod_fini(void)
> -{
> -       if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
> -               crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
> -}
> -
> arch_initcall(chacha_simd_mod_init);
> -module_exit(chacha_simd_mod_fini);

Why did you remove the ability to remove the module?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

