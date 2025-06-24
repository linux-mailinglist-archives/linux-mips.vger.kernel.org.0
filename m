Return-Path: <linux-mips+bounces-9461-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B2AE5A30
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 04:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C9E3189C2B2
	for <lists+linux-mips@lfdr.de>; Tue, 24 Jun 2025 02:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DF76EB79;
	Tue, 24 Jun 2025 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIipPcPU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B360C5680;
	Tue, 24 Jun 2025 02:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733126; cv=none; b=VRxxo0bU9d0Gokl7uAlC+errRDMAJ0gesTcqTawHlsHoiEzd+pFY4Gq/7qVhifNWQcJ4bSpsC/USC5FLQoG1gWE0ZGb4rVrR+cCUgTap9MW/Urg7pqQ0p1ko7T0Pz4DvaynKxyGWVMOYE3sOIy467Qo7QVvfoyxuyhLMdfA5is0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733126; c=relaxed/simple;
	bh=wvw4KZrFb3bDpFyljDt13+2hzP7dlyNidFKreU0+rGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gu8f9Q8i/M/GAZWaVSE0YpW3E2uFmKFLptD4TXdoEnla8Vnl2ZsWRcJ38dPmIL8pnWqoqPi7XSWM1EB7cqH8YMQKZWOCTBispOVZDtYgm7jI8JM5MLgxDeUXXOomh9oUU8LRA2eOU61l9RhIpFF5fYQL1v5PfVRr2RtwoBs2nLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIipPcPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A0AC4CEEA;
	Tue, 24 Jun 2025 02:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750733126;
	bh=wvw4KZrFb3bDpFyljDt13+2hzP7dlyNidFKreU0+rGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIipPcPUENDbB1DVaM2klpFxZLymtMC1278ktKPXQMNZt41mnhj+ZJexStFH5JK2u
	 nFXCl0kaNRAtFSccN6WfWV998QOsGwbB+qf9yeRG2pfUiPe5aPfG7a5fiaJzXH3RE/
	 FIJSmpv+ncH9OqsDWsdaTgdlboVcC2ABX1ghnprIEbIl3QAUqvV2QqsDjZ1079FYkn
	 jPt0nzSxpOunutckTus8H/G0ofSpk6ztujnJoy+KSEri/GKc+oFI2MLNBYknXyAgdT
	 3HUYlPxE9SjpaR0UWveXbgSzRwttALUuqVwFQiG2HmGYrj+2QgHF3a3xvoxS0gN2+S
	 O5Eof0eJUCorA==
Date: Mon, 23 Jun 2025 19:44:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jason@zx2c4.com, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/
 into lib/crypto/
Message-ID: <20250624024451.GA7127@sol>
References: <20250619191908.134235-6-ebiggers@kernel.org>
 <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-8FC37478-859D-40EA-A0E9-3EA86429DC53@palmerdabbelt-mac>

On Mon, Jun 23, 2025 at 04:23:52PM -0700, Palmer Dabbelt wrote:
> On Thu, 19 Jun 2025 12:19:04 PDT (-0700), ebiggers@kernel.org wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.
> > 
> > The new code organization makes a lot more sense for how this code
> > actually works and is developed.  In particular, it makes it possible to
> > build each algorithm as a single module, with better inlining and dead
> > code elimination.  For a more detailed explanation, see the patchset
> > which did this for the CRC library code:
> > https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
> > Also see the patchset which did this for SHA-512:
> > https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/
> > 
> > This is just a preparatory commit, which does the move to get the files
> > into their new location but keeps them building the same way as before.
> > Later commits will make the actual improvements to the way the
> > arch-optimized code is integrated for each algorithm.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  arch/riscv/lib/Makefile                                         | 1 -
> >  lib/crypto/Kconfig                                              | 2 +-
> >  lib/crypto/Makefile                                             | 1 +
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
> >  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
> >  .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
> >  .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
> >  {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
> >  9 files changed, 2 insertions(+), 2 deletions(-)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
> >  rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)
> 
> I'm assuming you want to keep these all together.
> 
> Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
> 

Yes, I'm taking this series through libcrypto-next.  Thanks!

- Eric

