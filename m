Return-Path: <linux-mips+bounces-9980-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23336B1969E
	for <lists+linux-mips@lfdr.de>; Mon,  4 Aug 2025 00:11:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F4FD16E9D9
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54C21E51EF;
	Sun,  3 Aug 2025 22:11:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49E0114E2F2;
	Sun,  3 Aug 2025 22:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754259090; cv=none; b=qOOfErubN6rwAIeJ+dC+wHlCAbf+i4fTDJwpawnE3MxNdRXrL1F1L2PaI/1dp5Ol1uAEi1gpSuC/k6EBzJjFFJ2MlhEI1ezHVSqK9NUODQ2r6Y7dBoWW9NpV2COeJ4pjkm2dqXQD2jv0300K8EpAZ3WrB1fc7WbgvLVoBjmdR0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754259090; c=relaxed/simple;
	bh=73Oyym1J25ZQwGG+tQigFOo/ZqXaFCAwe0qaK8mV0mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TglBL2B96Bc3uA4M4UcLmAaO4Qn2QEMd7sNLowmI2rBhSs1h9HCWeLn5iRGGhoGfoVYOrH6zu+j1ZGT6r54Yyk+GaatDqyVBlVYeUapnbH0dcoTJbo6vVcF2TTVJIxxbr5OnoSC25BG6xbLQ1sa1i/R5hueIY6JQ9rHEEi5dGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 573M7CHh1821837;
	Sun, 3 Aug 2025 17:07:12 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 573M7BAg1821833;
	Sun, 3 Aug 2025 17:07:11 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 3 Aug 2025 17:07:10 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH 3/7] crypto: powerpc/md5 - Remove PowerPC optimized MD5
 code
Message-ID: <aI_djr4v-3nQqG9E@gate>
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250803204433.75703-4-ebiggers@kernel.org>

On Sun, Aug 03, 2025 at 01:44:29PM -0700, Eric Biggers wrote:
> MD5 is insecure,

Really?  Have you found an attack?  Can you explain it to the rest of
the world?

MD5 is not recommended for future cryptographic purposes, there have
been some collission "attacks" on it (quotes because such a thing is
never an attack at all, merely an indication that not all is well with
it, somewhere in the future an actual vulnerability might be found).

Since there are newer, better, *cheaper* alternatives available, of
course you should not use MD5 for anything new anymore.  But claiming it
is insecure is FUD.

> This commit removes the PowerPC optimized MD5 code.

Why?  It would help to have real arguments for it!

If you just want to remove code you have no interest in, there are much
bigger targets available...


Segher

