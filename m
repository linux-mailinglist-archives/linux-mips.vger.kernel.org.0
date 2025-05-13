Return-Path: <linux-mips+bounces-9005-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B79AEAB5921
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 17:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F4CF19E4B40
	for <lists+linux-mips@lfdr.de>; Tue, 13 May 2025 15:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA592BE0F2;
	Tue, 13 May 2025 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="IkMrIhBn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32991A3A8D;
	Tue, 13 May 2025 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151612; cv=none; b=XO1FpC+iA8cfZZ/xvJQOS5Kg11LAr38h+3SOp+UYpeNhPyJfYemYm/k7rv0raKK/wFauliyCWlH9XgtaP8Ybxa8UtY3GD7aRVllHWoLGeRguEh1LGa/rA/H1hRtdktK5eFTGLxuuNzcVtAP7Df8S2Oprhgp76r8ePeKWhe3OVWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151612; c=relaxed/simple;
	bh=hu7KL6SGvQ91ChmM4dOxm/FwnmotCZDHZWO4BDpNTOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jCQETMIs8lMfzNVHml3/TBxwWlSFXSzfDtViKdj9b9nbOTL6yRxvoUdKaeMdxkQgnnZg0IsHevAotFEddRbRe2zsOJzVOojbEqaAps/y5jZMJRM6KU86BwCIW4SL7QCjfo90kiO+mrS5wSLNEc0A4MaiYrwpTcw+r9rszYdHG/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=IkMrIhBn; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBEC8135653;
	Tue, 13 May 2025 17:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1747151608; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=xuqyAAuoDMtQl7aHc6ogdkm/UKwvvmnE5+dcBd3QudM=;
	b=IkMrIhBnJaCErPFw1yEBeZgaFvMO39PNrFDmmXYjXNLBaKjIzoJtB8wGIinVp1i4Yj3QH0
	/aKR23//abEyMb0eAe/tWrVJ9qjo4gGwHrsE1QahL6HoGVYmXqTGGFFAMoDMFGu12nmghF
	su6eAIAPrpv7DR9A/r/4SGsvKzJCnA2KIfQWH7vaQwV318LY9HfR80aCgZcvN9Sl/+bjLb
	cOiPpxnWB2n+tBdvSXOgVW8dyDg6EGzYk7blIC1oMCL0Ux/+NQELPeIXMzFSicj4lQlGtI
	Gq5waCU93MqwSSpb/jHufZOEqFgphhPRotzJOkuxqJfkvDsXP+Kq9+RsrtmM4Q==
Message-ID: <927c8a59-ac1b-49dc-b889-22c3a65bb49c@cjdns.fr>
Date: Tue, 13 May 2025 17:53:24 +0200
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
 <45166de2-8504-484d-90f6-6ef97c650b61@cjdns.fr>
 <aCNkmCJK1wOLGmgy@mai.linaro.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <aCNkmCJK1wOLGmgy@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3


On 13/05/2025 17:26, Daniel Lezcano wrote:
> On Tue, May 13, 2025 at 04:31:05PM +0200, Caleb James DeLisle wrote:
>> On 13/05/2025 16:24, Daniel Lezcano wrote:
>>> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
>>>> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
>>>> processors. They are found in xDSL and xPON modems, and contain PCM
>>>> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
>>>>
>>>> The EcoNet MIPS SoCs are divided broadly into two families, the
>>>> EN751221 family based on the 34Kc, and the EN751627 family based on
>>>> the 1004Kc. Individual SoCs within a family are very similar, only
>>>> with different peripherals.
>>>>
>>>> This patchset adds basic "boots to a console" support for the EN751221
>>>> family and adds SmartFiber XP8421-B, a low cost commercially available
>>>> board that is useful for testing and development.
>>>>
>>>> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
>>>> peripherals, and for historical reasons Airoha chips are sometimes
>>>> referred to with the EN75xx prefix. However this is a different
>>>> platform because Airoha chips are ARM based.
>>>>
>>>> This patchset is against mips-next.
>>>>
>>>> v4 -> v5
>>>> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>>>>     * Improve explanation of HPT timer in changelog
>>>>     * Move pr_info to pr_debug per recommendation
>>>>     * Remove pointless debug on spurious interrupt
>>>>     * Small code-style change
>>> Shall I pick the clocksource + bindings changes through my tree ?
>>>
>> I'm new here so I don't know what that means for the merges which
>> will happen later, but I don't see any reason to do otherwise.
> The series introduces a new platform. The patches are touching
> different susystems managed by different maintainers.
>
> Usually, the changes are per subsystem, except when they are
> interdependant.
>
> Here you can choose to merge all the patches through the mips tree or
> let the different maintainers to pick the changes related to the
> subsystems they handle. You should clarify that in the cover
> letter. If you choose the first alternative, then before merging the
> changes, all maintainer should have blessed the patches with their
> acked-by.
>
Thank you for the explanation, this patchset has already started to be
taken piece-wise, and the only dependency that comes to mind
is the econet vendor prefix which Rob Herring took few weeks ago.

With that said, I see no reason not to continue taking it piece-wise.

Thanks,

Caleb


