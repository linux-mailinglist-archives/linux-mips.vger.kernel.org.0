Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6396CF9C6
	for <lists+linux-mips@lfdr.de>; Thu, 30 Mar 2023 05:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjC3Dyy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Mar 2023 23:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjC3Dys (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Mar 2023 23:54:48 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E3B35B88
        for <linux-mips@vger.kernel.org>; Wed, 29 Mar 2023 20:54:46 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u10so16899506plz.7
        for <linux-mips@vger.kernel.org>; Wed, 29 Mar 2023 20:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680148485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mwmSNDnybMqBEh0Z+gPmCfYtw9bkrJ0PR1su4QL+8ng=;
        b=GfolM2geRXzvdw+ehZXpU8LIxL1xjz8Gj7iUHWYn0dQe/xK6gKP+jAnnfACd9dNas/
         V++Sm0TyABcLhhIGfP5TWHGwoCe9wculMPYuWNh8MX5dslq4eZGiHhMbH8QnfrjFjyDi
         1R02/q4m606IhgQClA65oAaxUmLy9Tlpoo3VU7hbegQucmzXRckhRFIw+Bte6EBu90qm
         Eybgi+WtfZP6vwZHlApEpFbN2Q1QBxtwJODT8JmI2ozap/CAX0ZDAlAhOh4ro/TsRICH
         q6vFusF7IDZ1ivkOyQ2u6hFyH7XuM27wai0R73hAJNlIGTC/gbz4+yD+DIAgG5FzF0WR
         8Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680148485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwmSNDnybMqBEh0Z+gPmCfYtw9bkrJ0PR1su4QL+8ng=;
        b=t3pN6uLmuYCVVQX6X9JYetM1KpL/4Dsf3pPLbVvR+/SFtzURs/5wodXX4lK9/tEzFs
         qbHZQPpZ7dwBldkDh7awih2+GMfs17+1nXSJymroe5k4Jctk+xdXJ9Qn6FxFUdNTtCkv
         CTWbiUNG35jNsLKEYzoAitgzOXF1tdPen0eRdH8WGbjv5mN8y3MaDMCEQ6D5YH3pH88K
         SoCf/LjcR4Rzia6cQsJdPP4lc2kblkoRRy64aRtWtij+fk7c28+tQ7f6dJJi+7WwVqvm
         Ttv2EPTSbHawPRspvA1E1tZs0RFGcsjS+m4om3eGcQhe4aF4psJUyRioFW7YmtmIfgQp
         Fj0g==
X-Gm-Message-State: AAQBX9ctB8Z/7k36rYHjA5ciV4T/FM6mkfobU8BBAwVPmdXHhBctA8sz
        xu8gDmh8T7+eVn4ooootgt/KMg==
X-Google-Smtp-Source: AKy350ZtoosHc1UXvyJfiqR7/4WaAgxoUcypk7oVcM2Qe5NgerUZWsBCiwEUDE9iUeMBrzKflkrmgQ==
X-Received: by 2002:a05:6a20:b71f:b0:e0:316a:d62c with SMTP id fg31-20020a056a20b71f00b000e0316ad62cmr11170953pzb.60.1680148485691;
        Wed, 29 Mar 2023 20:54:45 -0700 (PDT)
Received: from localhost ([122.172.85.168])
        by smtp.gmail.com with ESMTPSA id q17-20020a62ae11000000b0062607d604b2sm23791281pff.53.2023.03.29.20.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 20:54:45 -0700 (PDT)
Date:   Thu, 30 Mar 2023 09:24:43 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Anup Patel <anup@brainfault.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, sparclinux@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 15/19] cpufreq: sun50i: Add explicit include for cpu.h
Message-ID: <20230330035443.kowj26o4z22yg5f7@vireshk-i7>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
 <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-15-581e2605fe47@kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29-03-23, 10:52, Rob Herring wrote:
> Removing the include of cpu.h from of_device.h causes an error:
> 
> drivers/cpufreq/sun50i-cpufreq-nvmem.c:42:19: error: implicit declaration of function ‘get_cpu_device’; did you mean ‘get_device’? [-Werror=implicit-function-declaration]
> 
> As of_device.h is not otherwise needed, it can be replaced with of.h
> (also implicitly included).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 1583a370da39..4321d7bbe769 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -10,9 +10,10 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cpu.h>
>  #include <linux/module.h>
>  #include <linux/nvmem-consumer.h>
> -#include <linux/of_device.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/slab.h>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
