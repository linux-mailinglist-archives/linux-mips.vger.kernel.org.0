Return-Path: <linux-mips+bounces-7216-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 418289FF666
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 07:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF4B41617D7
	for <lists+linux-mips@lfdr.de>; Thu,  2 Jan 2025 06:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD90A18BBB0;
	Thu,  2 Jan 2025 06:07:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EACA149E00;
	Thu,  2 Jan 2025 06:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735798076; cv=none; b=axio45q1rwVM0j59G8xat64dtEiJgBVJCtpsUSr8ASctS5UpyUqAXdFMvqcdil+sq9seyRY2mWXFSnFgf/f3uNzTmFTt2fgtAf/n2Y4Yha32vvshrswFofeY5U72jnn3Xq/bx3Oz8f6MeUgr9FtRk8eYWsgvMRfBekNTQ1SZII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735798076; c=relaxed/simple;
	bh=C2xWx9+P4z0nX603meuePPwLoVjXtZGBdlS96zvGSiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eBXWvpm7qXSB1XRADnj4HkoUpYvUN3DBWfucKbhrq0Y7oLorxqZpUc7e/HD6IsAo/HtGDo4CCc4Cp4zOWr8gllbfJQf5ayZXmhRyNuK+AGQfdCtJ7u45WC45Q/UEf4vlwRCFkCtgnmeqgcfgQuUBN2n6FMIt9zazos1ccopn0dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7DE0C92009C; Thu,  2 Jan 2025 07:07:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7092A92009B;
	Thu,  2 Jan 2025 06:07:45 +0000 (GMT)
Date: Thu, 2 Jan 2025 06:07:45 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sashal@kernel.org, 
    stable@vger.kernel.org, jiaxun.yang@flygoat.com, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    guanwentao@uniontech.com, baimingcong@uniontech.com, revy@deepin.org
Subject: Re: [PATCH 5.4~6.6] MIPS: Probe toolchain support of -msym32
In-Reply-To: <183F7B3F0A07AC93+20241224060918.15199-1-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2501020550110.20821@angie.orcam.me.uk>
References: <183F7B3F0A07AC93+20241224060918.15199-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Dec 2024, WangYuli wrote:

> From: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> [ Upstream commit 18ca63a2e23c5e170d2d7552b64b1f5ad019cd9b ]
> 
> msym32 is not supported by LLVM toolchain.
> Workaround by probe toolchain support of msym32 for KBUILD_SYM32
> feature.

 Doesn't this reintroduce the failure fixed with commit a79a404e6c22 
("MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression")?

 If this call to `cc-option-yn' does need to be made here, then this whole 
stuff has to be wrapped into a `need-compiler' check, see the discussion: 
<https://lore.kernel.org/r/alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk/> 
and the other patches in the series.

  Maciej

