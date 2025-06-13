Return-Path: <linux-mips+bounces-9275-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F0AD85C8
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 10:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADF277A6162
	for <lists+linux-mips@lfdr.de>; Fri, 13 Jun 2025 08:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78E226B775;
	Fri, 13 Jun 2025 08:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="Dqacu+sT"
X-Original-To: linux-mips@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDD2DA751;
	Fri, 13 Jun 2025 08:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803959; cv=none; b=Z2nI/hJZhErjfgQiPFZ4/Ei7syEgCPe0BYRLRYzJl3tSFoE2qZVZH7daOSxeOdddIsK3hSJkbfNqAXeNj1RX/gowBPb0RYvEa6PZR67Bb5zmRH2BZGVTkx6HvAlmaleNFmt2P7BsIhIRvm2Z4xiEOU1QHIq3H2Z22plBSEwWyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803959; c=relaxed/simple;
	bh=6xWAtqVWcnVhNq3FdMxXgZW7X9XJpphcbjy58tJXXKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtX0bBRwO/49SYa9M6TaL9TZwT5NOIRjzgR+OLGfzqfYCCj/mYpcV453elKGIGP8qbyvYFmSg1gXIZFdqvPrx3xsoKYJc0fFyTzjqj23IyWYbkd/Cxc1cgenJ3T8Kqsq1I5YzxKqEvU/uYGG0FwV5bv0pn4DfnlGFnv1WyFQmZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=Dqacu+sT; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=z2jx2sNLNoJ0ygGTf3Y8T5QDDcxRyAG0f6aRQMfMYKs=; b=Dqacu+sT7ilY3QllsgF/kbefo0
	GdITohgE0nQBt/EYnqx4lHQgvV4Dv6F1wIU9eQAl4ci4vNvkw5yOCf/xRMQJjk97CC1+WtFXiNmt9
	ng1hmwEm7mvHCGCLGIPB7Y0qihOstz/KTuCJv0q+xNXMeFq9dhAhp2IxaG8qNR9AHI2DHj2vAxXXY
	9q/fvfkAp4GpD+vKUtKur21el66NXn0IUE0vQ7byU41Bhod/OxxMR6yFo6zPsd6p9ujY4MfOYL0b3
	Wtj8YQibzup0USfdWJ89Ve02aoDvW+cit1BycTBi4ecJ+kNE+EJ8cz7FFwUxzo64ntpSAv/kuwscm
	zwvheCug==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uPzwM-00Cs6f-1z;
	Fri, 13 Jun 2025 16:39:11 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 13 Jun 2025 16:39:10 +0800
Date: Fri, 13 Jun 2025 16:39:10 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <aEvjrhkLnB_GEKnV@gondor.apana.org.au>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
 <20250611033957.GA1484147@sol>
 <aEj8J3ZIYEFp_XT4@gondor.apana.org.au>
 <20250611035842.GB1484147@sol>
 <20250613053624.GA163131@sol>
 <aEu5cyDOMcKteW_b@gondor.apana.org.au>
 <20250613055439.GB163131@sol>
 <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXEDCRfCgvtuhRc+a=m1kVt-zkcCqi_=_WOFTmt4Hz2gGg@mail.gmail.com>

On Fri, Jun 13, 2025 at 09:38:11AM +0200, Ard Biesheuvel wrote:
>
> Perhaps I am just slow, but could you please explain again what the
> point is of all these changes?
> 
> Where is h/w accelerated ahash being used to the extent that it
> justifies changing all this existing code to accommodate it?

There are two separate changes.

First of all the export format is being made consistent so that
any hardware hash can switch over to a software fallback after
it has started, e.g., in the event of a memory allocation failure.

The partial block API handling on the other hand is about simplifying
the drivers so that they are less error-prone.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

