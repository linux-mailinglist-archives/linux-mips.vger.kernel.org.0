Return-Path: <linux-mips+bounces-1514-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D58578A9
	for <lists+linux-mips@lfdr.de>; Fri, 16 Feb 2024 10:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B2E3282AAE
	for <lists+linux-mips@lfdr.de>; Fri, 16 Feb 2024 09:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B846C1C286;
	Fri, 16 Feb 2024 09:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6FTe74K"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6921BDCE
	for <linux-mips@vger.kernel.org>; Fri, 16 Feb 2024 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708075032; cv=none; b=CXXC2iD0hYPEcfPL+z2K0p/OsWCofyQTRKEpAOhTqO1bnLctKwOQP+tWleEnqYj7hJKsbQsdWYyjuhb0X8bnH4JaOnKPCb90pGtukkGbCjOoeD/0wxdDWNVhxQnB+RS4qOR6od3feWuDbDxOrPmmicD+pyP4OCJOK1kNIvSQsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708075032; c=relaxed/simple;
	bh=Iw/Mjp3cgQFeFv6FvDxeUL5ZZJTzEQJTjDgGF96VzhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YLdRUZnOe1YYjsgkpg5jrCtwyWRFhjjrhN81C78a/wk5xJcYYOlaUXQ16GKwISxY2oxzmDM/j43tTVnJOOcixusxnkjFgIF9Ey3AUbZygrVW8aSkiEx+42314Svz5pWnJGDlKQLAyzl7LOaSKQvyDYo6+nAY6CIvEa8DeQ5Cppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6FTe74K; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so2741240a12.2
        for <linux-mips@vger.kernel.org>; Fri, 16 Feb 2024 01:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708075028; x=1708679828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oIAGCtsHSU2vaGBc5nOfaSyTj9r1XMAdthhQbXQ4a4k=;
        b=b6FTe74KX+0WaI0oA91SHOVaNVgCWZHH23GC4Ade5cE7NKrcYKmGzIoU17z0TBBgJ3
         VaTkT57LPx8sAonrxgBHGPp3qwr2lhe9SMujWsvZnZsaoXyhmkOGNNQilUQBohzWzYH5
         pYp9tf9u+yUuHfztOS3mtzJyg4OVnSB8R1mT0Jc6qT7zOCzZLlxuIBYZb+miySEyMiCs
         8IJE/gnClCqgneMPxQKfd07HkIHDOFGTJTtizL2SuxNyLSpxe4Dpqjk8L9Ae4Neta3l8
         Sdf7jmmII15ZZBjTfkpUSGFUISLcfvfYQ+iuGDZTlPiAfUIhOS3+Et9biXNSSJNT3DgF
         8MDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708075028; x=1708679828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIAGCtsHSU2vaGBc5nOfaSyTj9r1XMAdthhQbXQ4a4k=;
        b=F9TXRjUKskwt0e53kCPF35XacvrxKYHVa5dTYgj/W8HLXucHN8uocKzzTm4ICyKpp9
         n9hdCWVXesaO8IClRM+uhJfyPuilYM3HO7HPe7X4p3X0VlWOLDxbxrg+5lhDTnL4ny8p
         YKvXpYteUsfrcgsrnguPP3TsaF2h92bsZqzs8rd8WVfWvMevQc6nOtMwvUunzNwq4yGI
         bnWWUKIVRp3NuG7iTJg8ecbwv+VxeVZ0KR/4f7xZX17Rx1a0baoiZK/SjP7Jsy7w0PaP
         ldIfOxJYXlM9FmyIlPpQPkNE+w2enz85vNTCa9/AKyWxNGzlC5h1/CcyMC4nU7D3MReH
         +RxA==
X-Forwarded-Encrypted: i=1; AJvYcCUMydZuopW07DSy2cqlCpA61L6G7LKg0mGRrsatu3cwej/HL1CYji7b5AHsyamUG02iTD8ftbl9/n9v0tcQThiKrvJCaeYn27FmPQ==
X-Gm-Message-State: AOJu0YwXg6Vb5iuMzK4utBtmf1su85p9pKygtZFqgnBKkNq+sb6BL2DY
	+kDGhGRzZnmKGk879yx/DTn62lOUc6u9hTcLjXXiWzupbhS7IECaqfCqam6wzFU=
X-Google-Smtp-Source: AGHT+IGyZO9/H88K7zq3+enqrfVfVYfcgWM7ymRAaGwQ7TcaErbfdXNBtPll+xd7MvBG1McF48Bq+w==
X-Received: by 2002:a17:906:fa18:b0:a3d:1340:7399 with SMTP id lo24-20020a170906fa1800b00a3d13407399mr2931848ejb.71.1708075027904;
        Fri, 16 Feb 2024 01:17:07 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id s15-20020a17090699cf00b00a3bd8a34b1bsm1372932ejn.164.2024.02.16.01.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 01:17:07 -0800 (PST)
Message-ID: <c478bb6f-49b8-4251-99e9-46b4c9510953@linaro.org>
Date: Fri, 16 Feb 2024 10:17:05 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] MIPS: mobileye: eyeq5: add resets to I2C
 controllers
Content-Language: en-US
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Gregory Clement <gregory.clement@bootlin.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240215-mbly-i2c-v1-0-19a336e91dca@bootlin.com>
 <20240215-mbly-i2c-v1-13-19a336e91dca@bootlin.com>
 <42b7e3bb-a152-4ded-91f3-fb8043a7f413@linaro.org>
 <CZ6DTGBC02P7.1RHCB4E64N88A@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CZ6DTGBC02P7.1RHCB4E64N88A@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/02/2024 10:05, Théo Lebrun wrote:
> Hello,
> 
> On Fri Feb 16, 2024 at 8:59 AM CET, Krzysztof Kozlowski wrote:
>> On 15/02/2024 17:52, Théo Lebrun wrote:
>>> Add resets properties to each I2C controller. This depends on the
>>> reset-eyeq5 platform reset controller driver.
>>>
>>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>>> ---
>>
>> This should be squashed with previous patch adding i2c controllers.
>> Don't add incomplete nodes just to fix them in next patch.
> 
> The goal was to isolate reset phandles to a single patch. The series

That was what you did, not the goal. If that's the goal, then it is
clearly wrong.

> with this patch dropped works because resets in their default state are
> deasserted, so this isn't a fix. And it allows testing the series on
> hardware with only the base platform series, which I found useful.

Series or half-of-series? Anyway, commits must be logical chunks, so one
chunk is to add I2C controllers, not "part of I2C controllers". DTS is
also independent of drivers (and it will go via different trees!), so
whatever dependency you think of, it does not exist.

Best regards,
Krzysztof


