Return-Path: <linux-mips+bounces-2616-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF62589B7DA
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11E01C217CD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53FCC1BC39;
	Mon,  8 Apr 2024 06:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DhqJ2EIy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B982F9E6
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712558783; cv=none; b=cK7joT7KoWQY3qKj1N4TOA+7GNi4KQdNma9ug6VWZSsjY3yJJ8dHplJuyZjKNBUJeDNXAk/gPh/OEuLVBMJ6NACvZQTMRTHKSc21BNiFPIub/WbqljgWIczJm8+/i3gBt1d0hIbJtMK+4EVwJqckt9Dy+03/KHoaQl1oDAGELfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712558783; c=relaxed/simple;
	bh=DSExnLCvejWYqCkol0Sfds6mjCuUAV3tmgrfTTDY5aI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IDiNolAYGcw9PWbOjiBCi5N1L8MTFzBtrs0CkYqz4qfrNWgBFeC+zVCop+B4vukyBH0VMNCQ0bAVLer6w6m0G8deYAx2aLbzJUFUA8l+xvRtEitY7yix7LyvXFEvOHdujn4GAxJdZQ2sXKw2tInh5ObhdDZcp38WHCjVKZsJDUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DhqJ2EIy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34339f01cd2so3039952f8f.2
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712558780; x=1713163580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gix0+LM+ddhIif0f14Aq2TxbM4MRCHDThvSL9sY9dYY=;
        b=DhqJ2EIyPmii4ijM+GM4jNzCNPk8wZpRG+S4tQUA8cStv3bNp/4n2aJmcktBMOXEI6
         p04rVO1hZo+xOHPyliuT+zR89a+T5aBonjIC36ip4OwzklcL1oIYybXx8MWFuK8gMVcy
         N1AcZlHr54/9JK7Bk9kaX2UDddjZdtAyKAz8OKCrpWDebwE8V0xA0XFHgI/SJko4KLGY
         AmMM742a8pASa3vpcUdF03zl0XGVmAVBSZD8S95WQuRYwt0Q5q8e3/46+86XaTqwaCR7
         IZbl6veHqj5hfRZsbDz/5zv6x+2nrjf99l2U7/SSCHWRU06axBdir62Pi3PA3vYmX3+f
         4avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558780; x=1713163580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gix0+LM+ddhIif0f14Aq2TxbM4MRCHDThvSL9sY9dYY=;
        b=IN8y1SoueTxP7QKrGZC+VhTO3puMd2rbJ1dfQPQbZmKmonGUJASCvfS947EFZIKtBE
         4RTj4RTS8HZd4/wCGZ0qOWXEZFb+Z42wOHapRsgzLnLgtsRU8J8fXawltQwIcndT5Pg/
         i/9YeCovy+yxyUaXCUkkNVlMPfsnjc5RUlSsvhO/W/UCJPEY7yNIsVftymoJhlp9v51S
         rxLm7KSbp4rZ4fJdllnqZbS4PFBfxwh/AAJjgO+YiFcmBYpvgNUVGex8aJMwB0HOVNoI
         aXjZqQL8gcwjldF1epqYpRkx7adje1X2ZyQYtWG4z7sB81YFXSFNG3Lh7gsfzVFPh21j
         96pw==
X-Gm-Message-State: AOJu0Yzav9bnAgX5xWmjErOPJXW+zYxw/LJug6RGLiKQCSm1oMcqrsN5
	ePwVi4KDq5xP/GinQLUKyatbvU/emNkQ7dFsCABGNEUeDKHN7ffaMjLmCH9J0jU=
X-Google-Smtp-Source: AGHT+IEKDgZl95z+k1DM+Ts+D8PLd6KaxGR8xjNlS58XzSoOqtrWXakvsSwlj0X3UbzA2T96z0MORQ==
X-Received: by 2002:a05:6000:1864:b0:343:617e:26ba with SMTP id d4-20020a056000186400b00343617e26bamr6914509wri.54.1712558779909;
        Sun, 07 Apr 2024 23:46:19 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id f13-20020a5d64cd000000b00343e97150d6sm7629666wri.32.2024.04.07.23.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:46:19 -0700 (PDT)
Message-ID: <10deb213-1244-4bee-8a6b-2e875cce81cc@linaro.org>
Date: Mon, 8 Apr 2024 08:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] MIPS: debug_ll: Add Kconfig symbols for some 8250
 uarts
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240326-mips_debug_ll-v2-0-b64abc76f2a1@flygoat.com>
 <20240326-mips_debug_ll-v2-5-b64abc76f2a1@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240326-mips_debug_ll-v2-5-b64abc76f2a1@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/3/24 21:35, Jiaxun Yang wrote:
> Define platform symbols for all 8250 style uart type supported
> by zboot, plus Loongson-2K and boston.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Kconfig.debug | 56 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 56 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


