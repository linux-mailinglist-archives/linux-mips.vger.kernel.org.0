Return-Path: <linux-mips+bounces-4190-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5F92A77C
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 18:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79DE0281CC8
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jul 2024 16:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35AA146A63;
	Mon,  8 Jul 2024 16:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QPQDRduS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB13A143881
	for <linux-mips@vger.kernel.org>; Mon,  8 Jul 2024 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720456856; cv=none; b=LePV0zMc/c4aMPYPJfIFFO6Te53uob3ml1AP3kelrPJJRAHkQ17qgxv4fLxhepsyQFd790SXR7nvycfX302OotnQzoK6L7Y0LzP0E2nDNgtk7AvGWifcnuNJS+WpcDtVONBD96bCLLoAXOUTQfYJpVrdvZNaPcISEU91Pu3Dk3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720456856; c=relaxed/simple;
	bh=NMY7IXINjFtBIuRr/zxt90U+bZTuOpMWeifpxOkmw3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOxowbr9+yTt3d0hA6nvP/wBOsU3VMTjsgeaYQjA33J21D4N1xsh4TfgOXa2xnZEttMVCRpMMbXB11CnP5D3PgW1st8biUGn1CC3ziVxnBshn2ciSbsB+DrkKFATB2cVCHrLwdt4aeWZ1viTZEeZb7TTSeJ+FY1bQQUYIUIl8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QPQDRduS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4266bb98b4aso7946745e9.3
        for <linux-mips@vger.kernel.org>; Mon, 08 Jul 2024 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720456852; x=1721061652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94KAr4ELE0QjzDMH+V3YBSBrsKILCzYBksersdMzaIM=;
        b=QPQDRduSancfLKhnP4chtl/sGXPdEPtaBHPm6R73mDK2WKhs5u9gd5UV6yCR1vFoTv
         BuB7/dXp+bP6Jr2Guf1+adk/FEcn7k1VWHqugrB2elr4ww+FnFCZ4LVmZ4Q2ditIoJuK
         mSvkgXvfLTjJLaSYLgQk0MsG0K6VzySsDSsx1cTViL3lsmJtAkIMg/7uitLS0phaeKt+
         kJn/miZmRvA+OOcdRYgfWg2gyq1BvLjl9Bz5RTniSOYi5OeyTOV2r+lIyAfhV3YipTZo
         4z7gpo2scLcf9+AaQjgVdeXzpISkZ9H2duDpjxsqIsRCxU0TsuX9ejvoTVsTx7LYOyUg
         C2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720456852; x=1721061652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94KAr4ELE0QjzDMH+V3YBSBrsKILCzYBksersdMzaIM=;
        b=Ybqgyct//pAOm2mwPm5e/OZl5tolMgT9MW/1+56fDo2V+tqFsQtliZOnGRdxpk/nIY
         vQlmcMdP/Ikn8eImucVt2WlcBYHyCtC3d8L+xydwmKdz47YROT+vzKd/w5KtIGqD1OBy
         7ZemcleFDa3R1zy0T/dhWROlNomKST/CLBDsROKlj46NXDNXkBSzYp8C1bO23lkYGzdU
         ccSl9pCamoZVZFdKSfyin+UKM38HpidVzRi2nCWrndWAiOtnY5M+Ev0FmuFVrrxyn8Ae
         FS35zeN5nOSX6NWNM1HXQiobAEcD3lYn7m88h5M8DDT4rh7lU0MRn3d0ickxJFJ26Hba
         CniA==
X-Forwarded-Encrypted: i=1; AJvYcCWRPcb+OPFwTSPIIdXrvjKOyxwRCGhZI/SL/C41PiKBXnt1N87tlSfLN+01u96mIsl0qnmd8y1NLt7Gr/CvQWKSC9fN5FLEHo1tqg==
X-Gm-Message-State: AOJu0YxPvzfMBQLBwBk2kxvYFYvxBsh5wMfs29TSC3i7fYXKicobQDiE
	1CshTc4B3eMVbAd/joyxsZpdhOTouDI35L7AHtdK7wbSLH06ZEONlW7IOT5l/Yw=
X-Google-Smtp-Source: AGHT+IGs6bQ7nWrRNkbA7g34usxnJIV4s3YfBwqStJkvqaMPUVvz/yZhmMFC7Sllw6GqcdmCDXqyFQ==
X-Received: by 2002:a05:600c:22d4:b0:425:81bd:e5ee with SMTP id 5b1f17b1804b1-426707d07c5mr1322845e9.16.1720456852193;
        Mon, 08 Jul 2024 09:40:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:cf24:cce:17df:12ab? ([2a05:6e02:1041:c10:cf24:cce:17df:12ab])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6f20c0sm5077845e9.20.2024.07.08.09.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 09:40:51 -0700 (PDT)
Message-ID: <b2c8b349-4834-4b67-a970-c0aaaca9489d@linaro.org>
Date: Mon, 8 Jul 2024 18:40:51 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] MIPS: clocksource cumulative enhancements
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Serge Semin <fancer.lancer@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Maciej W. Rozycki"
 <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
 <ZoVtHkn1HuRy4SDw@alpha.franken.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <ZoVtHkn1HuRy4SDw@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03/07/2024 17:24, Thomas Bogendoerfer wrote:
> On Wed, Jun 12, 2024 at 09:54:27AM +0100, Jiaxun Yang wrote:
>> Hi all,
>>
>> This series combined many enhancements for MIPS clocksource subsystems,
>> It improved r4k count synchronisation process, clock source rating for
>> selection, sched_clock eligibility and so on.
>>
>> It seems fixed random RCU stall issue on Loongson 3A4000 multi-node
>> system and some boot failures on QEMU.
>>
>> Please review.
>>
>> Thanks
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> Changes in v2:
>> - Fix number of zeros in rating computation (Maciej)
>> - Only select HAVE_UNSTABLE_SCHED_CLOCK for SMP (Maciej)
>> - Link to v1: https://lore.kernel.org/r/20240511-mips-clks-v1-0-ddb4a10ee9f9@flygoat.com
>>
>> ---
>> Jiaxun Yang (7):
>>        MIPS: csrc-r4k: Refine rating computation
>>        MIPS: csrc-r4k: Apply verification clocksource flags
>>        MIPS: csrc-r4k: Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
>>        MIPS: csrc-r4k: Don't register as sched_clock if unfit
>>        MIPS: sync-r4k: Rework based on x86 tsc_sync
> 
> applied these patches to mips-next.
> 
>>        clocksource: mips-gic-timer: Refine rating computation
>>        clocksource: mips-gic-timer: Correct sched_clock width
> 
> looks like the remaining patches don't have any dependency to the other
> five patches, so they could just go via clocksource tree. BTW it would
> be good to split series in such cases.

Applied patches 6 and 7

Thanks

   -- Daniel

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


