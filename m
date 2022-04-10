Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C80C4FAE85
	for <lists+linux-mips@lfdr.de>; Sun, 10 Apr 2022 17:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242299AbiDJPiO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 Apr 2022 11:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237457AbiDJPiL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 Apr 2022 11:38:11 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80D721809
        for <linux-mips@vger.kernel.org>; Sun, 10 Apr 2022 08:35:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id lc2so5637700ejb.12
        for <linux-mips@vger.kernel.org>; Sun, 10 Apr 2022 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=Ymd6ZB8X+RwTwj7uy0xGRMmhXHvaYLUxYMCOqaKXCEw=;
        b=q4Bwc/sQ9eh7WrqSPQwLuUvKn+WnDSv2ZFIIv/MuoTBPXfda+uMW82lCo3xaOEkflX
         6pmv0q0AHQOgD837jusI6OwhlrFVUEYHL0dljBFQdBNE/1ZPnOk+M3zO8YqwgZ37mQxe
         VU7sruwKrS3dPobB8x3xlPfbGgMajrUFtJxaOFPyPt/dluJmmcqkUq8XGK7hR+hDHv7M
         ZNabGDcgM8mIyblJbBRGqXFCKLV9nQX+1dL6jVVFY/KuP4Z5Y3LQ5i32S2Yi2TBpwaN0
         FWfD8L6P9OmQoXLD0F0AexsccH08kvl2XuRP+44fG1Tdtusm81i9jioBNS5Id5tYaeyh
         Y6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Ymd6ZB8X+RwTwj7uy0xGRMmhXHvaYLUxYMCOqaKXCEw=;
        b=g6VqGj4dLo16WkQDT8vmlVB5E77ePf7q4vb2T/lG7haT+wtghmr1QoWOKCpIe4SGC1
         2190Vr53kGdoo2ew53KDGJH3DXNXGJM131BaFjdx6CdS/iarbe26y/PE1KgQrbU8iqgL
         2pFC+3TzPjJoJRIbMHv8/JVXwa1ZZ9y+N8Bc6fde0i+6pW/H/JfRq8VjBevB4q3vekjq
         SGDULI4pxcSJqEcITZWEAOUUEChJSxgqZltTctIv/tSRSn3H6+Y3mGuNzH04hahhkcls
         RuYek4ynGuFTmjtbVEwULWNHwmkP/RF6+GhdwZfaJSgNp4od+W9pkQ1woTIrttRfaw1m
         fpIw==
X-Gm-Message-State: AOAM5317NIkRj4UEPqLXjsObL3NhOGbvn+dAaQ8nAuRaHSNJ3NdbEUQt
        RnIyH3ZWbNAkKqR1vBRV46V1qQ==
X-Google-Smtp-Source: ABdhPJwFU0Aib2QRHEDKy7VYoKmZqoimt6/xyHAjy+BiRfsUtU4TzhgV65xTCH8QCvvNp6ATpXOm+g==
X-Received: by 2002:a17:907:3e0a:b0:6e8:8d91:48bb with SMTP id hp10-20020a1709073e0a00b006e88d9148bbmr1964405ejc.237.1649604957362;
        Sun, 10 Apr 2022 08:35:57 -0700 (PDT)
Received: from [192.168.0.189] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id jv20-20020a170907769400b006e7f859e683sm7386652ejc.19.2022.04.10.08.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 08:35:56 -0700 (PDT)
Message-ID: <e10f0291-8252-fd12-5bba-f25f472cd605@linaro.org>
Date:   Sun, 10 Apr 2022 17:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 13/18] dt-bindings: fix jz4780-nemc issue as reported by
 dtbscheck
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <84adfe6237cd4cfd52cb9723416f69926e556e55.1649443080.git.hns@goldelico.com>
 <036b66b2-c221-6e9e-6a56-510e7a0d20d3@linaro.org>
 <B9FD64FE-82B0-4DC2-B4C3-BE266DAB28A0@goldelico.com>
 <99a97b0f-19a5-136d-9160-c9fde6f3548c@linaro.org>
In-Reply-To: <99a97b0f-19a5-136d-9160-c9fde6f3548c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/04/2022 15:18, Krzysztof Kozlowski wrote:
> On 09/04/2022 15:09, H. Nikolaus Schaller wrote:

(...)

>>>> @@ -17,7 +17,7 @@ properties:
>>>>     oneOf:
>>>>       - enum:
>>>>           - 
>>>> -          - ingenic,jz4780-nemc
>>>> +          - [ , simple-mfd ]
>>>
>>> This is not correct representation. If you really need simple-mfd, then
>>> this should be a separate item below oneOf.
>>
>> Well, it is valid YAML syntax and seems to be accepted by dtbscheck.

Minor update:
Well, it is not a valid schema. Rob's checker now confirmed. If you run
dt_bindings_check by yourself you will see the error:

   properties:compatible:oneOf:0:enum:1: ['ingenic', 'jz4780-nemc',
'simple-mfd'] is not of type 'string'

Probably because enum expects string, not another enum (so enum inside
enum is not correct).

If you do not see the error, you might be missing some packages
(mentioned in writing-schema + yamllint for a different issue) or your
dtschema is old.

> 
> It's not how we code it. Please do not introduce inconsistent - even if
> valid - blocks.


Best regards,
Krzysztof
