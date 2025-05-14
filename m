Return-Path: <linux-mips+bounces-9009-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C06AB6D4C
	for <lists+linux-mips@lfdr.de>; Wed, 14 May 2025 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98BDC17F5E6
	for <lists+linux-mips@lfdr.de>; Wed, 14 May 2025 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDA6279788;
	Wed, 14 May 2025 13:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VaW0tDVl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490CB27A465
	for <linux-mips@vger.kernel.org>; Wed, 14 May 2025 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230725; cv=none; b=jaPAhyV869iPrnl3kPIuTxGFhkfJh6JdJNXgzh1HqoKU/6yre1Dc3MK4LiD9DA4fts7EYeknnSalF2jLTrBfGDGkhLBOCe5k0ZXlJQb3ciAck1YVI9pTB0bNkZJ9XDRoGMW8KXcUQ58JbE3mfILwxnsdeNqmAK5rmDN2oAKrUnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230725; c=relaxed/simple;
	bh=yAktS0IcTttm+5igPEE95jdF3S5CsNJvlNvqBV1C72Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+Z1Lp7TBbnJXhReV9Gf7OHvutLCb8mNNFBO6WjRHblvGXMreZZ9RsuA/1YyOlffAjzhczOyn0O+HgGnmZdv3Zud/o8bSlMGks0flSoAx9yLTRCCc+e3QRUECUTIUyLx2IWhGcyvp08IPanMII7N9eLqvciVNQjMptIrZyF06HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VaW0tDVl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7224305e9.1
        for <linux-mips@vger.kernel.org>; Wed, 14 May 2025 06:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747230721; x=1747835521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pzH7d+l+7UapIjPhhBZ1DFv41GO7ARQVP3TgvTdkaus=;
        b=VaW0tDVlP2msl6IIsUXEtC8x98BfNSvU3VSAzkOw60lY9q0y65L7QadJqVMUUS9PeL
         tvXyRLgygl21IwiN2uBrRA1RWDG8YWRpnUQNV1CtFr5302IkFjUhzoFKqK+IIaVK3203
         DueEoMRm0XK060JhlGh5XZbYAWlUqo5t2JXaDR7+CCUsBkaN61nQBr693Mw1pltkSXK1
         K+rXvpyIMKlSUk7N1vz2Dc/jBl9jkqTDyxi/X+py/dT8AAamunczXDDuAEr0nac4ZA7K
         GL+bsp4e4rmTsnZoLN4pnCdQa7m3eWkrJZvlxEJpq3UdjFeQ7xYw/r/miWsKCs2ckMkq
         wEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230721; x=1747835521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pzH7d+l+7UapIjPhhBZ1DFv41GO7ARQVP3TgvTdkaus=;
        b=uh03s92Pb4Z2sAT+1gDEH1/luwoLsCxe9DOKGtVob7cFup75HzNAv2y2Nao4TBhPvw
         gkPX/qvLRCKYXUdpIqQpaKI0Lu5ojFZY1Ak7Zf1LRJsNMX9Kqf74aHZXzMgMTYDfAWlg
         Ih+uFRcG4/3sucxhsiFQpuR24/95WxN/swLjRB5S9AiqssZ7bhDPgJih9G9y9z6/j+eb
         iXSrRYJzZpdevbzKRJt90+j/JbYSIshrihLaqBStijWFrjR4rQ5Txgk+EkDB0ZeZkR6L
         QWErzg6DMec/Bc0wDbpZBWeYdQ5AMx87WcgalLCodcSW8mkNsvGDMV5vckddyfqASJOi
         nPrA==
X-Forwarded-Encrypted: i=1; AJvYcCXLAsbuXlSd645j0UNbASMtZphI+H+U0apIhJeOay3feX2iOPT89Nv6xApOaA3jnYVtzLfKTuDl63QK@vger.kernel.org
X-Gm-Message-State: AOJu0YzfVEpPEYHMmDJW5m+8DW33gmxGnrsAP47aeikLMRshUb1PdOp9
	YTZwV3pKCtJwWEnP4rMox5V3kVIsSr/5SVmn1S0OYRDRHq7dXz6H2/F7ywRNad8=
X-Gm-Gg: ASbGncvC5uzbfJf8S4QjxHz4PdzwHqyDZ2e3YG9xi7wuLOlnc7YFwhbfQI3HW8kDzrk
	W5mfRKiNFDrqIWKS21Ky1VQBDTXMHp85EPe7y08mlOW2fpxjA9OXOMqIcwq7bzP2o8lgszqzhTz
	JOMkNRUVo8RP92XwRop6nXfFBE2OP4EMo7jeDSxEW2/OEzZvLMeoZy1GOKY60KFfix5LrQd5Pp0
	D/CY+w35QmNAZgsjmAzv0l7QcJE8szHj/oBPfp7+cMW1ZoMEDU+vdXqg1omWexnt6eduGA44r7g
	XIVcRq96eqrUeU5AnxRsSoCY2eSvLHd40Rxrt0CV0LZIa8Oi7ygheZOyTOfIhdzT6AhJ08EcXqZ
	ATKf66J7T6DvJ
X-Google-Smtp-Source: AGHT+IFj9i5QTyKcpRv7+tejxsKkLmxlMRzgDUG9rJki22dIq9ouqJs9twLL4571+qHl8gfmhK4eAA==
X-Received: by 2002:a05:600c:8707:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-442f1a42318mr38467255e9.8.1747230721455;
        Wed, 14 May 2025 06:52:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f397b6fbsm31591395e9.39.2025.05.14.06.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 06:52:00 -0700 (PDT)
Message-ID: <b4c704d9-c94e-4e89-b3ed-f715bef4e379@linaro.org>
Date: Wed, 14 May 2025 15:51:58 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org,
 tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.larsson@genexis.eu,
 linux-mediatek@lists.infradead.org
References: <20250507134500.390547-1-cjd@cjdns.fr>
 <aCNWM5Xq7wnHVCrc@mai.linaro.org> <aCNhVw7oMRhHQNq_@alpha.franken.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aCNhVw7oMRhHQNq_@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/13/25 17:12, Thomas Bogendoerfer wrote:
> On Tue, May 13, 2025 at 04:24:51PM +0200, Daniel Lezcano wrote:
>> On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
>>> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
>>> processors. They are found in xDSL and xPON modems, and contain PCM
>>> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
>>>
>>> The EcoNet MIPS SoCs are divided broadly into two families, the
>>> EN751221 family based on the 34Kc, and the EN751627 family based on
>>> the 1004Kc. Individual SoCs within a family are very similar, only
>>> with different peripherals.
>>>
>>> This patchset adds basic "boots to a console" support for the EN751221
>>> family and adds SmartFiber XP8421-B, a low cost commercially available
>>> board that is useful for testing and development.
>>>
>>> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
>>> peripherals, and for historical reasons Airoha chips are sometimes
>>> referred to with the EN75xx prefix. However this is a different
>>> platform because Airoha chips are ARM based.
>>>
>>> This patchset is against mips-next.
>>>
>>> v4 -> v5
>>> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>>>    * Improve explanation of HPT timer in changelog
>>>    * Move pr_info to pr_debug per recommendation
>>>    * Remove pointless debug on spurious interrupt
>>>    * Small code-style change
>>
>> Shall I pick the clocksource + bindings changes through my tree ?
> 
> please do, I'll take the remaining patches.


Applied patch 1 et 2, thanks!


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

