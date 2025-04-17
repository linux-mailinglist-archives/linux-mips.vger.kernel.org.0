Return-Path: <linux-mips+bounces-8621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAA3A922B8
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 18:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A013A7D2C
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 16:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A83F13777E;
	Thu, 17 Apr 2025 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttluGruo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BF12DFA36;
	Thu, 17 Apr 2025 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907545; cv=none; b=QjMSg5F3fqnPXBr/sCdFyPngPdg/uqbgbQWb3cUzkL7R0gjeSr3IPBxN6KGPonWsQ/fMVBmVGUv4QuJcAwGniFN9iT47fIBkOOQXLFVi8bnYi9GYfSCYvm+4jqghQqKh8wzd2UxZElqZuWe9DuPUfp40ymiYtDHyMhVEPs3CPwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907545; c=relaxed/simple;
	bh=IV/xW+QXt1ASDi8c6AGAf/97Q00BOAQgySjKp6oRkGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDT7WcJWq7gFs97Nr2AzypR4Y7KIvPaxl+sbpevk0KkxD7j9w47sQL68wBu3NlO4M7waYJjpqPl+3u8/JWgbblPDzr06c8yaV0rhr5Tiq4kyKLF/GNPluKywIrPZgLS3iGe+FoXU10K0FYFF1OC2uJFvQvzIWoLjLaaEQAGzknE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttluGruo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CD8C4CEE4;
	Thu, 17 Apr 2025 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744907544;
	bh=IV/xW+QXt1ASDi8c6AGAf/97Q00BOAQgySjKp6oRkGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttluGruoonakRWVv2QadlsnXULVOzog0Vv6+AUNJs7eFI4QI1pV/no4q9xkLONAHa
	 ND3JGSYH6nxKKbmxpfAk3lZRxnxlKtOzXZZkoplp5mWvGpuC2Hvnh8byO5PQmx1hNB
	 J6Y/H5VBxTyZTegf4X6qSAylixrad/WfU/iej79TEbLb4+jS16TT1JgnyCM3NBRBJl
	 H8VmM+L/sGPSbtsZWrNRfaqDOr3siGDYmXV59DFk5upNBZclqmvezjF3RTSLQisHR5
	 XCt6eaEq5R/CGobkqTZEIrgkFklo0zUaJigiUCOQTG8NcZjLX5p9LhBDfFIbTuRRaV
	 06/JbYgKkSMYQ==
Date: Thu, 17 Apr 2025 09:32:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
Message-ID: <20250417163221.GA800@quark.localdomain>
References: <20250413154350.10819-1-ebiggers@kernel.org>
 <20250417125318.12521F12-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417125318.12521F12-hca@linux.ibm.com>

On Thu, Apr 17, 2025 at 02:53:18PM +0200, Heiko Carstens wrote:
> On Sun, Apr 13, 2025 at 08:43:50AM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > All of the CRC library's CPU feature static_keys are initialized by
> > initcalls and never change afterwards, so there's no need for them to be
> > in the regular .data section.  Put them in .data..ro_after_init instead.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> > 
> > I'm planning to take this via the crc tree.
> > 
> >  arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
> >  arch/arm/lib/crc32-glue.c            | 4 ++--
> >  arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
> >  arch/loongarch/lib/crc32-loongarch.c | 2 +-
> >  arch/mips/lib/crc32-mips.c           | 2 +-
> >  arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
> >  arch/powerpc/lib/crc32-glue.c        | 2 +-
> >  arch/s390/lib/crc32-glue.c           | 2 +-
> 
> 
> Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390
> 
> I just realized that we can get rid of the static key in the s390
> piece and end up with slightly better code. Could you add the patch
> below to your tree, please? If this would go via the s390 tree this
> would result in a merge conflict, which is unnecessary.
> 
> From 6c4c0ca6fe87e43acf6192f1afc0a6346db994f4 Mon Sep 17 00:00:00 2001
> From: Heiko Carstens <hca@linux.ibm.com>
> Date: Thu, 17 Apr 2025 14:30:56 +0200
> Subject: [PATCH] s390/crc32: Remove have_vxrs static key
> 
> Replace the have_vxrs static key with a cpu_has_vx() call.  cpu_has_vx()
> resolves into a compile time constant (true) if the kernel is compiled for
> z13 or newer. Otherwise it generates an unconditional one instruction
> branch, which is patched based on CPU alternatives.
> 
> In any case the generated code is at least as good as before and avoids
> static key handling.
> 
> Signed-off-by: Heiko Carstens <hca@linux.ibm.com>
> ---
>  arch/s390/lib/crc32-glue.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

Thanks!  Applied to
https://web.git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

