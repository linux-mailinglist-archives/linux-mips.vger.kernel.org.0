Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BAED76846A
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jul 2023 10:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjG3IYm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jul 2023 04:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjG3IYl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Jul 2023 04:24:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA544170F
        for <linux-mips@vger.kernel.org>; Sun, 30 Jul 2023 01:24:39 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99c136ee106so5801166b.1
        for <linux-mips@vger.kernel.org>; Sun, 30 Jul 2023 01:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690705478; x=1691310278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VRYMQY9BPGlo18Ue9wdGHPc8r7gHT9j4qAfo4pAR8pg=;
        b=owbVRypjlOyFlexhfqt/MhVKvgt6pkZQ6hihoLu51y5Jh3JByEO4nEwPiJaNXo3PrI
         UscLe6JozUMO+Rc40R8nU/QC/TOrpmuGoLRb/nMW4tL9uTPrX0W6rqB8TuKinVY+z1uy
         RIj+jk6EM+r/2XBSxb/5PzzumbxxzRFL7LF4irjZiGScTD++D5R/wREKA7rRKYFk6n6b
         2MBmu72lyG31rEGTMupL240EblAVlQjjR2cdpFAm8QMJ7ZTz6H0jFP2q0ZrHSpgugFaB
         LCT1jGKL4I003wQdlocf/DrelkJnFECwuCLRrT1rAb+YQLg46aLKW821WofZN9hSQPwN
         wYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705478; x=1691310278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRYMQY9BPGlo18Ue9wdGHPc8r7gHT9j4qAfo4pAR8pg=;
        b=ckssrdKu3YPKK8a/3BATXVRk31hlyY2Iy5PhyO2WSUJlxGB+8phu+SNXLWvoWE3Kk0
         9y4SQL48OD1gHxxnOvvd8E2PDaqSiZvKWXPhqIxQby2IJGf9An/alDD78pibh11fNUWv
         KCySuy1dAbLqbLkb/GldDfs5P68cOhOd5PU95wZz/zhKG+bjzPfnO6sHQ6VgoPzCjQvT
         ni7HXjzHU+9NnnVEoUyNedGPVZsRld5VuodqWtYQDye/sC2EHLidX7k7cUqXTplGveUt
         kY1hvycN5ckYEeZ/r6NAPNEpv7zKvBHROtWbhV2ySEMfqCqHJIgJyr790vm4+AoWxqnT
         M3hQ==
X-Gm-Message-State: ABy/qLZTCFRrZ6s0HClBIOygdFYmxuw6Etmag3jyvgRntR2W6mAoZYnE
        Mo7e4guviuoePxzICbAWborXWw==
X-Google-Smtp-Source: APBJJlGPd1tmqLalRo51udpNx2aE3VHYZNSILqkQSfgCqquKiYK0kHBII2lYw5i4zn//fesICVN0qg==
X-Received: by 2002:a17:907:1dd9:b0:98e:3b89:5dc6 with SMTP id og25-20020a1709071dd900b0098e3b895dc6mr4944156ejc.48.1690705477808;
        Sun, 30 Jul 2023 01:24:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709063c0f00b009929ab17be0sm4347881ejg.162.2023.07.30.01.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 01:24:37 -0700 (PDT)
Message-ID: <551ac5ae-2ccf-0a7e-46df-e1b05e8163cc@linaro.org>
Date:   Sun, 30 Jul 2023 10:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/17] MIPS: loongson32: Convert platform IRQ driver to DT
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20230729134318.1694467-1-keguang.zhang@gmail.com>
 <20230729134318.1694467-7-keguang.zhang@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230729134318.1694467-7-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29/07/2023 15:43, Keguang Zhang wrote:
> This patch enables Loongson-1 irqchip driver
> by adding platform INTC device nodes.
> And drop the legacy platform IRQ driver accordingly.
> 
> Based on previous patch by Jiaxun Yang.
> 
> Link: https://lore.kernel.org/all/20190411121915.8040-3-jiaxun.yang@flygoat.com
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
>  arch/mips/boot/dts/loongson/loongson1.dtsi  |  53 ++++++
>  arch/mips/boot/dts/loongson/loongson1c.dtsi |  13 ++

DTS is always separate from the drivers.

>  arch/mips/loongson32/common/Makefile        |   2 +-
>  arch/mips/loongson32/common/irq.c           | 191 --------------------
>  arch/mips/loongson32/init.c                 |   5 +
>  5 files changed, 72 insertions(+), 192 deletions(-)
>  delete mode 100644 arch/mips/loongson32/common/irq.c
> 



Best regards,
Krzysztof

