Return-Path: <linux-mips+bounces-9981-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF91B196A5
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 00:14:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B011890E00
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1EE1F2371;
	Sun,  3 Aug 2025 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oi1RAm7F"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE321E51EF;
	Sun,  3 Aug 2025 22:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754259281; cv=none; b=ZVMUUvmv7fok13LC2ttcm2WOIIttzfz1BcYz3ERi/6GLR+1n7DlDfBq8cGUwNaMC5BO7jJhbI7f8lOPJOdzqpl13zddTKq4Ww3vzgQ6Tj8VEr5cGWqu3bJMEuuznWLyuPI3XsAzZ4mL3BRpCY7XO/2TqXExsleoH0dEEvef6fnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754259281; c=relaxed/simple;
	bh=olBu8GPPnFxFEX4luPW3wJTVVnKXrQ1s0KYtdiIrtTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnwfwLPcWUv6EmjawNclTBC/CoIGUmRkKdsPzPS74dUiYS7W83Y5qB2WPbn6+wtSOE87cV85fhWZH1b+8Mw2FjGwFv6HpyoE+XK2O0hECqyPHwU0JRbeqpekdvbNxj3+lc6dNZCeKeE/qV9SYDBv4S3oN9pyIvkTXwhaOi8J/LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oi1RAm7F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C19C4CEEB;
	Sun,  3 Aug 2025 22:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754259281;
	bh=olBu8GPPnFxFEX4luPW3wJTVVnKXrQ1s0KYtdiIrtTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oi1RAm7FfD6VjSXeapdnG5lXDK7EnlVbGejmSeausFjUEs6WbuvR6W5xCq9f9xAuK
	 fvPl4Xt+c4HdOfN360VF9KCTEhY4g+AcPgI01/ERRKWQH+Q/r22CfMVE7zMv2l80Aq
	 ozbMOM7QnfbyAobaz2lWPSUrLqzzYT4mxa01h7UZi33nMcxjs8VTH7RllzpnCz9+oo
	 fl4NtXZBBWKtMOhq/HD4o90xjV0ANn7ipqKKI5artQFunZhwqdAnm1my0zxiA8ZrT5
	 eiIFPXT+hQSdRbqGrXkCWdIe8PobgwR06E3DMRLquXtw+dLHDcU/iVTFqVyJ3lYLeb
	 ltEITkCxvbLoQ==
Date: Sun, 3 Aug 2025 15:14:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <20250803221438.GA119835@quark>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <aI_djr4v-3nQqG9E@gate>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aI_djr4v-3nQqG9E@gate>

On Sun, Aug 03, 2025 at 05:07:10PM -0500, Segher Boessenkool wrote:
> On Sun, Aug 03, 2025 at 01:44:29PM -0700, Eric Biggers wrote:
> > MD5 is insecure,
> 
> Really?  Have you found an attack?  Can you explain it to the rest of
> the world?
> 
> MD5 is not recommended for future cryptographic purposes, there have
> been some collission "attacks" on it (quotes because such a thing is
> never an attack at all, merely an indication that not all is well with
> it, somewhere in the future an actual vulnerability might be found).
> 
> Since there are newer, better, *cheaper* alternatives available, of
> course you should not use MD5 for anything new anymore.  But claiming it
> is insecure is FUD.

Many attacks, including practical attacks, have been found on MD5 over
the past few decades.  Check out https://en.wikipedia.org/wiki/MD5

> > This commit removes the PowerPC optimized MD5 code.
> 
> Why?  It would help to have real arguments for it!

Sure, check out the commit message which mentioned multiple reasons why
maintaining this code is not worthwhile.

- Eric

