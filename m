Return-Path: <linux-mips+bounces-7232-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB59A003C3
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 06:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34B72162D4D
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jan 2025 05:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E112EAE6;
	Fri,  3 Jan 2025 05:49:32 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A23A632;
	Fri,  3 Jan 2025 05:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735883372; cv=none; b=qugumuvvRpM28jFAygOVoUf/ar18vxpZI2+XG07aTYP7nHGoNvt5BCVO5QxCV1pQv96BkWWS5VPcUh1BaFAoK8Y1Zu7fSaGdRy0MX/plFiIM6E09xkvAkuP135mWIZu0qBAwCJ/mfJVFNdgHHPJldGtXwEcVVqgS50hHVhGDyjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735883372; c=relaxed/simple;
	bh=tZqBg6KFSz6RLBmK46x/Vo4Zf3qEH1aLtlSQ+ighRHw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TSIojpVH7ftjfxqyg9fnkq+eVqLuIsEoul/FESBCmx+f8pjmujRUtciI2Y9ZZWwCLyZPSG9lV1bm/vVZAR7LvAd8BomlO0uS5NkCOfLv6RPcx3qjK7PwBLJy+l7ShnI2MV9wfRC8gQYiOEk1xjKe0PY931/FNGEk5cQg+ss6EC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 959ED92009C; Fri,  3 Jan 2025 06:49:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8F94692009B;
	Fri,  3 Jan 2025 05:49:27 +0000 (GMT)
Date: Fri, 3 Jan 2025 05:49:27 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: WangYuli <wangyuli@uniontech.com>
cc: baimingcong@uniontech.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    guanwentao@uniontech.com, jiaxun.yang@flygoat.com, 
    linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, revy@deepin.org, 
    sashal@kernel.org, stable@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, chenhuacai@kernel.org
Subject: Re: Re: [PATCH 5.4~6.6] MIPS: Probe toolchain support of -msym32
In-Reply-To: <8AC8E4D8519CF8E4+20250102165258.57525-1-wangyuli@uniontech.com>
Message-ID: <alpine.DEB.2.21.2501030535080.49841@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2501020550110.20821@angie.orcam.me.uk> <8AC8E4D8519CF8E4+20250102165258.57525-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Jan 2025, WangYuli wrote:

> Are you suggesting that a commit from v6.8 reintroduced a regression that
> was fixed in v6.6?

 Correct.

> If so, we should address this issue in the mainline first before backporting.

 I do not disagree.

> As a general rule, we avoid introducing out-of-tree commits to linux-stable
> except for reverts.

 Understood.

> For this patch, merging it into linux-stable is crucial, as it would prevent
> certain configurations like loongson3_defconfig from building the kernel with
> clang.

 Conversely I don't think it's acceptable for -stable to merge a change 
that replaces one known bug with another; it violates our rule #2:

 - It must be obviously correct and tested.

 If you care about support for building with Clang, then please either fix 
your fix or fix the compiler to handle `-msym32' or an equivalent option 
(which seems a good idea for n64 MIPS performance anyway -- you're wasting 
a lot of cycles to explicitly put the sign-extension of bit 31 into the 
high order 32 bits where the CPU architecture does it for you already).  
And only then offer a backport of whatever you feel is needed to -stable.

  Maciej

