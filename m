Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 964A143D696
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 00:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbhJ0WbZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 18:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbhJ0WbY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Oct 2021 18:31:24 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201EAC061570;
        Wed, 27 Oct 2021 15:28:59 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id in13so817026pjb.1;
        Wed, 27 Oct 2021 15:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ts7jQwvxo7Esv/bJT5YrOOKnlyDGF2TkgNS9/cVB0Xw=;
        b=PDpS1Uz8xBPiXrmKnw6VN4A+Jlasl/WUpaZ9r8ZkkrI90ZdrHhX/peCmwjt0lT5UeL
         goz5ILtNrroZdOgrLmTt0vrCCFRejt/gsH6inFvfk4qS9MFOPfJgocfdoe++1c6n4d9k
         FZ9zVr9MvDkNTRUjr6YdxNne29A/62HTEUol36dWq6vRBVjUYICwZEVoDhB4nHZbzJmA
         VjITdAbSvCEfX1A1nvcSjSpDbT0YhOcYBRJkhEnvgPPyBEoEDs2Uy/IOObn/OziA84Un
         vg9n0b6eW27q+tNwD2vJmCctz9vmSMQH2Ckg1lPzSArJBcSJSznIgMd0Ca6mBjx8F8Fd
         aJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ts7jQwvxo7Esv/bJT5YrOOKnlyDGF2TkgNS9/cVB0Xw=;
        b=x0bW1Tybo73t4G9RXHip97UZRHNXwm4ur+h2a4JpWFKuQl95mXuIKSdvSugk1wPqjs
         TIDiOLOiuYcx8mKyDg3qURRrgEVrHz/LJd7Z25Z9qTrKJbWnu0Fn68WF1LMs+WntWKW3
         LjL7O9yLtji3qNXHhqAy3sqhpL68pnPC556kMvts3peZhe4k5FnXy4O364W4UoTUhPRJ
         cTsGjAOYuT1HI1I13/J53JS4DV/yAj5hcE7EV4X3sxhV+EkNGcOzMZZj5uOiZg3t0/sy
         32j1mhedFIm8h1RYXeBH78QHVDUMikpN5iq4tdmm4LFIb/wGuyZDkbHIskE8p5VvdKOc
         b57w==
X-Gm-Message-State: AOAM531pJkys6exrURWRwmxzVICTNoiedSKq+9Ru6SUmXZ6XJK8rWWmD
        r30EG8czVOJ/o3yHFCqCunE=
X-Google-Smtp-Source: ABdhPJz3640rQYhKT4HCqWVeTovoH/x9LWBvXnkN2DOg+41qBmG0k2k5nBtT42TMCd3Zbt+ATQS+mA==
X-Received: by 2002:a17:902:c215:b0:141:690a:863a with SMTP id 21-20020a170902c21500b00141690a863amr313595pll.22.1635373738647;
        Wed, 27 Oct 2021 15:28:58 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id i5sm718446pgo.36.2021.10.27.15.28.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 15:28:58 -0700 (PDT)
Subject: Re: [PATCH 3/3] watchdog: bcm63xx_wdt: support BCM4908
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211027215531.9996-1-zajec5@gmail.com>
 <20211027215531.9996-3-zajec5@gmail.com>
 <20211027222213.GB342815@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <35519aa4-266e-04f4-baed-fa41f2b2d989@gmail.com>
Date:   Wed, 27 Oct 2021 15:28:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027222213.GB342815@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/27/21 3:22 PM, Guenter Roeck wrote:
> On Wed, Oct 27, 2021 at 11:55:31PM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> So far bcm63xx_wdt included support for Broadcom's watchdog block of old
>> MIPS devices only. It was also a fully platform (non-DT) driver.
>>
>> The same block was recently found on BCM4908 with just a slightly
>> different registers layout. Extend this driver to support OF and add
>> support for per-chipset registers offsets.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Please convert the driver to use the watchdog subsystem first.
> Also, when doing so, please explain why you don't use the bcm7038
> driver instead, since it serves the same hardware interface and
> already supports the watchdog core.

This is too ugly unfortunately so yes let us use bcm7038_wdt.c and let
me know if you need help with converting arch/mips/bcm63xx to use the
bcm7038_wdt.c
-- 
Florian
