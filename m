Return-Path: <linux-mips+bounces-3723-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B18690C822
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 13:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00CD11F2409F
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2024 11:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D5F1D1901;
	Tue, 18 Jun 2024 09:36:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876A615747E
	for <linux-mips@vger.kernel.org>; Tue, 18 Jun 2024 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718703407; cv=none; b=Xi5j0vtX8Mn07QKIgar3SvVMP02btElnoQZPOIkHcxM5CFqjneDoHnuF0BZWmVCBKuTySuTTLpmZNJkm5DGjwBxwgeu/bWUwJzZRGaCmcsxMpzH9rvMuN9Ay1QCTKstvwALl5GmKIi9XqJF5AIdP1J7CKnJwrtGl8pt22wgYv2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718703407; c=relaxed/simple;
	bh=Pm72A+O9k/rVqJHLOZG9ADJ4j/Qk7mZjCw8RNSki/oA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LYwmJl4PRIFXIpq+1hZi5EupmHdXafZjKy/W2Hzttc886AuHWtywv14n5J0B4VGzadNgZ/hwYmpFDY88SrleneZGbabc8/KUt5QdGPSpyQuhQT2VD/+oN3HjyNOuFKMLqdlUD4er4sHpbxLpj8GybHl7D+6EU9d9TJy97Hxs+oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id AC8F392009C; Tue, 18 Jun 2024 11:28:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id A56C492009B;
	Tue, 18 Jun 2024 10:28:58 +0100 (BST)
Date: Tue, 18 Jun 2024 10:28:58 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Nathan Chancellor <nathan@kernel.org>
cc: Jeff Johnson <quic_jjohnson@quicinc.com>, linux-mips@vger.kernel.org, 
    llvm@lists.linux.dev
Subject: Re: mips allmodconfig build error with llvm-18.1.7-x86_64
In-Reply-To: <20240617174446.GA843124@thelio-3990X>
Message-ID: <alpine.DEB.2.21.2406180329440.43454@angie.orcam.me.uk>
References: <a138bd58-80b3-4adb-8cbb-65e92a0d0b6e@quicinc.com> <20240617174446.GA843124@thelio-3990X>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Jun 2024, Nathan Chancellor wrote:

> Even with that addressed though, I see another issue in an allmodconfig
> when building arch/mips/kernel/cps-vec.S that I don't recall seeing
> before:
> 
>   arch/mips/kernel/cps-vec.S:363:2: error: instruction requires a CPU feature not currently enabled
>    jr.hb $9
>    ^
>   arch/mips/kernel/cps-vec.S:477:4: error: instruction requires a CPU feature not currently enabled
>   1: jr.hb $8
>      ^

 JR.HB is supposed to be permitted for MIPSr1 as a backwards compatible 
ISA extension, even though coming from MIPSr2 and not originally a part of 
the MIPSr1 ISA (although there was an erratum in some MIPS 4Kc cores that 
caused an RI exception with this encoding).

 FWIW,

  Maciej

