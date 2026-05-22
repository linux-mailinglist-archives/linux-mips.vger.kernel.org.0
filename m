Return-Path: <linux-mips+bounces-14717-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEJGMTJYEGocWgYAu9opvQ
	(envelope-from <linux-mips+bounces-14717-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 15:20:50 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13B5B5073
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 15:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3D597301DC7F
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 12:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43A63FFAAD;
	Fri, 22 May 2026 12:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="U4FOevce"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ADE3A2576;
	Fri, 22 May 2026 12:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453317; cv=none; b=DBLtOXWdQKhog1Jqbm/0tO9FyvbamdXphd443pQchmHkEgVB/OgI9cMMj7tOUjKnqefcwt+PbYcWyAfVlD34MdjrK7+j0nEjWuRxnlk6NskT+vnIry2jdLfAwAfV2G4SG7HhkxOW01uu7iSqSq1DexpbwpOIujJNFEp4GRRAWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453317; c=relaxed/simple;
	bh=HMU1PutA3bdouJkZUeyxyghrGZTfoCJtuVi9cUWs/uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIuUWr3s9YZ5SuPGGLr/vqdPsT5aCMHUJCB9nJWofe2h4PgZ2QxFHnDOSU20b0/RnSRS881GNjsga8hVaEnBkJzTTLnCmI9pDpXZo9Gi9GgUl2ePfOnwDmBKjb1eVppkNl9ZUVrJVcS9+GBkbqphWDro+/+iWDRhywd9Q3GWSbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=U4FOevce; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=vO0BR4NCEUNrdYjg7SnlFj8ZbPX/0PHGgpRt+e8KcwI=; 
	b=U4FOevceI0YD3aGhUUWTGFBzPd+Vevohds2ymshBPmX5Yz3acx0c06rm+KTyELrW25bb+QpEpND
	fGxXB7Q9by42I+VhVYult1OAxLjiLT3AUw+0+Mpj2MHU+P+87VMEOxcGVcfFORQd91EhkNXqMCvrt
	EEOSOED30MoFIe8GNzqrdERPOsWcStZhipVqBjG+QWF2Vbvmw2Nn4KjzsU5MzC/kywLkNH6ydk/IB
	FuwyDOV9G48FqGDBbZwmAe2hGyu6HWNmMYkokoiPpbeorZenoC/KZhErE3m6hjAptyl3o8CHN9Uyf
	8tJVtx7rtigTzRX3K7yOotWZq9srZ1EAk7XQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wQP5r-00GSTw-2Z;
	Fri, 22 May 2026 20:35:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 May 2026 20:35:11 +0800
Date: Fri, 22 May 2026 20:35:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: linux-mips@vger.kernel.org, linux-crypto@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] MIPS: Remove unused arch/mips/crypto directory
Message-ID: <ahBNf4BaaCQOqGRX@gondor.apana.org.au>
References: <20260517032100.105696-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517032100.105696-1-enelsonmoore@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[apana.org.au,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gondor.apana.org.au:s=h01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14717-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gondor.apana.org.au:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herbert@gondor.apana.org.au,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 6E13B5B5073
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 16, 2026 at 08:20:56PM -0700, Ethan Nelson-Moore wrote:
> The last MIPS crypto code was moved to lib/crypto/mips in
> commit c9e5ac0ab9d1 ("lib/crypto: mips/md5: Migrate optimized code into
> library"). However, arch/mips/crypto still contains stub Kconfig,
> Makefile, and .gitignore files. Remove these unnecessary files.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
> ---
>  arch/mips/Makefile          | 2 --
>  arch/mips/crypto/.gitignore | 2 --
>  arch/mips/crypto/Kconfig    | 5 -----
>  arch/mips/crypto/Makefile   | 5 -----
>  crypto/Kconfig              | 3 ---
>  5 files changed, 17 deletions(-)
>  delete mode 100644 arch/mips/crypto/.gitignore
>  delete mode 100644 arch/mips/crypto/Kconfig
>  delete mode 100644 arch/mips/crypto/Makefile

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

