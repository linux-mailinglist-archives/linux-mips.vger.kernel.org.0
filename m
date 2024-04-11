Return-Path: <linux-mips+bounces-2706-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B001E8A1810
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 17:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34CB41F219AC
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 15:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA9AE13FF6;
	Thu, 11 Apr 2024 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WKSzJnIr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0695010A12
	for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712847927; cv=none; b=jtZWEV5iKfZdo3+CHWoIPBmN5npQ/qEVm8/yvZqIsLd7yiKh2CrymCeCHNeQlEgB5ckEUqDEvEOdirbHUHH7GPfn4pMMJIORcS1FAW3eEs0LiM4oDRQaiWjMYuuMkhE3JHpL5fHJqaQFlwIDDzL2kb/nZvqPFNvVM/HNc1oNwPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712847927; c=relaxed/simple;
	bh=QevyOVKvuSdzQHrZ1in1R1OWAnKYiLrTvJ3OUPJlArA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LmvvIWvNfT4JOIlnWj/zzhRxTfrmWKSEHskQswPGngaxrFECg1ZTxUIm7/bXVkbz3rSH3lpBSOKHW1Gd9rnuWYbEQ+IZTUUtfbnzp92R3EoO1Dwk8aWOFrLAAMH5anQvr4VRxbu82DZS8OR5zv4Urzgp+6EeenJh1UCSWWe6A1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WKSzJnIr; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516c403cc46so15513844e87.3
        for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712847924; x=1713452724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Tm6ZTNxTOPVKjmmIupco1zixq2O8DRitaHGxcnNlY8Q=;
        b=WKSzJnIr7O6BqvCkTBUww4NdHvPgCN0PZ4fejkM2T7GbfDPR1APiqKjfuIFmPnfyBj
         /l33gCEQJIzzNeKisDmySwCtIpb04LZGqvyVEjndita5LFVGuVJEOI7Srp5KH/acSsSL
         zDP9ZQJ1UN+sbHTwVAIKYGXFZ/arT9qEKKZaLs7vRxrhACqKZjM7ECIgcOad08gqByu5
         I3n/KoTZzbFHTrhljtiOmZB0sSAMPKvjIgx7XYKlDR1zZj2a02JwkyJ52phd6eMErr4A
         gT9taZecIMvLEur62wM7PgFs3korn7VpRDGxkdvr9bWDl8cyvub/G37pVjNKcQJ9CEAt
         g8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712847924; x=1713452724;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tm6ZTNxTOPVKjmmIupco1zixq2O8DRitaHGxcnNlY8Q=;
        b=fnq2wVa3uYgR4D8ku5hGSDib1xFQlW7P+MQeMb9RxvFttF7SyCx3XCEPSFOd07MMQt
         aE2UtgqsYhy0DFgSAtyLY0I71mePohb37oc1j83fCogD3Ts3E1z2wrnWOu3P8Xr/l4Kw
         6MjNpFLZ0C8ThtH80O5XLr30aPpvWeEciU9IvO8mrDbvKlh/+TkUZPz/cwIA8bf6irFs
         Ei4loQHE2YjyDqSkyA11Pl3lkrqkOiZwD47RiAUr+0s1Fn3+cJAW4dikltWf6Eb92lfp
         zGo9EsbxFLGv8RjlASdKdcYY6E2iR8td78wbcf5ErGnPZnwNtd7tTwEjNWHVBguEp6cC
         xE9w==
X-Gm-Message-State: AOJu0YxlhBuDQqjKuEXRWhxuYe+5mOcrGOSygnNoWxRS7hq/T17GStt6
	NIIhFU/pusxP/M97QXOP8GGy2keHSJVfvDV8jDRt7VySB/XmfLebxDFObP45eUw=
X-Google-Smtp-Source: AGHT+IGzDBSQxEdpLg1BfGvNVw+/WhMauDtncjFcsF+rSyVriGUgF4Zznz0ZOynEqwfvz/ZjRzgY1A==
X-Received: by 2002:a05:6512:539:b0:516:cec0:1fb8 with SMTP id o25-20020a056512053900b00516cec01fb8mr5134101lfc.65.1712847924096;
        Thu, 11 Apr 2024 08:05:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id lo17-20020a170906fa1100b00a466af74ef2sm830566ejb.2.2024.04.11.08.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 08:05:23 -0700 (PDT)
