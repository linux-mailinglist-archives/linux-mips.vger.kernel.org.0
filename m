Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B87B1ADB07
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2020 12:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728869AbgDQK0s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Apr 2020 06:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728823AbgDQK0r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Apr 2020 06:26:47 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C858CC061A0C
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2020 03:26:46 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m2so1376242lfo.6
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2020 03:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=abDyn/jXseXxq1cb7bzkp4uCUuMQnA0AHpsOMWQZYsc=;
        b=Ibbybj3B49zX5Erj/RuaY9e3gsgQ5r7g/GnmjSMpZ/abyKFCQAXFSZECh04pljsSDe
         K1oL4Jtupdt6W0gpdx2hMGO0/KoQk/hbf41AWqkdYrU268L1WB5zWGC+ilh8mGKMutXl
         eHMnHDsuvNOf09CZB1Jw6062l1EK38hwF+VraL5qIXpvAWli/rENokjYyaolv82CzlL5
         uS5ZVkRjkmDiQYrIGv3X5lYcASPKF2cgh5QAJWSm2S0Z2nyBRDCV1P9LFq7l7+uBKdae
         j0l41cDPgHlRH7LrYrTSQNRIkQuqfr2k4wVA4i2kPg9bpIHVQtYpZClL3HgqGeCGityA
         L9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=abDyn/jXseXxq1cb7bzkp4uCUuMQnA0AHpsOMWQZYsc=;
        b=l9Sl5IaXvkHG+cVDWUtx3b7yNQNZmRROpzSoguK9aaAZcyPXmpYQy8lgjmFGtIqp1j
         zTTZLfdcF7rWAYn+jUMvVy60EFvjSMAjYNzX7AdR5yzc3s/5zuGWsI8FTBbMHFV7fbL3
         axtz2VGQi+7ArM3YmQXkLxaUyVqQVpg21qYobQx6v+CauslTzPNRm4fGdRpKnYLR3DqF
         bGloT7TF3BqOQda2larJ1zsdJdiO5sVCHCjnd/Bq8y0fs5/fS1UT7FYq3KBI1dTHkC3t
         E1KI+fpeS7qsq6wwUgaU/7xQP2fPXHhEnNnk78R6sSv9TlSdhYbDdGjqSk0cEJRsBn1X
         9Jxw==
X-Gm-Message-State: AGi0PuYDmh5FV/L2ilbzRm8y4qbgWmhPoBclK4XvxEsjdoip2H+CyG9c
        +7zMn/Bhrg8qipGK/ZNRAd6OxA==
X-Google-Smtp-Source: APiQypKjN7ryKHp7crnqULqVwMcxdcRVmUG5EbaOPwpMcWc6SP+r9a0h77F07utY1WzaZU4k1WmcKA==
X-Received: by 2002:a19:5206:: with SMTP id m6mr1607205lfb.33.1587119205308;
        Fri, 17 Apr 2020 03:26:45 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4680:4c27:1a2:7a5f:abbc:5b1c? ([2a00:1fa0:4680:4c27:1a2:7a5f:abbc:5b1c])
        by smtp.gmail.com with ESMTPSA id a11sm11712142lji.62.2020.04.17.03.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 03:26:44 -0700 (PDT)
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: make bcm7038_l1_of_init() static
To:     Jason Yan <yanaijie@huawei.com>, f.fainelli@gmail.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        justinpopo6@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hulk Robot <hulkci@huawei.com>
References: <20200417074036.46594-1-yanaijie@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <ecb3e3e1-7761-faa7-10fa-67da69604306@cogentembedded.com>
Date:   Fri, 17 Apr 2020 13:26:43 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417074036.46594-1-yanaijie@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 17.04.2020 10:40, Jason Yan wrote:

> Fix the following sparse warning:
> 
> drivers/irqchip/irq-bcm7038-l1.c:419:12: warning: symbol
> 'bcm7038_l1_of_init' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>   drivers/irqchip/irq-bcm7038-l1.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
> index eb9bce93cd05..fd7c537fb42a 100644
> --- a/drivers/irqchip/irq-bcm7038-l1.c
> +++ b/drivers/irqchip/irq-bcm7038-l1.c
> @@ -416,7 +416,7 @@ static const struct irq_domain_ops bcm7038_l1_domain_ops = {
>   	.map			= bcm7038_l1_map,
>   };
>   
> -int __init bcm7038_l1_of_init(struct device_node *dn,
> +static int __init bcm7038_l1_of_init(struct device_node *dn,
>   			      struct device_node *parent)

    Reindent the above line please, it should start under *struct* on the 1st 
line.

[...]

MBR, Sergei
