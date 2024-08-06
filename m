Return-Path: <linux-mips+bounces-4735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4C79488D6
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 07:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ABC51F239EF
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 05:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBA31BB684;
	Tue,  6 Aug 2024 05:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJr1etZc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAC115C133;
	Tue,  6 Aug 2024 05:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722921210; cv=none; b=HYgFj6oZ9G1+a+jtaP9ZZoHYFAMbYREZzcknECBJgxsHjAhPLdd0+RhHr3NGSchheuh3uJEyKrFB/0ls3bKn7945feYt5icxIX7YS2RbjqC4GFHh3zEqsnaRKQIO312Ajs1beVshgjNcSf6QmPTkRBV1hX705O6CCuh3AW7JbIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722921210; c=relaxed/simple;
	bh=ODt2sQtBEF7gXIeophuLXAGf8GZMaXJ0c43ziZvHH8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pjNyULadQ2OE7aWkbckkXUXNPwXqp24CFu0JPkdS1XXQs10XNpc16HZaLLcA6pqkCAiEtB3TRkkTX9BcR6cA2pPdjOJp4aVYaBS4PSFjCGsV4RQ9weGmk47tXSd9WSefVsU+wWPWyvSDGRcR9+IJS8MBRiCb8haZrAZz1ZNVaLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJr1etZc; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d2b921cd1so162633b3a.1;
        Mon, 05 Aug 2024 22:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722921208; x=1723526008; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5HEhvUc4S5m26e92rC7zmJWdjl/o1va5cHyfoAn9E94=;
        b=bJr1etZcx1ozAcj28goi17xd9CgSIW3DIVKxgUUa++TSCtJxs5HnFFX0nno8YjbTjm
         8hy7ijcR1MWX/LZDkkSprU3dM/0qPdk8MbN+he1m0j9q5Z9a0NyGEWPberyhr8cS3O9F
         wb1glSL/Ff2X/RGN5acoadkEwIRnzSgG/h/I79vshsdAAPjGZWh084HQLFVUUoO8AXhI
         gJ3NH+N41JTOgzMewZoWe4xMVG+pv8snIfKOOwfHv8ECSQOzWGJSRhaR9HhebgKYWBtb
         ZNu6CxdZynNscApe8EMFBxtiVZCGImcApMrbUFlhp9l9Mrc/LoM/X+vpZ+fNT/qck2/b
         RFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722921208; x=1723526008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HEhvUc4S5m26e92rC7zmJWdjl/o1va5cHyfoAn9E94=;
        b=o507FRmLJEeakYqtjfEFgD2RYUEqis07SNUAC82dGjRVNIo1OA2M1F45QFzT3Hbe06
         pT4QMtCJmdnHL6GcG5Q7Tr9tYoCHqN5zWiGCLe3pqSn+SVlfjkeyVAjUIY05XOj+e7TM
         67Sz4nq1ydB6w84SbHrQuxLcbIVAB/2xOwBjKP17kFA/nbzoLv4FJrFbdIxFGiz/WyRA
         kCy6gIEHW2EpWwc+6O6gktphTYI33qYbtS+UGo3lG8uG4YPa8/cUvTNFZ1i0qsIynwLD
         NqxQFyXGjU0Ixtu9sA/yVSyfQYMT/x42y7Ot3kSoeIxiSkuFNJMRvEE0pUA6X9YA6Ugc
         tVFw==
X-Forwarded-Encrypted: i=1; AJvYcCVhyn/O44ayI6hlcxuYKPEcEfKrlTsUamhrK3RWxF9loDPhEMBtQPVFiMx8eQr+Rfjex98LDvmQfKXMtBcacP8nuHcIMpJ9SYPjfdJXsLbLPfkHdcL0SUvNcm1mybwgiB7rP5LZ9oI+jg==
X-Gm-Message-State: AOJu0YwTVQsDFOL+dD4qnJR/PelwngMCyHWcTOv9AyEy1/KJmv6zoDiN
	e5IrBqjLRJjlBR61Zz7oaJnV7Q9TyCULknUUxQug74rSFceDsCdc
X-Google-Smtp-Source: AGHT+IERZR0W7aS3qgKBEs2jq5Mf5rtrlJSxh/EAiVsJwXMDIi228pkWMw3M2sP8P3pW8PD1LasnKw==
X-Received: by 2002:a05:6a00:3988:b0:70d:2892:402b with SMTP id d2e1a72fcca58-7106cfa5379mr20551245b3a.7.1722921207543;
        Mon, 05 Aug 2024 22:13:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ed2c7ebsm6275894b3a.197.2024.08.05.22.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 22:13:26 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <62e8056b-6a6c-42d1-89f6-7306bb2a528b@roeck-us.net>
