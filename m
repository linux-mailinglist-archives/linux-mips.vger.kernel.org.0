Return-Path: <linux-mips+bounces-2622-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D3189B806
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2D42818FB
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B062B9B0;
	Mon,  8 Apr 2024 06:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FqsCwiMx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918B425761
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559341; cv=none; b=cwxZE3sc2XPX0Auzvg8x2n8mzBNyokWOs5EBhlewd46lRUpHmDLjz7oAwcw80mn5B/k+lCln6LSvxyB9vQMoxybncx1OmOyhYDZ/Z/MkSmPwDz8CbBE6cLVTBtApx2Y7PYAYsnljMipLfsnMkqDsH85j65jyZ504dXJf8JMx2Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559341; c=relaxed/simple;
	bh=bsPsnH/Qe6h3bW7N1JA68yGZ4jSnX40d5+s2NK1N4dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dzti9lBvGT8Uuxf5wO4sIVAcDcaqjQEV7jZIXv3Aq3evk2qK4HgvRpZLTUA4xe8ECCQmGgrc39ZZFY+enFGXlb9Kx4l27Iv7AmDw9rS+aHZa423NKcsPv8mKdk1102BemCgsIMAwkhr7AbRmZMj6k87TVOgKGYa78YsA/VzVbr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FqsCwiMx; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a51c37a5025so154551566b.1
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712559335; x=1713164135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NFaDkg3N+rKkFqev0DgY2RM3zexS4ynDz0rBsWS0Uc=;
        b=FqsCwiMxBCQwo6daNU34GyjsfsFa7RqaCZP7Nh1V9XBRYVbSNY5smQ+tOlEpKmTerD
         1oXCSOQSwHtYAOk8+Ymri2PaJS65AKW7LTcW7gH2dOycDEKHGbVHNRSntY01Kt4jl48h
         gzyeG1BSVDhxZZ02hvsP4NMXYrWZWKVdF6KBuiwl6nj7XFbQeqP9U07FZl54p7bHp7xb
         H20wwTOlQkhq867GMnH1z4WTzRBD1/9K6K81iBSEpxePSD1qozgTkXHuj3VYogtuA6V2
         CYQFTcLCMCbJ6yY9aoRu4Apa445a1b8LLqHS9qDH+4fl9AYI+iBaETSg2b7UsZ3GIjnr
         qrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559335; x=1713164135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0NFaDkg3N+rKkFqev0DgY2RM3zexS4ynDz0rBsWS0Uc=;
        b=s9Lem8zpx6y+AP7Js5vT0Nf/cTX4VMrcezIYuNs8ZFeP3YuKNhAfKLnmAfWaAZKVrc
         qr/6GYR20Nxj/tKOcTU2VjzeRbMCyFLHm5BkZ8KTWwwI8dn9u6Eb1XPWacM+Ke0f9Cru
         KZ76UqRgfjHtYkbAMuXEk9zSVXail2tTMiKVhgqY/ymQNL/kFRO0jVURl7Dk5WYKRS3y
         aw9ZK4JNDzpHJogR2QeN7IFXSwRG5eO4soy6kYPSc9bolcYVO1zxZZb8y6kjYFaBEw9S
         kzPdv6baBa23Y2YTKPiDzqZ06u2kpjSkTOOaZxXqnWQfMyx7k2aZpe8qKGXYqxRzz6DP
         93iA==
X-Forwarded-Encrypted: i=1; AJvYcCUuxAp9bqTxoSNpgqcY4CZMnEdszTwBc0lu7Rtf0xC7ZnJQHtAsEFkq5TJpyGdMoEpJSElA5lbFBF2ARZipgukVRX6dNtrilYVCCA==
X-Gm-Message-State: AOJu0Yw9jWuRoAUE2iiAjZn0SM54mq9OPLkniEoujmyOu9y+5cBzaanu
	kqWlUUmfLE9HDHUv1eUPAjCzApEJ3KvBMZkuHcKjldauihJexHkTD/DKHncg8AM=
X-Google-Smtp-Source: AGHT+IEoC9wBZKm/gH2IWs1khixZDizFbCvOUAJbeI0P+DUkE1xlXhZZ1pfD5vdqHbl+obFnU6yl9Q==
X-Received: by 2002:a17:906:dac1:b0:a51:c138:402f with SMTP id xi1-20020a170906dac100b00a51c138402fmr3546969ejb.39.1712559334946;
        Sun, 07 Apr 2024 23:55:34 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id o18-20020a1709061d5200b00a51d31924c6sm1203216ejh.189.2024.04.07.23.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:55:34 -0700 (PDT)
Message-ID: <d9ad95b6-d10f-431d-9a8e-6d357d4afc7a@linaro.org>
Date: Mon, 8 Apr 2024 08:55:33 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: BCM47XX: include header for
 bcm47xx_prom_highmem_init() prototype
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>, hauke@hauke-m.de
Cc: zajec5@gmail.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
References: <20240315022923.178593-1-zhangyongzhen@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240315022923.178593-1-zhangyongzhen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/3/24 03:29, Yongzhen Zhang wrote:
> bcm47xx_prom_highmem_init() is a global function declared in
> arch/mips/bcm47xx/bcm47xx_private.h, but this header is not
> included before the definition, causing a error:
> 
> arch/mips/bcm47xx/prom.c:134:13: error: no previous prototype for ‘bcm47xx_prom_highmem_init’ [-Werror=missing-prototypes]
>    134 | void __init bcm47xx_prom_highmem_init(void)
>        |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
> ---
>   arch/mips/bcm47xx/prom.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


