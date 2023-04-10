Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE8B6DC353
	for <lists+linux-mips@lfdr.de>; Mon, 10 Apr 2023 07:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjDJFhU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Apr 2023 01:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjDJFhT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Apr 2023 01:37:19 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A955F35B3
        for <linux-mips@vger.kernel.org>; Sun,  9 Apr 2023 22:37:17 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id ud9so9948752ejc.7
        for <linux-mips@vger.kernel.org>; Sun, 09 Apr 2023 22:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681105036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2/k4nezMOkcM+h2CDII7+REb1p1LqwOaOkMYQqqQJrs=;
        b=whrLD5VxYI35os9KEqHHxKa9Pszo5bo/r3L1orZhvpTq+fxiO2jOFNxbUlcI0Vs3GI
         p3RauP4xFlUGVo8P+SU0FAjx22bxvxCcnObAMYYRyICpZgnhTXjhA5DCU6ygFH4gKuyO
         eXbdDoA7p3M07jbTtohEJ2v/Tz9VjHr6a0oJvdDrr7ejrHUVk++XAtzWb+z2In6SL2Gl
         t5tXQY/ajlwSp4Lah8lGP7hewVhzXVhK5MgiJIM1jDOC3z+GFlsAzATc7ylW+X+YH8So
         id2qKF0m1S0qz2zyvyjFzxEpK2HPsFYVayvCP8RJW7o40S1Tl79GVKw4kmsvRGVPv8gK
         DGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681105036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/k4nezMOkcM+h2CDII7+REb1p1LqwOaOkMYQqqQJrs=;
        b=0ftzmBg0KqR9kqIaxao9STZ5pFfGZxpDS+a2i5tio/LHMDn8v12FDLHDym+UiOxkq4
         tqwi8n/yFekEsQxogWMZegFXUZCydGhDEUCURnyZe3+y3Pccjs8JlXm/S2d8a+BBPz13
         yHlSoX9D2/P24hp8KHMl26yPRDfq79QZiFtVDEs2LdwR2c75MOoiG+qevuxSacLIp56+
         Bn+sPlz5guFcsp1xuCaQX37/6ynIA/iJMygwjQEPMbXJSSkuE+pZ5OnHw5nZCFdYgVVn
         F/h+X4zx1iDOsIS4uqvUE0LMqRKptk0GWTr61TpBxDvFvtUUBAPOCGA89Tl2zrQgZFDB
         ktyw==
X-Gm-Message-State: AAQBX9cGOlmlSgkWdSBL12bgJqnL8Fbg/gF8u1GwlR2zwWe/1XyR3SAL
        /lGE6yNptTwqB3mcJD1CQ9+UEg==
X-Google-Smtp-Source: AKy350YTLowzB2oBTshKq4rUG1CwxaDQBrenUjB20X2/2en11DizxiRt7NJuVWdjlDxpJZAqRXbXzA==
X-Received: by 2002:a17:906:a043:b0:94b:5921:69f9 with SMTP id bg3-20020a170906a04300b0094b592169f9mr200904ejb.64.1681105036100;
        Sun, 09 Apr 2023 22:37:16 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906350d00b0094b0f3886b0sm104670eja.76.2023.04.09.22.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Apr 2023 22:37:15 -0700 (PDT)
Message-ID: <5d091ef6-0f4c-dbf6-fb73-f9f9d13af3d8@linaro.org>
Date:   Mon, 10 Apr 2023 06:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback returning
 void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lucas Stach <dev@lynxeye.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Stefan Agner <stefan@agner.ch>, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        linux-tegra@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-amlogic@lists.infradead.org,
        Chuanhong Guo <gch981213@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-mediatek@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Jack Wang <jinpu.wang@ionos.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        kernel@pengutronix.de, Arnd Bergmann <arnd@arndb.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Roger Quadros <rogerq@kernel.org>,
        Wang Weiyang <wangweiyang2@huawei.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Han Xu <han.xu@nxp.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Valentin Korenblit <vkorenblit@sequans.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        linux-renesas-soc@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org, linux-oxnas@groups.io,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Content-Language: en-US
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 4/8/23 19:53, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

b4 seems didn't take my tag on 00/49, here it is again:
Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
