Return-Path: <linux-mips+bounces-3135-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B135A8BE784
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 17:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DEB61F256FB
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2024 15:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1691161331;
	Tue,  7 May 2024 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gW00Oyc8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940315FD0E
	for <linux-mips@vger.kernel.org>; Tue,  7 May 2024 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715096070; cv=none; b=kB56tmUtwohxef6BA5nYSMiKuUo2jwJr19B0nrIbAD0MvhX+9U9qnum3PBIBCB7I0XQFjyR/gvqoACQt0b6KFuNVZe8Z1109nDJkX96ToD58opBzp5nifPCdPbdZLrj3VHFluVzt9gIWBq1LrTOE9szNtJv9opCKZYWlpN3uMKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715096070; c=relaxed/simple;
	bh=tu+2KsqH6Kw2kSlfjdVYv3BxFYp5x00TFFNEkPzGHcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ITYvM14l/4ufMUh0L+8FSnXENVvh+b7raXz80ozFMMjQQ625mEfAvcoSof+rCa0eCYeEZc91a6x9z9z/DnT6pG6Kz/S9MprbM7BxUpCAqUG8A0C7W629Bj5zKwd1Lc7SDFljIsS7tRZNV48XSIN2Tad1DmKFtvg4TPCCDPNxgWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gW00Oyc8; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51fb14816f6so4112299e87.0
        for <linux-mips@vger.kernel.org>; Tue, 07 May 2024 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715096067; x=1715700867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BHoEecY35FMnmlhyVpSrsI+xWHMu8Vy09k8sd+/BChg=;
        b=gW00Oyc8fLfPJID4YqM9e720ru5kWxlyfA1OnHKru9Y74tCJNW0bi7hzQy0U2ENcbZ
         u8XaWeOgdfrnO72cKVQxcdPtEyAHNldFYd3Ibb3v73tQhEqqdGx9RuYhzUVLqQdw8SR+
         aLrDYqrsLx2znhsjK+xdx5ibbH2sKV7FrGXixPd2RX6S3ela5RKS5hinnj16Z5yefmo0
         LpYKUNhh9F/u8kUhtRbFhQ+6h4h1x8TOHG6Qb4ApUYfmk/LGdA95UcWNoHLdw3yuqMYk
         Ln9c5fQL08E9tGJmONl076FUUVmfyF2pE9dhrSCIeGEEwKXqhPRCSBW62mD2cgMtcmMi
         7XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715096067; x=1715700867;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHoEecY35FMnmlhyVpSrsI+xWHMu8Vy09k8sd+/BChg=;
        b=JcohkU8UHvfKxLArRxITAzbUYxMqfLGtVhh2ocGeOvZwGBllO4f579QlsiFKNSj6ic
         6Yz/UKTmFEoxjWy+9HaKoVOf9bWL9dmOXDl7hj1e/QR5pRJ91+9BNjSBh4ZDbWILe9ae
         qvI4ud+r4M7N/n6chAIeUJE3c4YwHk11qKvjd+GF6Lgiki5EL2j1tyOv21cLuBBa0sYe
         zUtB102UOeD3++7NGhGkleW+PfFzizjGyzHNLsa+W/zSyR1x7Yj4UB0TdygMcWAHtX0+
         hvf3vlyYdfaC4zvczRF3kWiRsIjrE4zZ+TM4aljKx95Svb+JIiqkHRC06FDsKccPgNox
         qapQ==
X-Gm-Message-State: AOJu0Yz1GBaDDGRKVj8Rg2+4xfhvQ4j7VAPQJwImXFDiqvbyDW53j00C
	rbLJ/wOLEJkFLCiEJbluZ+hAxIkQQ+PZ3tgeWwf3Vl+gghyNTuoU0WUDRqAFiRk=
X-Google-Smtp-Source: AGHT+IEhWswRvXH88vuHJvUkIcH5ToHsgKLLHbQdBcNKmFn28UP+tHurJV3VIwnR15xNbDtbkI+YCg==
X-Received: by 2002:a19:ac49:0:b0:51d:97e8:b780 with SMTP id r9-20020a19ac49000000b0051d97e8b780mr8499462lfc.44.1715096067213;
        Tue, 07 May 2024 08:34:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id n4-20020aa7d044000000b005720e083878sm6440132edo.49.2024.05.07.08.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 08:34:26 -0700 (PDT)
Message-ID: <fd0228f2-2f41-4194-b804-7a90ea3a6091@linaro.org>
Date: Tue, 7 May 2024 17:34:24 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: mobileye,eyeq5-clk: drop
 bindings
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240503-mbly-olb-v2-0-95ce5a1e18fe@bootlin.com>
 <20240503-mbly-olb-v2-1-95ce5a1e18fe@bootlin.com>
 <ee278102-f4b8-4ca0-879e-f83cd54efbd0@linaro.org>
 <13ed1865-d702-47b6-b186-d5f060103280@linaro.org>
 <D13I8TFIF77X.2EFWZ14LM2H6N@bootlin.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <D13I8TFIF77X.2EFWZ14LM2H6N@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 17:07, Théo Lebrun wrote:
> Hello,
> 
> On Fri May 3, 2024 at 6:05 PM CEST, Krzysztof Kozlowski wrote:
>> On 03/05/2024 17:57, Krzysztof Kozlowski wrote:
>>> On 03/05/2024 16:20, Théo Lebrun wrote:
>>>> Switch from sub-nodes in system-controller for each functionality to a
>>>> single node representing the entire OLB instance. dt-bindings is
>>>> unnecessary and soc/mobileye/mobileye,eyeq5-olb.yaml will inherit all
>>>> properties.
>>>
>>> Why changing this? You just added these bindings not so long time ago...
>>> This is very confusing to push bindings and then immediately ask to
>>> remove them.
> 
> See this revision as a proposal of something that has been asked
> multiple times in previous reviews. See message from Stephen Boyd on

That's driver, we talk about bindings.

> last revision [0], or discussion with Rob Herring on much earlier
> revision [1].
> 
> Proposal from Stephen Boyd of using auxiliary devices makes sense, that
> could be the future direction of this series. It won't change the
> dt-bindings aspect of it, only the driver implementations.
> 
> [0]: https://lore.kernel.org/lkml/daa732cb31d947c308513b535930c729.sboyd@kernel.org/
> [1]: https://lore.kernel.org/lkml/20240124151405.GA930997-robh@kernel.org/

So after Robs comment above, you still pushed the wrong approach and now
you revert it?

Why v7 was sent ignoring Rob's comments:
https://lore.kernel.org/all/20240221-mbly-clk-v7-3-31d4ce3630c3@bootlin.com/

Best regards,
Krzysztof


