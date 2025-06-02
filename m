Return-Path: <linux-mips+bounces-9153-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E4ACBD38
	for <lists+linux-mips@lfdr.de>; Tue,  3 Jun 2025 00:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 053163A2889
	for <lists+linux-mips@lfdr.de>; Mon,  2 Jun 2025 22:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F51224882;
	Mon,  2 Jun 2025 22:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="C47MePDa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B431182D0
	for <linux-mips@vger.kernel.org>; Mon,  2 Jun 2025 22:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748902920; cv=none; b=JIZaWIehxJxxxKiZmMmzTbAjh7ta056IuaFyP61qTA1GAj4K3P9082U+jOy3Idh2m7hLmk4xg/XhuvoZ2Ve4oglGSz0jAA4/w/t4ujcfr7jTaUPMfwGXP8E4LozIN5FEQoBmUQQxOC35/Ke8iFFCdnMv5ak/ZFtD3CCKtPaCuv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748902920; c=relaxed/simple;
	bh=Z/SP8Pk+F4FFxk8vgq2hVCMlYSJpgDiQRlCq91lj+T8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmBYIE17inEZDXR6o39WN4dPWRKKuqCJL2MHMS0DAI/Ht7aOTKS0qm0a6/1choy5StCcthe6cTl9tTV1D2ATEqBdQE4BuqsFzwvUMJQLg71PtV7t7ZfsLGp8CZ4AiWNnTjYTsziSFFg1bv2f6EuQSFR1Tt0cVuWsGWjSqZGWGd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=C47MePDa; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-86d2d9effe0so201661939f.2
        for <linux-mips@vger.kernel.org>; Mon, 02 Jun 2025 15:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748902918; x=1749507718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iu4wxZAVQO2hf/eLt9ktDv6KrJsBEvpVaW0no81zuhU=;
        b=C47MePDaWyByizHbbBL3rebiBMdYA+ggmXNk9CWPs0jD2613mRQwxIPoY3Shu8qUoT
         YRPFlbHjThRgMtNY384o7e6wX/5r7llcbTDr7Jde3tUCpPzPWFmS9XWqpeBCHQTzO/jA
         T2jsaxtJ0B+w1/z53XSXETol0aqiwcrHY9vtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748902918; x=1749507718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iu4wxZAVQO2hf/eLt9ktDv6KrJsBEvpVaW0no81zuhU=;
        b=eITelUhYbY1eWEmy3e+eO4snXTJka0WaDgpROKpv4dgQZGvio7RwyWwBfQLy3OiPac
         UWLZHtXhFvG/KVw7vUjyEJ+etZghjcLE2DWRgQXMTiLfJAbnAtD7vRyFXMUBQ1ts6veS
         mKefapR9jCb1LVYpb+GfTVrq+iH4qZm6rHswh9NSC7hV5j2ZJOWCX/Ci7KQY48DL5Ug6
         Eq8dn767J1ItkDn2y7n4M9m9q+Mpnp3e+qFVB12cdpEIAbt/HGoJoQU5/5zJ9tDp9kP3
         ib8GO/aMNZsDWCvXpV9guxzPOtvkdC8DBA2CFRObMvnURVwq7DeRLQy12ENCDgdK/gfj
         zBQA==
X-Forwarded-Encrypted: i=1; AJvYcCWJev/MF/ln3+2vBhEjZJdJWWSh9aN6FhMQeEKu8R8/YLrHfKnGt1cplMBqm5rPv+o2queL3ttRVZDA@vger.kernel.org
X-Gm-Message-State: AOJu0YxSPoPl6WfD7Uh2AXWXwxHbbfbL2lMxYL3YWHMgS/tJRwWfCwam
	nUET9eQldRE2KnHPnz4CUABg4bxOlosEtE74Ad4k06riWbyMGFvAsc6JT6pJeC0nrDI=
