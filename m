Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2B06F25DA
	for <lists+linux-mips@lfdr.de>; Sat, 29 Apr 2023 20:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjD2SZD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Apr 2023 14:25:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjD2SYy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Apr 2023 14:24:54 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63D31FDD
        for <linux-mips@vger.kernel.org>; Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a6670671e3so9276575ad.0
        for <linux-mips@vger.kernel.org>; Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=l+H0JwRFKwAD4TzkKtg69sq/SE0iMjDe/NX6Txlv16Ba4kBdBRnOLJE9cuEp/EtowJ
         pvTfeswVQQvBqhKyncNpPdAR29BMkNe6LB9ZMzoVyBV5Q9aGwXPM1Fc+6Qr50SDIiKsJ
         q9xyHClsPNOcAaBRr9fQ8UfCjonz6jsBwXrYvJjTpLiOgKgKgvN8uwk1fTPbl8XK+035
         m3QY80DvBeDJf799u5hnhHuLgfMpPNb4a9jtTjDBw2OzLziw75OHG2J322CH+dAw1HCw
         HsmmVI7grjIDtuj7uBS5rk+EMADzgTEglzedbNWVOsorwBluoILEBWp5M0RLFiHKNfCf
         2+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682792692; x=1685384692;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGl5HMSK57VmBSwKSnwgm3VXr902jH6XBJlNczgIzTY=;
        b=OUbmwDDlfrDeeNlVmbHu7udaYXh2Yc4bZDWO7x8vWZ5CeYrDR1vnu40cEJmFX2ss8T
         Pm7rgbVslzkZO01SB9eZW2/k0SLh1XavyaivW9Y2RM4nTmP2mKljQQCmacxylLta5VO5
         SExUKlFTv+Wu00hG7wEHnD6Yz8Mn689EcIA397sTr+yyrqzK7KjiFcKI1imUal/WWrah
         dAdh7nFTKAR/NBUu5lyajZ7p7/4BXe/8vyYWF/V0kyOtwZzmmRDU/CWd8c3eUsxfplvp
         1WTp06K7iLFnivGopuIysypGaydk8bfnHqMekors0UOGBDUO03CT2XRIzw05PHIgN/oP
         DoBw==
X-Gm-Message-State: AC+VfDwoqBRd7mdF32w03Xdg+ip6Po+IZjDS0Rp5JsLNR1ba+ecUFN5o
        QHOWBiPRyZP3JE9guXkE0FBcCA==
X-Google-Smtp-Source: ACHHUZ6ZiLzN9eR+ckFMqg7tN3D4bPpq4geojnHO1Jqz7HXa46oxZHVvxREPvQQtQygRvSqX/lxFkg==
X-Received: by 2002:a17:903:124b:b0:1a2:8c7e:f315 with SMTP id u11-20020a170903124b00b001a28c7ef315mr10630845plh.21.1682792692014;
        Sat, 29 Apr 2023 11:24:52 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z2-20020a170902708200b001a19196af48sm15137375plk.64.2023.04.29.11.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
Date:   Sat, 29 Apr 2023 11:24:51 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 11:24:33 PDT (-0700)
Subject:     Re: [PATCH 09/19] riscv: cacheinfo: Adjust includes to remove of_device.h
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-9-581e2605fe47@kernel.org>
CC:     davem@davemloft.net, robh+dt@kernel.org, frowand.list@gmail.com,
        linux@armlinux.org.uk, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, Greg KH <gregkh@linuxfoundation.org>,
        rafael@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
        amit.kachhap@gmail.com, viresh.kumar@linaro.org,
        lukasz.luba@arm.com, amitk@kernel.org, rui.zhang@intel.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        tiny.windzz@gmail.com, lpieralisi@kernel.org, sudeep.holla@arm.com,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        anup@brainfault.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, Marc Zyngier <maz@kernel.org>,
        vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     robh@kernel.org
Message-ID: <mhng-8827afbb-9f5f-4a6d-b528-4b79b1a32f8a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 29 Mar 2023 08:52:06 PDT (-0700), robh@kernel.org wrote:
> Now that of_cpu_device_node_get() is defined in of.h, of_device.h is just
> implicitly including other includes, and is no longer needed. Adjust the
> include files with what was implicitly included by of_device.h (cpu.h and
> of.h) and drop including of_device.h.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack and I will take the series via the DT tree.
> ---
>  arch/riscv/kernel/cacheinfo.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 3a13113f1b29..e3829d2de5d9 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -5,7 +5,6 @@
>
>  #include <linux/cpu.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheinfo.h>
>
>  static struct riscv_cacheinfo_ops *rv_cache_ops;

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
