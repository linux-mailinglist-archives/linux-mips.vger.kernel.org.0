Return-Path: <linux-mips+bounces-3332-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E487C8D002D
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 14:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0F21280D4F
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 12:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D3F38FA6;
	Mon, 27 May 2024 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cSOTj1+6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1328D15DBCA
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 12:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813523; cv=none; b=Gp89vOCFo+rt4PGYWd3k3K9va2hAa/NPs2TjZwMREc8QzL8qqucF1uDx08Pewqczn/JCoWKR3WE/TybNYqETNa3047xnNc4UASs4ggP47k5/D73LTO8iKHVEfCKHLnA46jsDDhCxgx/nMKZ9nIA7eiekKtNtI0yBSG9Kwdwkzfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813523; c=relaxed/simple;
	bh=KUPmkaVNi0PLQviM9npC6+ISIfhFnQySeRNyLrPRQXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJLRVeJ0yrW3oUb9Wfu0Qr6M/iZYx9F3VLVK5P+3wRz50Qf8y4Wk2QtugovJta606sbCA5oKyklXwPvlUUTydICemtYDsmRO3EKFvvzNmz1rnkJ0WcJ7LqEcwKZgT9yh0AGIDYRmyNBA/IqipXWAYeW+TPugcdvM5X/IHuX2B9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cSOTj1+6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52388d9ca98so16767897e87.0
        for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 05:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813519; x=1717418319; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U0MksHKwBICLwuSG6OgSnqATRY+MnKcyIIXC1UuoUb4=;
        b=cSOTj1+6tgggUjBV+F0I/iX9/C7/h5mRFTUWEaHczTBlPedAmFhH9/HhLde6D2s5yb
         CpjoEvD2hdnHecfwb88IpdMYmGpfpuH6j23Q+9MarOkkgnYFqwelGfe7HXuUfMWoclUF
         NaML2RsFSS36ZuAy2Dp4ppQmHETjJ+UPDbTa7OohaJVRkhdYgeEmWVqKq5JL7Ps3C2Zv
         d9IYyCVVSXpr9YTUt4csDcEP3D5Ij1h3DNH6W4xW2Vvf7ZO3O4E8Reg3bhdwqsQgVZaW
         IZmo0D4u9L2Ry7+dyxQJDgDBYGRmqYSmkH8Dho/T+euE8YEP14bQjket9kNpHk7C0YDz
         oCGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813519; x=1717418319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0MksHKwBICLwuSG6OgSnqATRY+MnKcyIIXC1UuoUb4=;
        b=JPyhAKFvYsZKMNHZP6KKMBgRfY+GnL4xfpPTC3rj2mKmWuhIp4GoPrpS+nBgzSuG5r
         uo1W9Rs80a/9MEpoUdju+pfNxlisGlNzdXFzPeORL82VgJ2g2sdlXen7PR1n7GQrFiDq
         mOrFYxlh0ZZS6jL0Oc66YjldYBOSQA0PZmeiNZgQ8g+P+y1fiHtTiR0X1wIxi1bTszj4
         ufKVKjwj/LvpWygHaUBuuXTZX4Xd0gKtKY+OerR4MDzKzX7A3yO6LG3PLu8ay9QfOXLP
         w7gt854Gthxt70egcsc+v8XpqwyHUPvBZOa87CeMIP7JHTLCH7NnUW7quyBToqhLPpER
         dv6g==
X-Forwarded-Encrypted: i=1; AJvYcCX++3RGixRvrAvtHNMCjsPy/6ZD1kLnlxpFq6ctb7hZAz7q3KHzI323Sxdt5SYQVUp7+EPJfGCEIWfThTCv2MaAXB8bP+/dccN6GQ==
X-Gm-Message-State: AOJu0YwSSt7EVQjIJIS48mdib71BcIe1Ml7sxkpY5nHuxf5xQbQypJIg
	v37UiQpc2B4an4/fa/dO63r2FGBluZc0X207u8PHCNxrcg/mWklHuMkmhs9du3w=
X-Google-Smtp-Source: AGHT+IG1nhVnExbK4ShBNQp8AOL1BeyHFQcVZ25huQqTJip9CI8Tg0co5jAULq+rDZ4Vc1qdUlRr3g==
X-Received: by 2002:ac2:43b9:0:b0:523:ae99:b333 with SMTP id 2adb3069b0e04-52967a26df9mr6335447e87.64.1716813519261;
        Mon, 27 May 2024 05:38:39 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c818139sm491740266b.35.2024.05.27.05.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 05:38:38 -0700 (PDT)
Message-ID: <e3cc1552-4f96-4aa0-a375-a5582094c1ae@linaro.org>
Date: Mon, 27 May 2024 14:38:36 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Implement ieee754 NAN2008 emulation mode
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Jonathan Corbet <corbet@lwn.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20240507-mips_ieee754_emul-v1-1-1dc7c0d13cac@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240507-mips_ieee754_emul-v1-1-1dc7c0d13cac@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/5/24 14:34, Jiaxun Yang wrote:
> Implement ieee754 NAN2008 emulation mode.
> 
> When this mode is enabled, kernel will accept ELF file
> compiled for both NaN 2008 and NaN legacy, but if hardware
> does not have capability to match ELF's NaN mode, __own_fpu
> will fail for corresponding thread and fpuemu will then kick
> in.
> 
> This mode trade performance for corretness, while maintaining

"correctness"

> support for both NaN mode regardless of hardware capability.
> It is useful for multilib installation that have both types
> of binary exist in system.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt |  4 +++-
>   arch/mips/include/asm/fpu.h                     | 15 +++++++++++++++
>   arch/mips/kernel/elf.c                          |  4 ++++
>   arch/mips/kernel/fpu-probe.c                    | 10 +++++++++-
>   4 files changed, 31 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