Message-ID: <a6f91997-bbaf-48fd-9b8d-2bb671cd026b@linaro.org>
Date: Thu, 11 Apr 2024 17:05:22 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] dt-bindings: reset: mobileye,eyeq5-reset: add
 EyeQ6L and EyeQ6H
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240410-mbly-olb-v1-0-335e496d7be3@bootlin.com>
 <20240410-mbly-olb-v1-3-335e496d7be3@bootlin.com>
 <975a8554-a299-4394-be15-c910cf9688ae@linaro.org>
 <D0HCMDMWTO61.1F860N5I5SKS3@bootlin.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <D0HCMDMWTO61.1F860N5I5SKS3@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 16:04, Théo Lebrun wrote:
> Hello,
> 
> On Thu Apr 11, 2024 at 8:14 AM CEST, Krzysztof Kozlowski wrote:
>> On 10/04/2024 19:12, Théo Lebrun wrote:
>>> Add bindings for EyeQ6L and EyeQ6H reset controllers.
>>>
>>> Some controllers host a single domain, meaning a single cell is enough.
>>> We do not enforce reg-names for such nodes.
>>>
>>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>>> ---
>>>  .../bindings/reset/mobileye,eyeq5-reset.yaml       | 88 ++++++++++++++++++----
>>>  MAINTAINERS                                        |  1 +
>>>  2 files changed, 74 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml b/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
>>> index 062b4518347b..799bcf15bed9 100644
>>> --- a/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
>>> +++ b/Documentation/devicetree/bindings/reset/mobileye,eyeq5-reset.yaml
>>> @@ -4,11 +4,13 @@
>>>  $id: http://devicetree.org/schemas/reset/mobileye,eyeq5-reset.yaml#
>>>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>  
>>> -title: Mobileye EyeQ5 reset controller
>>> +title: Mobileye EyeQ reset controller
>>>  
>>>  description:
>>> -  The EyeQ5 reset driver handles three reset domains. Its registers live in a
>>> -  shared region called OLB.
>>> +  EyeQ reset controller handles one or more reset domains. They live in shared
>>> +  regions called OLB. EyeQ5 and EyeQ6L host one OLB each, each with one reset
>>> +  instance. EyeQ6H hosts 7 OLB regions; three of those (west, east,
>>> +  accelerator) host reset controllers. West and east are duplicates.
>>>  
>>>  maintainers:
>>>    - Grégory Clement <gregory.clement@bootlin.com>
>>> @@ -17,27 +19,83 @@ maintainers:
>>>  
>>>  properties:
>>>    compatible:
>>> -    const: mobileye,eyeq5-reset
>>> +    enum:
>>> +      - mobileye,eyeq5-reset
>>> +      - mobileye,eyeq6l-reset
>>> +      - mobileye,eyeq6h-we-reset
>>> +      - mobileye,eyeq6h-acc-reset
>>>  
>>> -  reg:
>>> -    maxItems: 3
>>> +  reg: true
>>
>> Same mistakes. Please open existing bindings with multiple variants,
>> e.g. some Qualcomm, and take a look how it is done there.
> 
> Thanks for the pointer to good example, that is useful! So if we take
> one random binding matching
> Documentation/devicetree/bindings/clock/qcom,*.yaml and that contains
> the "reg-names" string, we see:
> 
>   reg:
>     items:
>       - description: LPASS qdsp6ss register
>       - description: LPASS top-cc register
> 
>   reg-names:
>     items:
>       - const: qdsp6ss
>       - const: top_cc
> 
> I don't understand one thing; this doesn't tell you:
> 
>    You can provide 2 MMIO blocks, which must be qdsp6ss and top_cc.

No, it tells you exactly this, with difference: s/can/must/

> 
> But it tells you:
> 
>    Block zero must be qdsp6ss.
>    Block one must be top_cc.
> 
> If we do that I do not get the point of reg-names; we put more
> information in our devicetree that is in any case imposed.

Same old argument. Order is not flexible. Order is fixed.

Why do you need names? I don't need, it's purely your optional choice.
Maybe you find it more readable, up to you.


> 
> This is why I went with a different approach looking like:
> 
>   reg:
>     minItems: 2
>     maxItems: 2
>   reg-names:
>     minItems: 2
>     maxItems: 2
>     items:
>       enum: [ d0, d1 ]

No, order is fixed.

> 
> I know this is not perfect, but at least you don't enforce an order for
> no reason. If "items: const..." approach should be taken, then I'll
> remove reg-names which bring no benefit.

You can remove it, you can keep it, whatever makes code more readable,
but order is fixed.

Best regards,
Krzysztof


