Return-Path: <linux-mips+bounces-11246-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF51B53CB4
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 21:51:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCDAC5C0BFA
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 19:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178CD2673B7;
	Thu, 11 Sep 2025 19:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYbqvfh0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1E263C8F
	for <linux-mips@vger.kernel.org>; Thu, 11 Sep 2025 19:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757620246; cv=none; b=WMxg4av64Fq9u7oRrOTkrt/LUh1m6lNTdKttmXCQU7Rxum6re13NBem76UxYOyoqSoWhWiiFhTK4Yh4fHzGhmBDJEgLEQuk/A3UlNxy+Vt4LpOYS19qPpVKQJ+Leh1re4Nq8esa5ajPY8cfXWhKZO79SLsi6o0Vhb6Oa6HV8YnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757620246; c=relaxed/simple;
	bh=kjGxb0dqWe7yMsPMZAV2sViKlRrgFATmcxKdL62xjMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgPnYUrNIK6JzGYgOIP7RquRC3PONxAvzwxsIOg193+hR+m8p9HPLWIjPmlciIpbG8cXmKp509twa1uw8gVLyZjCRiELkp4S4vf+m1g94SUZvlIJ86ywYPQ8H9ma2/UdL386byL1vCfraAJNY/bKJH7SgL1hkDAmvBZTPFniREg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYbqvfh0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2518a38e7e4so24220685ad.1
        for <linux-mips@vger.kernel.org>; Thu, 11 Sep 2025 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757620244; x=1758225044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=lYbqvfh0apVRXMw+txPj0wP76djiX9rgjxr4pMffpBBxgjA9QIxYKQvqPyWx8yFLYP
         8l/q3pWkuetePejx6oo+sURwayCHPh2fzsURenVJ14vSn2gFHhPb9MxOx66joJjW/AXm
         VVfnH8vC1kA7mDA2GGoaNyVgUbrQ/jUj17cTeAAEM8lqP4aYRAAZbJrLF1svu21pFe4I
         0ESLc0Pp/rY3tMipO/Wl7U37HbTdplJnH43xex4KBq+yB4vbnhBzRyGmLyOFQNFzKGUp
         i/rDcGTgEuyoH3u3E0YJ8eZWS72evKAgxCUJTw2wigD0TXH/sSyAc7ibOsNwXc0QwcWs
         58XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757620244; x=1758225044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=nfV3RahwR2yIQmO3lAcIOhC8ly05snP1qaJIIjxu/Q2fgbhcXbVrG7bAisEDEqmwd2
         7qO7CqfItEozbv+01FIwb5eogKxp4329ZJkjbwB1Er1HnpCu4+mQD6uqPWtjabkhO951
         WSG6arHmA0NVkmEKXBME/PCwZwToseSRIBztVFN4Ijcv3w4o8gBrlb8g67j6pybVNR5S
         AFQhpzYjg2KMhJwOHqVobYLT3CMrv5cMif4CGtQ7xh7sSrA/ftGx2bgA0TWLPLRHmPPs
         YLQGavVeUxgBEcy4bY6FYUTHUEFihkhnFf8h4wqA54u0HEXpA1xP9pwB21rLdno+SMJq
         lSZw==
X-Forwarded-Encrypted: i=1; AJvYcCXYDzq+TxWcBZePHQO0XY9TOOJVkCMBS8TSULh7v61LaOYvvASI4pJKW1fRcusADW1y7BM6p2DD8YnT@vger.kernel.org
X-Gm-Message-State: AOJu0YzwjxnnOfB/1bucLh1oxwxTFp1PmiiIx0qLpIDnyu0nGyx/NV64
	SAl3yAG186zosg8bAo0Ut8kbj+LierwH5Qd2tG8/NwukA4n/awZ2I9mw
X-Gm-Gg: ASbGncu17B5MWsOXc6YzD7mmZzLnrCEo5TLlB/eyeuAQbWyBfKOejeP3MpRY3XOtwFR
	S2xzRc0pMt9mCoQiAFB6rmtNZjBqLD84tqwUpqYtGFEgaJ6WmvWOcxJdssa825ON1x8YeZSy55e
	uT3M1UpQvbIEm2Uynfv7ZKUp5qS23bjMr9GQKHKAfaW2FPBpqmVsiPp4/wrzFSFq4Vob8mI2xby
	ppIsj8af0nUd6TURtq8K/VMazL92A8eCcVikew8FhHqGdmGt/5G0Y85AwKU3QqKkqTNWmiMkCgo
	JTicQkV1EM+hDjfVnnlcnrGImCX1kvm8KOU0U0KCErHDPz9rNiOu5fBOy+sy9SDjTXOJzeWG9xj
	JjJYDAneKA/s/b7pWPmlceaIBQmS6CPvKLbpDiyigF319x9tT
X-Google-Smtp-Source: AGHT+IGM3HY9cYe0k8sf5GxMMVgG9l2ykvqk4n7ayiGGr2GhLio6Ij8ygJsJDwHZ88T4ZvBeMdpxjA==
X-Received: by 2002:a17:902:d506:b0:25c:9084:4172 with SMTP id d9443c01a7336-25c908466d3mr25755745ad.14.1757620243626;
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Received: from [10.69.47.143] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc53bcsm26957775ad.28.2025.09.11.12.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Message-ID: <cfe7bc19-763f-4e92-b1ae-355c661bcc19@gmail.com>
Date: Thu, 11 Sep 2025 12:50:47 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
 <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
 <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/2025 12:56 AM, Bartosz Golaszewski wrote:
> On Thu, Sep 11, 2025 at 2:11 AM Doug Berger <opendmb@gmail.com> wrote:
>>
>>>
>>> @@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
>>>                 * be retained from S5 cold boot
>>>                 */
>>>                need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
>>> -             gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
>>> +             gpio_generic_write_reg(&bank->chip,
>>> +                                    reg_base + GIO_MASK(bank->id), 0);
>>>
>>>                err = gpiochip_add_data(gc, bank);
>>>                if (err) {
>>>
>> I suppose I'm OK with all of this, but I'm just curious about the longer
>> term plans for the member accesses. Is there an intent to have helpers
>> for things like?:
>> chip.gc.offset
>> chip.gc.ngpio
> 
> I don't think so. It would require an enormous effort and these fields
> in struct gpio_chip are pretty stable so there's no real reason for
> it.
> 
> Bart
Ok, so assuming struct gpio_chip is sticking around long term that makes 
sense to me.

Thanks!

Acked-by: Doug Berger <opendmb@gmail.com>

