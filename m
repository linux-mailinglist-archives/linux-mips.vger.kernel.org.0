Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCD344ABA6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 11:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244228AbhKIKlU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 05:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239413AbhKIKlU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 05:41:20 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47684C061764;
        Tue,  9 Nov 2021 02:38:34 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 207so17195094ljf.10;
        Tue, 09 Nov 2021 02:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=le8Bh1sXQkFqRDvAznIIoxJrnDHClOIi7rOb+080txQ=;
        b=ppPXFb1iqSEWjPKHr/gHT/wFMi8GXgxkURaFBfEY/+DV0cx6Uz+gyi5VNjuJqhK9vM
         YLjboE5Iw9cJUHqikakQ2aUv/YAGydszKCeXLvPKebMBgP9j+K4XFRy22FFQAESdnlXF
         zweRCveRqS6n8f52xCSoK/0kj39AhhzdoUFaG3dgfYEAtrLdlV41M6h8+pce36LkLJc9
         GeH2TGGjxcS+Jv+tI2Vr4a1P3AOFEdIGQyh/WevQpxxmndaT6wXQ8arGq/iqPrFK6iFL
         2+R2TxpAmebzh1J//7w49qr9LNbUNru8vWZtL1q8azqecBsYSo2l4HP+HWoQ/Wr7ztOE
         KPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=le8Bh1sXQkFqRDvAznIIoxJrnDHClOIi7rOb+080txQ=;
        b=Sx6I2tnvfCTQt5b0cSqKahC7aYEggeNCO+p/A5QGv8t7rJXj8iYPVviHHUsJ02xAOl
         H7fmSpRkwqWlENz2KVt/hFHnLaGwPzfQROiftm7Zjqhgl4Y3ZvCs8O/CIvJVd+f9Z8HN
         o2Lv7QQ8os2d9o1w75O+8BEBx2q2v3+C0e3P9BITzHJEdNEpEeWO83IALCq9OJ1MxrBD
         71+f5xfmjF04A1iRZEXgruOXyxJ3XRw6Gb3OFrT33TrkPD/eHwOQHZinyPVqeawzxcL7
         Z79FcwDLkmhdh7dpI2183888onT19pWjEPq7ptLH1YOSlG6B3ePqOZGdWNsHqM3vDJTS
         QSMw==
X-Gm-Message-State: AOAM5314mLTdcd/1N+ZTGxpusGg7HSxGZwOGDPUHyG/1lFBlnuEgajHh
        qXet4NSjItAsjpwLbx2boSQ=
X-Google-Smtp-Source: ABdhPJwE1WI990S6Ueb49S9xNyRSmAfn1H7xZQmhZKQjOaqo9eRhz7hSLiSIILni0afJlrjbbeh+AA==
X-Received: by 2002:a05:651c:1411:: with SMTP id u17mr6565829lje.483.1636454312587;
        Tue, 09 Nov 2021 02:38:32 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id k23sm673836ljg.139.2021.11.09.02.38.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 02:38:32 -0800 (PST)
Message-ID: <f54640c8-941a-d4c2-822b-9b21bc134811@gmail.com>
Date:   Tue, 9 Nov 2021 11:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH v4 5/7] watchdog: bcm7038_wdt: Add platform device id for
 bcm63xx-wdt
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "maintainer:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Justin Chen <justinpopo6@gmail.com>,
        "open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "moderated list:BROADCOM BCM63XX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20211105154208.614260-1-f.fainelli@gmail.com>
 <20211105154208.614260-6-f.fainelli@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20211105154208.614260-6-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05.11.2021 16:42, Florian Fainelli wrote:
> In order to phase out bcm63xx_wdt and use bcm7038_wdt instead, introduce
> a platform_device_id table that allows both names to be matched.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   drivers/watchdog/bcm7038_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/bcm7038_wdt.c b/drivers/watchdog/bcm7038_wdt.c
> index 506cd7ef9c77..a8a0e8485125 100644
> --- a/drivers/watchdog/bcm7038_wdt.c
> +++ b/drivers/watchdog/bcm7038_wdt.c
> @@ -223,8 +223,16 @@ static const struct of_device_id bcm7038_wdt_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, bcm7038_wdt_match);
>   
> +static const struct platform_device_id bcm7038_wdt_devtype[] = {
> +	{ .name = "bcm7038-wdt" },
> +	{ .name = "bcm63xx-wdt" },
> +	{ /* sentinel */ },
> +};

I don't think I received answer on this: do we really need or want
"bcm7038-wdt" there? BCM7038 uses DT so it should never use a platform
devices created by arch code.
