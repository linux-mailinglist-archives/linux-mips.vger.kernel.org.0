Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7C3943D6A6
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 00:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbhJ0WgM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Oct 2021 18:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbhJ0WgF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Oct 2021 18:36:05 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963BAC061224;
        Wed, 27 Oct 2021 15:33:09 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so3214700pjb.0;
        Wed, 27 Oct 2021 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LWiNtqMvOK1c6M/JXyzgbtBi/GZdiN3yImmaE+xZk/M=;
        b=Qe0Si4BqJZw/9LgcO4BSjHHlEviV5hqOlS/7jVcCkxxS8RzpaQmw52pjf9bsIr+ORX
         +SWHj8GQzbl4TtB5c18j0pga9I2AEe1wVmun/JngfGcwUZQ70Xy9akF235vZOmHeqE0A
         kJgpTQqkf5BG1P/qTreG/34AtYaZoDK9hSoUJ9M0FHjJRIqGmHO/Iyc1Tm23Rp/oNAur
         D/FRRPbU6ftQn6UI1vzli5zExv9TxFY7ospVMp/MBqbhaJfVHyOh93iudJv/eIoTPgJd
         aSA5jq9MSvq+Q8Wc5ZF3FPI/XpBi6n4888duCJ5IL+JJVSd+xXbI1LTU+/+F4c1Rs/PQ
         6SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LWiNtqMvOK1c6M/JXyzgbtBi/GZdiN3yImmaE+xZk/M=;
        b=qLC7IAIj7Mwaq+ZunVjE2D+tirjuuXYddgZEDFX5HPJ6BXCiZeEcz+IGXMemlo0RpQ
         kivZbGnggVSqkkG7Sp5ibIYP2kcLUO6adwYmJwfd8C1MB/rruSuq+GC8FfxcFI559LyR
         Q34wBEe/BIccA6XNrcRFMpRmKPQZwykKj8PHaSzjSLSj+iEZwy4mbuwLoWW5venc72Yr
         5NUMJon/kXRtPjmmqvk1G4ADuar7kYpgVQoaQi5bQLs+710LUdabFg99VRH0OFzhQ8IO
         cL7B7r7yzVNGwjmE0twEdgx3E/WRzXCcoWWF1dunOHWk0kJYK854XqVXPaG9bgvBuam7
         yKiw==
X-Gm-Message-State: AOAM5328XjRjMf9Bn6bCb7LYS9AIUmq4jXF6xyRtWDCuXv6PumPJ6HWB
        Nx0OG+q2hguxICFI+7nn2v0=
X-Google-Smtp-Source: ABdhPJyNCJcg8j6GLGpVyE8M6o88xhWDlwV9dhXUE3iTdx4v21uS4PDWlVw0ll9YZIC1HpWasdY0Ug==
X-Received: by 2002:a17:902:b111:b0:13f:48e1:9bc4 with SMTP id q17-20020a170902b11100b0013f48e19bc4mr475282plr.53.1635373989124;
        Wed, 27 Oct 2021 15:33:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k14sm693507pji.45.2021.10.27.15.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 15:33:08 -0700 (PDT)
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: add Broadcom's BCM63xx
 watchdog
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211027215531.9996-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <dfc39077-d20f-97ab-591b-d0cb25b6f1aa@gmail.com>
Date:   Wed, 27 Oct 2021 15:33:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027215531.9996-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/27/21 2:55 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a block that can be found on old MIPS devices as well as on
> relatively new BCM4908.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/watchdog/brcm,bcm63xx-wdt.yaml   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
> new file mode 100644
> index 000000000000..f89bdefdeb19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/brcm,bcm63xx-wdt.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/watchdog/brcm,bcm63xx-wdt.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: BCM63xx watchdog
> +
> +allOf:
> +  - $ref: "watchdog.yaml#"
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - brcm,bcm3368-wdt
> +      - brcm,bcm4908-wdt
> +      - brcm,bcm6328-wdt
> +      - brcm,bcm6338-wdt
> +      - brcm,bcm6345-wdt
> +      - brcm,bcm6348-wdt
> +      - brcm,bcm6358-wdt
> +      - brcm,bcm6362-wdt
> +      - brcm,bcm6368-wdt
> +      - brcm,bcm6838-wdt
> +      - brcm,bcm6848-wdt
> +      - brcm,bcm6858-wdt
> +      - brcm,bcm60333-wdt
> +      - brcm,bcm63138-wdt
> +      - brcm,bcm63148-wdt
> +      - brcm,bcm63268-wdt
> +      - brcm,bcm63381-wdt
> +      - brcm,bcm68360-wdt

That's a lot of compatible strings for a piece of hardware that has not
really change from the venerable BCM6345 days. I believe if you use only
"brcm,bcm6345-wdt" we ought to have everything covered. Similar to the
bcm63xx-uart binding.
-- 
Florian
