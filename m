Return-Path: <linux-mips+bounces-8107-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0549A53EB9
	for <lists+linux-mips@lfdr.de>; Thu,  6 Mar 2025 00:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33DC23ADA24
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 23:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D31207A3A;
	Wed,  5 Mar 2025 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIwYqsjC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624FE207A2A;
	Wed,  5 Mar 2025 23:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219127; cv=none; b=hIfmymQ6aCPnwG7x0C6ITZJ4z1GbU8PXns91Tvkxf0Wru7arWBqiRL8IxCPlIzzcqEZAc9qwpsdRBrnlpb2K/TJ+8eqWuC7QsbhSGw3tJlptKm9Nyz4vGYS0wi208Znh/D2KEhLXhMACCA0S7+pa4AVv04A+rPXq/+KfNruv6P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219127; c=relaxed/simple;
	bh=1LihH3Y5rB1CuOJs6aDXxOP33wzjt1mHrT/odXvquow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBVKNj1U7eisLWR6jiGJTz6TDKPsw010HnYieehJvNyJgDUrNxMQeuuPkyUSfY39B6OpOIWi3fDb+2/uABYt3J//1mZbAvSvok9KSOXDNjmVrmPhhcixHXa+As1uD7mQ0hs+XSou+gAVbIuk+GtXf6kJRTOyKY4A49d9yU1bgsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIwYqsjC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2234daaf269so608865ad.3;
        Wed, 05 Mar 2025 15:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219125; x=1741823925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2C3t9OHZV16KbvS+eOTMIJqI95FVIw2G7lcCbFYFJZs=;
        b=mIwYqsjCrqud1SBEsT/ddG2vgqvqHoMc2gV3qVIxJvmQLdeiL1GN6LUVxPefl3jmJY
         I8xVyQvBBJJK1ziIOdWJD4T+y8rCR1MuGr3izs1bpfDQWrC7yohNkPfpwUm6v1t83BrQ
         sV8WCX/rFHtq2RcH7XqtgyYhatNl0d3paS63LBcuFnP3y9v02Yx2ZS7zHzAJn6ch8uaF
         j8eqf9RCVKW3eGqF6z8FBanOCJbFbyZwqF7P5Ix/17HGymnHKqsnYffVFL7TzX9nDuBr
         EtpsfGKoLkaZQ00n6c5sOKDxrDykaiZ8r+u2B1H4bxRTQUz0DHHBhpnTgy7yKqaT1Z9Z
         elag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219125; x=1741823925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2C3t9OHZV16KbvS+eOTMIJqI95FVIw2G7lcCbFYFJZs=;
        b=UlmXipFTms54a/lr6F3VidIN7ZEpm+QEvl8GhhETOH3rXyKEcrA7IST+iQsZAk/aSY
         bFrfIQz8ZUesh7h5okUOQkGW3p6/WcHnsLbtJhCUChHYREX/4oDXk3euw6mJz2XSZZ0C
         jiqrjSuYVp1Y4QRNwhSWapWb/OnGe8VBFhTCtn+KRTh8ymNYSkhyCfLnDnvFUzcZxKc6
         3evG0rGu974dmntmccZRvoc0VbadznMHt7Vtx+85Rju9tn++eZ06I/3z2LCuPCpZUdOo
         hlqKRlMk0kDaQETjBGG4Mwya/LkTdt2rPGl9D5tfP1QmNIJXB9/2SgEXGuZnyuBLsUK6
         EWvA==
