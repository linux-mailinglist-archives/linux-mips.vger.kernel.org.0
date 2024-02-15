Return-Path: <linux-mips+bounces-1473-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CE855D80
	for <lists+linux-mips@lfdr.de>; Thu, 15 Feb 2024 10:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 237AE1C21DAB
	for <lists+linux-mips@lfdr.de>; Thu, 15 Feb 2024 09:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2387A13FE0;
	Thu, 15 Feb 2024 09:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLyhXGHT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454B313ADD
	for <linux-mips@vger.kernel.org>; Thu, 15 Feb 2024 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707988397; cv=none; b=uQtTov+iIUcG1edvKFY67P9AUNrLzLgOyRvWMEzP3NM2rjUzncGFjW3WETvcH7RzuemHgBxB4d0y86zmSZJFwKIeMkHIU14iR6aOXDbYJcuDodCpmkEYe3/SPxWZwF8oN/oiKBKuQjUdFUatxdqigblC6ZiUzfLfdLGJx/lk7oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707988397; c=relaxed/simple;
	bh=bICAboczo0fE1kosVdjDA8jTx9PZOkEy/Kr7tLy6oSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BJX+J0ujjUyd/66xUHVh7d4uWTcHoutLfL/w09m5ef4BGEHzPVPJDMbkdu+pTI1UnJQf728CWHnmf+7AEphYIAjKGsbZuFD19aoQ7t3I1ykQTSxzxflFbHF57ruDG9rR2p0HRoWkioPn/3Ft/n8nvO3RDZ8oYTPaSaqkke5Drzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLyhXGHT; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5620c778052so809992a12.0
        for <linux-mips@vger.kernel.org>; Thu, 15 Feb 2024 01:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707988393; x=1708593193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WidnjJffhTsILS34UkL2f/yQzPDmxMpZNSHt1ahPWzs=;
        b=xLyhXGHT8RyZb1MpvJaWhxrY6jebwfhKSZDOTbOirO+kT171FaFcupNdI47wSr/OdP
         wCnryz9Ea9HZexTt7VKMf0ovPfeTWsOTNWo80ykGqV99BcTUaRMjuin48/g0HuMgDDts
         IMFsEg1kj8iAk2GblBMhzZryWqBWRCjCOb0ZcXODumCctzySAJfcIYH4vC+fpMi497X1
         raCabaWfNb4QRwbMizcgNWBzpwmiVWrlda5I4XXW4CFmCGDAbcJrlIDSyrF7juKtoSpu
         yFbIanowDBwbs2rijZHuo576k8q6Xgqh2UAblEUelfaWpur6tBXHrbtM+DkSygXeOlwP
         kQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707988393; x=1708593193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WidnjJffhTsILS34UkL2f/yQzPDmxMpZNSHt1ahPWzs=;
        b=du9ofxU1H6K1cHK8du4HnXbKwhUsMqsSodP3cGWh3PDG0zZb5xBtumoz729LzBuuxN
         VoSTmfexH1Wi71AXdNwIuuS0S/AOUbP8LWz4/XhiGirbnMxAdRyFQu52AcYuBTwWxYOX
         tHhv7A/axIjcLFSjuFT04AQreQgGcrWLOQmuA/9TQuTkyFYjt7B4ep7jha8DO90P0tPI
         cuxoZM/VDVn3PtY4rYZlDc9StbBjMNKnPsrLP3CxQDkjeKt6e/H+VVXS5lBKEQL7R3ST
         7cILZh7tDHNaCfyzRnyJZIwq5msZDpXKHssbs878cgT16GTz53w5hFvp05sMx/UsjF+f
         gl7w==
X-Forwarded-Encrypted: i=1; AJvYcCXRuAMz5lsZTzfZHDZVMTH0uc+Ftr8wtIqQ79/sCqjnVyu9Y6tWMRwXVjoEOPuXex93be711gxXE3XGKKYlMo0IlCWhNplSyKTMXw==
X-Gm-Message-State: AOJu0YxgARKTAkL4LKol+Ef89HIrLyFuT1NF0VYdnXb/vQ8RkLThqEM0
	UAvCeEle1VS0ETPBf6xfsnacZF3cTAtkdWMMozLJFlEIxFdpd3QASL/EI6XuLpI=
X-Google-Smtp-Source: AGHT+IEw/vjsN/JN8erTGnuSQJieL6oohFH0SW0tibglcIcwiJvU/5yKS35C5X8Bsq4G/oZlbbuMJQ==
X-Received: by 2002:a50:ed19:0:b0:562:f48:d8f4 with SMTP id j25-20020a50ed19000000b005620f48d8f4mr940341eds.3.1707988393559;
        Thu, 15 Feb 2024 01:13:13 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id w15-20020a50d78f000000b0055ef4a779d9sm381258edi.34.2024.02.15.01.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 01:13:13 -0800 (PST)
Message-ID: <9e19c820-c9aa-4eef-a594-f7305b03eea4@linaro.org>
Date: Thu, 15 Feb 2024 10:13:12 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/23] dt-bindings: gpio: nomadik: add mobileye,eyeq5-gpio
 compatible
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240214-mbly-gpio-v1-0-f88c0ccf372b@bootlin.com>
 <20240214-mbly-gpio-v1-3-f88c0ccf372b@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240214-mbly-gpio-v1-3-f88c0ccf372b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2024 17:23, Théo Lebrun wrote:
> This GPIO controller is used on the Mobileye EyeQ5 SoC. Add its
> compatible to the dt-bindings. One difference is that the block as
> integrated on EyeQ5 does not support sleep-mode.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../devicetree/bindings/gpio/st,nomadik-gpio.yaml        | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> index bbd23daed229..e44cf292bc6d 100644
> --- a/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/st,nomadik-gpio.yaml
> @@ -19,7 +19,9 @@ properties:
>      pattern: "^gpio@[0-9a-f]+$"
>  
>    compatible:
> -    const: st,nomadik-gpio
> +    enum:
> +      - st,nomadik-gpio
> +      - mobileye,eyeq5-gpio
>  
>    reg:
>      maxItems: 1
> @@ -65,6 +67,18 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,nomadik-gpio
> +    then:
> +      properties:
> +        st,supports-sleepmode:
> +          description: Whether the controller can sleep or not.
> +          $ref: /schemas/types.yaml#/definitions/flag

You already have such property, so you are defining it second time. You
want instead if: for eyeq5-gpio making it:
then:
  properties:
    st,supports-sleepmode: false

Best regards,
Krzysztof


