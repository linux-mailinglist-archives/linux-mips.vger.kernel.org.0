Return-Path: <linux-mips+bounces-3328-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B80188CFFF0
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 14:24:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BD501F20F0C
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 12:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07DE15D5DF;
	Mon, 27 May 2024 12:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zVM0rHud"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B081581E2
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 12:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716812646; cv=none; b=uV2DDLfYWJwbstrwa+r6KiSHpLgKI+05VUkGd8E88dEKSb15SCmooyx38EIY8lrfpgAaB52my7KrX6mVczTyFSI3mqV4jV2u3apErsSy9obTnTJdtHYxV9Znq01DOYSl0M8y028ejroPfGthv9FOtwoNmA86x53Wo9G8RNieUXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716812646; c=relaxed/simple;
	bh=u4pNQndhTwzjvZeCbvNzFIGllGB6K3HszRuUI2KOTno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iqaFllEPifg4zfYbw27swU3KN+qfdYlxydHghA7bpUZNW7IXph+LE3gcCrKxyC1FdAxy8dMHGLjC9seQa2RvbxVH67DcUfSOFev8Q3QLrttinKMSM7yzNe0z0BjDk3VezNf25h6oojHZgXnhSco+efXmRr4/ArDwkG8DgSL0K/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVM0rHud; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57869599ed5so2129515a12.2
        for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 05:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716812644; x=1717417444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvByR1DQ2F9g5kyajsGPK2dl35siqeWB3JPTIt3yItE=;
        b=zVM0rHudB34o7ySW45Ii9I2XxjnADnmUel7RmSG1itp99BEBcP5zWvU+mI7enWC+M0
         2V2+IwGBOXUafWS4BhxsQritmUWiZ+1qNksWtivxJa/QddEPOp42Z3ZskHPmGj6wV8VC
         nZpelsWyi4IX/zh9SvHWhVacZ0yIseao6S+zqjILCVSu2wUQI6oyaQr5gfkgBvl1FhUA
         4f3DhnSvZK6F9ZCCkcdNY6g9oF/Pz2nPbRt1w0jZoEbHKnFjEDkxPgXjI4HDvmfENorJ
         985kSb51usfMVOMg1hg5N8WgE5aaleISNQrjrEdqaQLnDKu4sfNkYXuoYNzyvfKRKAcF
         GOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716812644; x=1717417444;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvByR1DQ2F9g5kyajsGPK2dl35siqeWB3JPTIt3yItE=;
        b=SIIdEt02jE8+443HqFT3fAXwtp1h5dcscL1NoLJml6e+9tE/IgTLCZVjR845N3i7lG
         MKIdiHrxl6Rys1GJvZ5RE9JnGlaW+15NG1a8KXDBZsJNW9wT5iF6AihHMqH/cy8Z0Q0V
         WV8TbTcj/dDg0c3Lz16d/qU7aFKpHit+g1ESLlAmj6ZSS2EjaU1oF/IfLSo2AENfPH7F
         lNSpzOsgz9Gaslq5BEUvIMy60rB7lPHcUCGbmsNr9Kob9Ge/7a9dxL51UI1K18KWBBSk
         Bg84gpC753Sof61rgH4FIzzrZg9rNC/mdx8NChwauVaDID7H8beouBXRrQ8Ie+Sw/gQC
         UKvg==
X-Gm-Message-State: AOJu0YzOMWOoay/6gac/ojntriGjez01fOWZr46k3vvpO5nGGak6Jt/M
	+PQgfPEQRJGUphlm0lfn2zU5GJDAoXtCcbzAgq/dWkAfE5CimPCaArEhKRDtH8F359KB1LvDwbE
	Pwo0=
X-Google-Smtp-Source: AGHT+IHJXyIPVfQ3VM4Dz+dObdkePRCK0LaLG+DImc2OW2iQv0GkTNfNw3rFNPePQO/ok4Rkh6u9fA==
X-Received: by 2002:a50:8751:0:b0:578:6159:8976 with SMTP id 4fb4d7f45d1cf-57861598a76mr5909962a12.28.1716812643725;
        Mon, 27 May 2024 05:24:03 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578638009b1sm4178095a12.17.2024.05.27.05.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 05:24:03 -0700 (PDT)
Message-ID: <9d93682c-5da4-43d2-a9fb-f05d3596e066@linaro.org>
Date: Mon, 27 May 2024 14:24:01 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] clocksource: mips-gic-timer: Correct sched_clock
 width
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com>
 <20240511-mips-clks-v1-7-ddb4a10ee9f9@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240511-mips-clks-v1-7-ddb4a10ee9f9@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/5/24 18:00, Jiaxun Yang wrote:
> Counter width of GIC is configurable and can be read from a
> register.
> 
> Use width value from the register for sched_clock.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   drivers/clocksource/mips-gic-timer.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


