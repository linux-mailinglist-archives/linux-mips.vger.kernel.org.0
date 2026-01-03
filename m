Return-Path: <linux-mips+bounces-12739-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F390ECF072C
	for <lists+linux-mips@lfdr.de>; Sun, 04 Jan 2026 00:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2CD83009579
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 23:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE18296BDF;
	Sat,  3 Jan 2026 23:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IcmhY4Q1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE0E1C84D0
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 23:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767484681; cv=none; b=OtHltW2FVbo1oAzDtDDg5ki7raH9aUC++/Vxm6Ks6HW3Vw3Nca8k/d+uPmzPpdIrC//qPc2kVjhWCP/NDkh1y1ZUfsJahBuceG4U9cW09yrArhxPupx4hWMb7/41FMVCsdZsv/Kxdz0W37zqnCuh27/UL5xjxtrMgKD12wxhS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767484681; c=relaxed/simple;
	bh=Nc0bv4pj2jQS1zXWwXvjiUVnCrXsy+PQZzamWQEOi/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=osbTzp3lAeeGG1melGaaP9qs6AX10OZkxga29TO/rZ85hnvHz+kyYEP2HkIkIayDNgUcQVXdpbmJuP8LhcrqjYul662F0037GSQmywalwPnU2NOkaaQa4vbj0opX9GbQbxukKmCYrllM/eCn4OInHLUOTUOR6mSTM+gs6ha9SbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IcmhY4Q1; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5957a623c7fso1660839e87.0
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 15:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767484677; x=1768089477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=IcmhY4Q1VROUpEIn0PP0vEUnJ3UnOVKso3pWBHmiMrDJtyunw54KWFgXkpxy15saTO
         9SiOAl71hK3KC9gstLtRuPRgvhP3HzHHwAnlwR5OxnJGFZU5WJR0NYosfRdqxobgzuvF
         HXDipGhaxZsfx34XxO3j2X9ABG7ogtHl3WBnnB+xcI7kq5JfBpVDt97ztu9gc4pLsRgs
         pNc3pfO8kfpBc1tx/WSioIqY+SmKxvCjIWr7Ej8p31hM9uQIv90FMZUlDbzEnkUqvgJh
         MTkUoDiKLk4HVlCmDnVIoqFAcktaJAAolg08LtoeCbMOHCLTx/lb33+7vzGuJ122SkMs
         rWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767484677; x=1768089477;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dB1LagwegptwwLHmXyd1osJA27FSZTcIsYt0ExTrUgg=;
        b=MThb58fbkVQkWlJtvj934BA4HwQi2WlVxvK1TSjQPOwvZaAMdPEJ/iVWO4IrhMAOrX
         KM9qNFDt1sBChYeEFCzeGBy9aNEQBCPYkujtkW/MfR+/b7uer6MTkgWgZ6BIkAOYx8De
         PlMvvkhHkT/ufVTWgDQYxtl2KKq5cXPdmH2Gz0rRUGnvbgoPWU3XLCbSL7vi/wugoSxj
         sK4rQdL9yWFx1IXNHMIfRBtMeyJWSAyf+RWfU+/vddRhJGRX1n3S4UGxOpy0I1LIQbLT
         /ySvPT0qO1vwEHqTd/V8dBeMM83GZoVyOxpVHFwnNAu3WXtdjkNxFDCDGJT2k6zkHH13
         xrww==
X-Forwarded-Encrypted: i=1; AJvYcCUCb756MpJ3l7HVuTEnTn2cd8KsMo1colbZxIwLPV+MrVulmE4WxFs+jRHZcZCoH187jwttruFyJbUg@vger.kernel.org
X-Gm-Message-State: AOJu0YzBQmdEHdVd2BS5nn09kmriHav9i2/EKUK4uhgoR1GkJfRGR/Zl
	k/TcGLVV3XVOBlhSJzx8u/ks+Ve6uPOCJh9lUEKt1V5AUlaiVlt9RAStifFyGv2aD18=
