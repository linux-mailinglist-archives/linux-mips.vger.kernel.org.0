Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD11D4FA745
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233449AbiDIL2g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiDIL2f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:28:35 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09522CCB32
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:26:28 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id r3so3178960edi.8
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uIniKHNq8JZpBtiVtTYbsG4CSucAQy7J49l7XkGedJQ=;
        b=syeAl4mFwn7Jlf6Z67Bj7MRA0g1s6XL6W+iUCPVh9bRj0JKzwA/frdhS50xI6s3hgY
         IKRj2nALPfJwi9YtRVwicdOlBhC4b3H2KmL5NN6yLZr3YAY4UlZymVZpRN9ghJUEcBi4
         Hr71QPr/0f1I5/yyCu8YSGM5fs9WdIrZQ9me7tT8IEPVVZ5dFj04D/OBb2XuO33EWkhF
         uW+ELDc2H2YWVP9FguWuSvqThhqmziX75ZjeHIdoAtrVgRED2PdTQCVtpU1ju3w4c3CW
         PKRzPaLLkQbd/IFnjkyP2xQrI1945TDC1tI3izSL2pmybvsQv9i1DoayS9PgtYhVgGLW
         6i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uIniKHNq8JZpBtiVtTYbsG4CSucAQy7J49l7XkGedJQ=;
        b=8Rn5PGvtUFH84d9hR1uJwxL0WhCls+fdJg4f4z4byGZXw+fxhEQt9gv8pukUSa6Kac
         kN0qUtYI/8Qo/0gQ4ZEHqGBCV9byuhx+dMJk4H0uIU+0bKPeRrK+xnQDaQ5Oc2aESV8m
         iBgaoZHTWxp3Aws0cO+gS8Zw8kTU6mg6pwyy0y2N+SP8FgRsGLeJE/wKzNKJ6LD4zAOB
         0RgMF96/43GNS/WvsvY+dWxT1EAmlZWbST6LgczB3EWNZzLjV+5IqSIMYNR/zdpcTlEs
         Z9wRvr7onWyWSYkjQfwX2/JZhZKk5Be2dsAdgqXGsEVTcnWqk3Mx+8dX3J9SUxLGeodx
         tVtg==
X-Gm-Message-State: AOAM533Db5PDedbovJc4w11+TNYurTGZFPYsGNS82tNFQIo8kO2FSsXB
        xA+D4gNJtenqRXaX/cWnST+gLY8nnAlu5Xak
X-Google-Smtp-Source: ABdhPJykVOfbfFlyQPpCMCFTFcG34OHVH9wUEbVWiFWDIxmCK8sV9ej4osJTkQAsEBTVah10qvGJ3Q==
X-Received: by 2002:a05:6402:150d:b0:41d:5ef9:e241 with SMTP id f13-20020a056402150d00b0041d5ef9e241mr4500392edw.353.1649503587221;
        Sat, 09 Apr 2022 04:26:27 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id p9-20020a50c949000000b0041d180b8beesm2314883edh.48.2022.04.09.04.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:26:26 -0700 (PDT)
Message-ID: <036b66b2-c221-6e9e-6a56-510e7a0d20d3@linaro.org>
Date:   Sat, 9 Apr 2022 13:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/18] dt-bindings: fix jz4780-nemc issue as reported by
 dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <84adfe6237cd4cfd52cb9723416f69926e556e55.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <84adfe6237cd4cfd52cb9723416f69926e556e55.1649443080.git.hns@goldelico.com>
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
> jz4780-nemc needs to be compatible to simple-mfd as well or we get
> 
> arch/mips/boot/dts/ingenic/ci20.dtb: memory-controller@13410000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['ingenic,jz4780-nemc', 'simple-mfd'] is too long
> 	'ingenic,jz4725b-nemc' was expected
> 	'ingenic,jz4740-nemc' was expected
> 	From schema: Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/memory-controllers/ingenic,nemc.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> index 24f9e19820282..3b1116588de3d 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> @@ -17,7 +17,7 @@ properties:
>      oneOf:
>        - enum:
>            - ingenic,jz4740-nemc
> -          - ingenic,jz4780-nemc
> +          - [ ingenic,jz4780-nemc, simple-mfd ]

This is not correct representation. If you really need simple-mfd, then
this should be a separate item below oneOf.

The true question is whether you need simple-mfd. Isn't the binding (and
the driver) expected to instantiate its children?

>        - items:
>            - const: ingenic,jz4725b-nemc
>            - const: ingenic,jz4740-nemc


Best regards,
Krzysztof