Date: Mon, 5 Aug 2024 22:13:25 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] MIPS: csrc-r4k: Apply verification clocksource
 flags
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <97ad6c99-ca4e-463b-aee0-9a7e9455fea3@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/24 22:06, Jiaxun Yang wrote:
> 
> 
> 在2024年8月6日八月 下午12:09，Guenter Roeck写道：
>> Hi,
>>
>> On Wed, Jun 12, 2024 at 09:54:29AM +0100, Jiaxun Yang wrote:
>>> CP0 counter suffers from various problems like SMP sync,
>>> behaviour on wait.
>>>
>>> Set CLOCK_SOURCE_MUST_VERIFY and CLOCK_SOURCE_VERIFY_PERCPU,
>>> as what x86 did to TSC, to let kernel test it before use.
>>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> Hi Guenter,
> 
> Thanks for the report, it makes no sense to me though....
> 
> I can't reproduce it with QEMU git master, do you mind specifying your QEMU
> version for me? Also is it possible to have a copy of dmesg when failure happens.
> 

I currently use v9.0.2. I'll try with some other versions tomorrow.
A complete log is at
https://kerneltests.org/builders/qemu-mips64-master/builds/241/steps/qemubuildcommand/logs/stdio

Are you trying to instantiate an e1000 (or a variant of it) ? So far
I have only seen the problem with that controller. There is no specific
error message, the network interface just doesn't get an IP address.

Thanks,
Guenter

> If I'm unable to resolve it in a couple of days, I'll send a patch to revert this change.
> 
> Thanks
> 
>>
>> With this patch in the mainline kernel, about one in five qemu
>> boot attempts with e1000 Ethernet controller fail to activate
>> the network interface (specifically, the dhcp client is unable to
>> get an IP address for the interface). Bisect log is attached below.
>>
>> For reference, here is an example command line.
>>
>> qemu-system-mips64 -kernel vmlinux -M malta -cpu 5KEc \
>> 	-initrd rootfs-n32.cpio \
>> 	-device e1000,netdev=net0 -netdev user,id=net0 \
>> 	-vga cirrus -no-reboot -m 256 \
>> 	--append "rdinit=/sbin/init mem=256M console=ttyS0 console=tty " \
>> 	-nographic
>>
>> Reverting this patch fixes the probem.
>>
>> Thanks,
>> Guenter
>>
>> ---
>> # bad: [de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed] Linux 6.11-rc2
>> # good: [0c3836482481200ead7b416ca80c68a29cfdaabd] Linux 6.10
>> git bisect start 'HEAD' 'v6.10'
>> # good: [280e36f0d5b997173d014c07484c03a7f7750668] nsfs: use cleanup
>> guard
>> git bisect good 280e36f0d5b997173d014c07484c03a7f7750668
>> # good: [a4f9285520584977127946a22eab2adfbc87d1bf] Merge tag
>> 'clk-for-linus' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
>> git bisect good a4f9285520584977127946a22eab2adfbc87d1bf
>> # bad: [8e313211f7d46d42b6aa7601b972fe89dcc4a076] Merge tag
>> 'pinctrl-v6.11-1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
>> git bisect bad 8e313211f7d46d42b6aa7601b972fe89dcc4a076
>> # good: [acc5965b9ff8a1889f5b51466562896d59c6e1b9] Merge tag
>> 'char-misc-6.11-rc1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
>> git bisect good acc5965b9ff8a1889f5b51466562896d59c6e1b9
>> # bad: [d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d] Merge tag 'mips_6.11'
>> of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
>> git bisect bad d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d
>> # good: [45659274e60864f9acabba844468e405362bdc8c] Merge branch
>> 'pci/misc'
>> git bisect good 45659274e60864f9acabba844468e405362bdc8c
>> # good: [8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74] Merge tag
>> 'input-for-v6.11-rc0' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
>> git bisect good 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74
>> # good: [3c3ff7be9729959699eb6cbc7fd7303566d74069] Merge tag
>> 'powerpc-6.11-1' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
>> git bisect good 3c3ff7be9729959699eb6cbc7fd7303566d74069
>> # good: [3de96d810ffd712b7ad2bd764c1390fac2436551] dt-bindings: mips:
>> brcm: Document brcm,bmips-cbr-reg property
>> git bisect good 3de96d810ffd712b7ad2bd764c1390fac2436551
>> # bad: [9c7a86c935074525f24cc20e78a7d5150e4600e3] MIPS: lantiq: improve
>> USB initialization
>> git bisect bad 9c7a86c935074525f24cc20e78a7d5150e4600e3
>> # bad: [580724fce27f2b71b3e4d58bbe6d83b671929b33] MIPS: sync-r4k:
>> Rework based on x86 tsc_sync
>> git bisect bad 580724fce27f2b71b3e4d58bbe6d83b671929b33
>> # good: [c171186c177970d3ec22dd814f2693f1f7fc1e7d] MIPS: csrc-r4k:
>> Refine rating computation
>> git bisect good c171186c177970d3ec22dd814f2693f1f7fc1e7d
>> # bad: [426fa8e4fe7bb914b5977cbce453a9926bf5b2e6] MIPS: csrc-r4k:
>> Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
>> git bisect bad 426fa8e4fe7bb914b5977cbce453a9926bf5b2e6
>> # bad: [7190401fc56fb5f02ee3d04476778ab000bbaf32] MIPS: csrc-r4k: Apply
>> verification clocksource flags
>> git bisect bad 7190401fc56fb5f02ee3d04476778ab000bbaf32
>> # first bad commit: [7190401fc56fb5f02ee3d04476778ab000bbaf32] MIPS:
>> csrc-r4k: Apply verification clocksource flags
> 


