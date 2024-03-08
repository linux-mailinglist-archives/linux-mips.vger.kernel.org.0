Return-Path: <linux-mips+bounces-2211-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3B876966
	for <lists+linux-mips@lfdr.de>; Fri,  8 Mar 2024 18:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78601B22046
	for <lists+linux-mips@lfdr.de>; Fri,  8 Mar 2024 17:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A221F2577B;
	Fri,  8 Mar 2024 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="awlEQleV"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEC828DA5
	for <linux-mips@vger.kernel.org>; Fri,  8 Mar 2024 17:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918032; cv=none; b=THa3gfViZA1fynrlwfuUrXBSDEbf2oHUhxxT54mh/15fhmG0hTEnRnYaug+v1On2IWFMb8dHjzE8KPCDzmfV34zczf3aX3ocwB/uZ/tVxn/YMlM7WCKK8ZBt1h+Nk+ZUUl4XlsiawpfzgG0thQIhMc7T7pAHXBoYj4pYjZh6S0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918032; c=relaxed/simple;
	bh=roMBvLgUN1tKukEBXMcgTKnWog6Eqqm5Kt4rCc4OxnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIFWHBtQtKGWN5IrdJEurO8t+APxTfa37V6UScFotw4zPMCWgj+1/fqvFkFEVldtKsZntveVFXqL4js+mXKBuCPvpTDtKR/KT+6DG0En7MG3zOQneZNOf5WGij8JcPP/uTwqeroEdTQ4jTa0SS4IFFGpXEI/sG4LjSC/Qhpoh6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=awlEQleV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-566e869f631so2826259a12.0
        for <linux-mips@vger.kernel.org>; Fri, 08 Mar 2024 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709918029; x=1710522829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qK1jns3vULEJfy8OFDSsNxpR6piVHIAeHp2yPIJZNeQ=;
        b=awlEQleV8xlRsYsb3ldG91uWFd0eXTlfX0sHyivSqKUxFgFy3poY5Q76yPE7kB7yre
         35d3uksjy4EF+PuVa6UWvij3f2G6Wj6gyBWZOszrqhoXhAXLYh6kwtiRFjHYHV2d50kG
         ZXwEVPo3Gfwp6vwmpEAV8npFHuyDODxzNbuuJMBaTdZhhi3OLJzgodFdy4H9add5n3IY
         e71BKAtOWW17gKoxTnC5Hc9OyKhPKo5A1rx/u7j3nBkhLyepjrn/aEZkYTsLFfdgdGaL
         km9tJUMbA5/Csh/JrogpnbL+REM9bQrE/oP/zK9hkZUPgoUN2WaLY/CfTcqH2HDxUVEv
         9P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709918029; x=1710522829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qK1jns3vULEJfy8OFDSsNxpR6piVHIAeHp2yPIJZNeQ=;
        b=cq/U8hiGc+GUNyJJ3vSH4bzQ6cc8j0cRUFIIDcK1fziIejm2qIucgKOcyTlobhBAPi
         BrSfuykDv0n/oOAGJlkUZGWTklfs1nh11OYH4GqEX0pSK3IXnjaU+BdCwuxuujUFGda8
         y0229h2+dmZ/GCf0/fy2yeZVbYxBz2JjyidA+JOgAj+9OCsvuDG72rI5nxO+kZ2Dk7bi
         HbwumoEGlylBbGi9AteLki6t6sfk2jjL/XWJGtE8L+UB1gS0CJEhJpcs35CdC3X0dbPh
         1qu93k1jzDZyfpmjupPGIt/c5VqaZLiskQPZ1hFT8/5ItjNSHBwPKcidZgu0fkGkfa+w
         DVZg==
X-Forwarded-Encrypted: i=1; AJvYcCXhhPgc3xgVbR19t4yohnpIn+7vjPGjfczVGpUpswUN5qJ6NzmIHrg0yZMRzY1yPVPrw+VuDf2ua0oPIYX7R16qI6TzTaRlcTYh/g==
X-Gm-Message-State: AOJu0YyN5aQ3WQ1AVyFyjtFZoOBzbIqpR9kFx2SXuGAx/nOagya6Nrn9
	sR2f9dwr4quQKNr2C7PKctOBUoxkVcbl3LiHMlery+fIs8gT2Qu81fvqKKo7awE=
X-Google-Smtp-Source: AGHT+IHh+jGBt7zZqrF3tzGe26VHugYZd2UpdNjYXqM3HAwtD74nVS84faIgE5NU8u/wZqzcHLtbuw==
X-Received: by 2002:a50:9505:0:b0:568:1b1b:e221 with SMTP id u5-20020a509505000000b005681b1be221mr2397645eda.25.1709918029169;
        Fri, 08 Mar 2024 09:13:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id c21-20020aa7df15000000b005682dfd9182sm725756edy.61.2024.03.08.09.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 09:13:48 -0800 (PST)
Message-ID: <eec5be72-e27f-4068-ac7a-566605f3256c@linaro.org>
Date: Fri, 8 Mar 2024 18:13:46 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mips: dts: ralink: mt7621: associate uart1_pins
 with serial0
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240308155616.11742-1-justin.swartz@risingedge.co.za>
 <20240308155616.11742-2-justin.swartz@risingedge.co.za>
 <70822db4-d642-4180-9db8-eb0aa5728ef1@arinc9.com>
 <bec06da5c4099898d9e531181d0797ca@risingedge.co.za>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <bec06da5c4099898d9e531181d0797ca@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/03/2024 18:01, Justin Swartz wrote:
> On 2024-03-08 18:14, Arınç ÜNAL wrote:
>> On 08/03/2024 18:56, Justin Swartz wrote:
>>> Add missing pinctrl-name and pinctrl-0 properties to declare
>>> that the uart1_pins group is associated with serial0.
>>>
>>> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>>
>> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Please add the trailers from previous patch versions from now on.
> 
> What do you mean by trailers?

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof


