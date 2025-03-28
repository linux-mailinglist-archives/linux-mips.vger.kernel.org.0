Return-Path: <linux-mips+bounces-8398-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BD3A752C1
	for <lists+linux-mips@lfdr.de>; Sat, 29 Mar 2025 00:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F33188F160
	for <lists+linux-mips@lfdr.de>; Fri, 28 Mar 2025 23:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B8E1DED66;
	Fri, 28 Mar 2025 23:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NuaPZIhR"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C571865E5
	for <linux-mips@vger.kernel.org>; Fri, 28 Mar 2025 23:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743203099; cv=none; b=NZpGX3n6Z9+StvOzxik+tBrGX069pTAEeeDSjfy9ffifgPPnImRhdvZHIoKItHrg7AcB1bSIWZQkfLMXbrCVqs+A6Ul8CatWWvxz0YjdWj3IQWdvuAiYSgpAIVjIqGRLB8xdtMExrQExdTV3OZm57HdjoaDI86aSlD0b8BY2Vlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743203099; c=relaxed/simple;
	bh=N4LioLCzdMTrJaJfOn5iKcMWtxWly92s4CM0tnL18FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceK3Us1HncuAt+9lARYLpuNlAwGUc2GEiQ0qX5xfHR++o9qMLUCExyzTG9O4kt56m5Av5dWeQpHDczKNxVE0uTmmwZp0NWRrZtHa7WDwFWsoSjczPNF/rw64lXJqVWN7E5/nrDCa0w8PUUOGFMDTpSmzvF/zTmlBTy/fQDMHUQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NuaPZIhR; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-85dd470597fso77921339f.2
        for <linux-mips@vger.kernel.org>; Fri, 28 Mar 2025 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743203096; x=1743807896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzTkMNJi3T5R9/ZQI6BV3XWRq5Seuy9ftDvABDqYWPg=;
        b=NuaPZIhR5Nm3yyxyHzlyb/PGRoJ80/aAeRCTVfpAxRFwndb/FFhTbkDFrwJqgqLgEE
         Rl+K/ohrBEYkGWgZT22L3TdA6l6Q+Qk1JOuWqVRR9jd1XR41G4gg/z3n4yXn/oDXEXDc
         JJWHkHAe3kKqB0w9hylwBZ1sw2OfZG86lCTOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743203096; x=1743807896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzTkMNJi3T5R9/ZQI6BV3XWRq5Seuy9ftDvABDqYWPg=;
        b=Z8Fg3vMjdpKuqLe3651Xb4cKz/QpZ7Kp8w4Dx4L3ajmZbh+fhF1RKirl5YP2YZxHHj
         X9t9Zoq5rJ3sE80UKS3FYU3dILrYrz2ZmNRNMsiuC9dBIMpDiERwcsE3XxlZMk3BdRg1
         H5Aeff9BC4y5bmZqSZl5Ln3Qqba3tSd4rd5QPPUw3dFdbuvp7s3xvNeF4t+YpomL5pp6
         vOavvkZMX8ArSi5CteVpEjx8i1O7W5Ol5tWXKODqqdhoOABKPi+Yqbg1wT+KXoF2Kdmw
         KpwPGdk2nlpAGdQ19dGlCNf3dUGveCEXsS3FPM+FLNvFSHhKC13aBDY87Ebx/wlLQaQ8
         tGZw==
X-Forwarded-Encrypted: i=1; AJvYcCXJXx53nROJPx7yj8TKmsOIY/UqyUSTUYDDA6khma1QgYireC+Xq2haOtYe2FHYY32P6noE/pKncgaH@vger.kernel.org
X-Gm-Message-State: AOJu0YyOtDE9zom6JM2ZP6niPIR9eVK2pknLbSxDYXcw+sx+VUTOrf6u
	54wdg8vUYSOJ/cBSZzddAQ5SXCQnRzVukJMS2V8B05AoeX1BbY1YncFVL6j+YKs=