X-Gm-Gg: ASbGncupzdBYjeb8w+LEKYV/t0j3mOzGQzkwQZEqFwtVRpCtAjcURBwmnr2UZbN0aA5
	FFvw8r9FtQ60PZdp5CFIyd9zTQZrXOKoyF/E+CY/LcAQFYhuYJOoOm7V+xHESHdidF7BoDNsyEr
	eKtwN+A4IIgYuJZVPHWuYa9mZs7/5q89T0ZCThD0tGhye4N1A50d8/n7eskVshwxDf9XQOQwhMK
	uw8g5vSJKBntghSob7fUp8whXKIkgaBKon1wBfnyxopsZ6FR/haf0KYFAt3KNlqOrPBJ8VAFj4A
	SNn86M04dNAu3NEUMNpUmPgVLoZsfb4CBdasvpsMISTTQcXndPL0gD1UFcT+0w==
X-Google-Smtp-Source: AGHT+IHeGCNq4cv4J4LIgdnexVFJmTDFs9i9Zx9R+h4U+awQWpIRMwn7SGjs0Hi+OSqiNOAK0FCywQ==
X-Received: by 2002:a05:6602:3806:b0:86c:f2c1:70d9 with SMTP id ca18e2360f4ac-86d00099634mr1794429539f.3.1748902918105;
        Mon, 02 Jun 2025 15:21:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdd7e29877sm1977626173.53.2025.06.02.15.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 15:21:57 -0700 (PDT)
Message-ID: <b2e62143-fa68-4cd1-bf6c-67f0ad49c670@linuxfoundation.org>
Date: Mon, 2 Jun 2025 16:21:57 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ptrace/get_syscall_info: fix for MIPS n32
To: "Dmitry V. Levin" <ldv@strace.io>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Shuah Khan <shuah@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, strace-devel@lists.strace.io,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250115233747.GA28541@strace.io>
 <0262acf1-4d3f-471b-bd56-4ddf8a2bc1a3@linuxfoundation.org>
 <20250329124856.GA1356@strace.io>
 <alpine.DEB.2.21.2503291345580.47733@angie.orcam.me.uk>
 <20250602115924.GB329@strace.io>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250602115924.GB329@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/2/25 05:59, Dmitry V. Levin wrote:
> On Sat, Mar 29, 2025 at 02:02:28PM +0000, Maciej W. Rozycki wrote:
>> On Sat, 29 Mar 2025, Dmitry V. Levin wrote:
>>
>>>>> +#if defined(_MIPS_SIM) && _MIPS_SIM == _MIPS_SIM_NABI32
>>>>> +/*
>>>>> + * MIPS N32 is the only architecture where __kernel_ulong_t
>>>>> + * does not match the bitness of syscall arguments.
>>>>> + */
>>>>> +typedef unsigned long long kernel_ulong_t;
>>>>> +#else
>>>>> +typedef __kernel_ulong_t kernel_ulong_t;
>>>>> +#endif
>>>>> +
>>>>
>>>> What's the reason for adding these typedefs? checkpatch should
>>>> have warned you about adding new typedefs.
>>>>
>>>> Also this introduces kernel_ulong_t in user-space test code.
>>>> Something to avoid.
>>>
>>> There has to be a new type for this test, and the natural way to do this
>>> is to use typedef.  The alternative would be to #define kernel_ulong_t
>>> which is ugly.  By the way, there are quite a few typedefs in selftests,
>>> and there seems to be given no rationale why adding new types in selftests
>>> is a bad idea.
>>
>>   FWIW I agree, and I fail to see a reason why this would be a problem in a
>> standalone test program where the typedef does not propagate anywhere.
>>
>>   The only potential issue I can identify would be a namespace clash, so
>> perhaps the new type could have a name prefix specific to the test, but it
>> doesn't appear to me a widespread practice across our selftests and then
>> `kernel_' ought to be pretty safe against ISO C or POSIX, so perhaps let's
>> leave the things alone?
> 
> Another similar test I authored (selftests/ptrace/set_syscall_info) has
> been merged, so there are two similar tests in the tree now, but only
> one of them is permitted to use this approach, creating inconsistency.
> 
> Taking all of the above into consideration, please approve this fix.
> 
> 

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

