Return-Path: <linux-mips+bounces-783-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE87818261
	for <lists+linux-mips@lfdr.de>; Tue, 19 Dec 2023 08:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 467451C23529
	for <lists+linux-mips@lfdr.de>; Tue, 19 Dec 2023 07:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E93898838;
	Tue, 19 Dec 2023 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zXhV8Awq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3D3125CC
	for <linux-mips@vger.kernel.org>; Tue, 19 Dec 2023 07:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cc7ba7d12eso8820091fa.3
        for <linux-mips@vger.kernel.org>; Mon, 18 Dec 2023 23:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702971493; x=1703576293; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xminXgCBuj1Jpf20jWnFqmozJPH56EUn0oky68BU8xw=;
        b=zXhV8AwqxI+Rjri54VoaRvBaFkoihmmNyx6NwiHwQBLaoNoE8NVynv0Qch100eq/UV
         n+GkE6igXEzeAFqVy0qRRnIjQq4it0wv6RO3voiOB8eEJkEn9kjTw9eWv3Sro0sJj7KH
         iUqX/r2qmly7Xqk/bEO8CD/ueRBWrABN9/h6w9V1AchZh+UHH4JN1T6WcDO2h5I+GUj3
         JCvlquPmhhNpQ+z6JMyd+FkDg8Zx7HTKT1W1YnkxTfstuHwrpptQt9woZYQ0pVcUIAsh
         7QHsIGpC1Nf8cVx/x03nyQkwYMEYxG8HNzk8c0DnYKEeG/B9rb0R5fQTkEfxvb/JPkHk
         jC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702971493; x=1703576293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xminXgCBuj1Jpf20jWnFqmozJPH56EUn0oky68BU8xw=;
        b=UiaPEcrXCwP47kdR/ZFmocVCqXxYjUT6xWGynQX0eeK37sJLSQLRGnFsaAn8iVihtk
         K3HIb98PM2hj3aLNbAEAwOJjLBmRVKZtqV8fJpdPmhTyu0ODcMTV2ymwPTwkStbJin0N
         L2y49OpnWBcYBbCvaV0vpw3J5TsUjUKg2zlCTd10Hp5MMHfTjsZazbylq11fRQGU2zeP
         Q3MB8hqs1YeXFoXheszzp9A/zf8rWfjsbAr0UplHlDR3VE0+UGZDOJLbZ9jnT7YTjujW
         a2FadThPc4vB03HeF3Ao7xLsNSfiIVhIVVreWw/k/GKZ1TfWBHd1v/0auh7fpJ2LXsvP
         yvOA==
X-Gm-Message-State: AOJu0Yz3dvb02+LjJEQxofXiwWpsflmuSl0V64iiWWfi1+ZGszLYQA1f
	WByHOxn+aIQt6VUw0/So0BYc7w==
X-Google-Smtp-Source: AGHT+IEwCi6TuXgBXmQCr4t3MJg1QkQhNwWnewugfUeqrY5kscNstXB/rrHGtBazygdrQxPq5qsgbQ==
X-Received: by 2002:a05:6512:220f:b0:50e:44a8:6628 with SMTP id h15-20020a056512220f00b0050e44a86628mr270964lfu.103.1702971493230;
        Mon, 18 Dec 2023 23:38:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id x9-20020aa7cd89000000b0055289f60e3bsm4644445edv.79.2023.12.18.23.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 23:38:12 -0800 (PST)
Message-ID: <2fb31811-b277-4f19-aaac-dc5ce9e99c34@linaro.org>
Date: Tue, 19 Dec 2023 08:38:10 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: clock: mobileye,eyeq5-clk: add bindings
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20231218-mbly-clk-v1-0-44ce54108f06@bootlin.com>
 <20231218-mbly-clk-v1-2-44ce54108f06@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231218-mbly-clk-v1-2-44ce54108f06@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2023 18:14, Théo Lebrun wrote:
> Add DT schema bindings for the EyeQ5 clock controller driver.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  .../bindings/clock/mobileye,eyeq5-clk.yaml         | 83 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  include/dt-bindings/clock/mobileye,eyeq5-clk.h     | 22 ++++++
>  3 files changed, 107 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml b/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml
> new file mode 100644
> index 000000000000..d56482a06bf1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/mobileye,eyeq5-clk.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/mobileye,eyeq5-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mobileye EyeQ5 clock controller
> +
> +description:
> +  The EyeQ5 clock controller handles 10 read-only PLLs derived from the main
> +  crystal clock. It also exposes one divider clock, a child of one of the PLLs.
> +  It is custom to this platform, its registers live in a shared region called
> +  OLB.
> +
> +maintainers:
> +  - Grégory Clement <gregory.clement@bootlin.com>
> +  - Théo Lebrun <theo.lebrun@bootlin.com>
> +  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^clocks$"

No, that's not correct pattern.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +    description:
> +      We have no unique address, we rely on OLB.

No.

I explained why in pinctrl patchset.

> +
> +  compatible:
> +    const: mobileye,eyeq5-clk
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Input parent clock to all PLLs. Expected to be the main crystal.
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +
> +  mobileye,olb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the OLB syscon. This is a fallback to using the parent as
> +      syscon node.

Drop.

> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    olb@e00000 {
> +      compatible = "mobileye,eyeq5-olb", "syscon", "simple-mfd";

Drop, not related.

> +      reg = <0xe00000 0x400>;
> +      reg-io-width = <4>;
> +
> +      clocks {
> +        compatible = "mobileye,eyeq5-clk";
> +        #clock-cells = <1>;
> +        clocks = <&xtal>;
> +        clock-names = "ref";
> +      };
> +    };
> +
> +  - |
> +    olb: olb@e00000 {
> +      compatible = "mobileye,eyeq5-olb", "syscon", "simple-mfd";

Drop, even less related. Still no explanation why you represent the same
hardware in two different ways.


Best regards,
Krzysztof


