Return-Path: <linux-mips+bounces-7856-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDC0A3BE50
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 13:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EC357A637F
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2025 12:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEC81DED62;
	Wed, 19 Feb 2025 12:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G0F1ro7W"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3861C8618
	for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 12:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739968730; cv=none; b=s+KKOxgpTW2IEY2wI6bLAqANFoMkJlG+h6CW3ZMjVGEKmTI8UzRK1ZkSXxFdUBcUhkollulZX4sHwO0KGlv1200+LKBeYFAn76M8LGHRUNRsenM4Ln7iSSHCKk09Sfa1o0hXjl9qpFBJ6HC7yzS4ww2UR1t65Y3kXrp2XLhb3NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739968730; c=relaxed/simple;
	bh=ZZIZuTeaAoFO/P3zdlI6Eu5y/BY1YCPLBFDq51YFA1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=barILJFOrMcEJBEzD4hJuzUjEgm6/E2TSnkJUeaCQdO2kapDxU69/7jjXQ9N1BW25OgEEDDCl8o7vlpO5TMJeX/74QjXP53iipkluwjlwPTt4umJcVi5XKGzMfFoaqtbqWBs14jLG7+hTuyyZaZTg8tjYNnHmRxRsR/v2U31SPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G0F1ro7W; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4398e3dfc66so24836405e9.0
        for <linux-mips@vger.kernel.org>; Wed, 19 Feb 2025 04:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739968727; x=1740573527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wj3JrNUhg35mjfieRS2TI+7IeiK1zMMxQs4U9cM29c=;
        b=G0F1ro7WuMopAkx4nWm1fesaru8jeYKdmx6wsceqcpeJwpR7lwgiz0he68aqgHLQOB
         SP4WF5cRhb7URYm5egE+Nj6/++cCvBd+F3AhO6r093quWp39YRrJTK/xEMrmx5A9dqsP
         0Ul5XpnANKbkUBYA3o7CwGs/T9ZTDHYjhrUaWEI+hyQtAnW17k8Fe7eebbfixVu7DN2m
         QB6G9JGA+jlaRmX8zDRuGyymXkmE/6l+DaH/aNyhT++HRcmkap2vesB0vuqsObh/kCvh
         yQ+jHS+affElNj40jGsqPY+qJWcdULyp0ULk9lVANgdajlPdVu4C6orHxkSUA80znUgp
         tD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739968727; x=1740573527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wj3JrNUhg35mjfieRS2TI+7IeiK1zMMxQs4U9cM29c=;
        b=f6m/CdqYIp2jWHqGM5Q3W8xrDss10nh+MtDsc83CsG5KDdA+NiC+aPXtvc12Iqz5Av
         HePBOyrcKJ+Jx6A/L+Yd1NpPqUEUAykZRm3co6V/oZ22gMCGh2xjXNkR4hZfWnPcaKKS
         ak7FgcCLoc1+3LOk0jwGW4fEb5eveeyMh2lfsCNESyZU43es01KmEielVhtqQgYytysn
         5V/HhSc22QyhT0BQPEJyqEkLQYA1t+U/3aeHgELP0O5oI9sBc6mcxttnCPAR8PZ5NnLf
         LJQCmuVx4n3hh3Kzxq2kNPF2gMqlpYizUNxM5EXcq6gmHpGaNvSlio4Vv6bnidkBej5J
         iZ/A==
X-Forwarded-Encrypted: i=1; AJvYcCWXAgQPm0RGM9piw4LlRvuPdUva807+ndVGAKwEVL1P6SrOH3wGD3V2WEugSCW7SMBvq5qy3OvPCwsW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9dR6gcc7gyL8Rg8CmUaVEu1PpaE/LbPiyGYaS7Ta1iHCNQWwB
	swEntTFchoiR4LT6qjk53ykNXgcC4MqD5UAEPJ6h5jeBDiU49dDxVPldm+sQZh8=
X-Gm-Gg: ASbGncuVSzFpteSh5nLS+KZc0wI0Cv5OvQgTZDzOVcw6Opn1xsMLtN+M0XhME+wkSRn
	4H6WOSN4Rl/GZe302ZMLA56mO1Ts9H4WeL69QW99WNWT7JyGzE5nc8N7i+2HpSPg1CcUcW6s/Xr
	HY1uVj375jSpqSG6uRGlZbEHE23NnxgOYCtfTLacppcbqVAb36eWTS95eePhNuXuY+VDJnRXb8X
	qrtl/m8fVaI+kLj9dWK8BYVy0UjA2wu1JnEXaAamcuLCiaWsUBHGUOb/FQ3mp9qStcLw7gPIU6Y
	iCQgMTNy4Zl/kLowIm/x14WsuqBCtd1x81FQP6ww5DykRxI8cYh3NEU=
X-Google-Smtp-Source: AGHT+IEHJKEFS1/VXZbvg78fmSTXn4dztJg0x/bM2Gn3fvw76lknofTT3eKLDhhDFYuIqpL40BKnFQ==
X-Received: by 2002:a05:600c:5124:b0:439:6ab6:5d45 with SMTP id 5b1f17b1804b1-43999ddae20mr30956125e9.28.1739968726833;
        Wed, 19 Feb 2025 04:38:46 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38f258b43d4sm17488976f8f.4.2025.02.19.04.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 04:38:46 -0800 (PST)
Message-ID: <c65a86a5-fc65-4144-b780-ed9e8a59f1ab@linaro.org>
Date: Wed, 19 Feb 2025 13:38:45 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] clocksource: mips-gic-timer: Enable counter when
 CPUs start
To: Aleksandar Rikalo <arikalo@gmail.com>, linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Serge Semin <fancer.lancer@gmail.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Paul Burton <paulburton@kernel.org>,
 Chao-ying Fu <cfu@mips.com>,
 Djordje Todorovic <djordje.todorovic@htecgroup.com>
References: <20250129123250.711910-1-arikalo@gmail.com>
 <20250129123250.711910-2-arikalo@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250129123250.711910-2-arikalo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/01/2025 13:32, Aleksandar Rikalo wrote:
> From: Paul Burton <paulburton@kernel.org>
> 
> In multi-cluster MIPS I6500 systems there is a GIC in each cluster,
> each with its own counter. When a cluster powers up the counter will
> be stopped, with the COUNTSTOP bit set in the GIC_CONFIG register.
> 
> In single cluster systems, it has been fine to clear COUNTSTOP once
> in gic_clocksource_of_init() to start the counter. In multi-cluster
> systems, this will only have started the counter in the boot cluster,
> and any CPUs in other clusters will find their counter stopped which
> will break the GIC clock_event_device.
> 
> Resolve this by having CPUs clear the COUNTSTOP bit when they come
> online, using the existing gic_starting_cpu() CPU hotplug callback. This
> will allow CPUs in secondary clusters to ensure that the cluster's GIC
> counter is running as expected.
> 
> Signed-off-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

