Return-Path: <linux-mips+bounces-12422-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3F0CAE02E
	for <lists+linux-mips@lfdr.de>; Mon, 08 Dec 2025 19:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89AA03063910
	for <lists+linux-mips@lfdr.de>; Mon,  8 Dec 2025 18:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91ABD221543;
	Mon,  8 Dec 2025 18:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CLnNfxgB"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F7F18C2C;
	Mon,  8 Dec 2025 18:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765219208; cv=none; b=bFmUQbkxzuC4IEH8SN4DIxFJuYrUPq9U7p+ie9/UKWdOkz3K9Ih4xbQ/FFnI/pXXT8aqZ29qiGQVCbTn4C4Rut86LNLHGwuBiBH5ikOnke+hYv7M46Y+9LtzHsizYQ55NuEO8cnIG61/6l1freVlnwrkY/43yT2dPZoD3rX32pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765219208; c=relaxed/simple;
	bh=Br0gR5xX7Wu9kNG4+1L4NZYaktjSOXP24yfPQlZXH0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qja17p1+DoXasNvV7Ku0Z+uWVJ9lf4cQhnCj5EFkVGMVrigAMigsj/qB4Wzjo0RhbHft4EXU68C7ce1YmIegWzJ/JhqN8Q2X9rGIhjsQjXSUKbLs78YKl9IKipEU+EVwgq4kMUwftJ6s2hdu5aOo3Oyac5M4FrrcvzBcDyBXX6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CLnNfxgB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=yLzKuVB9SRbRu6KABlxK9U/BOBG3oxrbOo+OTMvlotw=; b=CLnNfxgBY0q5YgCfYzG3Dlh34b
	EEtmJtTusDTKsZbTYzaXhcu0062Ml+ROgkjDjvTdVCGOyI1WiqRal51qFDhJku9JOUdVEgOoDzDvZ
	FmxiWs9IpvtAnwnVt9QhEaz94qttqk9HtlYcwgT9XnjH/nZJaOPdL+/weryaY/RvWkRN6m6m+LWVL
	vOlh2ZpvnEm5cjAi8QGFaorWBMCjGSiewTGrxtA6zy3SM4XDLPQSA6e7KPHYOjKG/wQ1R9pDzaszP
	fkakMEtmCiLYQBRpi+HMs3PVPUdX8nQCYgcBRU3ydDbye0g0QWoyOcsIQCvVqF5ATGtmMIDIZQH0A
	ZaaML9ww==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSg9Q-0000000DR7O-2RyS;
	Mon, 08 Dec 2025 18:40:01 +0000
Message-ID: <873236c8-4dab-4f1e-a2bf-d233ec74bd49@infradead.org>
Date: Mon, 8 Dec 2025 10:39:58 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 chrome-platform@lists.linux.dev, Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <aTcVXrUXVsyjaT22@shepard>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aTcVXrUXVsyjaT22@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/8/25 10:13 AM, Paul Kocialkowski wrote:
> Hi Randy,
> 
> On Sun 07 Dec 25, 18:04, Randy Dunlap wrote:
>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>
>> The bugzilla entry includes a Perl script and a shell script.
>> This is the edited result of running them (I removed some entries that were noise).
> 
> [...]
> 
>> DRM_KMS_DMA_HELPER ---
>> drivers/gpu/drm/adp/Kconfig:9:	select DRM_KMS_DMA_HELPER
>> drivers/gpu/drm/logicvc/Kconfig:7:	select DRM_KMS_DMA_HELPER
> 
> For these two, the symbol was removed in commit
> 09717af7d13d63df141ae6e71686289989d17efd but these two drivers either were
> missed by the batch rename or were introduced a bit later.
> 
> Since the symbol selected DRM_GEM_CMA_HELPER (which is still needed by the
> drivers), it should be replaced with DRM_GEM_CMA_HELPER.
> 
> Are you expecting to craft a patch for fixing this or should I do it myself?

Hi Paul,
Please take care of it yourself.

Thanks.
-- 
~Randy


