Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C423339E0
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 11:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhCJKXz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 05:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbhCJKXo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Mar 2021 05:23:44 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D210EC061760
        for <linux-mips@vger.kernel.org>; Wed, 10 Mar 2021 02:23:43 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id h98so22635404wrh.11
        for <linux-mips@vger.kernel.org>; Wed, 10 Mar 2021 02:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i9Y/lpV+3eqs1cpuuW1CZ+hgCgLS+DhozHv8ISeLWGY=;
        b=Kfeii9nE4ZKnTyWx5UmmhF9q83vyk22XkyetBGYNVMxzVKsL+Lclpqh9POFCia192v
         9dcnjnOoaDwCmXqqU/KwcNLrGkAppGI2Xp+fhMaof6d6EhDVwovryi2gPZKooIhV1NpG
         YyxpR8/62q0ejk+CGMVVTgWTOzISJ4Fct5IdvrxJBdoGDMsby0OdO/U2hcVzb2GNarqh
         I7TjAiSigO/wFTsTrJWdr612nFVgebzxyIL4iAv7YNVOfALPp6kjLuxgw0SaXwh8zxQj
         qGOQR0vHKruzgA367zRYENg+2kkxXB1i1JM0/vMxn6RmbKcaNhtDAOWQirobmlxrInaP
         F5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i9Y/lpV+3eqs1cpuuW1CZ+hgCgLS+DhozHv8ISeLWGY=;
        b=k1FNmWLkIqft04XG2PM6SFyJMYEoaJKoX9avWI47QPPbZe3liF9Xwk6QXV3FgCbyPA
         A8HTMc3mA2WHxhfQTKAIASIf+keZHVdwiyVheYSskzkxcBlJdzWbexS1p8h5Brz6xLiQ
         wpkzvaEk+YMwt2BXOw77KQK3o+Y4+tvLaRKpwh2XZn1VUJ4WOM7ymeUVo6WxT/wCVutY
         jZ6HSeOlav62PqQej9USXStamklCmyWriXI+KHLb0KBWoX11O3ikq9HFQgouKPyYt9Bb
         civQKT05Weh/Ji9AsjTJECDcMF1uGww61mfBgQrLA/Hc1aPXSCZBlFQMbXjbRiVkw/TV
         VsJA==
X-Gm-Message-State: AOAM53215vbcQqEiYQp80yvGkLpV5iP43BlWM4HWgx1ksdPXe3WSpSWP
        ELOESkwwdlzQTA4gsVdj7J1xdg==
X-Google-Smtp-Source: ABdhPJxn9ebVqJvF8ImEFbKjT1QeBgvP7bS2omQk3vudL3fVsjieqKX/wP2R0dHt3jbY8soFgYzPeA==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr2827756wrt.111.1615371822522;
        Wed, 10 Mar 2021 02:23:42 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id r7sm29118896wre.25.2021.03.10.02.23.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 02:23:41 -0800 (PST)
Subject: Re: [PATCH V2 1/2] dt-bindings: nvmem: add Broadcom's NVRAM
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20210305183236.11784-1-zajec5@gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <4be3e736-8bd5-b9e4-9c5b-e69b164e152d@linaro.org>
Date:   Wed, 10 Mar 2021 10:23:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210305183236.11784-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 05/03/2021 18:32, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom's NVRAM structure contains device data and can be accessed
> using I/O mapping.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---


Applied both patches!


thanks
-srini

> V2: Use Broadcom's NVRAM specific binding. Generic "nvmem-iomap" binding
>      didn't make much sense. Thanks Srinivas!
> ---
>   .../devicetree/bindings/nvmem/brcm,nvram.yaml | 34 +++++++++++++++++++
>   1 file changed, 34 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
> new file mode 100644
> index 000000000000..58ff6b0bdb1a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml
> @@ -0,0 +1,34 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/brcm,nvram.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom's NVRAM
> +
> +description: |
> +  Broadcom's NVRAM is a structure containing device specific environment
> +  variables. It is used for storing device configuration, booting parameters
> +  and calibration data.
> +
> +  NVRAM can be accessed on Broadcom BCM47xx MIPS and Northstar ARM Cortex-A9
> +  devices usiong I/O mapped memory.
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    const: brcm,nvram
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nvram@1eff0000 {
> +            compatible = "brcm,nvram";
> +            reg = <0x1eff0000 0x10000>;
> +    };
> 
