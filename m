Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4C7E620FFA
	for <lists+linux-mips@lfdr.de>; Tue,  8 Nov 2022 13:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiKHML4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Nov 2022 07:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233278AbiKHML4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Nov 2022 07:11:56 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C93F2611
        for <linux-mips@vger.kernel.org>; Tue,  8 Nov 2022 04:11:55 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id v17so22155815edc.8
        for <linux-mips@vger.kernel.org>; Tue, 08 Nov 2022 04:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mzMlRiYVPoJeiMegBbQ1MjhjUAcP2BQ4/F4++yECz0k=;
        b=GBzcjxcTtY7cjcCkSCQAIGHks2ribsjrH6lBTtbG/1zwiEhQlsnJaSbsqWIDSpSOFx
         gJ6vlVgZq0l1FPcHLDk7jVXjlQ09V1dSyORgcpzPxrcHaQIAAMaR7a79x2DQ8AjUhDRz
         JMSHe1Q0tSvaXY4Pm09q1nRDHcwJZNo3OelsxpJBoi8C2q5sBwP+dCKAYZwBnAOhhu7f
         0aTgOUlr+3G93d5ICdGrtgnqHR0oAI81DJiwEiIC8Z6SnaSq/fzV9s0eUgMTPpF/ueZY
         N3lw/eDF0TozdSQV7+4aMpm8/4Zw++xw6a1SretE87N2695SH3E7QEONPdbUartnY7F4
         JuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzMlRiYVPoJeiMegBbQ1MjhjUAcP2BQ4/F4++yECz0k=;
        b=FSjHElvE/yTgWaN6lt0Jm7Xuhqy2bYDVKLKHEyH5JgIMJLfxT0CcKZ7i0aH9m5axOq
         IlFcG3C0WKYGcTOhT7sAzDCC6FxESFBv9kRqCkOYSJB9ptA/S0pRxSz+Ox6wi3g3D7Wz
         Jucb9gHpglnA7Gzd4GCfeca47bgj9wY19xl/CdYDFQkq8/FDQbxUGRzXZU9Whu8HofHJ
         b9wsudUcbHbQno13ycz7odWF+RZ31d6Zy1vKxRwVShoVAoEuYFyyI0UfmAA1+eL2995S
         QguclCeqqPBHM001V45rsmB/+QcsDIORIAcnLQ1WVZlNGYyz00bbgxwMBqyntBwhz7/Q
         WN+w==
X-Gm-Message-State: ACrzQf0c8hMpg+CplqlDHE5Y2odjVOuVnWaPas5YfxuuAfIlMCkSRrOg
        +1MLiV8kGYHgOlhWmW/QlhlliBNY1pHfOYmYeKsYwA==
X-Google-Smtp-Source: AMsMyM5kiWVSRjqdEOc/GfF/lf+nlKsl0ToMTcnzZ4XbNPlmja/gkGsp1SDtfcczBpZBE8Xvq90EA3Kh3ciEP69xttM=
X-Received: by 2002:aa7:d6d1:0:b0:463:ba50:e574 with SMTP id
 x17-20020aa7d6d1000000b00463ba50e574mr37546370edr.158.1667909513741; Tue, 08
 Nov 2022 04:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20221108092107.28996-1-zhuyinbo@loongson.cn> <20221108092107.28996-2-zhuyinbo@loongson.cn>
In-Reply-To: <20221108092107.28996-2-zhuyinbo@loongson.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 13:11:42 +0100
Message-ID: <CACRpkdbJFNhE1acJ5eNncvfK0VZgW=pCB3716Rv3KahdK1dokQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: gpio: add loongson series gpio
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Juxin Gao <gaojuxin@loongson.cn>,
        Bibo Mao <maobibo@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        richard.liu@st.com, Arnaud Patard <apatard@mandriva.com>,
        Hongbing Hu <huhb@lemote.com>,
        Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Yinbo,

thanks for your patch!

On Tue, Nov 8, 2022 at 10:21 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:

> Add the Loongson series gpio binding with DT schema format using
> json-schema.
>
> Signed-off-by: Yinbo Zhu <zhuyinbo@loongson.cn>

> +  gpio-ranges: true

So you are using GPIO ranges... and...

> +  loongson,gpio_base:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      This option indicate the first GPIO number in this node.

Then you have added this to reimplement gpio ranges.

It also shows in the driver.

Drop gpio_base altogether (we do not encode linux-specific properties
into the device trees) and use gpio-ranges as they are intended to
map between the GPIO numberspace and the pin control pin number
space.

See
Documentation/devicetree/bindings/gpio/gpio.txt
for documentation on gpio-ranges, also look how other drivers are
using them.

Yours,
Linus Walleij
