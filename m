Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4205691D70
	for <lists+linux-mips@lfdr.de>; Fri, 10 Feb 2023 12:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbjBJLAs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Feb 2023 06:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232248AbjBJLAr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Feb 2023 06:00:47 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3186FEBB
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 03:00:44 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r2so4668916wrv.7
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NbWtz/vqb341qaiav7lomSBFYNGOQ0+fBEtimwkEASk=;
        b=OCyvf5V5jB58eve8zjPzfIBgFkVcV62Mt9MZ7BurJszgZh6FyGS0/Qo1LSJh1mPJOQ
         RJFK/wQgovdhJ6No0buYoSa9INQnVB6voGreDPQ+0hFxGzJHjnFm6bQ8aYtOzlxgS0fI
         Yw2gDBP9h+6MhuSYgP2i5M7wFPtdhDSWPwYu+HheUnS10mR8evvqxkDVMwgbpkAIr1kK
         72EvPjK4m8tXtomzVCTXM/3ttve6T8idxGjVWRz9urYJxCy/qWjXB6MUHDfdLawkFfh0
         Efb2/43+2IoYIQ/BKH3+g5zpdOZIJrnAOPB8FFyl54ca3BFLph0lRPlXdVnnx6on6F8s
         2Uqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NbWtz/vqb341qaiav7lomSBFYNGOQ0+fBEtimwkEASk=;
        b=u11s8I/jhNXzC3qY09iN8m8zMQosEY1B576JknYSvkKn03tuDxO9+5GuD8Hu6yVxPg
         r0qrFi7yXN8k9ecQbm4aX3aHV1TQ/bCfqeY99K4lHs597F85/+7GugOtUtJ4bEVIsOsD
         ewdvDDyacj+DFUcLNWUV0i8sXB0Hsr+poD47Y7d70usfonSBH/HId8fITueQpgqxw+f7
         XcVPoOCZQcCOHe3NTCBFBBLzudFNqXOfZNVzpWHHCuUWImDytc6N3Rw7VpwUv0HIwNbt
         WRs3RZjBYxFpUz4q2tchGisb8E2KOmfj3HwWfR3q0emkdEJWR1cHBMUPCx10H/ZNZilN
         2o3g==
X-Gm-Message-State: AO0yUKWRMbkoJ8/wMN5QAEcCAsqagsiqCJE15V3qs4xAL3YkJZwC+t3f
        Onr2sAn7Irf/HkXedxNun+BdRA==
X-Google-Smtp-Source: AK7set8aWP0+1zZ5iWKQSeK7bsa3F/xXP9JsTQh08Y4HQtfwFbAaE1eYljewBGKEbB8fe0d6noFToQ==
X-Received: by 2002:a5d:4146:0:b0:2c5:4aad:db7e with SMTP id c6-20020a5d4146000000b002c54aaddb7emr1211541wrq.58.1676026843430;
        Fri, 10 Feb 2023 03:00:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s12-20020adfdb0c000000b002c3ec1fbc0bsm3336916wri.94.2023.02.10.03.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:00:43 -0800 (PST)
Message-ID: <23d2f23f-b063-c417-e85d-40f09b509d04@linaro.org>
Date:   Fri, 10 Feb 2023 12:00:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] mips: dts: ralink: mt7621: add phandle to system
 controller node for watchdog
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210065621.598120-1-sergio.paracuellos@gmail.com>
 <20230210065621.598120-3-sergio.paracuellos@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210065621.598120-3-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/02/2023 07:56, Sergio Paracuellos wrote:
> To allow to access system controller registers from watchdog driver code
> add a phandle in the watchdog 'wdt' node. This avoid using arch dependent

??? This does not make sense.

> operations in driver code.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
> index 5ca40fd21..ebee23a2b 100644
> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
> @@ -71,8 +71,9 @@ sysc: syscon@0 {
>  		};
>  
>  		wdt: wdt@100 {
> -			compatible = "mediatek,mt7621-wdt";
> +			compatible = "mediatek,mt7621-wdt", "syscon";

Why do you need syscon?

Best regards,
Krzysztof

