Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB847819FF
	for <lists+linux-mips@lfdr.de>; Sat, 19 Aug 2023 16:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbjHSO0U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Aug 2023 10:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233418AbjHSO0T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Aug 2023 10:26:19 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8B6F5BF
        for <linux-mips@vger.kernel.org>; Sat, 19 Aug 2023 07:26:16 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99df431d4bfso231702866b.1
        for <linux-mips@vger.kernel.org>; Sat, 19 Aug 2023 07:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692455175; x=1693059975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbpjVMNTkdRcuIw5rXUTxCd8hco58fdsRPI7jXTvCz4=;
        b=uSI/SKZKEaP/YyftU6PFB4YI8wLW387G/ZraE5IJRsolM1vPqyS/63teOQKNpVLGoR
         M9r3IC8igP7NZWNBkUek2lgneN4n4hN7WNCrZGIGFu7wqebYOAzM15zMNxmVxBXKjCKQ
         cehpORCPBykKNEdqtD5tmcvnHMuyOXgQdrQDkoWqIDJPsSFuNzkumjWTNDGGEv0UCnRh
         GidIbzvI9J5JhyVsf2OrBlGoZww2gTlmG6BEfvUbP7r6FLwP5oWShRlWxcMD6WHKPxLP
         5/CRzMoeTY4rnlYOmlvLLphlqtwroGeYhi10KN4g/NpJ1mbVFbn1ms2rxGiofHuCrkf1
         RuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692455175; x=1693059975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbpjVMNTkdRcuIw5rXUTxCd8hco58fdsRPI7jXTvCz4=;
        b=baetZL1Er/HfOHyb53LYhGMZKRVtkRwViWCGpd/PrgKltromZCb8CXc+eCKb/dJAyp
         n7gzzlodn/lRNsJEMBsgMcMQCXlyiVID0KIkmgat++Rljg/tLmX+f/8M0gP4/3MK96a2
         zHFah/vFLqsnmA3Ce705EdqHUWv+RriZJVnvhW/1exEqUC1255meAeqFjm2URv+d40+0
         AftgT+D8Z4Rq13Z+XxUo24KtqoKR1MFpPU5KoJIVcNhE2dzqmk71YQPNO6zvdz6djSiH
         H9uslltgIEjkAHprxyIup4ULqNEZkF72rHeocQH+utPU9clJaIV+MFstsMNKnhm2aQwl
         iJ+w==
X-Gm-Message-State: AOJu0YxCBvdRHNsshRKX8aSbRD2AtkOYCcwphvwH2KhSprP2LqAODJsF
        NFuJE9nmO97xHYIPSQ4Nt2OkrnZL0JZY6P/KhyM=
X-Google-Smtp-Source: AGHT+IG0knWJWrIMrXZddpta476bz0tcU0vmlzwCjL5GzABDGovZzi0nI+14ge9GCXDYQtqXUdut3w==
X-Received: by 2002:a17:906:220f:b0:994:554b:7f27 with SMTP id s15-20020a170906220f00b00994554b7f27mr1690881ejs.2.1692455175010;
        Sat, 19 Aug 2023 07:26:15 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090666cb00b009926928d486sm2785608ejp.35.2023.08.19.07.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 07:26:14 -0700 (PDT)
Message-ID: <c1499974-17c5-2f6b-8d6b-be225299fa9c@linaro.org>
Date:   Sat, 19 Aug 2023 16:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 2/4] dt-bindings: net: Add Loongson-1 DWMAC glue layer
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20230816111310.1656224-1-keguang.zhang@gmail.com>
 <20230816111310.1656224-3-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230816111310.1656224-3-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/08/2023 13:13, Keguang Zhang wrote:
> Add devicetree binding document for Loongson-1 DWMAC glue layer.
> 
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V1 -> V2: Fix "clock-names" and "interrupt-names" property
>           Rename the syscon property to "loongson,dwmac-syscon"
>           Drop "phy-handle" and "phy-mode" requirement
>           Revert adding loongson,ls1b-dwmac/loongson,ls1c-dwmac
>           to snps,dwmac.yaml
> 
>  .../bindings/net/loongson,ls1x-dwmac.yaml     | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml
> new file mode 100644
> index 000000000000..cf5477450e29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/loongson,ls1x-dwmac.yaml
> @@ -0,0 +1,98 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/loongson,ls1x-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson-1 DWMAC glue layer

Please implement Serge's comments about title and description. Rest
looks good:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

