Return-Path: <linux-mips+bounces-785-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A44EC81826B
	for <lists+linux-mips@lfdr.de>; Tue, 19 Dec 2023 08:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9533B1C235A4
	for <lists+linux-mips@lfdr.de>; Tue, 19 Dec 2023 07:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1DC8BE2;
	Tue, 19 Dec 2023 07:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWnOjiMh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D6E11702
	for <linux-mips@vger.kernel.org>; Tue, 19 Dec 2023 07:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a2345aaeb05so285835366b.0
        for <linux-mips@vger.kernel.org>; Mon, 18 Dec 2023 23:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702971705; x=1703576505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nXctI3I357roNP7qG6SksFhaE+Jk+2fn6B1riOMQudI=;
        b=DWnOjiMhAak0Toua9XlmuXIwfIhunQCibPFOIvvoMFGtwheT3Po6656ffUIoXtOoXn
         /pwjJ+t1AtBBl/iA3vgp1DwF0M02+PTYrk+xfWRVGVPDOSSyYR0VC+5yPZ8nRh+h/K7v
         9lyPbGbnDwuISOKdlHgaHFc8H7uchds1I5BXmsh37FXB0nItJktFdfFQvvsCKdycjzAY
         JnBkj8F5LYQB878iC2YQtu6ika6CpgReeMdlNMHBctzmmAwFnIdYUt8mwTAnGXBpvB+A
         hRTQimyzU42vlYHgn+0I/ClNkYyZCAlE0VQ3KRDk6yg2UMCUlB7fjGwaQ5Ae0vhFUR4z
         HWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702971705; x=1703576505;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXctI3I357roNP7qG6SksFhaE+Jk+2fn6B1riOMQudI=;
        b=w8Kr3vtn35QWAm7FSN1QXKr3/yEqeHiYjy9GIR3anpAPI8bEPbG79iGxdxCkU866pJ
         /AtM3qU3WGb27mfcsidDL9qVlSoV+5CelJ/wI5q9tUr7oJMmfzjKHTQzFETMx2xM1w24
         r8B9H8opQsyfiL3nR16/FLZw1BDinA6IeI0tqhglICuB6iYCi5S7vry3j5OTszJSx/0t
         UbO7O/zHE5mjZS7hY0mU2ugh7RQxnnVE57J7XZVsRlHtT6RqEErVCj3KjJ/TleXUHt14
         glIFU2JWoYKueZx8fg1Xbyo98eAz5EW18ymVj4hcoK+RS8eYB5mlKW7sZuV9mU6ldltY
         +PmQ==
X-Gm-Message-State: AOJu0YwM5Bf/WKuLxyCVIXF+IlRNWVvz7vQy236tZ3f0k0G2U6xLJr9w
	V/Feebfpu/FvAzzB8S9UrWJ1jw==
X-Google-Smtp-Source: AGHT+IG8UQ/3ALIZxBFYfozRFRKVqMqlgyNUXbK6yL0mYefZ60DRGpSJeMMoHHvQ3Ts6u2v6FqcSnw==
X-Received: by 2002:a17:906:1316:b0:a23:57f3:95a9 with SMTP id w22-20020a170906131600b00a2357f395a9mr1571350ejb.2.1702971704816;
        Mon, 18 Dec 2023 23:41:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id vi7-20020a170907d40700b00a1dc7e789fbsm14935769ejc.21.2023.12.18.23.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 23:41:44 -0800 (PST)
Message-ID: <6dd6690e-8344-49c2-b389-66562a94114a@linaro.org>
Date: Tue, 19 Dec 2023 08:41:42 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] reset: eyeq5: add driver
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20231218-mbly-reset-v1-0-b4688b916213@bootlin.com>
 <20231218-mbly-reset-v1-2-b4688b916213@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231218-mbly-reset-v1-2-b4688b916213@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2023 18:16, Théo Lebrun wrote:
> Add the Mobileye EyeQ5 reset controller driver. See the header comment
> for more information on how it works. This driver is specific to this
> platform; it might grow to add later support of other platforms from
> Mobileye.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---


...

> +static int eq5r_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct device_node *parent_np = of_get_parent(np);
> +	struct eq5r_private *priv;
> +	int ret, i;
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	priv->olb = ERR_PTR(-ENODEV);
> +	if (parent_np)
> +		priv->olb = syscon_node_to_regmap(parent_np);
> +	if (IS_ERR(priv->olb))
> +		priv->olb = syscon_regmap_lookup_by_phandle(np, "mobileye,olb");
> +	if (IS_ERR(priv->olb))
> +		return PTR_ERR(priv->olb);

NAK for such code. In all of your patches. This is part of the OLB, as
you explained before, and cannot be anything else.

> +
> +	for (i = 0; i < EQ5R_DOMAIN_COUNT; i++)
> +		mutex_init(&priv->mutexes[i]);
> +
> +	priv->rcdev.ops = &eq5r_ops;
> +	priv->rcdev.owner = THIS_MODULE;
> +	priv->rcdev.dev = dev;
> +	priv->rcdev.of_node = np;
> +	priv->rcdev.of_reset_n_cells = 2;
> +	priv->rcdev.of_xlate = eq5r_of_xlate;
> +
> +	priv->rcdev.nr_resets = 0;
> +	for (i = 0; i < EQ5R_DOMAIN_COUNT; i++)
> +		priv->rcdev.nr_resets += __builtin_popcount(eq5r_valid_masks[i]);
> +
> +	ret = reset_controller_register(&priv->rcdev);
> +	if (ret) {
> +		dev_err(dev, "Failed registering reset controller: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(dev, "probed\n");

Drop


Best regards,
Krzysztof


