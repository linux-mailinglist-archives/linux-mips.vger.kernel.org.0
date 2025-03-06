Return-Path: <linux-mips+bounces-8108-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A14A53EC2
	for <lists+linux-mips@lfdr.de>; Thu,  6 Mar 2025 01:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89FCB1697E6
	for <lists+linux-mips@lfdr.de>; Thu,  6 Mar 2025 00:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2835728E3F;
	Thu,  6 Mar 2025 00:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKCk3ueQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC821345;
	Thu,  6 Mar 2025 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219255; cv=none; b=PKfnCrYmVRGkI8qfKZ7aFhUj26/JlQVfJhPIEazP+wdPwmVulm9eb5pWgo3GU1ioJeUBddjW3xNp8A2Yu6cNKG71MMoGtMFZdzlj+NkuM8Q0PEmz0TOguzLWNBzIQ96UPTSivPzO0ysOE1T5jzjOScS3CS0GGKiluW4t1/Vnl6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219255; c=relaxed/simple;
	bh=9SMTplvOW8Y0aUq+MUzef7Y+O7HPYhrDmJ57NxbBB/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRLcjru8q0S6xObwU+5KNxkiJl4khN47hx4JwMiAHDHdfGTm8FRkZ0R6BclCYDb5uNMjZcvQH6o0uqNbaGQ8KWyA75VuQIaN58ZX5RxjfBaoF/iPz7Ci3JHsREd8e5nKXsas94lQVo1+pqsDEsh3QJa0mzkNx+taW9waoj4TV9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKCk3ueQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2feb867849fso154175a91.3;
        Wed, 05 Mar 2025 16:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219253; x=1741824053; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=;
        b=BKCk3ueQzBHKjwPUDyuBv/n4shFLfjpku9YUmWd5dig5RjL+/UWRmAyW7K+CmDGUK/
         WtO8WFu99HiCONPg7l6eK/DgFymxnwr3PcJI6ch9L+WMAk1RaYJcwjE86cBenlBlqTl/
         HvF9XoPpH+fR3EQD8Ndz/XNgOWdNSNICgy5cSJzur3Jq8g9Th7yT+soXR5+1d90qZWIg
         cwOhUbiPwyr4CBadosm6U45N8Q5BCT6sZ/uKVl+24cmE1Zn3qyhldmd1wW9R0zosGLNQ
         pOyALmSoEChF8nnd4I16z/6ET10J1c05wefyQfMGm5Aes7Kjp77Ep8yWLAI2c2iPTLUi
         /tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219253; x=1741824053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=;
        b=DAK8Pf3xX6OpJ4NyIPYFubdY3XBfaLMyFL3OMrrEny/3H5WJpJ6u/Nqc8Cczb+YBwJ
         IsF7H3WKAp/TR4BMUCoBWrFJorqKNEzzDWnZfp6+uC9DfsEGP3SNr7Ad4kNowIEbnL/C
         h52raQw3sWdBMjF6vezW6Gubz5Bk5a/U8KZidazs11woDzrgYgbNZuybQU7tsIzAt6E3
         EBelrSFBgNB1mAN/f12Snb6mkSC53YbtxpMxeH3jDaEXaVwOIiN0QtOGTseEkqhAiIY+
         iRsmXaoBfAH7WdgJekRgNdqKO8QGdIwk6mwWXfuDTy/FigvDM4KtqpXJQKUKNGj2gIbh
         SrkA==
X-Forwarded-Encrypted: i=1; AJvYcCVu5IQRkA9VenGcjO9Sg97g38kM9bTun/CBPseE/ZPb/UqhU3OvTz9GXKNoKV/Pu7ZB5+RLkjkAZS8afw==@vger.kernel.org, AJvYcCWLAq1X1T4m3fcoyU3EdwnXjrkVZd4Bb8lJddFlAq9oYuHNxjXpJSfrOBvidsWEeImvD7KYshgkKeaHQ+Q=@vger.kernel.org, AJvYcCWonvo6h/44xRFQtg0QtHsJldvJVdJ/rSv18Tb4h/WAAWgrHlE7MvbEf0yNH7nenxlheGl9N1uYYd4S8qU+VH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj5izAAorYymMnZyHw//FsJjBVEB3Ml+8OYa7jcdOJ1WUjADYW
	zhgE++jWCA5kK9lViDa/fxFJauIGxAPOquCvhV8cdj3sP2GQ4jR9
X-Gm-Gg: ASbGncuXRtKigMp7Z1QGpZdAEFb//69GBmoCDXqHtmRvl457GfzSYwfAqaqx2aF4ggO
	sZTpD3bqMbpWyZ9Ompx9ViqnR/ynhcWGscE2dQUwIqVNUT3iV933O8ZnRAmuHEli5afbiq2M/jP
	BBKB34//6KDlC08tPnzmQeIFok7PH4TUcUQIafEVOP+7ZCLJSYSpyrlunIjp4gjyyi5cR5g7bwp
	Ma3U/IZoLBS6GndyLg1/7fui1S9LZAnHN5SUSWbe2zx0Ecsoa8nFFJbmqJWREIPyIKUrpFYCi9B
	zvZfM7hP47f3g80tzqRqNXXPyZPcxiWl0oRrZ4SzwipC2r5lvupr2s5p251MR/MmRdFJvRjVP6A
	3fHf2K0oY7kDtTyP/9g==
X-Google-Smtp-Source: AGHT+IG0o6NZDwL/ouuTSHVqdZU+QbHNr6bhBHpEI+HHBxP5E469uK+cbJOr5aaDszmuflfUD3yKfQ==
X-Received: by 2002:a17:90b:2750:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2ff4972ad4amr8472496a91.11.1741219252909;
        Wed, 05 Mar 2025 16:00:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff6935335asm30567a91.13.2025.03.05.16.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 16:00:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5ca55233-b370-4176-9632-8e5df8d4c4ce@roeck-us.net>
Date: Wed, 5 Mar 2025 16:00:48 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drivers: watchdog: Add support for panic notifier
 callback
To: Andy Shevchenko <andy@kernel.org>,
 George Cherian <george.cherian@marvell.com>
Cc: wim@linux-watchdog.org, jwerner@chromium.org, evanbenn@chromium.org,
 kabel@kernel.org, krzk@kernel.org, mazziesaccount@gmail.com,
 thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org,
 support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, paul@crapouillou.net,
 alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp,
 romain.perier@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org,
 linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-3-george.cherian@marvell.com>
 <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/25 02:33, Andy Shevchenko wrote:
> On Wed, Mar 05, 2025 at 10:10:25AM +0000, George Cherian wrote:
>> Watchdog is not turned off in kernel panic situation.
>> In certain systems this might prevent the successful loading
>> of kdump kernel. The kdump kernel might hit a watchdog reset
>> while it is booting.
>>
>> To avoid such scenarios add a panic notifier call back function
>> which can stop the watchdog. This provision can be enabled by
>> passing watchdog.stop_on_panic=1 via kernel command-line parameter.
> 
> ...
> 
> First of all, do we really need a new module parameter for that? Why can't it
> be done automatically if kdump is expected?
> 

Sounds like a good idea to me.

Guenter


