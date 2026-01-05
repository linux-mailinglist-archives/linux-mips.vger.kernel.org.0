Return-Path: <linux-mips+bounces-12744-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E0CF18CF
	for <lists+linux-mips@lfdr.de>; Mon, 05 Jan 2026 02:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D7E53007D9B
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jan 2026 01:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915142BE02B;
	Mon,  5 Jan 2026 01:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AKRq+C0R"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2682251795;
	Mon,  5 Jan 2026 01:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767575845; cv=none; b=jxCjq+eslDwzZnYce+6dgkqLUuahofDevRXT1LRjw37bmG7nys9D0KIWjASnuoRtV1wXdbizT5QJB2+dEU6ke1jNrEajKb5yc0EhYbuUqOEkN+xmHwCoitJtGguzrOv129iVnQxUJiAxxzO3/i3yiLHUa8zqrDW0QCqE7cVcjgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767575845; c=relaxed/simple;
	bh=lKYlFUk3wTX+gwXFOMsXeQ4+0b/Y3itIzSFepyAzzDk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FvRMSne941cGw4VtG2k9spnZqIb3e6Y6vtKAfmF8nwM1/Rr+xxc6p65WBdQBkCyRUCbM3HtQewP2uIjhpr95MO2+lAxZzYczov4V6lcwe7RULYPAFd7y0uPL/a2rEDeOUXgzpf8S6gg6f0VGTFAMRXTrXltYaw1vs3zadtmKIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AKRq+C0R; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=pZJXqr1shDOJNTqRYSFVIu1Zdtd7/8R285rGmkkRm1E=; b=AKRq+C0RidbJ2ebH1AwJJaiFtO
	8KWAnzMMb5j2/RD+jEWnlyhtwoMIEpAqesaCl2mj+Bgr79rcXC2iLY4X8UoUZ1J6ZcERcRLZf/1Mr
	Qj9AvTYMuYYMDIchA/83TyX753gWfZ5EHQHWWsZhznwSoZHN6XQ9mSMXkqJBZRxUOF8JjK7kxTjy8
	YRYm5cRRxcqihc4WnIbQJI4hdpLFCyLFM5d6xhV3rSlhTjcSnziwDYdjnr6V0QQi5WmSmqCxg8qg0
	JaNWJvB4I8S7f1CbEKaO5cHJ++lZok1J0rNm2fPDugTXr2azRdsHFhVo21Rw9ChmdPDMCgZBM4Cj0
	TJFOwEpA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcZDf-0000000AbSy-3tej;
	Mon, 05 Jan 2026 01:17:16 +0000
Message-ID: <eb7c246a-6c5f-4d8d-bc96-2a71ece2e042@infradead.org>
Date: Sun, 4 Jan 2026 17:17:14 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
To: Antonio Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann
 <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 andrew.jones@linux.dev, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski
 <paulk@sys-base.io>, linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>, Jonathan Cameron <jic23@kernel.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
 <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Language: en-US
In-Reply-To: <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/8/25 1:48 AM, Antonio Borneo wrote:
> On Mon, 2025-12-08 at 09:55 +0100, Arnd Bergmann wrote:
>> On Mon, Dec 8, 2025, at 03:04, Randy Dunlap wrote:
>>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>>
>>> The bugzilla entry includes a Perl script and a shell script.
>>> This is the edited result of running them (I removed some entries that 
>>> were noise).
>>>
>>> I'll try to Cc: all of the relevant mailing lists or individuals.
>>>
>>> ...
>>>
>>> MACH_STM32MP25 ---
>>> drivers/pinctrl/stm32/Kconfig:58:       default MACH_STM32MP25 || (ARCH_STM32 
>>> && ARM64)
>>
>> This was likely intended for 32-bit kernels on 64-bit STM32MP25
>> chips, which we don't support. I think this can go.
> 
> Yes, I fully agree!
> 
> I have a series pinctrl stm32 to be rebased on v6.19-rc1 and I can include the
> drop of MACH_STM32MP25 inside it.

and what about this dangling symbol?
arch/arm64/Kconfig.platforms:375:	select ARM_SMC_MBOX

It was merged with ARCH_STM32 in
9e4e24414cc6 ("arm64: introduce STM32 family on Armv8 architecture")

Same answer as for MACH_STM32MP25?
If so, Antonio, can you take care of that one also, please?

thanks.
-- 
~Randy