X-Gm-Gg: ASbGncvghXvpMtO4Mt6rLaECBU60yDNe5z76SmGOLmE9bFJp+UNINXRGm545LBQMB0n
	vHt83KkVqPtHnUWkfRTjf0wKiCfWzzWZ16gMjsylAbuLZ4c/M+zeEMSjH1ZNeJyltQ6pwSceYmY
	HLjI/6J5UTv6RSiAkVO/cYk0Adkckt8V0bKhain+Yfhq+T0ocWQlLFWElYWDBkcSj8HeL++bTfC
	F/mSOsEfnUhLsgUJuFL+6hNUsTyb8T5nXPhhFw2za3ht8vHhVLaMS13JqPgWAaV/F98C2UfsIn+
	Ly1hoo5AVhgquE3Lp9mtmlHbZ4FjbfdhornLUjQOQYvstLdDQZulC1Y=
X-Google-Smtp-Source: AGHT+IGmzjDgX0+RJz04kpKdj9ky97mpubGViMnY535puSdU5zpCw4L3L0/8A3wDj0HYYQYpYHcglQ==
X-Received: by 2002:a05:6e02:152e:b0:3d2:6768:c4fa with SMTP id e9e14a558f8ab-3d5e09fdbf6mr13250335ab.21.1743203095961;
        Fri, 28 Mar 2025 16:04:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f46473f906sm651408173.42.2025.03.28.16.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 16:04:55 -0700 (PDT)
Message-ID: <0262acf1-4d3f-471b-bd56-4ddf8a2bc1a3@linuxfoundation.org>
Date: Fri, 28 Mar 2025 17:04:54 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/ptrace/get_syscall_info: fix for MIPS n32
To: "Dmitry V. Levin" <ldv@strace.io>, Shuah Khan <shuah@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 strace-devel@lists.strace.io, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250115233747.GA28541@strace.io>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250115233747.GA28541@strace.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/15/25 16:37, Dmitry V. Levin wrote:
> MIPS n32 is one of two ILP32 architectures supported by the kernel
> that have 64-bit syscall arguments (another one is x32).
> 
> When this test passed 32-bit arguments to syscall(), they were
> sign-extended in libc, PTRACE_GET_SYSCALL_INFO reported these
> sign-extended 64-bit values, and the test complained about the mismatch.
> 
> Fix this by passing arguments of the appropriate type to syscall(),
> which is "unsigned long long" on MIPS n32, and __kernel_ulong_t on other
> architectures.
> 
> As a side effect, this also extends the test on all 64-bit architectures
> by choosing constants that don't fit into 32-bit integers.
> 
> Signed-off-by: Dmitry V. Levin <ldv@strace.io>
> ---
> 
> v2: Fixed MIPS #ifdef.
> 
>   .../selftests/ptrace/get_syscall_info.c       | 53 +++++++++++--------
>   1 file changed, 32 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/testing/selftests/ptrace/get_syscall_info.c b/tools/testing/selftests/ptrace/get_syscall_info.c
> index 5bcd1c7b5be6..2970f72d66d3 100644
> --- a/tools/testing/selftests/ptrace/get_syscall_info.c
> +++ b/tools/testing/selftests/ptrace/get_syscall_info.c
> @@ -11,8 +11,19 @@
>   #include <err.h>
>   #include <signal.h>
>   #include <asm/unistd.h>
> +#include <linux/types.h>
>   #include "linux/ptrace.h"
>   
> +#if defined(_MIPS_SIM) && _MIPS_SIM == _MIPS_SIM_NABI32
> +/*
> + * MIPS N32 is the only architecture where __kernel_ulong_t
> + * does not match the bitness of syscall arguments.
> + */
> +typedef unsigned long long kernel_ulong_t;
> +#else
> +typedef __kernel_ulong_t kernel_ulong_t;
> +#endif
> +

What's the reason for adding these typedefs? checkpatch should
have warned you about adding new typedefs.

