Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B8B243E61F
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 18:29:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhJ1QcR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 12:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhJ1QcQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 12:32:16 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2F5C061570;
        Thu, 28 Oct 2021 09:29:49 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so1556245pjc.4;
        Thu, 28 Oct 2021 09:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iOMV47zPl+WXbviyBiqlGpEOAdHC+x+zs56ErTuovVc=;
        b=pL7Bgh3tX9dNjUtKyckQRc2XeD6p6QKslnDUItLeTZ+KIFqI8imYlti7k6O002UtNI
         CdcDCTnzq9rRBjKIDxAFjj6Xsy8/bxxfWQfGHFgpBflqJLWLbrEdtHFsIIXt7UYdDoTe
         q+B5cRJwdfPB80P8oEEApP5ur4+xVl/sQoB7QtuA5S/UacVm+4A8EZglenAywIge6U2J
         rx+HyUJ26dKdW/3Z/rDyElVfCdWslQc6dtyrqbE78OfRfmgS7AbQ2eavr41w9/zZ4ay8
         QRBG85zDfRe2Z8QpsdQRpyk7W54V6xptNJUUSD+IgX7OYQqcVH2HZg/x5LNm8AFHr4FV
         nSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iOMV47zPl+WXbviyBiqlGpEOAdHC+x+zs56ErTuovVc=;
        b=lrsmagPccaF1wiUGmXBpnoKHvDSL12AzYnqBZY5QgvZpVx+cOgdPgAa7IrYNrI0S3T
         dEdyNnpkrhVfOIAq6//1lqpT6p3JtHEGKEWN5co9mZoN9FAenOPXfrm8pQjscrSblwxs
         BpNavOH+Pyo3jsBkVhDYpnU/Xpi0oq+iiiqZzP+Od84qklhYTuIdOqsLgquE2diTC9cS
         VqWD1BWAHA5pjYeJUtIrOEpELy2ZTmplRb1Ds67vN1Glt8TiM+VlN8l2MyNIvd4CAOon
         f/NFUicOJnMaAdygpy5d4LZKX8VudCKBIUYoHFphmIOaJNPgCnP6IxiDKDvF76/c1inA
         zAyw==
X-Gm-Message-State: AOAM531H8pFPMjRh/fUGCG35OE60CX+FDDCkbbgLjb2ItYrp/UUpMLXF
        +AQghaHNUKtTXs4l2LkN3OY=
X-Google-Smtp-Source: ABdhPJxbv77NUT6Q6Ou4dZoDsM+bgTIO25Un8DnF+mGPV5GA9+oGHexjWDC0g96hlAWDmoCYUuS6Hw==
X-Received: by 2002:a17:90a:7e13:: with SMTP id i19mr5574766pjl.120.1635438589365;
        Thu, 28 Oct 2021 09:29:49 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id mr2sm2411672pjb.25.2021.10.28.09.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 09:29:48 -0700 (PDT)
Subject: Re: [PATCH 3/3] watchdog: bcm7038_wdt: support BCM4908 SoC
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211028093059.32535-1-zajec5@gmail.com>
 <20211028093059.32535-3-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f78d1573-4909-039d-8647-d4fc13205f47@gmail.com>
Date:   Thu, 28 Oct 2021 09:29:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028093059.32535-3-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/28/21 2:30 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Hardware supported by this driver goes back to the old bcm63xx days. It
> was then reused in BCM7038 and later also in BCM4908.
> 
> Depending on SoC model registers layout differs a bit. This commit
> introduces support for per-chipset registers offsets & adds BCM4908
> layout.
> 
> Later on BCM63xx SoCs support should be added too (probably as platform
> devices due to missing DT). Eventually this driver should replace
> bcm63xx_wdt.c.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

[snip]

> +
> +static const u16 bcm7038_wdt_regs_bcm4908[] = {
> +	[BCM63XX_WDT_REG_DEFVAL]	= 0x28,
> +	[BCM63XX_WDT_REG_CTL]		= 0x2c,
> +	[BCM63XX_WDT_REG_SOFTRESET]	= 0x34,

I don't understand what you are doing here and why you are not
offsetting the "reg" property appropriately when you create your
bcm4908-wdt Device Tree node such that the base starts at 0, and the
existing driver becomes usable as-is. This does not make any sense to me
when it is obviously the simplest way to make the driver "accept" the
resource being passed.

I am going to send my patch series converting the bcm63xx_wdt.c driver
over to bcm7038_wdt.c, feel free to use or discard it.
-- 
Florian
