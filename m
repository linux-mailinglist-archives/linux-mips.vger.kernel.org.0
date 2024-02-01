Return-Path: <linux-mips+bounces-1244-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9851F84539E
	for <lists+linux-mips@lfdr.de>; Thu,  1 Feb 2024 10:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D04289EA9
	for <lists+linux-mips@lfdr.de>; Thu,  1 Feb 2024 09:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18241586FB;
	Thu,  1 Feb 2024 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XRmBe3eI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236B115A4B1
	for <linux-mips@vger.kernel.org>; Thu,  1 Feb 2024 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706779101; cv=none; b=XL16F+u9pxHaalPzFVjjasu0NtonsL9xHPm+Di5PdoY/IJULOAonmN4uzZ/TJdRq58tdIh1yNXcF/rb+vFb4c9nG9GoR//4+/DiOUzPCO921EIejLH5bJfuc+/yUHI/IUJk3V42dzupcAfVD0uINEYKv/PdrrLD+PRl4iy63LFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706779101; c=relaxed/simple;
	bh=iUlMnOrSV9wRy3crTeEV5w2RllYG4P8KL9D3za1zCtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2hCGZuyqm/lPyZdPxWpWHusIvJfjczLM6ixfmnUhPhzvvWE+uSiQRiLGPEYJA7npiFR3vqfrgQAEHShyXVUWgmgrlXhsfZbkd4Kz0mBRsMaAXjaUlAW9gTk8B1VVlvOV1UyBYFmAGQYfew1a37aYWICnZvMi62A+0yhmInfVbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XRmBe3eI; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55817a12ad8so812698a12.2
        for <linux-mips@vger.kernel.org>; Thu, 01 Feb 2024 01:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706779098; x=1707383898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IgYBWe/wqJ85IEZGtzGOJQZyi0IeIxpqLQiSec7DYZA=;
        b=XRmBe3eIkGXr2rE395PEnBPWsI/dc/19ksSIaRFXTLNZbglCv0hvyiWOQ2yv0ED5fh
         qqYzo/tJw9ZCrTj2GkYyMfaIA8eNqyq1vp0nbNohnEaQeGsubRkYpCCdRRRkh54OMGG7
         5FVCusA7RfNKZv67DfaOMZzFHsPzqB+Z2YzAvQ2DmGIl2TJ4QlNoAHmsScjZ6LAdEZF0
         dUh6PiDYwTOvYO1lqF7Zcb8f5CrwI4el4cnoNxWsvz0yMPdZmky6OrnPHyN+8nqGrWIq
         aETDHUfaGQXBwuM0VBzCPdGRTJPXNPQ4dCpla0iVCkzo7Y6GWFqCmQBR7YFU/iOv8Mb/
         8+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706779098; x=1707383898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IgYBWe/wqJ85IEZGtzGOJQZyi0IeIxpqLQiSec7DYZA=;
        b=L04q74LmSkC9bM866i2K5omKf5Fpg0i7ycdWpI39vgn8Vdn+NDBHpZEjTH9OU45duX
         6Xdmg5VyJPzjklx7ZWchMf0oscUvwR6TO+j5bopHrwm+cYTmSyyfnhn9zRFns1sT4gDu
         b2D9J+yc1qSnDYXpBLpKP3GEgH/hgl0OpselJK35p9mz3ZkvW3T3aZOS9cFM7gmemLZJ
         Pe+K8/ayaHKplyWrnRCTOrH14q6aazx0GraMoFL9DoFNoANuISVttZlzqvneJ7V/nB+e
         2t/DmKzmnH0PRmBxEarvnDPRpcdAbODn6YGs97JwVTCE1q37ooTij2eKr+4mB/Gf60Hs
         yuVQ==
X-Gm-Message-State: AOJu0YwSLIRQNB/dOq9lmqsFyEQv88bUoOxomskGMOjeKvRrim3xao69
	38HFQIAGe5VCJw+Iqb2uFDl4YNs9FjXw2rAFXb482h1znNjO1llkYG8vSX7RswM=
X-Google-Smtp-Source: AGHT+IHhRollnS0CkAdN4NE0JJ480kYB7z1iZCKK34tOvOmCZPRMbPmrJPAxWlkI2bgZWkVLEnX4Iw==
X-Received: by 2002:aa7:ca52:0:b0:55f:c704:56c9 with SMTP id j18-20020aa7ca52000000b0055fc70456c9mr387677edt.38.1706779098303;
        Thu, 01 Feb 2024 01:18:18 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXLxC4E564rLyFjTOq3hsqyCXFpo00V+DYJhQLlYibnZxAupjf//VhgwvTak96DQROrKxuIutJ0l1aJXUZfAxqCiW5CnS9Qva+KsR6BUV6tfepgQKm5OX8AURgDea4Ji2lQEI1iYzR8yYHvkvoIIBAn5IBYmNaGFx/yePvMQXZEunixnbFrUjI/pM2oZ0yMAObAOXUlrRP7j+81TQtSse7A0Pfs+EyiTPM4SKv8FZOnnA9izaE5lcNJ3IMTTxW5KT85S7FCwbCMR2Ur5aQ5JyTDrUR+N1xcBm0Se5115KKqX0e2by/9eHimuC/0Df5znArrUz+XzMyX2/ECJT7Wc3vobqz25HBu+1hKECY//dEKVVlwQUmQfq/HtQR+y7PooH1KLYBvON1fBIzkfLw4PzkGd1uA5hHod91aLSdoWIoKFV824n6o23IFcnMDarA1DTHZH6wUVgC2Otgssqo7RcPNNRNfugtuLYLQCv/ZDwdVrLj7LmKb5c44
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id c17-20020a056402101100b0055ef8318e97sm4152325edu.46.2024.02.01.01.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 01:18:17 -0800 (PST)
Message-ID: <48805585-aee6-46dc-b85a-d222a7420e5d@linaro.org>
Date: Thu, 1 Feb 2024 10:18:16 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/15] MIPS: mobileye: Add EPM5 device tree
Content-Language: en-US
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
 Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240118155252.397947-1-gregory.clement@bootlin.com>
 <20240118155252.397947-13-gregory.clement@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240118155252.397947-13-gregory.clement@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/01/2024 16:52, Gregory CLEMENT wrote:
> Add a device tree for the Mobileye EPM5 evaluation board.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/Makefile       |  4 ++++
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 24 ++++++++++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 arch/mips/boot/dts/mobileye/Makefile
>  create mode 100644 arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> 
> diff --git a/arch/mips/boot/dts/mobileye/Makefile b/arch/mips/boot/dts/mobileye/Makefile
> new file mode 100644
> index 0000000000000..01c01c3aad81d
> --- /dev/null
> +++ b/arch/mips/boot/dts/mobileye/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright 2023 Mobileye Vision Technologies Ltd.
> +
> +dtb-$(CONFIG_MACH_EYEQ5)		+= eyeq5-epm5.dtb
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> new file mode 100644
> index 0000000000000..ff16c3c760a19
> --- /dev/null
> +++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright 2023 Mobileye Vision Technologies Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "eyeq5.dtsi"
> +
> +/ {
> +	compatible = "mobileye,eyeq5-epm5", "mobileye,eyeq5";
> +	model = "Mobile EyeQ5 MP5 Evaluation board";
> +
> +	chosen {
> +		bootargs = "earlycon";

Still not suitable for mainline. Drop.

Best regards,
Krzysztof


