Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DDD54FA72E
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239866AbiDILVA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbiDILU7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:20:59 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EC432AF3
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:18:52 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id c7so16502546wrd.0
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=f/z45wIq/QdJwfG+0KT/Os2LMDAnKUavyQnArPNoU9I=;
        b=G7NyFQkys+nt8S29UMcHhB9DNFlBtze2CGv9LztxDaDXZZQglmZnAgYT76fN1tf50J
         lPNQx8mkBG1BC7b6GiG2/eWXGzkwVL6sTRQSvJomhU0NooVbYwu4y2s1meItzj+ctBEe
         AcdYH8/ZvAsDX40rPuKNJpFJL8jBkw6SaN6S9f9tiFk/j4sWT7ecQQtl8fFyxNezupUF
         6qEWZHLZ/EL+10UOMnKO/MiQpPWEzbdjT4onwYN2WyCeoLVxvhNXzHhgPKa2F+aMWp0l
         0oaOOyAeOdVjEt0uCoSkf80oPuRWpuH8rAREizD6b/DIypPwptnIizN9/NWP7zOTRZAq
         k7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f/z45wIq/QdJwfG+0KT/Os2LMDAnKUavyQnArPNoU9I=;
        b=CNC0QbiBJyVjr3kqX2HmsRJREjz2mXcB3FsEOvmjmYu3kR+/EAIxHc00f/vW26ATod
         U3QnYXZJ0raF72g0dqg7SYr3956sM2hZUgklY7c37YQ5G0w7rfP7DGDCwHtz5WM+dMMr
         Pr7oB+fCKiAG8bjdhJrGDUz2/Agsj6NfJ7sFkFwlUmWp73Pg/5qkS7+zxPDYe1Jz363q
         syGFE2rpzsC7z3z4CLGy1Jy8/DYmoahoTiSbxoj0/2pmqxgdItntNw9i/UB1kz1fDzNU
         hSJQbQmj3lebS5xHnVceY9dcJYIpxGTWUjfoxT0l1vor9alrZapVayQmKCBj+co8b/6B
         MZRA==
X-Gm-Message-State: AOAM533cdhUx9TiVk/wH8br/rZijdm2yi7yCenPU9L/a+kXrjbAvViyy
        kFjEKsjvWQlROXqXy3+JrnO0Zg==
X-Google-Smtp-Source: ABdhPJyOznpQ2/2yJAJ3R2KKPkRcEogaYqNMi8E+rE4dubxvyyI3ivBs6jhbVQ8E3FqzBX5y+yB72w==
X-Received: by 2002:adf:ebd0:0:b0:1e3:f9b:7b77 with SMTP id v16-20020adfebd0000000b001e30f9b7b77mr17511554wrn.691.1649503130913;
        Sat, 09 Apr 2022 04:18:50 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d456b000000b0020406ce0e06sm21207664wrc.94.2022.04.09.04.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:18:50 -0700 (PDT)
Message-ID: <7e986851-bb2b-f2f5-3bf4-8c26801d6ce3@linaro.org>
Date:   Sat, 9 Apr 2022 13:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 12/18] MIPS: DTS: jz4780: fix nemc memory controller as
 reported by dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <995a8977d6ecc5798bf6139811698f3493b71249.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <995a8977d6ecc5798bf6139811698f3493b71249.1649443080.git.hns@goldelico.com>
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
> arch/mips/boot/dts/ingenic/ci20.dtb: nemc@13410000: $nodename:0: 'nemc@13410000' does not match '^memory-controller@[0-9a-f]+$'
> 	From schema: Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  arch/mips/boot/dts/ingenic/jz4780.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
