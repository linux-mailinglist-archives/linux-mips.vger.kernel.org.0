Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AE8380B01
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 16:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230305AbhENOFs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 10:05:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43765 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhENOFr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 May 2021 10:05:47 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lhYQc-00034D-F8
        for linux-mips@vger.kernel.org; Fri, 14 May 2021 14:04:34 +0000
Received: by mail-ua1-f71.google.com with SMTP id u3-20020ab069c30000b02901ebe1c8da33so5483172uaq.7
        for <linux-mips@vger.kernel.org>; Fri, 14 May 2021 07:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QU/Hksxi2+pFDWpDvWUPYqDD7PqBm7YcgQmJYrRUtOY=;
        b=lPbtnqVMP12jayxaqw/4fIudHewpj41O8rsZmVLbbNaCSVDQUYU6ZPJebAPioqhr2j
         vfOaUv8zHMgoWVYvbdAlT6IStYvHtjiQ+QKWA1FNhLJGb6s2ebDJgJgl6dLbmfzUo97/
         yI/JgGy21ndgR/aWGoFVjjlWWOexKN55B4QB0Q8wacCtMkKwq9f46sWm9tokvkpGIiDk
         6uqB8LxyiZap4lKqlSte9iiUHg+EpSp9aXonYWIRn5bEmlFkTBV3ys8Vxp3kBReJ6UtJ
         zZ1u1xvadGbxNoVHZt0BPeMj2tTG/jK3cNbwxmRQkiWc+3PO4OyMv/kvNZoNY84IG8I1
         dvmQ==
X-Gm-Message-State: AOAM530fb0zTxxCktTWmKRV9OdmtU2SRcHK4jJki+c1bOoHts3K7cZZ2
        xOJa7XM9rhtQ7M4hxuCcnNKQpnhMiDWEdxinvXglkZRmHWF0QNtDClVyrSF8n0dwYZl3XZR7v+G
        OtVFmS6JRsil3XmakmS6e1Bq23t/CMBnLuXXWNvQ=
X-Received: by 2002:a1f:160c:: with SMTP id 12mr37650302vkw.25.1621001073612;
        Fri, 14 May 2021 07:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwylx1xY4Sf3udb6i6sdh04vHdujnzpZFF+f+9W/4TRbEFNhRCcUwNy8maLRsZ7g612dyKCKA==
X-Received: by 2002:a1f:160c:: with SMTP id 12mr37650275vkw.25.1621001073395;
        Fri, 14 May 2021 07:04:33 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id b2sm851232uaq.16.2021.05.14.07.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 07:04:32 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
Cc:     Lee Jones <lee.jones@linaro.org>, kernel test robot <lkp@intel.com>
References: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
 <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a15e7f62-12a0-1ec7-5104-f01f9e3eccc7@canonical.com>
Date:   Fri, 14 May 2021 10:04:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/05/2021 09:48, Guenter Roeck wrote:
> On 5/14/21 6:17 AM, Krzysztof Kozlowski wrote:
>> When rt2880_wdt watchdog driver is built as a module, the
>> rt_sysc_membase needs to be exported (it is being used via inlined
>> rt_sysc_r32):
>>
>>    ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> I don't see a recent change in the code. Has that problem been there
> all along ?

I think the problem was there always but 0-day builder did not hit it
until recently:
https://lore.kernel.org/lkml/202105082122.yrF7ploN-lkp@intel.com/


Best regards,
Krzysztof
