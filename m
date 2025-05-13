Return-Path: <linux-mips+bounces-9003-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3548EAB572E
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 16:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C842E3A3DAE
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 14:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF806482F2;
	Tue, 13 May 2025 14:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ImR3Veu6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0732260C;
	Tue, 13 May 2025 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747146679; cv=none; b=mGLdj2Nucr1Vp240OpI3aj1PFBHcseifuumwyTyY9hPzIuc8qJrEqlgw0TnqbTMNejzWULmE+CsGpReZDJR4ZNzsSBo559pOZgHTjtSyMvCeo65uJhSeMyvep2V256pN2TnqA8lqpWxXHDJ9JaaBlqV5Pc5ZppapIvpiEetUsrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747146679; c=relaxed/simple;
	bh=FVma0HglSHdfRfFV6OtVOHyiSgVx1ms3kePqvf2OV/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqZG9lrC0f+LVrsk06Q/BgO2EvF+NjD8eBD1vJ4+uYNy5uHRdX2gajgQ2eSYEesp5gzWDwwz5CNRmG2BLkmxZXQL5/ajwu5jxjUN/+VN4ikjHBJLExSM+Q6AHyuB3TYW9gd02DGWrZuUb4obdXkB3d8Zqfl42l2uhlN3BWnSiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ImR3Veu6; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87F0D1305EF;
	Tue, 13 May 2025 16:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747146669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kTGtXYGRQL2cWLSakDL/RGJFBLjrVwjbgAU6H+932/4=;
	b=ImR3Veu6J/nE220woGoGu6PNkF3kLxvnZkxbQE/4KldytbKqDsZOUZnoMnhiG9MRVrfKIM
	VqYElVmt7vf03EstKHvnKxJM0zRU1ESnlzK4jub1UdD1wxkRXT0nUT2sSPy0VH0RoMAVwM
	qGRIopZd9ZWhZ87RIUlADZXFP864Oe0PlxZhIDW03lqHG3naBM6Y9adfBbf6NzZKFpetrR
	kTeQR80uS4xtTKq9l7P9Cf1f3RLuZjdgcgMkKu+Macr5Pq89s6TWqai9/Me57vWmCF52VJ
	d1uQrVS5HwyFhnxjJRHT0xV2jc50gCDCAj7OlZ/CGne8VFez8xuJDXOzXexKRA==
Message-ID: <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
Date: Tue, 13 May 2025 16:31:05 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aCNWM5Xq7wnHVCrc@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 13/05/2025 16:24, Daniel Lezcano wrote:
> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
>> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
>> processors. They are found in xDSL and xPON modems, and contain PCM
>> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
>>
>> The EcoNet MIPS SoCs are divided broadly into two families, the
>> EN751221 family based on the 34Kc, and the EN751627 family based on
>> the 1004Kc. Individual SoCs within a family are very similar, only
>> with different peripherals.
>>
>> This patchset adds basic "boots to a console" support for the EN751221
>> family and adds SmartFiber XP8421-B, a low cost commercially available
>> board that is useful for testing and development.
>>
>> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
>> peripherals, and for historical reasons Airoha chips are sometimes
>> referred to with the EN75xx prefix. However this is a different
>> platform because Airoha chips are ARM based.
>>
>> This patchset is against mips-next.
>>
>> v4 -> v5
>> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>>    * Improve explanation of HPT timer in changelog
>>    * Move pr_info to pr_debug per recommendation
>>    * Remove pointless debug on spurious interrupt
>>    * Small code-style change
> Shall I pick the clocksource + bindings changes through my tree ?
>
I'm new here so I don't know what that means for the merges which
will happen later, but I don't see any reason to do otherwise.


Thanks,

Caleb



