Return-Path: <linux-mips+bounces-4422-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6AB939165
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 17:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72CB51F22345
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jul 2024 15:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CB216D9D9;
	Mon, 22 Jul 2024 15:06:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D624E16DC19;
	Mon, 22 Jul 2024 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660811; cv=none; b=uQfl7YhHemk+47LrUaugQioxp8nZ/6qVDCWRL5prYYSNsqOH9X2IlOqSjPdtcP+Ga4Ro2Q3kRHapyOjUvG16BKFZ2dUhHknfO6AAydTDg+cOQ0M9b3Cg8hvRw032PY9/VHOA2qpWjHuFYnPVwOFvSJoaPlWf27Ob2ILBvmlGAdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660811; c=relaxed/simple;
	bh=lDdJAmaAtGd+JqBuxsD3RVshAuORw5Ux7BEdPGnai0Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gUdEH2042wF5xzTw54nJCpxz0qkCaLzXx1w/Ok/kd/k+UdSIV/7pXzIM4ZKxN3zaz3Po9t05jIs7kN/WzVD6b4yQLSbhZDk0nMQnVJJEpmlqdXvPccQdXHz+kqSfsCCGLwBp9Lo1x6jqGMVvmpadfy2W0Xy04Cb1PtT0ydyCxeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B4FFD92009C; Mon, 22 Jul 2024 16:59:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id B1B9192009B;
	Mon, 22 Jul 2024 15:59:00 +0100 (BST)
Date: Mon, 22 Jul 2024 15:59:00 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Lukas Wunner <lukas@wunner.de>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, Stefan Berger <stefanb@linux.ibm.com>, 
    linux-crypto@vger.kernel.org
Subject: Re: Mips handling of signed integer overflows
In-Reply-To: <Zp5nGEBD41jBnw6B@wunner.de>
Message-ID: <alpine.DEB.2.21.2407221532520.51207@angie.orcam.me.uk>
References: <Zp5nGEBD41jBnw6B@wunner.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Jul 2024, Lukas Wunner wrote:

> back in 2006, commit 36ccf1c0e391 ("[MIPS] Make integer overflow
> exceptions in kernel mode fatal.") forced the kernel to panic on
> integer overflows.

 Makes sense.

> But three years later in 2009, commit 68df3755e383 ("Add '-fwrapv'
> to gcc CFLAGS") ensured that integer overflows are not undefined
> behavior and instead force wraparound.

 Makes sense too.

> I assume this means that the compiler uses non-trapping instructions
> for addition/subtraction on Mips.  Consequently, calling die_if_kernel()
> from do_ov() in arch/mips/kernel/traps.c should no longer be necessary
> as it can never happen.
> 
> Can you confirm or deny this?

 Neither.

 MIPS C compilers have never produced trapping addition/subtraction 
instructions, which have been reserved for use by other programming 
languages.  And GCC specifically has never produced these instructions for 
any of the languages supported, there are no patterns in the MIPS backend 
defined that would produce these instructions.  The only way to encounter 
one of them in the execution stream is by means of handcoded assembly.

 The call to `die_if_kernel' is there is to catch an unexpected scenario, 
just as with any unexpected exception triggered in the kernel mode.  It 
has to stay there as reaching that place means that we have a bug in the 
kernel, because we're not supposed ever to encounter a trapping 
addition/subtraction instruction (there's one specific exception to this 
rule in arch/mips/kernel/r4k-bugs64.c, and we install a special handler 
temporarily to take care about it).

> I came across this because ecdsa_get_signature_rs() in crypto/ecdsa.c
> performs a subtraction which may lead to a signed integer overflow:
> 
> https://lore.kernel.org/all/Zp5b7ZQaXfGbkCVC@wunner.de/
> 
> If gcc ignores -fno-strict-overflow on Mips and raises an exception,
> the kernel would panic in ecdsa_get_signature_rs() for a sufficiently
> large ASN.1-encoded integer.

 This is not going to happen.

 NB I know the internals of the MIPS GCC backend pretty well, I've worked 
with it for decades now.

 Did I answer your question?

  Maciej

