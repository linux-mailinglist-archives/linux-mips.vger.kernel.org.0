Return-Path: <linux-mips+bounces-2618-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A689B7E1
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95F651F20F4A
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D6F1CAA4;
	Mon,  8 Apr 2024 06:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XsJUhdhX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877A1BC39
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712558899; cv=none; b=a/k/8poINRvU0TgZ4ENUuUEmELps/JC5wkEkhaJ5+sl50PSOGSoBAJEHx+YNtSupa8yT8GLItvpvQwYWoGYhV3LyppEzmfYFrgG68nDnBuMZEHKWB6puCh3sgtgtKhaFcRoowWlKebgsFF5hNR8XHCMq0mt9hQRfl6LpcbM8IL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712558899; c=relaxed/simple;
	bh=HyA+6mhstgVPP/a7zFiKijsRqPoKdO1rUjEHmFlUNbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGEvv74C51KYHzJZwnh/d/OiWeAgFbrw3mSQV6Ng6A9B/FjHNKa5DoDMJYimTt/0RT0bf9+EhqOygztBJvY9C/uBZyfx6chsaug30l/t1PABaLCc82ugsEClFhL2jhCDYomiWMlBPmQIfid2CHmaEVInDuDayQvdo6T2ErEkhjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XsJUhdhX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-344047ac7e4so898399f8f.0
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712558896; x=1713163696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yI1uiCLOQpv/+K4dcA8iKWw5IGXMa3uNcLHhqf2sN4A=;
        b=XsJUhdhXB6J/LKHXTENcD7NrTLwg5w9mUNzd99N5CmJdZulXYvxrZcvmncrWjI1f/e
         H33FBM8+zUDpFwQ+KyGOtrh3V7FFrr0Q9zozgAC6zXhk+nv86CAtDc/Ao4qS80BcOUrr
         JypRJBXQEgxvDVE9byc9XLyPea2Ofn7K3IPTnZzQYAFMT/Qpq/7bBCBoLg+rWE/b3Kvh
         MLXxphOUlozqZ84GLWXFUGy8v/wjyHCZcVerawLx8OHmncUwPY6qLYI8LGEwm8n5bshM
         Vkw+ETw28cSJXPvAUhQob/whcVGlJrJFA+J9do0FcPy10FTAx2MOvREklDlMbT6P8GOW
         PzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558896; x=1713163696;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yI1uiCLOQpv/+K4dcA8iKWw5IGXMa3uNcLHhqf2sN4A=;
        b=QSFxNolmUOVjdfFO4ejJrVUvQyNsHPUPsYpI7D0jV1AWonDwT6U4sxrq/X8M0z2G9B
         9r4aJChqtYoIOdih/jr8zLUKQIXKR3jzVhhSICmZYGXKG2xZgmy10ktLFqS+0VguHFdF
         T+JXFQRa5Rrzfy3v1sb+rCjDmTuonWRiEMoGLFMFsLxU3Fuj4dv/mtlHOq46UjxmXf9K
         HCj/+0SNrrzNgpiUEIkNeucSj0lMZ4zOBnOkNifVDT8Ln7e3h2gDHG2UxdbWPN0AcwvZ
         8hHb3f92josGQy+7yMt4bKJ7/K4h3HuObSNaq+BWfy9gmflCFUjVN7vS1sY6se3BdFkc
         j3Ug==
X-Gm-Message-State: AOJu0YxAFBrzS+onJO2xKWm3cg7S1cS/0zVZ/GwFTM3Gax7t4rxM3BMd
	oBMow1C8Q/l4iIYd+WvYKzHIKFFmZfLNwA2WSJ9FYxk5sqYyNoNZrez6tFHLeO+DhFV9vkc7lTe
	x
X-Google-Smtp-Source: AGHT+IH+1QZmvQ8bMeYKGXg67Cc2kEziVs/rt+NYdYh5OhJtziQcmomn8MuoreErTdomBvfGLtYCgA==
X-Received: by 2002:adf:f24f:0:b0:343:7ed6:765a with SMTP id b15-20020adff24f000000b003437ed6765amr6382151wrp.20.1712558896082;
        Sun, 07 Apr 2024 23:48:16 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d4b52000000b00343723c126asm8162013wrs.48.2024.04.07.23.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:48:15 -0700 (PDT)
Message-ID: <17e04ad9-350a-4f6e-b932-9881b7898c5a@linaro.org>
Date: Mon, 8 Apr 2024 08:48:14 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/9] MIPS: debug: Implement low-level debugging
 functions
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240326-mips_debug_ll-v2-0-b64abc76f2a1@flygoat.com>
 <20240326-mips_debug_ll-v2-2-b64abc76f2a1@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240326-mips_debug_ll-v2-2-b64abc76f2a1@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/3/24 21:35, Jiaxun Yang wrote:
> Currently we have three sets of early debugging functions
> for MIPS: zboot putc/puts, cps-vec-ns16550, and prom_putc.
> 
> This is a attempt to bring them all to one by providing
> a interface similar to arm's debug_ll, which is very portable
> and allows you to support new platforms easily.
> 
> Two examples of output interfaces are provided, including
> 8250 uart and MIPS UHI semihosting, which already covered
> most of the platforms.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig.debug        |  80 +++++++++++++++++++++++++
>   arch/mips/include/debug/8250.S |  60 +++++++++++++++++++
>   arch/mips/include/debug/uhi.S  |  48 +++++++++++++++
>   arch/mips/kernel/Makefile      |   2 +
>   arch/mips/kernel/debug.S       | 130 +++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 320 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


