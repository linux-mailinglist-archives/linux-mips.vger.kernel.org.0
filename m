Return-Path: <linux-mips+bounces-1541-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7974858E10
	for <lists+linux-mips@lfdr.de>; Sat, 17 Feb 2024 09:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D98CB215B6
	for <lists+linux-mips@lfdr.de>; Sat, 17 Feb 2024 08:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0CB1CF8D;
	Sat, 17 Feb 2024 08:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OwcZuJDQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8181CD26
	for <linux-mips@vger.kernel.org>; Sat, 17 Feb 2024 08:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708158307; cv=none; b=SzaISUwQMv0GPMAgeVVFMWXrTDBQzs/wZ8uVOnwEbnARsNGTIkld05RxkliB/MkVasX6DOtrAcx+ELaEaAkFiR6FUnF3aLP6+cZM2Kg7kt0puBNzQO0hpMm++PojQHcFNUQLTjlvS65k3HUfv8Fz++96hGO3bV+55fKTmQM63yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708158307; c=relaxed/simple;
	bh=dfowKm22jL1oDacE72uZKauixuviw2LROG8o2jxLwgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2xu8Aoq0us9fBh+I2ii4Gg+NCKUjWPearAmlXuxeMiUAoZs/QinQeIZ18humzS1ATzME+NTqwJX6uSMx9vPpGhN+bpqWkj1Bl7r4DilRNxjju6xkw/val19bSsqdSJY/4XCKC88uUouUmMPa9ySvglcSpq+mMIcdsFSAVzYPqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OwcZuJDQ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-564372fb762so42174a12.0
        for <linux-mips@vger.kernel.org>; Sat, 17 Feb 2024 00:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708158304; x=1708763104; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9bypr4+I03LVLPYMzCWUReiagB0AomTZPG6880A9org=;
        b=OwcZuJDQrRBRoFEXzI3fEUYIgE724767RD/ihd32slyxiAjkHvzjqFmhQaW0AFMsYr
         rNpTeZC/faNK5tweKrKVY/uod8A7zpnGOUPbJRKiFj9X9WThuq+V3NRU8XcbtK4rdCY+
         mKZ/lSyKJ4ODQP6qd+g4l+LTXOWE9p45EacDHnox1iTE3rcMS5sef0llOGX4wwizn6Nw
         M+lvH+o6ft7OuPIiE1wonOLm+nKbFnL1UqP2a+HcokEurJV5EIl3cJzFQBH6vph4aQjG
         re9Vgi7fJpZa7EdKs/+r7JH9+uZ5bYT6DRTz5Qw8Q/cP7QtaSCcN8gy+0VqH2U3gqTaV
         WRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708158304; x=1708763104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9bypr4+I03LVLPYMzCWUReiagB0AomTZPG6880A9org=;
        b=VvqmxGUFCvAJJqbuaI7MpbVE4T7cbQJGcgV/KD+WjD3AVT3TXUZ/Y9FjSw1IwWRQup
         w5Zfyhebl0NAQFR2LML4Ebun9HVxO0hVE4jZo5wXj6CKHu+j70ZmXxV7VtTxYR/D5+Lo
         HL5VYeh++NQyKeynJV3iOlUGf4zzGUNntZ7x/yml0YASbChQjEfAOEklAe0kYFqs5BI4
         SzZHKbhjkcGgiD9jSO/Hfgt8Hol6yzUhoPaf2n4+n6uYgPZYYrj6fkjzl0QeSlHX3PPc
         Ph3UU8berDJtSFqdGvY9uMVDk9a4s9GrrJM1MN+6UHT2FE05gRP19j/BFNlf7lezm2f/
         cfBA==
X-Forwarded-Encrypted: i=1; AJvYcCWoJF9K+8c7t/PQ+2XWyDRCc/GyBo2DX2we0WVIJ92CI5mFqRmOisFXg8w6UBNnuqTAK34hhkppTutNub4sw1TLD2c++iVsdd69gg==
X-Gm-Message-State: AOJu0YxFOaz7iVUL5Yt3hYc3Hbh7UHtd8ejh65M0m4nD4/Cph03++f9T
	AdOxHcv/qP3CIK+r7/mGOPq9Qf6NQ8QvPbPcYUlHOd0zxlx+67VkC4AeWeKPioA=
X-Google-Smtp-Source: AGHT+IHDs36KqKnn4yFS3zjSh745G56nuB+z1H36+nmojixyor2w67IIUDOFLwO1BC6de1o+hF6JNg==
X-Received: by 2002:a17:906:8412:b0:a36:c353:952e with SMTP id n18-20020a170906841200b00a36c353952emr4669911ejx.41.1708158304024;
        Sat, 17 Feb 2024 00:25:04 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id cu3-20020a170906ba8300b00a3d014fa12esm763079ejd.196.2024.02.17.00.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 00:25:03 -0800 (PST)
Message-ID: <cf360cbf-7414-4024-8bdd-d2aba7f048b3@linaro.org>
Date: Sat, 17 Feb 2024 09:25:01 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] dt-bindings: i2c: nomadik: add mobileye,eyeq5-i2c
 bindings and example
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-2-19a336e91dca@bootlin.com>
 <20240216022227.GA850600-robh@kernel.org>
 <CZ6FD7EHIJDT.32IEDVT9FG2GP@bootlin.com>
 <6effca50-29a4-43b9-86eb-310bd4e08e5c@linaro.org>
 <CZ6FUECKEX2B.36QWZZA5EYPI@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CZ6FUECKEX2B.36QWZZA5EYPI@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/02/2024 11:40, Théo Lebrun wrote:
> Hello,
> 
> On Fri Feb 16, 2024 at 11:33 AM CET, Krzysztof Kozlowski wrote:
>> On 16/02/2024 11:18, Théo Lebrun wrote:
>>>
>>>>> +        mobileye,id:
>>>>> +          $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +          description: Platform-wide controller ID (integer starting from zero).
>>>>
>>>> instance indexes are a NAK. You can use i2cN aliases if you must.
>>>>
>>>> Why do you need it? To access OLB? If so, add cell args to the OLB 
>>>> phandle instead.
>>>
>>> Why we do what we do: I2C controller must write a 2 bit value depending
>>> on the bus speed. All I2C controllers write into the same register.
>>
>> Which register?  Your devices do not share IO address space.
> 
> mobileye,olb is a prop with a phandle to a syscon. That syscon contains
> the register we are interested in.

So exactly what Rob said... I don't understand why you have chosen to go
with alias.


Best regards,
Krzysztof


