Return-Path: <linux-mips+bounces-12722-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D2CCEFA97
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 05:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C7AC300D14A
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 04:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C802744F;
	Sat,  3 Jan 2026 04:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Y6nUZk1J"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D222A95E;
	Sat,  3 Jan 2026 04:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767414240; cv=none; b=DjwG74MkGr5qgP0Zm1YkDT3k4ELpAUPB28gL5J/tjnPdwkDLoZY7e8PmeOFRQ9ebXdS1h/m3Ts2HoYNozbBjJJ2MXDFuBH4DsMMaFFYxgjdGyEOAE1Rya4KIb7Hrf8hW95Tmpi7lVoAc04dnQmM4Ord/50oDN+DGR6ISrIxVmeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767414240; c=relaxed/simple;
	bh=uQ1VqyX8c/iF2ar2ZmdgvfzpUGlESZeCWAK7LbgRWjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZkNpffr0hqxTTyLVR/Uds8CmPbUCP8HyvZVZIedAnA1AAIS5TXio+NYxNDpcXZeI0dbYo6/GQ9aqcOkKm1xBjYJQCknWXdL5AZHGTiC13fR4Nn9EUnAcB300kBoXZy4hevstmN3m13AVsLrYQvUe5oY0uV4t/nnTthy4wqFw7pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Y6nUZk1J; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=HMNxrDlb/w2uoB7nldApUtArlcx6S0iegHQUn3dycmw=; b=Y6nUZk1JhWWprmGvf/cBGxQmRe
	e+6CT6I6mVgSTuSy9EbCSo5iiDX/brpGoHSoZRkjdSYZ9hzlFcxNtpLNcHWgDsoCRHYWxNwoP/11R
	m6WmN+R2gE1p++qxJ73+BBLBM6HA1OBKmpTzFkdETZg/R4SFC1mlJJ4Xf082JR+E6bo2U7x44fGAJ
	yazo6gyQGq2X4xgHeGx7T97tMjCgBw9bPBKPSeoFDpPF2Ub9Dq/69DvL/AQra8VhRQkKpkzN96asy
	10Uj822CNdPbHCQ02stmBjB3t/ihvI1x2GDOK5v2fEOo+AeR2ICMnqoMwYGx5aUKiqs7w0Cc0MPV2
	rXc8VfNg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbtB9-00000008xt8-1eoQ;
	Sat, 03 Jan 2026 04:23:51 +0000
Message-ID: <a0868d32-f164-40fe-a095-8bfb322e68a1@infradead.org>
Date: Fri, 2 Jan 2026 20:23:49 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: LOONGSON32: drop a dangling Kconfig symbol
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-kernel@vger.kernel.org, Keguang Zhang <keguang.zhang@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
References: <20251228190443.2479978-1-rdunlap@infradead.org>
 <alpine.DEB.2.21.2601030126020.14570@angie.orcam.me.uk>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <alpine.DEB.2.21.2601030126020.14570@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/2/26 5:26 PM, Maciej W. Rozycki wrote:
> On Sun, 28 Dec 2025, Randy Dunlap wrote:
> 
>> CPU_GAS_LOAD_STORE_LR is not used anywhere in the kernel sources,
> 
> s/CPU_GAS_LOAD_STORE_LR/CPU_HAS_LOAD_STORE_LR/

Aye, thanks. Will send v2.

-- 
~Randy