X-Gm-Gg: AY/fxX4Jsnnk0V8HBfy7ugxVD4V2JAq1KqpiI559BOEELlg3FgmaKBIMS5f3jcmic3I
	EpgjMno2AUhPwYebQLDynB5Kloacwc9P0EvCos2E1vktELtpGlgWonQYaI5SqWPt86HqSygphSl
	jydO2E4Zuakn2vbIgjCBvRG6DIkz410w+CB4Rs+8CcoZbtE7ORJ/zvElk28Upj4HiOXxFD5b5yv
	+VZtUyFNVFurdElQGe5H7lNhJVtGFZ+kEqAmKlWpmhgWhz6khewVfZj4Qz8C90javjGyio0iNzy
	39q3fy9fkflQO6Po3iX2c8pfCylpa/Flh+eq5hTcyVLsGbAAhQ5z1WQMh/hRy6vEoZfDxwTOtL2
	ey4Mt7Ti1yiHfnLb7adA/CTBdTjtC8rdjy+wFX7EIDwC2x2jG/jFNevyl+TJzVJZOo1Gf9WwDsB
	lk7XD+SM24kDp5KVed1+gaD5HKuC//VOE+gk6Aq6m3VMpJWtHsvWzAIhqCObu7Slareg==
X-Google-Smtp-Source: AGHT+IHsnTa0hbn+0Wh1C3VR25cgPSQ44uvQseVE0kXGNojATuxFAd6n7Pd80xTUUipMQpgZdEmtvQ==
X-Received: by 2002:a05:6512:3ba3:b0:597:d7d6:eae1 with SMTP id 2adb3069b0e04-59a17d74eb7mr10048358e87.2.1767484677292;
        Sat, 03 Jan 2026 15:57:57 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185dd90esm13558109e87.31.2026.01.03.15.57.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jan 2026 15:57:55 -0800 (PST)
Message-ID: <ad801501-cd9f-41f5-97b3-bf8b628d6e1d@linaro.org>
Date: Sun, 4 Jan 2026 01:57:48 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each
 OF child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Paul Cercueil
 <paul@crapouillou.net>, Manivannan Sadhasivam <mani@kernel.org>,
 Stefan Agner <stefan@agner.ch>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Michael Walle <mwalle@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
 <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
 <86a4yw87g8.fsf@kernel.org>
 <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <e2e72720-5541-44cc-a000-c469d7873c06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/26 14:38, Krzysztof Kozlowski wrote:
> On 02/01/2026 14:33, Pratyush Yadav wrote:
>> Hi Kyzystof,
>>
>> Thanks for the cleanup.
>>
>> On Fri, Jan 02 2026, Krzysztof Kozlowski wrote:
>>
>>> Use scoped for-each loop when iterating over device nodes to make code a
>>> bit simpler.
>>
>> Nit: the commit message is a bit too dry. I had to go and look what the
>> difference between the two variants was. I could make an educated guess
>> by looking at the patch, but still.
> 
> Really? That's old and widely used syntax, replaced so many times and
> sorry, but really obvious.

The made conversion changes are not exactly the ones, which were asked to
be done.

Commit 34af4554fb0c ("of: Introduce for_each_*_child_of_node_scoped()
to automate of_node_put() handling") says it clearly:

     Note that, in the vast majority of cases, the _available_ form should be
     used and as code is converted to these scoped handers, we should confirm
     that any cases that do not check for available have a good reason not
     to.

So, likely this and many other similar changes miss information in their
commit messages, why for_each_available_child_of_node_scoped() form is
inapplicable, thus it still could be improved.

> We should not explain core kernel API in commit msgs, except maybe first
> months of usage.
> 
>>
>> If you end up doing a v2, a one-liner explanation of the difference
>> between the two loop variants would be nice to have.
> 

-- 
Best wishes,
Vladimir