X-Forwarded-Encrypted: i=1; AJvYcCULuxKd5vzu+SHUZwZfKDauGfDsmzP1oD0OeksOWWogc3gVKtbjM0hbN26uY0hWXU+WGm+613xkFLlFWL0=@vger.kernel.org, AJvYcCV0nj0HXX4SQccC8xBOyJder+N+NfFwGQBAl13Bdxfm8Bz31TaQzrOKQXRmZojWzUW4OxrBnumfrpEZ1YX5C9o=@vger.kernel.org, AJvYcCVaK3x2CAZB8bm7jFygPwMy4XTJqApXNjJ62o2BG8ahXjYnTgeaGtILZe/DFz51lbR1QYu1NBquEQIbvg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/qbp4uG89pTqjl+uaSdk7onOeX0VP3ITfwT1wBPyov/vacze
	EPoEJPXrUenORdgrdpB6sjlmDSNSWpbUkCSxeLG1D59jElO5Ob/T
X-Gm-Gg: ASbGncvyw6TELxfQtQNkgA9mbUJq0kFa9PctMwz0lTbyWR/QK5KM0fECgTLknbvV8P0
	u5D0KHRc3BaU+ar6E9FqIBmSxjMEbX5jX2nsfgpsvfwNwazRDHsi9TENa9JWbg0Uq5RbJlJ3+03
	wvZHD2XUMoeEIyEBjO/9p9sOrfjofbC5LDi3M/huPPxci9mLYgiiiWhxUPIwrg1uN7JKFrJHrEf
	7Yrga0jXl4/Ahl14nS6OKZmOlAtOSfjzsjb+ZCPbo9Np+q4xzFeEJr0oJRU0Adihz5GxzAu218x
	ka6PfwazOrGrZUSW1IDgEw4+tPwJMtBL/poBBt8g69GyUeVMqKvbxdCS9fmjoNQ8l7Swiwa/nSA
	sW4SuPwZPjMFaXs7jKw==
X-Google-Smtp-Source: AGHT+IFfm7H7nJs7aTJzjddZ42tdexmQKPWdcSPX9vN1nE9dL8KTlJ94ovJcHC3Iz8/npiXYs/Z0Pg==
X-Received: by 2002:a05:6a00:2d8a:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-73682b85400mr7181751b3a.9.1741219125493;
        Wed, 05 Mar 2025 15:58:45 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736984f8666sm20220b3a.113.2025.03.05.15.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 15:58:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <28a711e5-b2cb-4d5f-bb78-259a01cd4bcc@roeck-us.net>
Date: Wed, 5 Mar 2025 15:58:40 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 George Cherian <gcherian@marvell.com>
Cc: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "jwerner@chromium.org" <jwerner@chromium.org>,
 "evanbenn@chromium.org" <evanbenn@chromium.org>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
 "lma@chromium.org" <lma@chromium.org>,
 "bleung@chromium.org" <bleung@chromium.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "andy@kernel.org"
 <andy@kernel.org>, "paul@crapouillou.net" <paul@crapouillou.net>,
 "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>,
 "andreas.werner@men.de" <andreas.werner@men.de>,
 "daniel@thingy.jp" <daniel@thingy.jp>,
 "romain.perier@gmail.com" <romain.perier@gmail.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "yuenn@google.com" <yuenn@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "naveen@kernel.org" <naveen@kernel.org>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>,
 "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/25 03:01, Ahmad Fatoum wrote:
> Hi George,
> Hi Guenter,
> 
> On 05.03.25 11:34, George Cherian wrote:
>>> why is armada_37xx_wdt also here?
>>> The stop function in that driver may not sleep.
>> Marek,
>>
>> Thanks for reviewing.
>> Since the stop function has a regmap_write(), I thought it might sleep.
>> Now that you pointed it out, I assume that it is an MMIO based regmap being used for armada.
>> I will update the same in the next version
> 
> Failure to add WDIOF_STOP_MAYSLEEP when it's needed can lead to
> kernel hanging. Failure to add an alternative WDIOF_STOP_ATOMIC
> would lead to the kernel option being a no-op.
> 
> I think a no-op stop_on_panic (or reset_on_panic) is a saner default.
> 

Agreed. Also, I like WDIOF_STOP_ATOMIC more than the WDIOF_STOP_NOSLEEP
I had suggested in my other response.

Thanks,
Guenter


