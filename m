Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927555BC316
	for <lists+linux-mips@lfdr.de>; Mon, 19 Sep 2022 08:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiISGuT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Sep 2022 02:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiISGuS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 19 Sep 2022 02:50:18 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EA3BC37
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 23:50:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z20so32730768ljq.3
        for <linux-mips@vger.kernel.org>; Sun, 18 Sep 2022 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AgUTiKhBujn05TxXhChEqalF/68tJs4eQO8QBl9KDLA=;
        b=u/00MNl+D+cPo1LMA53PEjTlV1YyUFDISGSKO7fmcY8jJtG4osxrevg1ir2oZrMlAY
         KGoplI+L/szE5gXN1gy6tWxgb8djvpTAMpmzrd85685XR5XmIEHg4wzs8n1hyba1cAQk
         I/x2ASViQlamzdlRcYMvL1kVNN2fiTRnVIwyf36fPouyWZxzGeAwbiX6xvyKcUqMTiyr
         RgCU7a8Q/7D4dzss6xuN1oQgVs1t96f98DmNZyqKy9boypscFwNBnl21DO23cIHuGuCt
         mJKe7X0zl5pd2YP1NseYOlHYs0mFIa1OSPjuL8I7Xd00n2kdRHhVVDg6/Ec8n3zf+Oq1
         9Fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AgUTiKhBujn05TxXhChEqalF/68tJs4eQO8QBl9KDLA=;
        b=n1g1JWXFxlJOjYSxVKi/gmCwUVyyfI+3OEWja2/h/Z2Liha/TP5tnktG6uCIIcovxW
         i1RWHouJY7pXUJ79PFp8dTk03yIJxW9WtEisoPPFW8xQZProNchHz7CwiW50Ojxu4O2M
         jnSXInv97ziv60gI597/S+F5RGzGl/DMaMKK5k/djsW4nbQ79SgpssduK3GGDocESMx/
         zabeiF1vZRfXFuH4ypX9vl+RLAwUsTJxnqcXegt22Ml7+6TyTm+1wUIBzuD4KU98ugmJ
         SRbOz1oZo1Zi4mRgfTZR7gtF6mm6YU9W2wRnPfQbMjka40+bRDO5WOBO/+58JI4DyLCW
         FP1w==
X-Gm-Message-State: ACrzQf35bVXwz1H01chgy/ZGvKyh3xBShRFG5wgW/KSZUK4mD5Nh/JqS
        qk2c7GTlJ+Ckoz7epzYMgO/FcQ==
X-Google-Smtp-Source: AMsMyM5BXYEND5jV85kw4nwQ041fTS/U3XG4Jie4d8jTejwhbLVGJErLR5uyBRT4JJIIgVqcoO6YPw==
X-Received: by 2002:a2e:9d88:0:b0:26a:95c1:218f with SMTP id c8-20020a2e9d88000000b0026a95c1218fmr4722063ljj.223.1663570214700;
        Sun, 18 Sep 2022 23:50:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m7-20020a056512114700b0048960b581e3sm5049900lfg.8.2022.09.18.23.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 23:50:14 -0700 (PDT)
Message-ID: <d0630c9e-22c6-48a8-35ed-024949782cbd@linaro.org>
Date:   Mon, 19 Sep 2022 08:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 net-next 00/10] dt-bindings and mt7621 devicetree
 changes
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Landen Chao <Landen.Chao@mediatek.com>,
        DENG Qingfang <dqfext@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        erkin.bozoglu@xeront.com
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 18/09/2022 15:41, Arınç ÜNAL wrote:
> Hello there!
> 
> This patch series removes old MediaTek bindings, improves mediatek,mt7530
> and mt7621 memory controller bindings and improves mt7621 DTs.
> 
> v3:
> - Explain the mt7621 memory controller binding change in more details.
> - Remove explaining the remaining DTC warnings from the patch log as there
> are new schemas submitted for them.

Please always describe dependencies. Otherwise I am free to take memory
controllers patch and I expect it will not hurt bisectability.

Best regards,
Krzysztof
