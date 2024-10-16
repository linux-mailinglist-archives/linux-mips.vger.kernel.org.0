Return-Path: <linux-mips+bounces-6082-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A97C9A061A
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2024 11:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CAB3284CB1
	for <lists+linux-mips@lfdr.de>; Wed, 16 Oct 2024 09:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C145206069;
	Wed, 16 Oct 2024 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OK3f/FjE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094AA204F94
	for <linux-mips@vger.kernel.org>; Wed, 16 Oct 2024 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072238; cv=none; b=sQCvhA3LgFhHQluw9B9KZ5itjyrT3fYNqfPGd139CJbVM9Waw2Bd1TtNqwcYvT9GwfvedBIJCioQx1oWxmt+bN8Tz0w5iQVR9A0lbP8lpRaRGj2KMe2LIdhAWd8Vndm1tcNc4E1xYV8Mwy5PIybZYfX/kGAwMHral662t/wyX4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072238; c=relaxed/simple;
	bh=gKfhZS8VL11gmiSVbPzW7rWHgLUL89WS0lvu6n/GkAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qrq4EHGE0gdQaTfXZ4mUxGo4+3dOlFxUc+WrkDH4jPbsF55PL4UJsGZ2YPDwOSbiNICibB00bTE7STwZIBSUZ40ca4/erYe2t5YlA5S0Q7XKMLFoXjVmzUsGG4hNA2B3ds/xIESwmFaB45LogzBmDXuLIV6PWiJVXmbFyG/oc/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OK3f/FjE; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so3878908a12.3
        for <linux-mips@vger.kernel.org>; Wed, 16 Oct 2024 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729072236; x=1729677036; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IuhWEQRkk63CsbZ+cS6salQFFe2QOXgNb9woXoTYN0g=;
        b=OK3f/FjECwyy1e/ULYCLvVvA5q/vcaWd/zwOezVPhWAfeYIe7z0/n1tqUZeoz11jbu
         HEDYgCa6Iu26b/hRK4o+Lp+VeYfulIrmo4O3rinKMgmTjfQ06HO9F97zWyo+vjuLV7GG
         IbLBP+ggoh69hIEMqQvkKn761DnFxcXIc8E7urUFGJ8jA5UzOX/P7A9aNDNBUGJGNRlj
         CJcnnpNM39Y6JbS3azSTpL1w8K3BMYGtTTxeDCrCA0+ALZqcXuVTf8N+H8Msk7BPkWba
         aIih5WOa/3fsCtfHFEWHDc68vOV9KdwHuKF2pMeWiD686BFVwVhUCnZEBwAjQnVaican
         HlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072236; x=1729677036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuhWEQRkk63CsbZ+cS6salQFFe2QOXgNb9woXoTYN0g=;
        b=kDXaUiZVso81jpMkToCHG/pAsoZqp1W5utBALcErJpEqtnJ7tmbvZYGjsb0tcFXx+y
         J7SmbpPN0+weK/oVXeKa5+9LS8Fr/RMmfeyLgtISaKrv2zVEqtSrUIFDbUUdBSn9wy26
         n3TVc8XeEceQ9LzF3CjWTuXZTDL/FUAfKA1Y0KRKsEn7wvQ1qPofBVDb2T9n2AB13afU
         ycqAEtoNw2aF+vAXN1fav3+XFlDsS2UmRHV2diKYdJvN46FpSfRwXZmiQqJnTMmvZcQA
         kZPmrMQlwf4bsQ2nBgBpButeG24yxclQ0Po9GfJvm3nZfxMVWd5xweU6TFm0W48lohhJ
         v/uw==
X-Forwarded-Encrypted: i=1; AJvYcCWE4nJBHrZXRdeN7zQa2W5IHyJ5FzODc6xSGglFbaSuUrdEPQ5zWrivYB7cMzB+lTcvXyfxHYPXd+vj@vger.kernel.org
X-Gm-Message-State: AOJu0YxdzPdQhkwyh/RRQ+W8UeIvipvtc2UYSuSCMgR34N7rdyPOd6Kl
	C8vWtwTwrHcUYAKe9xW81i8H01dKJCIzWD1JwLyC5WeRf20Gge97a1PKY4J9b5M=
X-Google-Smtp-Source: AGHT+IFfiD66oi4uFKIKHIYFPilxzcNoxMVMTkobjqP09YW+RWP27tr8+YT264TCeDV0Y3OwkQ+NnQ==
X-Received: by 2002:a05:6a21:1508:b0:1d8:ac0b:2f63 with SMTP id adf61e73a8af0-1d905f83b59mr4099484637.47.1729072236353;
        Wed, 16 Oct 2024 02:50:36 -0700 (PDT)
Received: from localhost ([122.172.84.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77509db5sm2697196b3a.198.2024.10.16.02.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 02:50:35 -0700 (PDT)
Date: Wed, 16 Oct 2024 15:20:33 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yuan Can <yuancan@huawei.com>
Cc: jiaxun.yang@flygoat.com, rafael@kernel.org, ralf@linux-mips.org,
	wuzhangjin@gmail.com, linux-mips@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: loongson2: Unregister platform_driver on
 failure
Message-ID: <20241016095033.5npga65f4wv4xm76@vireshk-i7>
References: <20241016090615.128678-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016090615.128678-1-yuancan@huawei.com>

On 16-10-24, 17:06, Yuan Can wrote:
> When cpufreq_register_driver() returns error, the cpufreq_init() returns
> without unregister platform_driver, fix by add missing
> platform_driver_unregister() when cpufreq_register_driver() failed.
> 
> Fixes: f8ede0f700f5 ("MIPS: Loongson 2F: Add CPU frequency scaling support")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> Changes since v1:
> - Change to style suggested by Viresh Kumar.
> ---
>  drivers/cpufreq/loongson2_cpufreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
> index 6a8e97896d38..ed1a6dbad638 100644
> --- a/drivers/cpufreq/loongson2_cpufreq.c
> +++ b/drivers/cpufreq/loongson2_cpufreq.c
> @@ -148,7 +148,9 @@ static int __init cpufreq_init(void)
>  
>  	ret = cpufreq_register_driver(&loongson2_cpufreq_driver);
>  
> -	if (!ret && !nowait) {
> +	if (ret) {
> +		platform_driver_unregister(&platform_driver);
> +	} else if (!nowait) {
>  		saved_cpu_wait = cpu_wait;
>  		cpu_wait = loongson2_cpu_wait;
>  	}

Applied. Thanks.

-- 
viresh

