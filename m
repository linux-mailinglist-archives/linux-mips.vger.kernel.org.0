Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47C75691F71
	for <lists+linux-mips@lfdr.de>; Fri, 10 Feb 2023 14:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbjBJNDd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Feb 2023 08:03:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbjBJNDb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Feb 2023 08:03:31 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F347716C
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 05:03:29 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6233526wmb.2
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 05:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mHuKwy+neRC0vkQu0jpgXEjq9Ic9UbkFb4DMiDzFskY=;
        b=fDxIJSJZZ/kLmAABxA8Kcv8S4dcPNV4Rp2bwW0AAOKfaKIGu4ltXgYQ/VPqqAdpR5U
         mC95clFCgFGDQ5v3NcAgLLL3wykN5Lel48ZBgKMzkZo1LCnx5rY0OpbECxxN/BRt2jRg
         YTSZcFGyOU+hY33vr11tzoB5V9UFG99pA7IZwxnY2GYa9c1/sACtp17nABCGLcx/5TYm
         T/zwA8s7lD8iSMewjXEuzUKpewZFv5IsmpIC2mdz+DhQ9i3CVbVEMLzkx6CbwdMV4A0L
         105KFV4uG+Z6Xblm086KFHitnIziK3S3kFMAvhLfh7s/tjrquR0JPh2SvZ/zw83a5r0X
         5aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHuKwy+neRC0vkQu0jpgXEjq9Ic9UbkFb4DMiDzFskY=;
        b=iI/fXbhA2abxTS2ta3/LrV2caQoWFBSTz2LiUDXdKKjVOvmiTH5AYr3S/i7NUfsr3A
         gX0bLAMmFgR32d3XsM/EJt0luMbRsFBWHuQE2lfVe1+mE1U9lOdIgdvvlDOtUyl7IjW0
         Lw1yZftujVzGcSBT8dKWpsWCHE1oIcLer2hgmWk8xr0IseSWyWIkJVUtwaMmNU3lzEX9
         8TDHn/cXt6wvVWv0dcGP1an4v1rJH+ZpVIuYSQmkQXbJYvN04W+JfpnNAgvq41KMRqH/
         MGsut1WH+DXrPqyK92kCjfwVIExhhOkCVFkDDRS49UMjtIhKD2TLgQ6AAou/+52AgYQ7
         LKxA==
X-Gm-Message-State: AO0yUKWomNtb6yHiv7qj2xh60Cv1b57eEv4OT/1k2EmOD0jXLNI6scyL
        V5YEdBO+hfIJMkzAOpRMuPoOuw==
X-Google-Smtp-Source: AK7set+KT2zNPVtT7oMROBr1VeXLjUv22uoW4r8pr/RWokE1j63+pl/LhGpO2bz0dTngXuH8mJzppg==
X-Received: by 2002:a05:600c:3b8b:b0:3df:f124:f997 with SMTP id n11-20020a05600c3b8b00b003dff124f997mr9686392wms.19.1676034208584;
        Fri, 10 Feb 2023 05:03:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c450700b003dc42d48defsm5988514wmo.6.2023.02.10.05.03.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 05:03:28 -0800 (PST)
Message-ID: <b59d426d-8a5e-9eff-57f2-e36ebfdc5466@linaro.org>
Date:   Fri, 10 Feb 2023 14:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] dt-bindings: watchdog: mt7621-wdt: add phandle to
 access system controller registers
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210121735.639089-1-sergio.paracuellos@gmail.com>
 <20230210121735.639089-2-sergio.paracuellos@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210121735.639089-2-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/02/2023 13:17, Sergio Paracuellos wrote:
> MT7621 SoC provides a system controller node for accessing to some registers.
> Add a phandle in this node to avoid using MIPS related arch operations and
> includes in watchdog driver code.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> index b2b17fdf4..cc701e920 100644
> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
> @@ -19,6 +19,12 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  ralink,sysctl:

Thanks for the changes. I did not notice it before - isn't Ralink part
of Mediatek now? Also compatible is mediatek, not "ralink"?



Best regards,
Krzysztof