Also this introduces kernel_ulong_t in user-space test code.
Something to avoid.

>   static int
>   kill_tracee(pid_t pid)
>   {
> @@ -42,37 +53,37 @@ sys_ptrace(int request, pid_t pid, unsigned long addr, unsigned long data)
>   
>   TEST(get_syscall_info)
>   {
> -	static const unsigned long args[][7] = {
> +	const kernel_ulong_t args[][7] = {
>   		/* a sequence of architecture-agnostic syscalls */
>   		{
>   			__NR_chdir,
> -			(unsigned long) "",
> -			0xbad1fed1,
> -			0xbad2fed2,
> -			0xbad3fed3,
> -			0xbad4fed4,
> -			0xbad5fed5
> +			(uintptr_t) "",

You could use ifdef here.

> +			(kernel_ulong_t) 0xdad1bef1bad1fed1ULL,
> +			(kernel_ulong_t) 0xdad2bef2bad2fed2ULL,
> +			(kernel_ulong_t) 0xdad3bef3bad3fed3ULL,
> +			(kernel_ulong_t) 0xdad4bef4bad4fed4ULL,
> +			(kernel_ulong_t) 0xdad5bef5bad5fed5ULL
>   		},
>   		{
>   			__NR_gettid,
> -			0xcaf0bea0,
> -			0xcaf1bea1,
> -			0xcaf2bea2,
> -			0xcaf3bea3,
> -			0xcaf4bea4,
> -			0xcaf5bea5
> +			(kernel_ulong_t) 0xdad0bef0caf0bea0ULL,
> +			(kernel_ulong_t) 0xdad1bef1caf1bea1ULL,
> +			(kernel_ulong_t) 0xdad2bef2caf2bea2ULL,
> +			(kernel_ulong_t) 0xdad3bef3caf3bea3ULL,
> +			(kernel_ulong_t) 0xdad4bef4caf4bea4ULL,
> +			(kernel_ulong_t) 0xdad5bef5caf5bea5ULL
>   		},
>   		{
>   			__NR_exit_group,
>   			0,
> -			0xfac1c0d1,
> -			0xfac2c0d2,
> -			0xfac3c0d3,
> -			0xfac4c0d4,
> -			0xfac5c0d5
> +			(kernel_ulong_t) 0xdad1bef1fac1c0d1ULL,
> +			(kernel_ulong_t) 0xdad2bef2fac2c0d2ULL,
> +			(kernel_ulong_t) 0xdad3bef3fac3c0d3ULL,
> +			(kernel_ulong_t) 0xdad4bef4fac4c0d4ULL,
> +			(kernel_ulong_t) 0xdad5bef5fac5c0d5ULL
>   		}
>   	};
> -	const unsigned long *exp_args;
> +	const kernel_ulong_t *exp_args;
>   
>   	pid_t pid = fork();
>   
> @@ -154,7 +165,7 @@ TEST(get_syscall_info)
>   			}
>   			ASSERT_LT(0, (rc = sys_ptrace(PTRACE_GET_SYSCALL_INFO,
>   						      pid, size,
> -						      (unsigned long) &info))) {
> +						      (uintptr_t) &info))) {
>   				LOG_KILL_TRACEE("PTRACE_GET_SYSCALL_INFO: %m");
>   			}
>   			ASSERT_EQ(expected_none_size, rc) {
> @@ -177,7 +188,7 @@ TEST(get_syscall_info)
>   		case SIGTRAP | 0x80:
>   			ASSERT_LT(0, (rc = sys_ptrace(PTRACE_GET_SYSCALL_INFO,
>   						      pid, size,
> -						      (unsigned long) &info))) {
> +						      (uintptr_t) &info))) {
>   				LOG_KILL_TRACEE("PTRACE_GET_SYSCALL_INFO: %m");
>   			}
>   			switch (ptrace_stop) {

thanks,
-- Shuah

