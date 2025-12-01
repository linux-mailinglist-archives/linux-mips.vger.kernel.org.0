Return-Path: <linux-mips+bounces-12389-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8DC9879B
	for <lists+linux-mips@lfdr.de>; Mon, 01 Dec 2025 18:18:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BCB6F4E292D
	for <lists+linux-mips@lfdr.de>; Mon,  1 Dec 2025 17:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92643375BF;
	Mon,  1 Dec 2025 17:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Npow+MGS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5B3337103
	for <linux-mips@vger.kernel.org>; Mon,  1 Dec 2025 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609363; cv=none; b=p1pztO+ufeYP26xB0anE+YI9TrG8Gkyn28rHPxgCtic5h4v2H2ldITP6gVhU7QLyB9UpjOBbVqAdm/USfMhKNN81i5dFqJwIU0Q1HeY7KAKCgUyGJYalT/CAJKZhgX72M4N5Gt6SYLyvExLTrfQSjAHu7s9KBZJn8QmCQVEKKmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609363; c=relaxed/simple;
	bh=HH/YjoTJvK+HycLUz2tbwGdJb1nNegFYrobhQ9Ypw8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oPrL6FBS+5mLlMDevUZFSVm01pwjcd/84uUhZ9wEX3FHE1ogQAf9i1lazEFfx8A/eP83sxhjBQnJQyVMQmhh0X7U1ojod5b2IK2LBisDDCxSLCv1XDKC/rRduQZk6eEKODT1SyHll/arF72pXRZ3TM/52v24RBv/N7jxjhfU4Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Npow+MGS; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-45358572a11so108256b6e.3
        for <linux-mips@vger.kernel.org>; Mon, 01 Dec 2025 09:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764609357; x=1765214157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
        b=Npow+MGScSa9PmoCppCBKLkH/lvjtJcb6awX9aPoo0MtWh2u5ueZl/upHY6tPLROi5
         EW73g+TiACBOJ+6zy3qphgzGuN5GmxU+PFQrjTy1JxwXANnbrwdp5plkDZDTUHuv0JEr
         /OhNtkJdZQ2tjwgdau6y7JHlSn3T1eYWvaUdRrCjFeRqk2rWcjfNRY7xp9O58g1TKOs7
         TENNcDQyxVmuY8UZ9RorIWWD6IcDvaEP5x9IAtzciD9xU7ComNVSJfHGYv2lHYq0m5Mp
         C373JHEbOJ7pFsoWM7r6gp+mCteyyMrpi4dKE1LEy4ThHi502gBLwkQ2Pjs+1wi4HnJv
         zC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609357; x=1765214157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXBvbePBmN0aGW+rjYL5kzNiYaDe50sZg3kuC1eECMg=;
        b=N5u/NpIs3Y/Y4SiuYT39BjqSYgj6vZN1jT2eVZrKwR1FkImK09zS5ajz4Q7eIiVoNb
         FY6jRNrMPQqyEcJMwCHnuLMURRf9HaSqcMxE37FZIWNwAYfmApd0i1pDvCF1g2vGjLS4
         JMhthk3dfZp8ji2RfnaIHc4soFQmE2xYFkuXoNccfM+wfv0HAF7BncuzbO0QW1Hl0kcY
         OZRyiQBebB7S+q4snTSm7JCRZRdJT4oBIPDxvu60hgXtWcxk2wNylq5wqguh89XZadVr
         ney/sNkCK6HysTiEhFVCsX0U+0MKwj6UB/cvUZELGn/vYPxWu1gRlBGwuMvTIvLLPzzo
         xUPA==
X-Forwarded-Encrypted: i=1; AJvYcCV9EZQ/vazjtAYWuLcxwsv6pxoMENvkxVb8KM30SpBY6YxZyiTjGeWwuF2wpbSmAME3h5q8/CNGTP6t@vger.kernel.org
X-Gm-Message-State: AOJu0YxpB77XbVqhIsW67pPg0nOZwIwZHkV6uyrCPrbG8iWomLM87Zke
	VT2v9v2wmGDz1h9VNQh6X+C3ZAmJNyjIh89vpGQRgPRiEms5nbeg/WpheUk9cenrmug=
X-Gm-Gg: ASbGncsVh75GK8k4jagWAQn8VjyKWBcD9EKWjsZUlB4+ir4PEbDKkRZt/6F/zuvqzTs
	F7bqL091sz/9bnLfEWyiK8zqhQ+iOtiEmNLK8XX1iVpWT3cJA1TlYUHfcgC1JQpkZZk3CCgrhAO
	8mADT+UKQ65OR2p05KVRgY0FuMRecjGtZtrXvFocX+wusPgn0Uy8Y8YmZuYrKVfkjQ3AkpzJmnN
	ViMnTGaIB+5WBYb1Irn+YTtMYSQvsFpiBM9jlxDhcLEDP/vV+4OGvJL2L6Z3kXMJEbzYcPq5UXL
	NcB+FJ8pxxMgS4NeiOaqfRasbB3DZGn8fwY6QRjlMOTLKvhpT2thrw8qFKABG62Qa88hh4uDLog
	yCIO8mSU2ILwPpB68VX+vP0YkPTBcZfqU0LyvVnoU/T6YfAXmF3HVZb2QHR2deT917VVYpbEqlA
	cKPJR34IN+ELb0oUbNIa8grt7NkoHnyxEaRXuiuO5PuQckYRLxDrOh0ugfag==
X-Google-Smtp-Source: AGHT+IFhXzu7oIvN//K+0gQ9fSmHlhexzrACWF7hMjJsE/gYpW4bjA3882odDNc+t9DkOzPtuw0t9A==
X-Received: by 2002:a05:6808:1790:b0:450:65dc:1fce with SMTP id 5614622812f47-4514e5f84ddmr11527679b6e.3.1764609356945;
        Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:b67b:16c:f7ae:4908? ([2600:8803:e7e4:500:b67b:16c:f7ae:4908])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-453169b2a51sm3922009b6e.4.2025.12.01.09.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:15:56 -0800 (PST)
Message-ID: <78240755-44dc-4835-aca5-99540cca0304@baylibre.com>
Date: Mon, 1 Dec 2025 11:15:54 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
To: Romain Gantois <romain.gantois@bootlin.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>,
 Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Mariel Tinaco <Mariel.Tinaco@analog.com>, Kevin Tsai
 <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hansg@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matheus Castello <matheus@castello.eng.br>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/1/25 4:59 AM, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---

...

> diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
> index a8198ba4f98a..33d6692f46fe 100644
> --- a/drivers/iio/dac/ds4424.c
> +++ b/drivers/iio/dac/ds4424.c
> @@ -14,7 +14,6 @@
>  #include <linux/iio/iio.h>
>  #include <linux/iio/driver.h>
>  #include <linux/iio/machine.h>
> -#include <linux/iio/consumer.h>

Unrelated change?

>  
>  #define DS4422_MAX_DAC_CHANNELS		2
>  #define DS4424_MAX_DAC_CHANNELS		4
> @@ -321,3 +320,4 @@ MODULE_AUTHOR("Ismail H. Kose <ismail.kose@maximintegrated.com>");
>  MODULE_AUTHOR("Vishal Sood <vishal.sood@maximintegrated.com>");
>  MODULE_AUTHOR("David Jung <david.jung@maximintegrated.com>");
>  MODULE_LICENSE("GPL v2");
> +MODULE_IMPORT_NS("IIO_CONSUMER");
Is this actually needed if we don't use anything from consumer.h?

