Return-Path: <linux-mips+bounces-6542-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4389B3F99
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 02:17:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23235282A8A
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 01:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF1A18027;
	Tue, 29 Oct 2024 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H/ujWaNN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1078C28E7
	for <linux-mips@vger.kernel.org>; Tue, 29 Oct 2024 01:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730164617; cv=none; b=ux+bYAz1byOzZpiRZrD/eyAPlvSPdpfE2FFdZb4QFnfKn/u/mLNZQSjSABH0GGoiPcVkTLCVwzWsCJs/RJV313qOcHkHxTQP+si3p+xLzZRiTAiptgmNqCdiXK5GfP0J9lrk6buiqimqIko9Sw5SPXl5Ll6zQjhf3S2nxLe7dcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730164617; c=relaxed/simple;
	bh=XjU2N7ht/OAjt69p6a7f9Sa1vMjQlU/Ia9TLk81D6NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c+ZGm/o+3h8uz7KGPLDsUh6AtKsB0OG/WBauhqI2KF7OSTSEzOEm+x+0lQyNy8ApwrFsi5zVjUg70ingNWwqJgRswIPh8tpNmsEA+2lJJbfsiXmtOO2dcMIzcQfmDwiqszN1hxoI1vK0op0wN/wD4LhphflXzGsE71xGkeQ8d8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H/ujWaNN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso45439055e9.3
        for <linux-mips@vger.kernel.org>; Mon, 28 Oct 2024 18:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730164613; x=1730769413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+NS/jF/AnOvxt/m+oEc5tqcdG3BnxwspGc+lnh+OT9I=;
        b=H/ujWaNNT/7zXBIKkRlW5uvgJ/L3aMhJ9E+nZZYrLVNcZy9lRVP1VTLC/AX9Y/P9g0
         9G35d/uhPGsZ+cf8vSFBSGU0V7ruy0KZmphaQuX/Wbb/5DA0JtGvDOJbbPf8qWBCnUvZ
         jVaoauzbm57Ja6HE3qEreyiKLMDyDwDt4Wl68jW4MM773KHJLt65989ZG6tCPNjHE0Zz
         Nlbzj+MMjlKDaGI/OfmKJGFRpDk1kntZfY2lLtYKfINmW379H1ncYbdvtiCrOYspdaYO
         hlkWBBYyM6g9NflY88AarMc1YxYEd4cbvs7PmZp7BqXJGoFGtEOsgRS3dafoK8ESfJZC
         JBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730164613; x=1730769413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+NS/jF/AnOvxt/m+oEc5tqcdG3BnxwspGc+lnh+OT9I=;
        b=F0V2Y7c+ZLnrvtny+bdg0NXb98lzyl9Xf4RNRcBNY/TlilM6wkZh9WKFPnVU/wvbRK
         doBIt71f7FRqhDuh59clfVZ3pWfnocMVE/wZYXyuHITBYjJgu+INf/iDew18TEtCxa7g
         Wjn5ULCaVCES29p1jL0kEjUP6rkg86RhMAVVXTBTD/2OnJ/0E5sq2pvXmoV2ZqcKKtTU
         7wrmNUiNh9OyE4gYfGWM+Nbxronb9PZZSUrQrYHjf5ciBOpjIr9oENvm5WnF44HryFZM
         dy6eyzSUo2XNCBdWAfnJxpfvOvrL2uoHQo+fZO0PoBzhGe5XVKZ8f9KpV0cnfwDZDvuY
         7IJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZg/D1zJ1VgtiiJYDMHxXpNDbJnM77AMMBmCogoXjYSbe3ZhMukO0bvrmnrf8gTx1LvzWzDBybiO03@vger.kernel.org
X-Gm-Message-State: AOJu0YwnHmPzgIWz/rj4ibyq2F/H52iD3+DgsgmBWfLIcBWJLKln/Fns
	wZ2GeGVQJb9AdpT1UL7wi9Ae+xuGF7w0qJ101i3s22hlFXlI8dI4W8Ld8DBMVis=
X-Google-Smtp-Source: AGHT+IG6ne6u8TTtfBcuIldU4nvlu3c6f4n7mjSIh9T3Asco84kHIwQjzGzmfLkTpz886CdMOevM3A==
X-Received: by 2002:a05:600c:1989:b0:431:5d4c:5eff with SMTP id 5b1f17b1804b1-4319ac75529mr89724295e9.2.1730164613376;
        Mon, 28 Oct 2024 18:16:53 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-431b437c80fsm7645615e9.0.2024.10.28.18.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 18:16:52 -0700 (PDT)
Message-ID: <fe3e80d4-9482-4df4-b6c4-f903a83a5cfa@linaro.org>
Date: Tue, 29 Oct 2024 02:16:51 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource: Add Ralink System Tick Counter driver
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, tsbogend@alpha.franken.de, john@phrozen.org,
 linux-kernel@vger.kernel.org, yangshiji66@outlook.com
References: <20241028203643.191268-1-sergio.paracuellos@gmail.com>
 <20241028203643.191268-2-sergio.paracuellos@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241028203643.191268-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2024 21:36, Sergio Paracuellos wrote:
> System Tick Counter is present on Ralink SoCs RT3352 and MT7620. This
> driver has been in 'arch/mips/ralink' directory since the beggining of
> Ralink architecture support. However, it can be moved into a more proper
> place in 'drivers/clocksource'. Hence add it here adding also support for
> compile test targets and reducing LOC in architecture code folder.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

