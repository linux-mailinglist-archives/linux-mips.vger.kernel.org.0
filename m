Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7B44FA729
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241597AbiDILT4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241593AbiDILTz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:19:55 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0068C2BB1C
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:17:45 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id w21so16445147wra.2
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Rlp8fZ6f675sT1RAZ2uUPXpqd26mO5FLSykMFAEoi/w=;
        b=ggkIx3jpJkG/eVKwxFSMQrxcvlOCKe6AzqdhfFMr0ji/ArYZwXgd92JO9A7Dl5msOy
         38PWSswrTm/P85Q2ul/+II7UKtF8cVvyzJ7xoDBOo0yxEm1rUzw5alOjof6edyUuN7gf
         EeCiUEtvL9clXbfTFeM6Ql309PfXThofccHtXzx/nS+m5EvYgz/wEH+iNvJ1GG0aqRZ5
         tPg5/zsMOjKRtPrhIFWkPAcA1I9nyrsHVhBoExH9uFzw6geS+4eOKwPzylOhcdQl8MPQ
         FEQJKxJhsgrFdYtRxE5GLPoqY/AM4rASY4A+lmFmDP8dpPrdFDVaXZLq9+4LCk2E64Ja
         NzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Rlp8fZ6f675sT1RAZ2uUPXpqd26mO5FLSykMFAEoi/w=;
        b=ojw6qVaGFX2yiTgtMsc5wy8o+C3PMfH7H/+xG5LC+gftaGNa8jFuAHLj3JUN9591vh
         Byq4ahLryhuP7iZFzVPyZaclomIDWHOlaKbtWLPSugo7ManUSmv1rB8Ph1o+YJ8W2QE8
         GE5CrPEpW6fNna7MR48pTvV72mUrsLeXEArRrRV9mwar/8ZQRH0WA8vCuNqE1KfY5948
         Ide0wy4S2VDFnqLCWpXGou27NR37jBt4sp+lnVZZykqPst0IgQVfY8wuOkxPePOT7zVg
         H6Vw79sbfc8KIR0I4+7FGRLh5nz3GxL+ctDqg1EzzSkkh3USgqb/EF+6bbffOjsqWovT
         v/bw==
X-Gm-Message-State: AOAM531VQ+bfOzX/vcIdWfEt2L6tT+cjO61sAISwm02NkyBdrK6YF2LP
        6a6Uqv/kvcjClwPNCt6wQ13c1CSLta+Pa/UM
X-Google-Smtp-Source: ABdhPJx6rGjpibzJDqYxf5qk4hucKr2NqQCL61KyRK2oLUlFGGLyaPK1NpGIRZBxDzCJbnQS1JoaKw==
X-Received: by 2002:a05:6000:1285:b0:206:1107:77c with SMTP id f5-20020a056000128500b002061107077cmr17849859wrx.56.1649503064557;
        Sat, 09 Apr 2022 04:17:44 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id l28-20020a05600c1d1c00b0038e72a95ec4sm14057633wms.13.2022.04.09.04.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:17:44 -0700 (PDT)
Message-ID: <222263f8-e69c-1afc-232f-1a2cec4d8e23@linaro.org>
Date:   Sat, 9 Apr 2022 13:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 09/18] MIPS: DTS: jz4780: fix dma-controller as reported
 by dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <fba7fa695369311dab9ed9b1c929a0c57a1e8f98.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fba7fa695369311dab9ed9b1c929a0c57a1e8f98.1649443080.git.hns@goldelico.com>
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

On 08/04/2022 20:37, H. Nikolaus Schaller wrote:
> /Volumes/CaseSensitive/master/arch/mips/boot/dts/ingenic/ci20.dtb: dma@13420000: $nodename:0: 'dma@13420000' does not match '^dma-controller(@.*)?$'
> 	From schema: /Volumes/CaseSensitive/master/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/boot/dts/ingenic/jz4780.dtsi b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> index 8b95486c8afa7..dc88f9e813453 100644
> --- a/arch/mips/boot/dts/ingenic/jz4780.dtsi
> +++ b/arch/mips/boot/dts/ingenic/jz4780.dtsi
> @@ -515,7 +515,7 @@ eth0_addr: eth-mac-addr@22 {
>  		};
>  	};
>  
> -	dma: dma@13420000 {
> +	dma: dma-controller@13420000 {

Fix all the files.

Best regards,
Krzysztof
