Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F194691FD0
	for <lists+linux-mips@lfdr.de>; Fri, 10 Feb 2023 14:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjBJNf6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Feb 2023 08:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbjBJNf5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Feb 2023 08:35:57 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66BF6031A
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 05:35:55 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so5442921wmp.1
        for <linux-mips@vger.kernel.org>; Fri, 10 Feb 2023 05:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jIz89Rm+ze4w2D4vIzq2lUndt+Nkcy/TezE0K7M5Bo8=;
        b=Wk260Qajy4J+TRp0DVqwhtIHJ0z4twhGLNqwS5zOK/PRp/tIE4eQD4w4LhTjSHqIJU
         iau6muVDep3y7vixVYfAeBIIt3EaRIGEOM+za4zC2yO2FTf7kas73JpN3ijSvnHvEmJo
         lavLovSkH4jIqgbYfvbxfP4lW6B46wcU30mnYWlbGE8ne5Z24zQNp1UW3VjHUw4hUCj2
         TN+UWfGr282sr99jWiBRtFjIT50HpTURsa6eKcyAkKX73lINxRqeBIbHhL/fokUL4+CU
         Dzzc/c5sMeLUNaXr0r/vS9+oPcp60TRK5SwKIpxd4gSqc8eHTxr+PyS1k1KCq8aglJxl
         7dDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jIz89Rm+ze4w2D4vIzq2lUndt+Nkcy/TezE0K7M5Bo8=;
        b=P2i4guWydVv4kJH3qBlayyhixCVVmWKFlaid+3SqeMcTrX9laAW3NO9chPV7tlm80+
         f3ofw8IRG8JlVrRJ4BeWSTgML5V6XBu2Z3OI1EW0YYvbG2HrGYJ6SMKHnLBU4RpGjv9K
         5I351wNAcfA9eTKHMavplogh6N0bTE/p5FkfkqwssLYFl1U3ZjkuX1y85bXMRbF2M1xR
         I8LgOqEXrvDN9Fd9st8ln3AH6jPPDhXDdeYQvEuyngk6O9m2sOEZlnmNxS6olSct78O8
         rmcQ9ASoAm+nRR/wf88SbToRzjOb01BvPfT7WhtDbiocl9H68SZ6irDlybM+Y7Zczj7m
         UvfQ==
X-Gm-Message-State: AO0yUKWFS4zrzF+wr2HxwNRrTTkiG/PyDrSLtAinqFpTED60d6h2xI/k
        kyo+BbHgeqvFpToMk2JnFrngxw==
X-Google-Smtp-Source: AK7set8dwoeP6TIw+hwJOIhiWBeOZVSfXT1xwZFEisoSEOnDXvODSRgELUyR7569iDWRg2vpknhMmg==
X-Received: by 2002:a05:600c:181d:b0:3db:9e3:3bf1 with SMTP id n29-20020a05600c181d00b003db09e33bf1mr12564001wmp.31.1676036154328;
        Fri, 10 Feb 2023 05:35:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003dc433355aasm6004641wmo.18.2023.02.10.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 05:35:53 -0800 (PST)
Message-ID: <992912ca-63b2-9882-eb7a-f7a40d432853@linaro.org>
Date:   Fri, 10 Feb 2023 14:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] dt-bindings: watchdog: mt7621-wdt: add phandle to
 access system controller registers
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230210121735.639089-1-sergio.paracuellos@gmail.com>
 <20230210121735.639089-2-sergio.paracuellos@gmail.com>
 <b59d426d-8a5e-9eff-57f2-e36ebfdc5466@linaro.org>
 <CAMhs-H_6-2P7aaqSvFDypdfbf_YzhPW0r-GCP_xfO5TgyU6Bnw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_6-2P7aaqSvFDypdfbf_YzhPW0r-GCP_xfO5TgyU6Bnw@mail.gmail.com>
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

On 10/02/2023 14:14, Sergio Paracuellos wrote:
> On Fri, Feb 10, 2023 at 2:03 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/02/2023 13:17, Sergio Paracuellos wrote:
>>> MT7621 SoC provides a system controller node for accessing to some registers.
>>> Add a phandle in this node to avoid using MIPS related arch operations and
>>> includes in watchdog driver code.
>>>
>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>> ---
>>>  .../devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml  | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
>>> index b2b17fdf4..cc701e920 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mt7621-wdt.yaml
>>> @@ -19,6 +19,12 @@ properties:
>>>    reg:
>>>      maxItems: 1
>>>
>>> +  ralink,sysctl:
>>
>> Thanks for the changes. I did not notice it before - isn't Ralink part
>> of Mediatek now? Also compatible is mediatek, not "ralink"?
> 
> Yes, it is. I was using the same prefix as for the memory controller
> syscon phandler inside the 'sysc' node [0].
> 
> I have no problems at all in changing this to 'mediatek' if preferred.
> 

Yes, mediatek as already used in this binding is preferred.

Best regards,
Krzysztof

