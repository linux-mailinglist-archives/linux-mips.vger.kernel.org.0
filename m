Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3046261ECDB
	for <lists+linux-mips@lfdr.de>; Mon,  7 Nov 2022 09:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbiKGI2M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Nov 2022 03:28:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbiKGI2L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Nov 2022 03:28:11 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 119DC13F7A
        for <linux-mips@vger.kernel.org>; Mon,  7 Nov 2022 00:28:10 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id d20so15023095ljc.12
        for <linux-mips@vger.kernel.org>; Mon, 07 Nov 2022 00:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJ/Mwnct3TZ7HIih3opk7ydhGcqvBaH59swvlRhyi5o=;
        b=xa7T5BQxzXkz/boFwpbQFJiXwgrhpUrx5A0mnmE58r+XBnsnebuPQ3CYeOndGP7bUw
         2wzd+Jb7YiaY5Er2T77/2Ydj/QZfzOD7/qP6mXoyuD5JQO+eZqKau6HSkpK1wohfxj3l
         UnGU4DGm9F3uufcxBQdyL14prPXU337j/SglQRAOOCNurYqwg1ILSPT6MH8eMVxtHPeS
         miLsRIYaNY1dm4U7JagrKWVX4RseouKjAomkH1eQ/n4nfeQrGXX2LSD9sYhecX1ZCdRH
         cGZIZkM6j66nZCelPNSba3Qfbdzmm6aewa9QCszHGPG1brZsM8HiLUlhUnwa/n6G3WGa
         bE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ/Mwnct3TZ7HIih3opk7ydhGcqvBaH59swvlRhyi5o=;
        b=z6+HnlwJAPdFac1nRs0sLA+ZO+NhgOTMzjel1XZrAimlk/wJCICQYEq/wiwHdyMF0w
         7TxV2Jwp+ZDCAjSWrzBlofONiEkSHhMmRlPLzqDnNZwqcexIuDxdy/O72ANFX385NElJ
         38iKV+i5WIEeRYdCV2mG+wsy4UxcgSNIqDaLaEc4ZG2Fx/Ia/aiYONj0wrD6sjvf97Ht
         DevbpQzvOQ6NT9ifqruqJq6BBHDGirIz7be3/7dlYX4gi5pfRKa5RdYKvTbDX70ywr01
         5fOXPW8ogz3CwFFWPwJZFBIebBP8J57lcjfQPZksCH/4fPNFc983LigMrFL2aH2kXDQg
         ZKBA==
X-Gm-Message-State: ACrzQf0+LNoNfuY/ioNSlPRrUPqNxydVxNNKW4UUHLaTTvQZrLNgPAK2
        RcsnHJvtCSVI9lAsWeQvYTIOhQ==
X-Google-Smtp-Source: AMsMyM773skFoC6OdBSf7t8Ae0cisF6SiTWYbW/Zdmmo7u8JVCVXqxcgwqDj6Hx38fvKc8n74dfqPQ==
X-Received: by 2002:a05:651c:516:b0:26f:2a03:b969 with SMTP id o22-20020a05651c051600b0026f2a03b969mr4921918ljp.343.1667809688422;
        Mon, 07 Nov 2022 00:28:08 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q21-20020a2e9155000000b0026acc9edecdsm1098071ljg.47.2022.11.07.00.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 00:28:07 -0800 (PST)
Message-ID: <b45b8cf8-de9d-7132-1a35-48deeb4b79d5@linaro.org>
Date:   Mon, 7 Nov 2022 09:28:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] dt-bindings: interrupt-controller: add yaml for
 LoongArch CPU interrupt controller
Content-Language: en-US
To:     Liu Peibao <liupeibao@loongson.cn>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>
Cc:     Jianmin Lv <lvjianmin@loongson.cn>,
        Yinbo Zhu <zhuyinbo@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221107023404.26730-1-liupeibao@loongson.cn>
 <20221107023404.26730-2-liupeibao@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107023404.26730-2-liupeibao@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 07/11/2022 03:34, Liu Peibao wrote:

Add commit msg explaining what you are doing here (e.g. the hardware).

> Signed-off-by: Liu Peibao <liupeibao@loongson.cn>
> ---
>  .../loongarch,cpu-interrupt-controller.yaml   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongarch,cpu-interrupt-controller.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongarch,cpu-interrupt-controller.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongarch,cpu-interrupt-controller.yaml
> new file mode 100644
> index 000000000000..30b742661a3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongarch,cpu-interrupt-controller.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/loongarch,cpu-interrupt-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LoongArch CPU Interrupt Controller
> +
> +description: >
> +   On LoongArch the loongarch_cpu_irq_of_init() helper can be used to initialize
> +   the 14 CPU IRQs from a devicetree file and create a irq_domain for this IRQ
> +   controller.
> +
> +   With the irq_domain in place we can describe how the 14 IRQs are wired to the
> +   platforms internal interrupt controller cascade.

This should be the description of hardware, not Linux drivers.

> +
> +maintainers:
> +  - Liu Peibao <liupeibao@loongson.cn>
> +
> +properties:
> +  compatible:
> +    const: loongarch,cpu-interrupt-controller

You have exactly one and only one type of CPU interrupt controller for
all your Loongarch designs? All current and all future? All?

> +
> +  '#interrupt-cells':

Best regards,
Krzysztof

