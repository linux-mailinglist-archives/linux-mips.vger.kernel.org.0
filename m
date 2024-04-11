Return-Path: <linux-mips+bounces-2707-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 989828A182D
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 17:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E66E1F245D2
	for <lists+linux-mips@lfdr.de>; Thu, 11 Apr 2024 15:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F55014AB4;
	Thu, 11 Apr 2024 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IciBfujm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02F4134A6
	for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 15:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712848051; cv=none; b=P7eu2p1vBxjfX/UvBY8569gGjcmbMPXaMNaJ3bnmFElkFtOPV2BuTKoAZ0Pd7P1OwKlcLQafqnGlOpFKPFeYxur+xrgzNtIVK0GnZlCzFQ/4uw17irT0smBMusZbZHfsNplRQ0a1G2UU+3hQC3u1Mzfl4Y3xm0ErV5gRW5hLtQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712848051; c=relaxed/simple;
	bh=UwT3dZsEUGf2cX1eyjAmLR3tU+VqTAbl7oBJMslcH8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDlEooOn87ny11s3kIKnq9m6C9TmBy4c6PaneR3STwTx2iQvPoUEnFAsr11Xfgut3Jvnqxnk4O4bejVI6OAUIFTPuS37lz93LQ3dNE8bfzULCgzDXGm38gap5vLjv0Q+oeSgzDgZN2Jq5L5dgs45crtt/4kWr10r4OzrPqSEDzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IciBfujm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-416c3aca500so16092635e9.3
        for <linux-mips@vger.kernel.org>; Thu, 11 Apr 2024 08:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712848046; x=1713452846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/tLI+vFCnYgSsVdj6Lzrkmb8rf2aK1682Kp6/AzfUhU=;
        b=IciBfujmokgVCFRhr2rv1oivQTQcn6ij1bJpZFGJ5gkD5AdZHw1+JWf7CLas0iHnIa
         F+Osh1gnLtGgNHc3MigDvIlpx7XXAegryWkv1tUH9gjhzU4l3A+WSbekTfoFGYzteoiv
         /UfOBg+2mO8IO13i4Q2+rUQYwoL4LX3hME/OZmuXBiPZ7+96dKrAbIbxInC8TXPX5fUU
         Mg5cTIhqBdweSBKJBGyaN2LFlvHFSLFXKFMckVON7jMiSehVxGO+vbYm1XMk1oICgPh2
         7TGD/29dnL/MKMbtwQ9CubWHB7clCtE/ipxIC4G/FzCJ34/XlNmZ2mBmMoqz66+CNtFB
         Pk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712848046; x=1713452846;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tLI+vFCnYgSsVdj6Lzrkmb8rf2aK1682Kp6/AzfUhU=;
        b=G5ou3uyWyVD03MsoNBTgT7Sr0Eb4wl+BfS8Dxf018FYFo7Q+38Ob7yE8HRRUWRVFll
         scOC42E/0UJG6iIzHn9vNuH/9qlY+Qe46L/wrU8Ji+Co6BnoLNQlY++qDL9E+0igZd2a
         1OaGxlq9Hs9YnZRwDXVqaEBMbgoyqBhjVUlHovlWajnsvsd1eonUKhXOLpIz2Ihc4Y/y
         N+wyHmQHVHJN8Zb51R7H+BLFX66/CdNly7kAspMbyuqHkL5N9buw7JAxLWI9uIwPBqGY
         gj2NmhoriyAoniUCYetYiw2EBSPggSLS5IQuh7JL8HGAGDG3iNl1VEl54Yjlq/cxgM+D
         rSfw==
X-Gm-Message-State: AOJu0YwdWePHjIQ8XtHDM3DU++v6Ji/Mi/unq5mP7zBO+FkiJQ3zbesu
	EeC/Fn2Jq03W2PKhZic/xgWaBQK9J8EQlAKiBDSjFO5wLEI8rd/v6I7gLtzs3Jg=
X-Google-Smtp-Source: AGHT+IHZCpov/oi1/ULO8NO1QPM1SvVEcXaBk5vf2wbEFJTyGDjalN4vwdfxdRsfT+Gg820ixSQYZQ==
X-Received: by 2002:a5d:504c:0:b0:343:61bb:115d with SMTP id h12-20020a5d504c000000b0034361bb115dmr4398793wrt.26.1712848045998;
        Thu, 11 Apr 2024 08:07:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6281000000b003445bb2362esm1974138wru.65.2024.04.11.08.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 08:07:25 -0700 (PDT)
Message-ID: <6e3b02d9-9a1e-4fc0-9459-9c9c0d37aa92@linaro.org>
Date: Thu, 11 Apr 2024 17:07:23 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] MIPS: mobileye: eyeq5: add OLB syscon node
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
 <20240410-mbly-olb-v1-8-335e496d7be3@bootlin.com>
 <faa0769f-bd5e-4c6b-9f61-1a369830ad28@linaro.org>
 <D0HD94HI3W7W.3KLAW6WFIN6ZE@bootlin.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <D0HD94HI3W7W.3KLAW6WFIN6ZE@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/04/2024 16:34, Théo Lebrun wrote:
> Hello,
> 
> On Thu Apr 11, 2024 at 8:15 AM CEST, Krzysztof Kozlowski wrote:
>> On 10/04/2024 19:12, Théo Lebrun wrote:
>>> The OLB ("Other Logic Block") is a syscon region hosting clock, reset
>>> and pin controllers. It contains registers such as I2C speed mode that
>>> need to be accessible by other nodes.
>>>
>>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>>> ---
>>>  arch/mips/boot/dts/mobileye/eyeq5.dtsi | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
>>> index 6cc5980e2fa1..e82d2a57f6da 100644
>>> --- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
>>> +++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
>>> @@ -100,6 +100,14 @@ uart2: serial@a00000 {
>>>  			clock-names = "uartclk", "apb_pclk";
>>>  		};
>>>  
>>> +		olb: system-controller@e00000 {
>>> +			compatible = "mobileye,eyeq5-olb", "syscon", "simple-mfd";
>>> +			reg = <0 0xe00000 0x0 0x400>;
>>> +			ranges = <0x0 0x0 0xe00000 0x400>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>
>> Do not add incomplete node. ranges, address/size-cells are incorrect in
>> this context and you will have warnings.
>>
>> Add complete node, so these properties make sense.
> 
> I'll squash all four commits into one. For reference, commits are:
> 
>  - MIPS: mobileye: eyeq5: add OLB syscon node
>  - MIPS: mobileye: eyeq5: use OLB clocks controller node
>  - MIPS: mobileye: eyeq5: add OLB reset controller node
>  - MIPS: mobileye: eyeq5: add pinctrl node & pinmux function nodes
> 
> This means two things: (1) it won't be partially applicable and (2) it

Why?

> will make one big commit adding pins and editing clocks.

It never was partially applicable. Causing warnings does not make things
partially applicable. If node is too big, although I personally do not
agree, it's quite moderate size chunk, then sure, split pinctrl groups
or pinctrl node to additional patch.

Best regards,
Krzysztof


