Return-Path: <linux-mips+bounces-6078-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3302E9A0101
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2024 07:59:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE1521F23E96
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2024 05:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C79818C331;
	Wed, 16 Oct 2024 05:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9Pub590"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA2518C336
	for <linux-mips@vger.kernel.org>; Wed, 16 Oct 2024 05:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729058377; cv=none; b=mgkFUhwkpFsTV75bJiBjswz5X3MqATp3q7RB9LEkMjpeMMbrNHBwueHDzWUubfkl6JW/RawebA4kwBLaLo8+e02lpWXJVvxkzJSBtEVPCK+iM/BN+m/cgcpqDrj0N2Nf7BhOwOTjnLBvVVhFYe1LgD3+NaNUDMzNTPzLgEyKTt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729058377; c=relaxed/simple;
	bh=VWK4U/i8gUcds76RyMyEeEuiDy0+2wEwZXNMbfzpgPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3JsDk7I9W8mS5eQzZUdp9Grx7q/ocQIkyI4oeL496yrDUIEPShz/+/DCFYVNUzs9s2/QUnknILYOVYgBPD7+J/nnobixidXLcavaa2Ns/I82ds9KzwZO0FSMc9iQ9shOI+QNu/PPN7WknSrVgUGneyOoFJiXX3x1csp1Pcul4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n9Pub590; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e72db7bb1so1597338b3a.0
        for <linux-mips@vger.kernel.org>; Tue, 15 Oct 2024 22:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729058373; x=1729663173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8rXbSaoRM3I91C8i3phm7sHDz+HHlGYglaP+SNKnxuk=;
        b=n9Pub590uhX2mVwl3DdLG73eCptt9DQalEIef5/Fi857u55pbxxSho2mNPs+3Zxtw1
         HGJCsogmON89Mb/iBIwn6NZalXR108q0Oj3GvNAx4eYpuzA1As+JasshPMl8+LaXA8GM
         7ttzA/4lwE2d0ul3c1LrX6DIMYLRoa4TshIT+AHW1SYXNnnNlCyrof0hN26XO8BtvnWM
         1prxz+tuz6xH3YIN5EBbswiFz6F4P0a/+pjxFniuXjkJA9N7azG56lopVV5EffJjovog
         qsQAmm8l3JA1b9l+XIbEF4Bh9xwUdDibWEQuMt8ktEeL4m4A06eWkUe7PHJAwklrAU7O
         cmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729058373; x=1729663173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rXbSaoRM3I91C8i3phm7sHDz+HHlGYglaP+SNKnxuk=;
        b=pD/Ew2JCGRhryD1ANtnfRnZT/NaUTjE/5n47VMayqAb4kSfJxpswh+kTynhlw4PhIB
         vr99BxdVlKprBO6lG93OuOVuPc/T8BubUOvLrHn5mzUj4+iUGm833VgEGgiS7O6QVO0t
         uMa+G5vsk9dTx8yinF/1EwivKfuZw+PitNCICwgW3bpG05iaff8qpd576rcuRGMUIlmQ
         oQldUMO5vX5tLMxV3hmmEUsMaGA5qjtekAvXWnMArfQ/epB9T0a3exlj1pua03zr5uvu
         lDXfYudcIZpOcPwj/NsH10A4E97mxi/28hVR6yuXlBpkwedxlzD75mnOI+R31uyNE3us
         yz3A==
X-Forwarded-Encrypted: i=1; AJvYcCVavjZyyH0CPAaUxwjv6noQnfVEDKTziuZsrp80S750l1z0VS8sKasliIVzQXkegMjGjFWH4XY3lqHJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yza7LkKSo0wBbSFsIw1cyldhfwhUK/C88OofDVZw/sdptB1InCi
	ilSidc9ZYzl09yw0eDGGnS3lSSYxjdrCWn9yIyFSU5gI2OG+GFM+Dr8YgTTEp4g=
X-Google-Smtp-Source: AGHT+IHxy9OWThf9MgRvmZDpDpf2hJTqNvgcWsu7qq0YeFBzyE3RSWwmvlEXJG8I0L8nUOp3N1UmOA==
X-Received: by 2002:a05:6a00:1797:b0:71e:7c25:8217 with SMTP id d2e1a72fcca58-71e7c2591demr4729926b3a.25.1729058373527;
        Tue, 15 Oct 2024 22:59:33 -0700 (PDT)
Received: from localhost ([122.172.84.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508b1asm2316879b3a.192.2024.10.15.22.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 22:59:32 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:29:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yuan Can <yuancan@huawei.com>
Cc: jiaxun.yang@flygoat.com, rafael@kernel.org, ralf@linux-mips.org,
	wuzhangjin@gmail.com, linux-mips@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: loongson2: Unregister platform_driver on failure
Message-ID: <20241016055930.zhup3ecjrm4k24cn@vireshk-i7>
References: <20241015131337.20159-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015131337.20159-1-yuancan@huawei.com>

On 15-10-24, 21:13, Yuan Can wrote:
> When cpufreq_register_driver() returns error, the cpufreq_init() returns
> without unregister platform_driver, fix by add missing
> platform_driver_unregister() when cpufreq_register_driver() failed.
> 
> Fixes: f8ede0f700f5 ("MIPS: Loongson 2F: Add CPU frequency scaling support")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/cpufreq/loongson2_cpufreq.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
> index 6a8e97896d38..1291db067559 100644
> --- a/drivers/cpufreq/loongson2_cpufreq.c
> +++ b/drivers/cpufreq/loongson2_cpufreq.c
> @@ -153,6 +153,9 @@ static int __init cpufreq_init(void)
>  		cpu_wait = loongson2_cpu_wait;
>  	}
>  
> +	if (ret)
> +		platform_driver_unregister(&platform_driver);
> +
>  	return ret;

diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index 6a8e97896d38..6f8f647efded 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -147,8 +147,9 @@ static int __init cpufreq_init(void)
                                  CPUFREQ_TRANSITION_NOTIFIER);
 
        ret = cpufreq_register_driver(&loongson2_cpufreq_driver);
-
-       if (!ret && !nowait) {
+       if (ret) {
+               platform_driver_unregister(&platform_driver);
+       } else if (!nowait) {
                saved_cpu_wait = cpu_wait;
                cpu_wait = loongson2_cpu_wait;
        }

Maybe a bit like this instead ?

-- 
viresh

