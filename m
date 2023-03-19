Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 155A56C0564
	for <lists+linux-mips@lfdr.de>; Sun, 19 Mar 2023 22:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbjCSVUu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Mar 2023 17:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjCSVUs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Mar 2023 17:20:48 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8DA10A9B
        for <linux-mips@vger.kernel.org>; Sun, 19 Mar 2023 14:20:46 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5416b0ab0ecso192912637b3.6
        for <linux-mips@vger.kernel.org>; Sun, 19 Mar 2023 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=yxYOpG1BTRH8mP4CO9pabOiIVp8JZr5VwAuFO8HU6vbaqpTxWmCE4iIgG/OVL1bC1K
         h3LhfvJ9Emngr37qgSs4y3135OyBRvx5CQrGOhqBQ1h52Thw6LlPUCXerXAafRWoy3r/
         FDFDT9ERbcJkGc+2G4eLkbvA5KcKtQ6KYbmnVg4lq1vniUExZ2sFYpXbvCD7hKDVMLon
         QLx20N80Tf488Dgbj44gJ9XeDYP2w0y+6+La+/a0ASo0Dh+zkjSg2/P4RcnR2PKoZR8Z
         jdQ+VbU+0FFOQcGsff14UjVnV15EfKcDuX6yib3W9b/IG0H6KARxUCDOXylMZHreZLWk
         0npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=kAsqJAGtdIX/PiSNR9zMPH2PNjqTO+FM1omoageaQSXO26SX1OBoEG/68gkTMeVhzI
         VOcdR9Pkc311ySAiZCyHGGkg4EAIvMUIY+WAjh9x4vG3XhIVD9e9Htp8UpMtcFyL6wUt
         rWi+e9jtUjJddqAvdw3NCbHIqtv0MlHcEdOrnF9KhL36QEczjUsCVqofe5eCGig3fF7a
         flOClmfBGaMI1tDabfPO3bGqpmL9f+hcW9nxtVxT7VxoOFRRKCwN3IERYaD3Fe0SXLrz
         6eOrWJorI5Z09aK1lwZ3DS86N87k4UaEme9z6YssT3B4JDAoJ6e0EaEl+JRpPLZIgTQC
         8TzA==
X-Gm-Message-State: AO0yUKWXDmh/8IW8GyPPCvX9mwdiueOVSzkCNXCpVuhk+aLMnoSDY+yw
        ncaX/ymTcpfGPbJE1sWI8YcCZNpj7zJAqlmlc5Dpbg==
X-Google-Smtp-Source: AK7set/4tcKb2KcMcmhkFSECkX9UEXl6Q7CPyM6DmVWY/gBDswc6Du79KNPC9UhC3cNpQzNAw1FAAnNdRAYmdab1914=
X-Received: by 2002:a81:ae5f:0:b0:532:e887:2c23 with SMTP id
 g31-20020a81ae5f000000b00532e8872c23mr9029129ywk.9.1679260846054; Sun, 19 Mar
 2023 14:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230319115925.1317654-1-sensor1010@163.com>
In-Reply-To: <20230319115925.1317654-1-sensor1010@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:20:35 +0100
Message-ID: <CACRpkdbxSNCKNfous7h2dBQ_AW9KS9qyxPfPxOO=3PMDsDxcng@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/gpio : Remove redundant platform_set_drvdata().
To:     Lizhe <sensor1010@163.com>
Cc:     brgl@bgdev.pl, geert+renesas@glider.be, info@metux.net,
        rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        f.fainelli@gmail.com, sbranden@broadcom.com, shc_work@mail.ru,
        j-keerthy@ti.com, hoan@os.amperecomputing.com,
        fancer.lancer@gmail.com, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kaloz@openwrt.org,
        khalasa@piap.pl, keguang.zhang@gmail.com, daniel@thingy.jp,
        romain.perier@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org, mani@kernel.org,
        ludovic.desroches@microchip.com, andy@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, jonathanh@nvidia.com,
        sathyanarayanan.kuppuswamy@linux.intel.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 19, 2023 at 1:02=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:

> platform_set_drvdata() is redundant in these functions.
> the purpose of calling this function is to place data
> in *driver_data. but the data is not retrieved in these
> functions
>
> Signed-off-by: Lizhe <sensor1010@163.com>

You have to also ascertain that the data is not used elsewhere
like in some callbacks or even in other drivers in some odd cases.

Yours,
Linus Walleij
