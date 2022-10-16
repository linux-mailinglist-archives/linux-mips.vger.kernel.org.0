Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 306A96000A3
	for <lists+linux-mips@lfdr.de>; Sun, 16 Oct 2022 17:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiJPPbX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Oct 2022 11:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiJPPbW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Oct 2022 11:31:22 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 306B833429
        for <linux-mips@vger.kernel.org>; Sun, 16 Oct 2022 08:31:20 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id f22so6454863qto.3
        for <linux-mips@vger.kernel.org>; Sun, 16 Oct 2022 08:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fG8tP6ulNvkW7prqoOtdguFD+mr4WxhtDePb8i/GegQ=;
        b=jtyK9tawIw2C4KLU0bugKmT3U5/ee5JXFKGlIcbQXqLt+c5xGMSBPyG06M1SKlymVF
         YYaPoVMH5EaMqsWV2Vh7cTnEpjNaRsxiePEeQlCEFRbqg27QijX5bAcgtSb6jC5j+LrR
         C+6wE5KbfIdF2SAfjBGYlG8ZITasN76hNvYkEculvQ52fOpkdH5PWAEhLOQDalWGJ/H0
         kQHn+VmG7c8k3HHtUb5KMSvfkPJP0uBQswLVtmIPSO0gnEIxfTRlHXnTcKdyYvvEG3Xr
         3nzo6OO6xzjcSnzOgnrGgXozFGIwb8yMWEqgG7yVM8lqOMjSgePFtFklg++pFhqsylMr
         4z6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fG8tP6ulNvkW7prqoOtdguFD+mr4WxhtDePb8i/GegQ=;
        b=mc6PZI3HOaA3F0m13n8JTW9dRBRhR93KzeJ1h4jp6DuPpHxs3PZz2a3JTF8pXl/kLQ
         2ztOJVNau969jB7yUuGSlg8X1BN5amFakSONiDs4/qrnwq7jIFzwnPE3v+2ylL6dp2Hg
         hH8V7NJrmmPaQ9DgACeKEL+8Rl3BLjud0mE83ncyDm99XmGL4K0zLY8mS3FYHii6g9Oh
         8zgEctUAP46Y/TpjOCxK+qxU1kE5R/O7zu11P0RnRWhaY3RQ+CicGAx4giisFQOhoY+M
         pdE+IKm9aCzUo2a8bTLpiCTJEfwKMz6QWrbR6SmfVihr8LOJQ4CvDFLcf2dgZzEW/NlK
         +NFg==
X-Gm-Message-State: ACrzQf0Lxurs6KP12cpCnWak0C/WbcB4+XhwLiKEihnvKl+MppACCspM
        sgEHA8F0IEH/tn/TMlqNnoSf4YEW/WYeaQ==
X-Google-Smtp-Source: AMsMyM52zXE8H21VnnAi0L26xzxHGEAYVZ8vcpPooGRfX+RS9nAahoVcOGbKg2uzEgS50/tHmc6wSw==
X-Received: by 2002:ac8:4e4e:0:b0:39c:e3ac:df36 with SMTP id e14-20020ac84e4e000000b0039ce3acdf36mr4515219qtw.495.1665934279312;
        Sun, 16 Oct 2022 08:31:19 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id r28-20020ae9d61c000000b006ed30a8fb21sm6672822qkk.76.2022.10.16.08.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 08:31:18 -0700 (PDT)
Message-ID: <77676eda-20f1-e029-9bfb-a588caa96d73@linaro.org>
Date:   Sun, 16 Oct 2022 11:31:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/2] dt-bindings: ingenic: Add support for the JZ4755
 dmaengine
Content-Language: en-US
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20221016151256.3021729-1-lis8215@gmail.com>
 <20221016151256.3021729-2-lis8215@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221016151256.3021729-2-lis8215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/10/2022 11:12, Siarhei Volkau wrote:

You miss here now commit msg.


> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

No empty lines allowed between tags

> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
> ---
>  Documentation/devicetree/bindings/dma/ingenic,dma.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
> index 3b0b3b919..e42b8ce94 100644
> --- a/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/ingenic,dma.yaml
> @@ -18,6 +18,7 @@ properties:
>        - enum:
>            - ingenic,jz4740-dma
>            - ingenic,jz4725b-dma
> +          - ingenic,jz4755-dma
>            - ingenic,jz4760-dma
>            - ingenic,jz4760-bdma
>            - ingenic,jz4760-mdma

Best regards,
Krzysztof

