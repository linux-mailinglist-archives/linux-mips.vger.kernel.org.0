Return-Path: <linux-mips+bounces-2620-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D77CD89B7F8
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14D031C214BD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1125F200BA;
	Mon,  8 Apr 2024 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ccI9JrnW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6218C19
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559039; cv=none; b=r96YgSxGzPEuHNoFwZOj6DjsC+lQKHGX0QX50sjsC8Sbha4hHOunt/OVCueCxq9MYPYBHkARIMuH+JaV5XEUFabwUoFCQ316FfodjzgOkKtJS3RIf9gta07QTWqqpKq5LIEtNn6krK9rQRut4uG2xm7ss9ANJamsIDqgKciZUus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559039; c=relaxed/simple;
	bh=JPXTBTKfvJJVG9gDnw+mDcFjqItyjlrWTjRocYUQy/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpbL8VwuZP/iAjhjfHY9WlEmoEdrJF52gI8c60MXq24g4ti4MK3C6PpvFO7g7ppbSKU6U0vkZZMdPmUKeeFAGFRZ43At/HcEsMxekHERC/FFQi5ztX5TdaQd26PkUDdxA/t3ZRv+nUNCserFb2RbCX5p9Me2FGKD3aAoQ3vvnbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ccI9JrnW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56e56ee8d5cso846783a12.2
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712559035; x=1713163835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R/lVG3my3EQ4mbMOyTDsQvtcyQisN7c+whEMvUc8glQ=;
        b=ccI9JrnWfUalO87bSvILM025hwLU7MDhh0eoP7Ykwynzjodf4en9lrqgAQOrI2qY6w
         Wx+WZZm2rADWNnZSikVd6IGr4jtQKXSKwdKE4FKlVk9/obrYiF6C701xIsruaJvpkyrL
         AgkcVcqI+nn9illUd6IKv+nlfkpdcdgmyMpKq14Zxc9X089J6DQ5TVA26DJgjwtiMypQ
         PQLspRx1TwdUkfGwVH4XAR3IykIEFe4yNzY3u4iLsjlZ3p0SzAmx8Ubnx9J/xGgvFbQ8
         Qrrx9DA5858cY4DG4umWilbX/tW7bJxVaqynPEFlaKx0S0vHnUCv+y461Ci6rV5Gaxn6
         d7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559035; x=1713163835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/lVG3my3EQ4mbMOyTDsQvtcyQisN7c+whEMvUc8glQ=;
        b=dkkcpLxnkAXFSntC/dxgtEXo38+v8omzd+wCG8E4xjAERq3JMAjhr5SEbFgt9BGBJi
         oUE28JipnQ28akYHG1RcnxrDlFqXFsfAE1ugEizI+lUMPOyY4SL+wn3zLY5d2FPluGKm
         lMfNWZfq5RzIYPr1oNa5zbZLEuYkW0ZV9hepvovG6lyDeUY3RnZfqZjRsFunIFq/yoz3
         CZne7zHq2vW+/FbZnPRN+gmp+FtsN8fPFvbAKHT756+N1WJuT2NZntrT9zd1uig+dg65
         iNCuIz7kruLU6fT30IbRmBaKCgzgxtJycj2yZuS1F8cXZLn88ChVh1PCpnQ+1FnjVAIB
         GX7w==
X-Gm-Message-State: AOJu0Yw+pCYR3qcdn/prp6iz0x8eC9vknUsUYtARkt/E26+kENrjDOIA
	mF6CsI4umrGSp/nCKAjCE0jI0nTIAGjxUwKny3KjhbnvWU/hz3Y3SiuC2LwtmTvW1r40ujoJ6X7
	+
X-Google-Smtp-Source: AGHT+IHI2QYfnA4duDWNhz/BalbFNhhiN+B3WLlVxwhZyRNkL8W8n/GBBhfroO9mtTDhPjWfIiCsEw==
X-Received: by 2002:a17:907:ea3:b0:a51:adac:e1dd with SMTP id ho35-20020a1709070ea300b00a51adace1ddmr7710666ejc.26.1712559035039;
        Sun, 07 Apr 2024 23:50:35 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id hj13-20020a170906874d00b00a51c1b325e0sm2348314ejb.211.2024.04.07.23.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:50:34 -0700 (PDT)
Message-ID: <54cc141f-8a0e-4b03-b3b4-5e2c57eece08@linaro.org>
Date: Mon, 8 Apr 2024 08:50:33 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] MIPS: zboot: Convert to use debug_ll facilities
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240326-mips_debug_ll-v2-0-b64abc76f2a1@flygoat.com>
 <20240326-mips_debug_ll-v2-8-b64abc76f2a1@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240326-mips_debug_ll-v2-8-b64abc76f2a1@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/3/24 21:35, Jiaxun Yang wrote:
> Since now debug_ll facilities can cover all platforms supported
> by zboot debug print, and it provides extra capability on debugging
> exceptions, switch zboot to use those facilities.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig                        | 12 ++------
>   arch/mips/Kconfig.debug                  | 46 +++++++++++++-----------------
>   arch/mips/boot/compressed/Makefile       |  9 ++----
>   arch/mips/boot/compressed/dbg.c          | 39 -------------------------
>   arch/mips/boot/compressed/debug-vec.S    |  3 ++
>   arch/mips/boot/compressed/debug.S        |  3 ++
>   arch/mips/boot/compressed/decompress.h   |  8 +++---
>   arch/mips/boot/compressed/head.S         |  6 ++++
>   arch/mips/boot/compressed/uart-16550.c   | 49 --------------------------------
>   arch/mips/boot/compressed/uart-alchemy.c |  9 ------
>   arch/mips/boot/compressed/uart-ath79.c   |  2 --
>   arch/mips/boot/compressed/uart-prom.c    |  9 ------
>   12 files changed, 39 insertions(+), 156 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


