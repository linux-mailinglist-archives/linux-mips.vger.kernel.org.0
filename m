Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA8F1323620
	for <lists+linux-mips@lfdr.de>; Wed, 24 Feb 2021 04:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbhBXDoZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Feb 2021 22:44:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232779AbhBXDoZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Feb 2021 22:44:25 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C5CC061574;
        Tue, 23 Feb 2021 19:43:45 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id d11so371885plo.8;
        Tue, 23 Feb 2021 19:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=mBt9hQTkQ2cxkK5R0jCQwcHRCZkmatR1/Lom7M+wwuw=;
        b=uX+b40Q0fD3rHFTk7H3c8mgoejQ+YTZReMZSKo0BQfJofnsQOa48YFG3hYBGOr8MnZ
         Rc6OCKntoRsjvFln9DoJfWAeSlV5KrIy3LPJc0BnjVlMU323g2D594GsRfi7vnDbuvKo
         rZTQ1bFxk3SNnW3TvaMi8zCNC3dX40HsWDkXfMhdP5G2bakOOqy9640KqCDNWTq+rlG1
         XtJj7QdFEK5AI0TI1uohW1nCZfSl4QxTxnVvQSk5jVodEk1ELliOp3tQZp1L0yoRJhoy
         FoVMdaWQZIHbnXKQcv8RHBc+R5TyBr0nqIOnh/m8FElsb3ARoseTGUOuJPrwnkGfwZnG
         mN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mBt9hQTkQ2cxkK5R0jCQwcHRCZkmatR1/Lom7M+wwuw=;
        b=LU3Bj5c8DUTZXlykVUufJAH3+EnYD4V60TfPREFKamu3dkchwD6rkxVjl3bASr/FZ9
         nMEtJsyvQJ7IbiuylKG85yKGf8CxmtnAC9XcLu7OW2hnmoi/CBGx7XPFdnZmuvdw9AFt
         weK0hZ9tfbGpVhUw7CqDMJ8ILCgbwRkWXyIMUY5HrGqciDNot1hqg29R9X9HmvHO4wtY
         jniCgu4De7kpUm4m5JsNHhWrRrc1APQT6HioqGBk+e/PC3skw5gn/HA+FLIZqAIuiOEI
         GQPih6TbSpPJm1aGHYjA/M8CT1oiQhGgsd90Do4dUOQ66AZ9yhiv4BwTG+OIXt0FrM5I
         +rMw==
X-Gm-Message-State: AOAM530jg3pXbQPhF9Y8Q5Xf9Cz1+b5HKv+HrHYovwFO4MCqlPZmbZgk
        ZrWVTfwLT5E12cKZN6sJFxn695bgerg=
X-Google-Smtp-Source: ABdhPJw7TfQPjJUGfsPB/wnkKA039u2C/Rx7/iXpfDjnGLX+23V9icue3TzCPyBq6u3cTOgR+yNHlA==
X-Received: by 2002:a17:90a:cf0e:: with SMTP id h14mr2125850pju.96.1614138224504;
        Tue, 23 Feb 2021 19:43:44 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o20sm560518pjt.43.2021.02.23.19.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Feb 2021 19:43:44 -0800 (PST)
Subject: Re: [PATCH v2 2/2] irqchip: add support for BCM6345 external
 interrupt controller
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org
References: <20210223180840.28771-1-noltari@gmail.com>
 <20210223204340.312-1-noltari@gmail.com>
 <20210223204340.312-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7de8507d-82dd-291e-1f63-7c1460e6a6b2@gmail.com>
Date:   Tue, 23 Feb 2021 19:43:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210223204340.312-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2/23/2021 12:43 PM, Álvaro Fernández Rojas wrote:
> This interrupt controller is present on bcm63xx SoCs in order to generate
> interrupts based on GPIO status changes.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---

[snip]
> +static int __init bcm6345_ext_intc_of_init(struct device_node *node,
> +					   struct device_node *parent)
> +{
> +	int num_irqs, ret = -EINVAL;
> +	unsigned i;
> +	void __iomem *base;
> +	int irqs[MAX_IRQS] = { 0 };
> +	u32 shift;
> +	bool toggle_clear_on_ack = false;
> +
> +	num_irqs = of_irq_count(node);
> +
> +	if (!num_irqs || num_irqs > MAX_IRQS)
> +		return -EINVAL;
> +
> +	if (of_property_read_u32(node, "brcm,field-width", &shift))
> +		shift = 4;

This property is not documented in the binding, other than that:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
