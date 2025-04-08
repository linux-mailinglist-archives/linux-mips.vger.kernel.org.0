Return-Path: <linux-mips+bounces-8524-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B3A81989
	for <lists+linux-mips@lfdr.de>; Wed,  9 Apr 2025 01:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 798FB1B804BB
	for <lists+linux-mips@lfdr.de>; Tue,  8 Apr 2025 23:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CCEB2566E1;
	Tue,  8 Apr 2025 23:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RJMpo4gE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE1254872
	for <linux-mips@vger.kernel.org>; Tue,  8 Apr 2025 23:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744156485; cv=none; b=CsbyU6avQDeRyZXPRbZqVMXaMeTWXQIVMYoPjEYdA5XQxFemPbqYojakk4FLej6+7oWvMxV+XOCvJHpu4Dg7yjfREc3mYeDVL372IMM0oX45AcnO0kP0D4KCGL6junGiUbje3X/fGG6cjQ9tqprVVxWtwYH+D7awwHJWpXRBWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744156485; c=relaxed/simple;
	bh=Jnx6PKKzCvL4p4g+uO/ftLP/ihvxn+++kI74c7ySLPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMLAt41ea2T1gFyDIHjES9gAm/8uma0Fs6OnpJpRMy4A+FYRz6X2Aw8cu5ELu2U62c3NpldVDsKkzMSaViS1lT+YVhb6dtnSyFooXcPQYmqHI3oJsKybCNP9YttibGmjnxvPzIBz+fh9IhVWx9++li0temmSCziFU1xYI7gMgFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RJMpo4gE; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-861525e9b0aso119012639f.3
        for <linux-mips@vger.kernel.org>; Tue, 08 Apr 2025 16:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744156481; x=1744761281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdRyBtliQ5cx07mISx4wCHyn5iramOMcxVolUqi92Io=;
        b=RJMpo4gE/CclGysCZHF4DFNZsSnXV4P4XuEjnWRUTJ9omVb675XMkP0rDKjJIXgGqR
         QLn7HxEEUlqjtQiIyOZ8RBMTzUJ/XQZB7BHuSY/olcc272F/Uxt+iYgdIMs3C+cSM3Xi
         0DvCjOUiR/VPa/tZwkgRPn6Dzl5/OVyDbKNeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744156481; x=1744761281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdRyBtliQ5cx07mISx4wCHyn5iramOMcxVolUqi92Io=;
        b=NXcCOFTU/z2Y5nYWF8EkyYFk8pPWuwqnhn5xVas1TbDfJ0MIGmYUWNxKhzDB0t9r9V
         nD88BADD0OuQOJSn4q4orlIOzQyUmJhahhrokG4WjJGfUSlXWXDbXz7krkY+IzFJ44Kj
         /jzfO5zWRwT//jLWw/feI6XPeBGUCkxNFSczRFn9SsHDH2a2cdaQNdZ1SPhKTpC4QERZ
         LI9sjNmFU5mK/KJkm3k9sRC+cGb1L9qHXBcyOP+HwsnQR/Oa5XkTtcip9lH4FWxA9roI
         4G46pukmBO8w6rV1mIqH4BTgv1pgcYdHE73YGBkpxOo0YQeNd/zk8C2ZpLAEW2kSEtyk
         feDA==
X-Forwarded-Encrypted: i=1; AJvYcCVsPtkAm+YXGcPc5L1kzijzLAKDuym/Q0y61if/T71s7sa8LV3NqEziW1ap5amB49oDw7HMme8aUY/u@vger.kernel.org
X-Gm-Message-State: AOJu0YwOnvYtJdfeCEjBM5Jf7t+67WHbPFnE+UWqj6IxlMyzhYDdXbON
	JRH/pDkFh/pys9suThRbbiyP0gA1eNyjeecbit6PRS0EwokBQWGqbiXwzCP3i9k=
X-Gm-Gg: ASbGncuRVsipH5duKLvTs6xPkbnElSkW30YpXjRD3wTOkeSsy/2y0F742mxH3s86cLN
	8pRWIwXHBjZANH2rcKbPmT73eVKo+w45bheiS0SlDitXSw9UOXwieYaHJr6QKwCv2k3xu9hsdUB
	VyRzEITvtSIgOCqTNRk4GTRXthnX35Mc14/uDbMHf04ou2TNM/oC1dZj0nmQi3Mgf7NQOTJSUKC
	1aeTxTKffluvyjkdjW0OZ88PEfg28u3r4j3d0C8BkAGQAM0yIjKZoGV9NB2cH0D5+7JpcauJwLp
	/QuKdHqWXz4BSNPF21Iilu3WYM5MQ2Wv5ljh2RfbLdjvofEBYbwvwrU=
X-Google-Smtp-Source: AGHT+IHrbk9mfKXAQeL9/yafdcqMUAyL8vOKCLUsGKcMZRbOPlFSarz6cufkOxtG6i0ALC59RzlGtw==
X-Received: by 2002:a05:6602:720e:b0:85b:3dcd:d8c0 with SMTP id ca18e2360f4ac-8616128f2f0mr132204539f.12.1744156481759;
        Tue, 08 Apr 2025 16:54:41 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f43bda91sm746758173.27.2025.04.08.16.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 16:54:41 -0700 (PDT)
Message-ID: <dae94ac2-63d7-419c-9bec-bea0840ea534@linuxfoundation.org>
Date: Tue, 8 Apr 2025 17:54:40 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ptrace/get_syscall_info: fix for MIPS n32
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, "Dmitry V. Levin" <ldv@strace.io>
Cc: Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 strace-devel@lists.strace.io, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250115233747.GA28541@strace.io>
 <0262acf1-4d3f-471b-bd56-4ddf8a2bc1a3@linuxfoundation.org>
 <20250329124856.GA1356@strace.io>
 <alpine.DEB.2.21.2503291345580.47733@angie.orcam.me.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <alpine.DEB.2.21.2503291345580.47733@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/29/25 08:02, Maciej W. Rozycki wrote:
> On Sat, 29 Mar 2025, Dmitry V. Levin wrote:
> 
>>>> +#if defined(_MIPS_SIM) && _MIPS_SIM == _MIPS_SIM_NABI32
>>>> +/*
>>>> + * MIPS N32 is the only architecture where __kernel_ulong_t
>>>> + * does not match the bitness of syscall arguments.
>>>> + */
>>>> +typedef unsigned long long kernel_ulong_t;
>>>> +#else
>>>> +typedef __kernel_ulong_t kernel_ulong_t;
>>>> +#endif
>>>> +
>>>
>>> What's the reason for adding these typedefs? checkpatch should
>>> have warned you about adding new typedefs.
>>>
>>> Also this introduces kernel_ulong_t in user-space test code.
>>> Something to avoid.
>>
>> There has to be a new type for this test, and the natural way to do this
>> is to use typedef.  The alternative would be to #define kernel_ulong_t
>> which is ugly.  By the way, there are quite a few typedefs in selftests,
>> and there seems to be given no rationale why adding new types in selftests
>> is a bad idea.
> 

It causes problems down the road for maintenance. I would rather not
see these types of kernel typedefs added to user-space.

>   FWIW I agree, and I fail to see a reason why this would be a problem in a
> standalone test program where the typedef does not propagate anywhere.
> 
>   The only potential issue I can identify would be a namespace clash, so
> perhaps the new type could have a name prefix specific to the test, but it
> doesn't appear to me a widespread practice across our selftests and then
> `kernel_' ought to be pretty safe against ISO C or POSIX, so perhaps let's
> leave the things alone?
> 

Can't this be solved with ifdef?

thanks,
-- Shuah

