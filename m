Return-Path: <linux-mips+bounces-2241-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6709587814C
	for <lists+linux-mips@lfdr.de>; Mon, 11 Mar 2024 15:06:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987471C228EF
	for <lists+linux-mips@lfdr.de>; Mon, 11 Mar 2024 14:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1483FB9C;
	Mon, 11 Mar 2024 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rqiaeyx/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCA93FB87
	for <linux-mips@vger.kernel.org>; Mon, 11 Mar 2024 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710165977; cv=none; b=PF1APmKZEeYrR6LPfeKZGsBchvV+T4WLzX9Nb8h+5/WUArFxHcoCq5J71SlAy4hUaLUERCAWKVPJ/eD64Ir5Dy3wbZx7NT5VK/Muw7E83qoc5KgNm9Q9HYCteqFUETrzqgwGwG8WOrtU+o7zu3ufprdJcHhL14tWR9b36rgPQQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710165977; c=relaxed/simple;
	bh=lgogrjy9kuME3sQy/ONRQafuDu2sN7ANTyoJLy+/q8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZS3iWAKT/yxO67fDLQbVM7sV+jyB1TapLFb+J1A9xuZp6BNavR88vkhi54OlVDYLvzxnZy2dAo1pzF5DlRb1rDJNmNer0Pxxxp9mPn/Ll2CGzIFUd4La9/GbEsVdGqAnscD9mCwR2wEhsiDJ6VuYkQA2KgPwqyd6roRc/h7Rgrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rqiaeyx/; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33e9990da78so634553f8f.0
        for <linux-mips@vger.kernel.org>; Mon, 11 Mar 2024 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710165973; x=1710770773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oEfxD47P17376HaVN5QCqzhMLDLW1AovPI/CpxbhNnI=;
        b=Rqiaeyx/toJ2p9H8V5k5s2lZeXjSAfevgDrstKqf93y2dT7tIAs/iGkzz6qP0JZ3pk
         zf0eLqXAO5sz0lepKscfarucRxQGY9k2TBseTtoAi3hU/MS57cnktaPnelI25RccclxD
         5wpvJm5HZQR8tH7KkCJzplv1680GxPSHqnP4yMMfy6rG6sJIvRYZ3cAtKmqAWBJDMNov
         fRB5XkKpQhKFl0D9MTfVyePcnw1ptr6DJzcIRxDKBZrQjOiD98jsn1x4U1AXNyCHMr8K
         F1dWlUO/8i+xu0bWwPqKe1EGbaTIHlmQTGO8uSBoxRf8SfUj/0Vj+uacunpD4eahTglG
         IAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165973; x=1710770773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oEfxD47P17376HaVN5QCqzhMLDLW1AovPI/CpxbhNnI=;
        b=EeKHdpHPfThAbYX8xeS6cpnCXjZ500LBejrOMaBEHB2qQ4hgmjp+stBveYta/lCj7o
         uyoIKQnRvxm867yvWJsCHNaueMAZZ9/cQNlrMjcoXqK7Z2OnRUK7gbMttwBgKQGwD55B
         o5O85LekZOW9axRRY4a/4MSzETMOhAVmEk7rMFcElwQsluwPk3x+kRF5U6+smFVNF2lr
         r8fg5ry6jUU4yXF/33ImONWjsd4/hTJyJI5Pk23vCdpWFVg9ahUGgdQF/YmTbOsC8lfN
         RzV3erWtG/Hm2SXW7mJh0EwCh85ZI7hcwyAj2jGbjFGkcqLzAetiLW2minMcOGrGMMYy
         muBw==
X-Forwarded-Encrypted: i=1; AJvYcCWi0Dq1UM6QDl9e3ONMW+/lz87IftAqyAiaPkszPYHXKkHhuMj7Tlt3n055b5zNZy4w0WdxRd1ySjqj09OQV65G5A29VYThz8veKg==
X-Gm-Message-State: AOJu0YzB+OPywJOFIygmWilUUIJf1TauSmVgfq635rigtOXAtCMzadbA
	RzxHTwoVTcAMCMT4WOXwoUb/SP66Y1QsA6lVox5gQw8uhZDlDWvOXFJCFduxMZ8=
X-Google-Smtp-Source: AGHT+IG/g+fTjxWn4gTCH5rhKjgGvyr7sRc72LxPlTBMSdatMB2C+byQhEO6+eXSpLHPxb527WCirA==
X-Received: by 2002:adf:f1c8:0:b0:33d:f3c4:6002 with SMTP id z8-20020adff1c8000000b0033df3c46002mr4387671wro.1.1710165972907;
        Mon, 11 Mar 2024 07:06:12 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id m18-20020adffa12000000b0033d8ce120f2sm6531216wrr.95.2024.03.11.07.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 07:06:12 -0700 (PDT)
Message-ID: <f6b8d9bc-d95a-4d85-a2bc-820b1206fcaf@linaro.org>
Date: Mon, 11 Mar 2024 14:06:10 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] MIPS: mobileye: eyeq5: add octal flash node to eval
 board DTS
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240308-cdns-qspi-mbly-v1-0-a503856dd205@bootlin.com>
 <20240308-cdns-qspi-mbly-v1-11-a503856dd205@bootlin.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240308-cdns-qspi-mbly-v1-11-a503856dd205@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/8/24 17:18, Théo Lebrun wrote:
> Add SPI-NOR octal flash node to evaluation board devicetree.
> 
> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
> ---
>  arch/mips/boot/dts/mobileye/eyeq5-epm5.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> index 6898b2d8267d..0e5fee7b680c 100644
> --- a/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> +++ b/arch/mips/boot/dts/mobileye/eyeq5-epm5.dts
> @@ -21,3 +21,18 @@ memory@0 {
>  		      <0x8 0x02000000 0x0 0x7E000000>;
>  	};
>  };
> +
> +&ospi {
> +	flash0: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>; /* chip select */
> +
> +		spi-max-frequency = <40000000>;
> +		spi-rx-bus-width = <8>;
> +		cdns,read-delay = <1>;
> +		cdns,tshsl-ns = <400>;
> +		cdns,tsd2d-ns = <400>;
> +		cdns,tchsh-ns = <125>;
> +		cdns,tslch-ns = <50>;

These cdns properties look bad, they bypass SPI NOR entirely. I'd check
if these timings can be determined at SFDP parsing time, then I'd pass
them to the SPI controller.

I see these properties are already accepted in the bindings file for few
years now. Something to improve later on.

