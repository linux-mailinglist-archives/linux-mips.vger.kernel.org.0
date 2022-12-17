Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5601664FB8C
	for <lists+linux-mips@lfdr.de>; Sat, 17 Dec 2022 19:25:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiLQSZU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Dec 2022 13:25:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiLQSZT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Dec 2022 13:25:19 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D98E09D
        for <linux-mips@vger.kernel.org>; Sat, 17 Dec 2022 10:25:18 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id fc4so13027926ejc.12
        for <linux-mips@vger.kernel.org>; Sat, 17 Dec 2022 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6sjokT3o59YQmhEsW2Y1r40UA0KaXAmerdEu90dROAY=;
        b=CQdZuISZPwK8T2Igz6EXHHza5LmPrAP3Av2BNIh7xkU0F0I5db0YlLhLzJIMdXtLyR
         tjq/fF5teRiddgSjlEM4WBAPEilKCqCrDif48dtUX7sJ1fZMpJ6FWdJFNj3+IomUJup/
         +lA6EMn7FLv/wfrm//S3jhfgdDdvFJLjtcskA16EatZcERedpTFmgwY0Lc9jnZsCjsHN
         /K86FemMEVFUE4ZLrNL4ox56mq1aJLsONwyR0XXVy4ZkC2koODuYJVqmiFctjH8xPmxT
         5x0a/t50Ud0g7LaWe7UBonApgk2NwUBNODFe7uV+yoH66++0CRfWQGprnrv9oKFXMnvG
         kgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6sjokT3o59YQmhEsW2Y1r40UA0KaXAmerdEu90dROAY=;
        b=e/yM0qQfhqVDg+/uC9L5V2GRX67EOO+BG2q6ARMgeUETmzqChqpX41XwFF1TSxg8f1
         lPXr0KiNKWxEwfTtxGDt49aPvJ9BF4mPreZFT83PGHFnoFHeZfrOI9Qqy9vkV2uqiwNo
         Tr2TBCIhuet6W4179cliUwI2/gxa2nY3sMYm2Pc8bwvLjFlJ5F8T5T4CZBqXrLtGQcjT
         x+aVXoLH6JjQGsJBdxVHrY6trct3RdzS+f+NbeAZFw/0ShbRBinhtyOu8F0FKf2/KkcG
         X1/wUPT9/QMo5OL0MQQ7pONbWJuAcAkvz3hKPjbLgdAzwNSi2ABHG2ejiB9moRTHD7uN
         Pl8Q==
X-Gm-Message-State: ANoB5pkroGZQn/VF5ibc+2cwoBre/Awi3XPPOqMsBzZbzrqs8LCSCDV0
        GqVIbZcExHepW9+bjgTL+BvdwhfKOlyf+w6oF40=
X-Google-Smtp-Source: AA0mqf6tsKCjicf5xWmWMZtETvmXoMoLo598/C0L2Sw/QKMWL532MWBl9iftPhMfnmtPg4iCxHd5zQ==
X-Received: by 2002:a17:906:5a54:b0:7c0:eba2:f9dd with SMTP id my20-20020a1709065a5400b007c0eba2f9ddmr32447381ejc.53.1671301517250;
        Sat, 17 Dec 2022 10:25:17 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id e8-20020a170906314800b007bf988ce9f7sm2235244eje.38.2022.12.17.10.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 10:25:16 -0800 (PST)
Message-ID: <e5cdc996-3b0a-5d7e-fc0c-76a2ebce3fb7@linaro.org>
Date:   Sat, 17 Dec 2022 19:25:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] Couple of Broadcom L2 driver fixes
Content-Language: en-US
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Doug Berger <opendmb@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
References: <20221216230934.2478345-1-f.fainelli@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221216230934.2478345-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/12/22 00:09, Florian Fainelli wrote:
> This small patch series ensures that IRQ_LEVEL is set for level
> triggered interupts in both the irq-bcm7120-l2 and the irq-brcmstb-l2
> driver.
> 
> Thanks
> 
> Florian Fainelli (2):
>    irqchip/irq-brcmstb-l2: Set IRQ_LEVEL for level triggered interrupts
>    irqchip/irq-bcm7120-l2: Set IRQ_LEVEL for level triggered interrupts

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

