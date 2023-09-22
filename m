Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC657AB939
	for <lists+linux-mips@lfdr.de>; Fri, 22 Sep 2023 20:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjIVSf2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Sep 2023 14:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjIVSf1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Sep 2023 14:35:27 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695A6AB
        for <linux-mips@vger.kernel.org>; Fri, 22 Sep 2023 11:35:21 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so2460842f8f.2
        for <linux-mips@vger.kernel.org>; Fri, 22 Sep 2023 11:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695407720; x=1696012520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9ePrVfdNy/JzYRXiuwdT/jgHodsIKRvT6Kq8KoBVSc=;
        b=drXB3KZdD4j3ybh06C1KoNUB2WZsoB+lExp+KueeUACwPM8aRrBfT9aTRtcL2Kskok
         frYDYinNaQ0Y0TKNLHNwMvQ1Tnr2fpasN+hhmarEMhrChzzxQaSK7Dywud6DT1wKpaUP
         XynlfzmB1S4xJeLW7PZSrx8jJfdHNxNH3NdAxxqTs1gZ8vb/cJ56odPYLd1+/8KULdjY
         SXzTW+fNMUxDkwybH71j3yEqxBXLqXP6+m189M958wVSCzW3iT3m19ba8VpN8lbhtv8f
         hIwEIICDALP4fOwUgW5pul3aEWmunipxMu7sRXEz9cnqdEgKY3kJYIr8S3oN/LlVjKqd
         2+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695407720; x=1696012520;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9ePrVfdNy/JzYRXiuwdT/jgHodsIKRvT6Kq8KoBVSc=;
        b=eCkYdMrPTfnzohKghOOx+ZlhDeer4WDCNN6ny6pTzHaRUNHqz0N7fF96CxhtZ/XK9M
         tSSNYDmofG0QSoRXAXtYmJR0Aey7GLuVefabA9j6FTEPXzTry77Dpo8XD/WoRnF/1sDy
         gDtPuTAfvCHbTp0WijRAfF8soK4F88PXMEPilqarXE6wub5ygs/TI8JMRwzMO9Q+19xJ
         UwnxUfLsjFvcXZFJxvMzRs5Xig9A/a1AijzoWV8dNUn/W8ITYFQqu9VEt+SVySVgTH/C
         cCs+DLZmF5ziLumBYaWutbErJ6Yngz3h6HMk2EGDKQ5cELFgHvEhamTJKxrxTymPy3XT
         iK/w==
X-Gm-Message-State: AOJu0Yyyi1ljMog8Qudpj2cLzN2yN+8T8NWlfR2fXZET1P36q2y4Lbmq
        DE06FU2DkB6Em/Wb15zz8ud0Vw==
X-Google-Smtp-Source: AGHT+IGHNHeD3T2yar23Ec3UH67UtsxfVcBnSqULhmwaYiv+OLl4leNTFgBuPq0hiT5BDrQsK26dyQ==
X-Received: by 2002:a5d:60c5:0:b0:31f:b91f:23ef with SMTP id x5-20020a5d60c5000000b0031fb91f23efmr441114wrt.51.1695407719864;
        Fri, 22 Sep 2023 11:35:19 -0700 (PDT)
Received: from [192.168.192.175] (181.red-88-28-23.dynamicip.rima-tde.net. [88.28.23.181])
        by smtp.gmail.com with ESMTPSA id m16-20020a5d4a10000000b003200c918c81sm5000406wrq.112.2023.09.22.11.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 11:35:19 -0700 (PDT)
Message-ID: <52ba27b9-79d5-f9cc-450f-fe831e65769a@linaro.org>
Date:   Fri, 22 Sep 2023 20:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 2/6] mtd: parsers: ar7: remove support
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
References: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
 <20230922061530.3121-3-wsa+renesas@sang-engineering.com>
 <20230922163903.3f49ea2a@xps-13> <ZQ3VA/2pAC3Do1Xd@ninjato>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZQ3VA/2pAC3Do1Xd@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/9/23 19:55, Wolfram Sang wrote:
> 
>> I'm not sure it is wise to merge defconfig changes through mtd. Would
>> you mind sending this change aside to avoid potential conflicts? Each
>> patch can live on their own anyway.
> 
> Yup, I can send a seperate patch for it.
> 
>>>   drivers/mtd/parsers/Kconfig    |   5 --
>>>   drivers/mtd/parsers/Makefile   |   1 -
>>>   drivers/mtd/parsers/ar7part.c  | 129 ---------------------------------
>>
>> Do you have other changes related to this file in your tree? It failed
>> to apply on my side.
> 
> No change. Plain v6.6-rc2. I used "--irreversible-delete", though. Maybe
> this is causing issues? As I stated in the cover-letter, I wonder if all
> this should go via MIPS. But there hasn't been any discussion about it
> yet.

MIPS tree for the whole series certainly makes sense.

