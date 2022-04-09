Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50B8E4FA72B
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 13:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241604AbiDILUZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 07:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241599AbiDILUX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 07:20:23 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92BAC3C481
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 04:18:15 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id q20so7072584wmq.1
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=B0N+OwSXB4knXphkA3npowoH01kBKtCCzuJR6vseaEQ=;
        b=U6LMLN8h8KPMYnFF90Ad+319fMHmZaNuu8dafLLpmL1o7WALiw1SspYwvoG5xUUnqx
         sQnMBGfKrVV8hr6FT9DPGBaRzTR3v7g5/xIvaErTcvQp4GH+S+mB0fDkE1m3CbJcjVeU
         46TGzZhNou7jtgS4g/V86Q5UUoiblIQs9T1/zqfpRfDgPedp4os7nP5IC5/HgIM+zttt
         7vg2E8X3gRlVSOYNgGQoCr/2k4uS062764fOvpDIi9f1mUac/jSuSO2FI66lROMWRroO
         qCZmMzgjh/FYzRdp6mSCkZ5/687En6YQPz1NaBUJ74yFVyWox9Y/ZLb8pM8DydSZXN+y
         njMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B0N+OwSXB4knXphkA3npowoH01kBKtCCzuJR6vseaEQ=;
        b=1ybnz7GdYRcaMDhgmgrlJJKL1GXjpf9HU+/jpZfIb/yNDiu+TUd1G2VefoVn7p5EgM
         9QX9uj07I3+7Eck156y80BMUOfeWZ15u6HFAJ9TrK0Mw49568DqaAaMot34qPT/s5YJW
         TKvlbLZhJSc70rEok3Ho8BeHCSeEQH2/eXo3SUunxigfoQGNqziY5c1CtLADw3Sx4qwW
         IYjjvDAc52fKR8QrsFP7ljhzqHPWwJCE+7bdwCUb+nYgEvr7FSzIYj1qxbAv7a3e+h0l
         Z2Hxl3q+2EpaxlomG4SOkP3MAQRYK/CXML1Nq2y1SF5MUwLYs77P9Z26QqSQCRdhAHKl
         bM9w==
X-Gm-Message-State: AOAM533c/fu3UnEm9Y98ryKc2kKHKj10TMB3l4Jzabs5euqc08ceJmH2
        CRpJCTbIXVQrnZJNbGHVwRdaZChA7AK7TAxK
X-Google-Smtp-Source: ABdhPJwKRHMCNsGjq9T8m+T0mzvnY0pzB7roLlQWrdLdsg3ui2lnN0aVZwlrelYEpzHTFOk9WSgnng==
X-Received: by 2002:a7b:cb0d:0:b0:38e:aaf3:b08f with SMTP id u13-20020a7bcb0d000000b0038eaaf3b08fmr4981786wmj.12.1649503094236;
        Sat, 09 Apr 2022 04:18:14 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id p17-20020adfc391000000b002079f14979dsm1168578wrf.13.2022.04.09.04.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 04:18:13 -0700 (PDT)
Message-ID: <a7a46736-e917-7274-1593-147ed36a2a68@linaro.org>
Date:   Sat, 9 Apr 2022 13:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/18] MIPS: DTS: jz4780: fix uart dmas as reported by
 dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <00ec9d965cac78b252e14444deed8c93f5116bca.1649443080.git.hns@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <00ec9d965cac78b252e14444deed8c93f5116bca.1649443080.git.hns@goldelico.com>
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
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000: 'dmas' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10030000: 'dma-names' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000: 'dmas' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10031000: 'dma-names' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10032000: 'dmas' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10032000: 'dma-names' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10033000: 'dmas' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10033000: 'dma-names' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10034000: 'dmas' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: serial@10034000: 'dma-names' is a required property
> 	From schema: Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> arch/mips/boot/dts/ingenic/ci20.dtb: i2c@10050000: 'dmas' is a required property

All these warnings are the same two warnings...


Best regards,
Krzysztof
