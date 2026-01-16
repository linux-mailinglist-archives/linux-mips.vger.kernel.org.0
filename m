Return-Path: <linux-mips+bounces-12944-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB50D2D009
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 08:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26AC63079ECB
	for <lists+linux-mips@lfdr.de>; Fri, 16 Jan 2026 07:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B83234F47E;
	Fri, 16 Jan 2026 07:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RL1QqxZx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB2B34D90C
	for <linux-mips@vger.kernel.org>; Fri, 16 Jan 2026 07:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768547573; cv=none; b=DBUfcWcDjcY2iY1OYP2vwsG2FL9kzDlsV7v5dZWlSGqedmBfNNAKo+t0qNU73ONxbXu4gn+S+Uyc+u+5610WbRPj/dbRQBC5rExnHycuM19oz90N0yyKEx0GOXm75ImzEs+aO1YV3EzO4atLRQtj5DqrCZ4OwbWQqzLrqOumOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768547573; c=relaxed/simple;
	bh=IDZpvgs0osXhvOMGucQMxblMEbrDy2o9sMmMCnzNfX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCU7rs4a7aLQ6jF/xXyHgCLq7evGqigiwZLn0LNSLh0GXQVn6OdwqHlgRbAtXlthxXmHva8jVI6YfXcLgGzpVJxdAZQFoCzfxKGzxEnbYF2CWCsX/MuFO9IA53tyqSVpQiHvdijNQjlzyeM0XRprMqAWQPZhlu9NHW3cMwiizhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RL1QqxZx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so1458412f8f.1
        for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 23:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768547568; x=1769152368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yujaS+obb+VtoxAKq2QjqMFYiajEuQVYrsRP3lQ1y7s=;
        b=RL1QqxZxazu34npoyA+RVYMtkhUBUsHQ7Ei0bORNciMZ5Ayl2HG4yRHy7u2urkA+8Y
         zgpdJJbJ7Ra0gaHC2GKs4gL63te6BYZ/cht75Q4mHNETk2Q1MIXBQMqFWIJHrW5XYlFQ
         WeqH9dpN24f32UUq7UUbndRuhqwrPlHyDIOz4+EcaATlNhAhXNfFUYP5uOjN3gv/jbHx
         09jJf4flhjc4xlc4gWlBHvYWyW+WjMsYhSR2ClfVeIP569mA/YmBzgCLWqa+DHbwqX2b
         QvlydBMfj2yCF56b7WzYWhjW5TUM+D0khw44ViI3DF40xmb3deNKhqEYXq58rV9iyPZv
         X30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768547568; x=1769152368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yujaS+obb+VtoxAKq2QjqMFYiajEuQVYrsRP3lQ1y7s=;
        b=r5n1zN4uRrWTzv1v5V/sctlOPsBQf0TytQjSW+wi0hQZ/kvwDv7c/CHGwioLX7o180
         MnUmE7/k6+jExFCd9SQuANzMiqahDcJsfCU+OgQnkVOs3NZ/r+ndpMWY4zXJppcmv0k8
         f8wccw+G9PEQhCooLWwcBCqr5K+Fobv7fIAfoTYySCZjWI4uVdl66lpXvHK+u6E5oaX6
         u67DzNf4xM5HxFeX9p9cSPlnCuA8mVPyKXNBqJ4TND0grojqmnbK6tSZK4VudhQYpeGk
         QBAQkuE62y/d93FXUEkhx03YO8BAo33RAp+Sik8pmiIIqCvdUHhsPyzogX1QGCWRgD2s
         LsYg==
X-Gm-Message-State: AOJu0Yw/o+qZoXf7WESQsiaWZhhT/T+w6QLzfJvyB8WFKKpp+UqCLin4
	AswbyMctmBmbyOjDzX2NFUq2WPxYO1qBGYPNbBBR33mtW5ksdpDzzRNZRuBi46xikJ8=
X-Gm-Gg: AY/fxX5b8Cz6KST0pmlhBmosEGKmO6QGMuR39owi5DISKbErofbVYThLpf8lz/Y9J9o
	epTgvV7XZ6l41Z/VmF8rhrwpCouVVRjjecnH5VBkzNd5RF1gpF4T8kFKYgR/+yD4mZyD8xsDuLm
	Zfhmkz7p2/ERIEg+pvfaIwt5wRQHfzx+KNp7aB7JR0Zh4SA/c27Yrr6vqArEjqCRsVMlIUH7Pkr
	lpwMIsR6MdMCsF3g/G43Tb5UZC1GuO3cOJ7qoXh+USTCNRF10UYYwoJ+ZPKR4EO1BTIq6ALSWWE
	rM8ksIDrivASNaJAp0xxFffeAJZqp0AHuhcZe31vm+pUAZ4ZOhpWAQ7eD5CDq7hKQ/LTS98cxGV
	uL49QxVAqthL0QCzrNeGQeBySOnufXltOHiyIW7Fdgvm5lmYJbigpqDjrzGEPTcYtdcgSxmIoso
	x1uAcg9mpH+IjWlPD28w==
X-Received: by 2002:a5d:5f53:0:b0:432:84ef:7160 with SMTP id ffacd0b85a97d-4356997f4bamr2346948f8f.12.1768547568123;
        Thu, 15 Jan 2026 23:12:48 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569997f41sm3302056f8f.38.2026.01.15.23.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 23:12:47 -0800 (PST)
Message-ID: <4a59d752-7aa8-4687-9618-3994efadebe2@tuxon.dev>
Date: Fri, 16 Jan 2026 09:12:45 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] MIPS: pic32: drop unused include linux/io.h from
 pic32.h
To: Brian Masney <bmasney@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260112-mips-pic32-header-move-v2-0-927d516b1ff9@redhat.com>
 <20260112-mips-pic32-header-move-v2-3-927d516b1ff9@redhat.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260112-mips-pic32-header-move-v2-3-927d516b1ff9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Brian,

On 1/13/26 00:47, Brian Masney wrote:
> The linux/io.h include is not used, so let's drop it from pic32.h.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> ---
> To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>   arch/mips/include/asm/mach-pic32/pic32.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/include/asm/mach-pic32/pic32.h
> index e71c92a7bfde1342be6ea89a4bdf1389aa463b38..660fa4178b3e4e30977c8c4126df4266150062ce 100644
> --- a/arch/mips/include/asm/mach-pic32/pic32.h
> +++ b/arch/mips/include/asm/mach-pic32/pic32.h
> @@ -6,7 +6,6 @@
>   #ifndef _ASM_MACH_PIC32_H
>   #define _ASM_MACH_PIC32_H
>   
> -#include <linux/io.h>

Can't this be squashed this with patch 02/16 ?

>   #include <linux/types.h>
>   
>   /*
> 


