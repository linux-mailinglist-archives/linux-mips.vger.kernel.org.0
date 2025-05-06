Return-Path: <linux-mips+bounces-8947-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B7AAC7E5
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 16:26:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 909DF7AF41A
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 14:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8EF62820CF;
	Tue,  6 May 2025 14:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="irxMbsQt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC22427FD57;
	Tue,  6 May 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541550; cv=none; b=MkX+IlsEimnbhGWiY8j0cq6EFDOTWcObMaFj3AhOXev1oDLTm6R7GWwy9J7teXz3kolb/PWN6nvDZ0cfxsZ2oaANbKtZybbsVFPYnDq33qfRyjELB4zYZjt3omrIPODZSLr5Mgvsj08XjaI0D8W2TJXWzoklz1rMCLAoPzHIjZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541550; c=relaxed/simple;
	bh=bfhs5TMIO9WwVex3wgkVyM47F2j9OE9qbP0G/kaOvoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXSC6qzLNXxNWyUV63hjBO5fjhqdMP9RjRSFlUTLyKNXaYEnSUELJVrDtmCPKdKIwMB22hjUPn79OGudaqD+PznnoLKaMABUI1cRYwLtke+vfGDi7J2QSdB24fopWPMRYJJrSUyfqu+4RMbgdQCWkfiPlq70jIIxDJx+THMvm+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=irxMbsQt; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EED13E9408;
	Tue,  6 May 2025 16:25:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746541545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BIis3C4CFWwe/Nb/WYKe4dImQBx542mXba7Be46nPPk=;
	b=irxMbsQt3aIZkBTMYNb71ndZxm2HmV49EHtCrCq4sSmN4VC6qVpAuQcT8r6vSO/XEtW/CT
	hJSyvmpYsZwcUDDclOCyzxEx9ZpBvkOpuovMINSWZlUhmZb7ES9nDS3ZF7VnUuQb1eJTLT
	H+Jpv153lHJuk6CN8be32XLeoAfKtBAtM8vbYxZW+/jN2ZEyeJgW99NUbtylN4/OjNYyWc
	/GiO6cAF+wPBAQkkKj6CByIhE9DgqkvJoFGIcEKY+uP+tY6GV7hROBKfsug/psWVwvLrUO
	jLnCxRUI6sOzyeEYU9Z0d7v2fhlnt/HMtiHjMwokS4LsS6hazjaOthyjAxkU9w==
Message-ID: <ea17e686-68c7-463c-bb9e-bcc9e59a929d@cjdns.fr>
Date: Tue, 6 May 2025 16:25:41 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 2/7] clocksource/drivers: Add EcoNet Timer HPT driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-3-cjd@cjdns.fr> <aBjpBpJAIP89oiit@mai.linaro.org>
 <92cd3689-3409-4d43-8db1-8633d35f779a@cjdns.fr>
 <7c08cc9e-f39f-490c-85fe-5738656380e5@linaro.org>
Content-Language: en-US
From: Caleb James DeLisle <cjd@cjdns.fr>
In-Reply-To: <7c08cc9e-f39f-490c-85fe-5738656380e5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


On 06/05/2025 10:54, Daniel Lezcano wrote:
> On 05/05/2025 20:09, Caleb James DeLisle wrote:
>>
>> On 05/05/2025 18:36, Daniel Lezcano wrote:
>>> On Wed, Apr 30, 2025 at 01:34:28PM +0000, Caleb James DeLisle wrote:
>>>> Introduce a clocksource driver for the so-called high-precision 
>>>> timer (HPT)
>>>> in the EcoNet EN751221 MIPS SoC.
>>> As a new driver, please document the timer (up - down ?, SPI/PPI, etc
>>> ...) that will help to understand the code more easily, especially the
>>> reg_* functions (purposes?).
>>
>>
>> Sure thing, I can elaborate the comment in the header of
>> timer-econet-en751221.c. Let me know if you'd like it described
>> somewhere else as well, such as the help of config 
>> ECONET_EN751221_TIMER.
>
> It is ok in the changelog, so it is possible to get the description 
> when looking for the patch introducing the new timer.


Sounds good.


>
> [ ... ]
>
>>>> +
>>>> +    cpuhp_setup_state(CPUHP_AP_MIPS_GIC_TIMER_STARTING,
>>>> +              "clockevents/en75/timer:starting",
>>>> +              cevt_init_cpu, NULL);
>>> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ... ) ?
>>
>> I see that Ingenic does this. This is the only timer so until it's up,
>> sleeping causes a hang. If sleeping is prior to CPUHP_AP_ONLINE_DYN is
>> considered a bug then this should be okay, but I'm not informed enough
>> to say whether that is the case so I'll follow your guidance here.
>
> Hmm, hard to say without the platform. May be just give a try with 
> CPUHP_AP_ONLINE_DYN to check if it works otherwise stick on 
> CPUHP_AP_MIPS_GIC_TIMER_STARTING as it is already defined ?


I need a little time for this because I only got SMP on this processor

some time ago in a PoC so I'll need to put that back together in order

to validate the change.


Thanks,

Caleb


>
> [ ... ]
>
>

