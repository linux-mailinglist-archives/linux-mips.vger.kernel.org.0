Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B84544FA736
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241590AbiDILXX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241459AbiDILXW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:23:22 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FC4C31F6
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:21:15 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id lc2so1354906ejb.12
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U8VLbuItZPb4jyFCxn3Nqdzux75w9Ez2AQJe/mvSj4A=;
        b=MZjGle0ByqYHI5wymhPJm56J/LoPFEywbAuumwhYJWA5M3DOzRDEtcW8dgT6zYUPwh
         CBEjtMM74Bw6EvnT+z8DIjJmIhhy/ZnjDAuD7pPLbMjQ/TTM543UDflIu1wvHFXxjGGd
         AgE1J6+OwVJVJ72JVqOQYZO3w4iiwPhLjB/RFKaupE+qZSMmwukorNJSKI+Ij7AEkVCD
         h1P9rlyOinlae7akI0HGhvO2xl30D5eYgPwz8dBdY98Au7gzmEFmHoKU5scvfvbGZCQ5
         mQo12cb1rdA/RGHmY+tjXUghUXPLZlvFM2hAt1FLZ47Kea0jZO12Z0WgvnUFlAchHx7Q
         iNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U8VLbuItZPb4jyFCxn3Nqdzux75w9Ez2AQJe/mvSj4A=;
        b=i5AjFmc43BFytROUqdXVCHXJYi5xxpDXJv/teLJb6GCOI8RPQZD4ja9vM+a1Cdhh3c
         faWESfEUA8M+J0yYfo4bfQZA5EmBguxuzh0jo6c9NFUUDkKjJ9P/H7/p/Ew50tY7iHMR
         QIXnYUGaT8Mzz39sxNppOCYybIyTwUVjM1mwY/rPkSJU3fvOXLV/j/Ll0PqtxEbmojuT
         QN9ss0WxaxvMC8DD51LNJrEIcNTLB3Td/yaVxJfg+wLmrMmC7DFRXGOMXdDmR0T6rmfX
         KSH6SYkVBG2lwvx/yuQNs+qTX1/TAKUMiSEHjwsl6jU4CNV0L41aYFIG7ThcOF4UwqtC
         K6Kw==
X-Gm-Message-State: AOAM533RPxAfNn5bF+Zjs4v4LHsiJlODmfDJmkhTbQD88830k8Rz6XGX
        UZZuioCfOWsNIErAaKE8YVrK4A==
X-Google-Smtp-Source: ABdhPJy2s9VjHNmKGOrwbTOJXrBIrYI1mO9WDqGwdDMzfXRV8RoYLD97XwHXuQ0HbEBVuGpPkRpt7w==
X-Received: by 2002:a17:907:3ea3:b0:6e6:faf5:b8e with SMTP id hs35-20020a1709073ea300b006e6faf50b8emr23001920ejc.402.1649503274539;
        Sat, 09 Apr 2022 04:21:14 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id za11-20020a170906878b00b006e7f5d17d4dsm6286403ejb.140.2022.04.09.04.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:21:13 -0700 (PDT)
Message-ID: <326d0e37-0776-33b8-2985-d8a8f1a3ab0e@linaro.org>
Date:   Sat, 9 Apr 2022 13:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 17/18] MIPS: DTS: CI20: fix wifi as reported by dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <e96fc7f98ef3ef0d16ff9272a6835df4e376a497.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e96fc7f98ef3ef0d16ff9272a6835df4e376a497.1649443080.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/04/2022 20:38, H. Nikolaus Schaller wrote:
> arch/mips/boot/dts/ingenic/ci20.dtb: wifi@1: compatible: oneOf conditional failed, one must be fixed:
> 	[brcm,bcm4330-fmac] is too short
> 	brcm,bcm4329-fmac was expected
> 	From schema: Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
