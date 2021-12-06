Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6784046A981
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 22:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350559AbhLFVRz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 16:17:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350552AbhLFVRk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 16:17:40 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA22C0613F8;
        Mon,  6 Dec 2021 13:14:11 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id c32so28521656lfv.4;
        Mon, 06 Dec 2021 13:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=Nx7S1cnq+28Fds8BpEVp8gHA/k3oxCu0wS/EiP4WnR4=;
        b=ciwA2OG3/k5/DwImLuS7SlZ2eBaDRSvJz5llDzSA04JOYK315BDWljz8IcRkRUNYGN
         1mEaVOjxYRteQzZwtWo4uL+mbK61F0D0nrxeN0tI9gaDKgdFCFhuihxIDBBRT6Y2I8LG
         gTHDQL5AMRImr+N2xdySzZvv+70viT+2Y1IxsGOIvO853bA74SFlHUUI+JeVSr/luuBJ
         Wldk/QvvdSgXMRTRbdLnUXzKyx87IQnNg5eeEkrOPqcTGWzUnHzcLecqazKFwknSMg1h
         esLoK5PZWyy6bvHYYuyvvASXH6Ald4yHuGYL8NGJcfXWFBH5CDsDu779L2W2hcAaz38E
         Q5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Nx7S1cnq+28Fds8BpEVp8gHA/k3oxCu0wS/EiP4WnR4=;
        b=DaIukzZrFoUycJDLQ2/HcH1xpxpC1BGKGVK5NekX66rcW+YWlEaDSD3Tvu4cAnu4Oe
         mqmxGv1/o4Sd5MQz4akckx29MBecN37927GX1610D2M9NPpUVHLxm0KDDlbmglZ0myhL
         LmGrZ0S/fP+6rBTPi5eRr/CB2N7ys2e4r8wU6clFfbKUbq68UQe3hqYKbabkzvjX0iFZ
         5msZxou0JpIauYkqs0OIk+KFH2uVQA5AHacgAJnQDN2kQ7H/ixGXmpf2GLglx2Pssgcc
         FpEJzFusVPD40ziJYpDnHVmPcBJJqSIVZ7CI5SguGYGsX5Fh/3G6C58kD7SetMksx+R4
         l7jQ==
X-Gm-Message-State: AOAM533F0K7AQgCAIxP9S3uzBk5KevkCg4MM4tFeyE5lYEvDQ98WE4cF
        CvgTF2QCgwvDSceLVRxj9lw=
X-Google-Smtp-Source: ABdhPJwXINiCNeBaG/LblOtNnudsko5e4i0c+u20gDuX2xRcTZLYNtPtqVeQoA7aNPO6/cYB+17G+w==
X-Received: by 2002:a05:6512:39ca:: with SMTP id k10mr38007908lfu.426.1638825249741;
        Mon, 06 Dec 2021 13:14:09 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id 1sm1372137ljq.102.2021.12.06.13.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 13:14:09 -0800 (PST)
Message-ID: <18ae3b7a-ba7f-44d5-db82-aa9429cf0d3a@gmail.com>
Date:   Mon, 6 Dec 2021 22:14:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
 <Ya3NaVKf1NRc8rrx@google.com>
 <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
 <Ya3SU6U6YT6mlFu8@google.com>
 <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
 <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
 <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06.12.2021 20:43, Florian Fainelli wrote:
> On 12/6/21 11:37 AM, Guenter Roeck wrote:
>> On 12/6/21 11:13 AM, Florian Fainelli wrote:
>>> There is simply no rush in getting the bcm7038-wdt driver to support
>>> 4908 *just now*, so why don't you just take the bcm63xx-wdt series that
>>> I posed, and Rafal posts an updated series that adds support for the
>>> 4908 watchdog for the 5.18 cycle?
>>>
>>
>> Your series includes the patch discussed here, and it is the first patch
>> of your series. The second patch in your series depends on it. Are you
>> telling me that I should drop those two patches from your series ?
> 
> No, quite the contrary, I want you to keep the entire 7 patches that
> converted the bcm7038-wdt binding to YAML and get rid of the bcm63xx-wdt
> changes, the branch that you have right now is good in that regard.
> 
> I don't see why you should be creating an immutable branch for Lee and
> not simply merge Rafal's "[PATCH V4 RESEND 2/2] dt-bindings: mfd: add
> Broadcom's Timer-Watchdog block" patch with Lee's ack directly. This is
> a new file, so I don't see how it would create conflicts as long as we
> don't pile up changes on top.

I'd like that pretty much as I wouldn't need to wait few extra months.

Lee: would that be OK for you to simply ack 2/2? So Guenter can pick my
patch without the whole immutable branch & PR thing?
