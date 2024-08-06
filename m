Return-Path: <linux-mips+bounces-4767-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB88949431
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 17:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70FB81F26A34
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 15:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1754F1EA0C4;
	Tue,  6 Aug 2024 15:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9CL8tbD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FED1D6DDB;
	Tue,  6 Aug 2024 15:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722956813; cv=none; b=Vde/v2ThdHZiwLZxqcOqM+rokjgfT9slkrFCRJpslnJotZdIac+Ve6nGCaK1RrErYX6OXeHe/zy/t96dNZogPLHxjldqsWxCaro2x9BTreRfvMs6qhvLDtJ6OcY5s3f8miVkMvZn0Cy8xuzUZRGloibbiN1L596SEKdt42mt+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722956813; c=relaxed/simple;
	bh=JlMO4F3cSR8KssXl8sgOq1OXS7xAKJj6mVCZp5Uz4Ec=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LfCpewmT300t2gXoIwznNa6eiVpx/5O/etOVU7kGLhMm+di+UmrhWgBeAchN9ojkYnG2pyxN53Z4sD8Y+sRbkcgr7ExKT75cwzcrxtb5GGcj01oLtcmovjh9Fv5qiADDm6Cn8NFHpova4D+pqGhB8WTgUwmfia3WnYyVPaCxXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9CL8tbD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fc4fccdd78so5668915ad.2;
        Tue, 06 Aug 2024 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722956812; x=1723561612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OrDsz0XE0x5bR55QR2nM7yv4fZk6jVk6rHKzH1A8O2E=;
        b=H9CL8tbDrMXu98CmW0tU712ct/BuMtG+KWs6r565YGqw9kkByxmeDh5pgTOMFY1bcA
         h9rEEkGkqTyuTt/0SvhL6WAVPkVKi8GoMMcLQZApRSscX/1ISw7Z6593GhxUjPDZzF1k
         fGC1EdZfirHCbk8ReSoraWnwaPwgQpgDBIftbaYT1efrTzhHFVwplSIQinTRSXltgemp
         fwaNdaCHZ26EtniI3Si0WmnPJX02OIth5S1LCWejhuKAOBXFsUd00HkDaUKUfPNmt9nf
         9HxXvnxLjSa4doQOghHJVmC3I/kI8zv4HcXc4eSWxdfCqUMTxzuFVtPK8JYAMS7SACfG
         TRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722956812; x=1723561612;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OrDsz0XE0x5bR55QR2nM7yv4fZk6jVk6rHKzH1A8O2E=;
        b=LkXx/IASZbraOHoJh5ywNkVg7Vf3dS83Y5zyCBRgByUF7jr/HnyWx38F9U748wVKPv
         bXqQSjUgwY980QD6oGR57svcPfAg9Hi60oWJKaWbFbE971VdJlI3KoudiS2QCNXf5bsC
         gQ8odYS1yFT/KHG664xkilfEOCquqER6ak3t6EY9MOTa8pNXSEz6Gq0719dwY8IedWPJ
         hblG96npb7983pYV8c+xUXU+SFiEfkdWKvHKdNFVnJy/oJrVjhhLu554cXZfgosFZmM6
         mNNVOxe/VuJh26g9EMJ/R3n57YZkjRLL4A2imU/riGuEpAFnwfhlV7Jr8AZBiMC/ByL4
         2wlg==
X-Forwarded-Encrypted: i=1; AJvYcCUidH2bphKPhT8io7437Xy+3vZci582cWveAenvzIPzW9L2IBdutbVpavQAErneQ5pa68i8S3W6U06fdfWSNZ7B5+UYHDvPzDCE3Ew45o5F1jjPSFgL83XOF4nC+OYjqU103Vn5FQ1Cpg==
X-Gm-Message-State: AOJu0YwXrPTTSukrSkaspR06sel9XmRhDE//y8yHgWnCWl1wI8hC/XZG
	uDEZKAYWaWojMp/hFU7LhfWMo0lk0Q0ogvD/XEnTx3l0j9HGc5kP
X-Google-Smtp-Source: AGHT+IHwejZcW1jpQSvHj9nn0EIJDjptOBSgF+7+uAEcf9yLPPvacuMtCBGhTBOdj5GahG/nwJ+eTQ==
X-Received: by 2002:a17:902:d4c2:b0:1ff:4fa5:62f2 with SMTP id d9443c01a7336-1ff57361144mr167028475ad.30.1722956811477;
        Tue, 06 Aug 2024 08:06:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b8a7453e92sm4474937a12.41.2024.08.06.08.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 08:06:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <900ae60e-84f8-4300-87e7-7f35d16ad439@roeck-us.net>
Date: Tue, 6 Aug 2024 08:06:49 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] MIPS: csrc-r4k: Apply verification clocksource
 flags
From: Guenter Roeck <linux@roeck-us.net>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Serge Semin <fancer.lancer@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
 <20240612-mips-clks-v2-2-a57e6f49f3db@flygoat.com>
 <fbe92f1c-3c08-4b46-9d7a-e098ac1656a8@roeck-us.net>
 <97ad6c99-ca4e-463b-aee0-9a7e9455fea3@app.fastmail.com>
 <62e8056b-6a6c-42d1-89f6-7306bb2a528b@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <62e8056b-6a6c-42d1-89f6-7306bb2a528b@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/24 22:13, Guenter Roeck wrote:
> On 8/5/24 22:06, Jiaxun Yang wrote:
>>
>>
>> 在2024年8月6日八月 下午12:09，Guenter Roeck写道：
>>> Hi,
>>>
>>> On Wed, Jun 12, 2024 at 09:54:29AM +0100, Jiaxun Yang wrote:
>>>> CP0 counter suffers from various problems like SMP sync,
>>>> behaviour on wait.
>>>>
>>>> Set CLOCK_SOURCE_MUST_VERIFY and CLOCK_SOURCE_VERIFY_PERCPU,
>>>> as what x86 did to TSC, to let kernel test it before use.
>>>>
>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>
>> Hi Guenter,
>>
>> Thanks for the report, it makes no sense to me though....
>>
>> I can't reproduce it with QEMU git master, do you mind specifying your QEMU
>> version for me? Also is it possible to have a copy of dmesg when failure happens.
>>
> 
> I currently use v9.0.2. I'll try with some other versions tomorrow.
> A complete log is at
> https://kerneltests.org/builders/qemu-mips64-master/builds/241/steps/qemubuildcommand/logs/stdio
> 
> Are you trying to instantiate an e1000 (or a variant of it) ? So far
> I have only seen the problem with that controller. There is no specific
> error message, the network interface just doesn't get an IP address.
> 

I am able to reproduce the problem with qemu 6.2.0 (Debian build).
http://server.roeck-us.net/qemu/mips64/ should have everything needed to
reproduce it. "repeat.sh" repeats the test until it fails.

Hope this helps,
Guenter


