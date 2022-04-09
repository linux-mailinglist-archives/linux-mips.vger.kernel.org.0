Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2E04FA71D
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241564AbiDILRs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241553AbiDILRs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:17:48 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516533CFEB
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:15:40 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id g18so156430wrb.10
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iGiuPg7lc4blNR5kNU/wL46Om1t3+4rWHXM4pA/ZsLU=;
        b=Q2TtATKglLqgEJQCNnsLg1XDdMtsVQ1Sju+9GXtwIN35OHELJLvar0CTxHvsVwIkPI
         vySloLG45YYjbEN8HezbotELVNyivU7FOslSAulbTTdOzy1kKasNrhCOHDKn4r2Hzz6s
         QgXEZovuhuf/qtV8H1ihRqqxIzpk2mv3iAzVxB83Iro84MSyFYdgcMTI9usiHlwBcLqp
         H1HzV6BLov1jmO0FeacnZq5Xzk4JGv/E370HtWlHmUI8FOHw943Dwvb1dBmawcRp7Gqc
         yvONqk0Yu5PkuepzWE5UjCrv0fa0r3yistq190tbKW5Bu/pYmNOryfh80B5tWn+dDqjY
         vrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iGiuPg7lc4blNR5kNU/wL46Om1t3+4rWHXM4pA/ZsLU=;
        b=aUSuW6DnZqGtUpl68FeaWBEllnP/hO0/A+IexkK/lUn2ZlcawYE78ZXy9l2k8NxwIv
         r0o0/epJRStxXaRp2HQSgTX8bB/2RbJsJwyGCZmkrnipbZNPnlwpo3GZC5MNYjW/Dx8S
         Eoe6y9JdQ2ZIaT8TCf9xTmN9hkAWSxLgM2QfYCM8JJOhJPTRWKfxwJACJkneJTk9qCOU
         1xbA7DdB1YpKqCeMH0hBTG4qXQ5d9QO9zRxxpq2+b8lUGn5X20of/4E41wihkHP//BWO
         tRc6TKqRmdUcSwfnJwpoDOPCPGcDN4rMyH3/G7PSXMdK9UtaZvkki4FOeTSmK/ii4GKv
         PhJA==
X-Gm-Message-State: AOAM532L/hFsFgpFZ1prSh7i39dTTCyZ4xyu4rnbGIhdJI/tsAIa7txn
        cGbDN9cRDjgBrUuvPlpDc+uxqQ==
X-Google-Smtp-Source: ABdhPJw8eqZ3CK46BraT1Tr6WfztP8qaMpRU2FvUlKqHNaMjCJOrHLE52SwW4f8CpwJVc+Kf4eLk8g==
X-Received: by 2002:adf:db92:0:b0:205:9c92:f1e3 with SMTP id u18-20020adfdb92000000b002059c92f1e3mr17774537wri.515.1649502938951;
        Sat, 09 Apr 2022 04:15:38 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0037bdfa1665asm16462177wmj.18.2022.04.09.04.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:15:38 -0700 (PDT)
Message-ID: <bd19b6eb-d53a-b665-749d-46c275c85ccc@linaro.org>
Date:   Sat, 9 Apr 2022 13:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 07/18] MIPS: DTS: jz4780: fix otg node as reported by
 dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <298162bfa2e7225ccc753865e1ffa39ce2722b2a.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <298162bfa2e7225ccc753865e1ffa39ce2722b2a.1649443080.git.hns@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08/04/2022 20:37, H. Nikolaus Schaller wrote:
> arch/mips/boot/dts/ingenic/ci20.dtb: usb@13500000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['ingenic,jz4780-otg', 'snps,dwc2'] is too long
> 	['ingenic,jz4780-otg', 'snps,dwc2'] is too short
> 	'brcm,bcm2835-usb' was expected
> 	'hisilicon,hi6220-usb' was expected
> 	'rockchip,rk3066-usb' was expected
> 	'ingenic,jz4780-otg' is not one of ['rockchip,px30-usb', 'rockchip,rk3036-usb', 'rockchip,rk3188-usb', 'rockchip,rk3228-usb', 'rockchip,rk3288-usb', 'rockchip,rk3308-usb', 'rockchip,rk3328-usb', 'rockchip,rk3368-usb', 'rockchip,rv1108-usb']
> 	'lantiq,arx100-usb' was expected
> 	'lantiq,xrx200-usb' was expected
> 	'ingenic,jz4780-otg' is not one of ['amlogic,meson8-usb', 'amlogic,meson8b-usb', 'amlogic,meson-gxbb-usb', 'amlogic,meson-g12a-usb', 'intel,socfpga-agilex-hsotg']
> 	'amcc,dwc-otg' was expected
> 	'apm,apm82181-dwc-otg' was expected
> 	'snps,dwc2' was expected
> 	'st,stm32f4x9-fsotg' was expected
> 	'st,stm32f4x9-hsotg' was expected
> 	'st,stm32f7-hsotg' was expected
> 	'st,stm32mp15-fsotg' was expected
> 	'st,stm32mp15-hsotg' was expected
> 	'samsung,s3c6400-hsotg' was expected
> 	'intel,socfpga-agilex-hsotg' was expected

You really don't need to paste entire warning.


> 	From schema: Documentation/devicetree/bindings/usb/dwc2.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 2021836983c96..c5124459678b7 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -576,7 +576,7 @@ bch: bch@134d0000 {
>  	};
>  
>  	otg: usb@13500000 {
> -		compatible = "ingenic,jz4780-otg", "snps,dwc2";
> +		compatible = "snps,dwc2";

This looks wrong, the block usually should have a specific compatible.
Please mention why it does not.

Best regards,
Best regards,
Krzysztof
