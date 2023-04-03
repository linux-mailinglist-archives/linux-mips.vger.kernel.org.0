Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB83D6D4DCD
	for <lists+linux-mips@lfdr.de>; Mon,  3 Apr 2023 18:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjDCQaw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Apr 2023 12:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjDCQau (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Apr 2023 12:30:50 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C48C35A0
        for <linux-mips@vger.kernel.org>; Mon,  3 Apr 2023 09:30:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id ew6so119586737edb.7
        for <linux-mips@vger.kernel.org>; Mon, 03 Apr 2023 09:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680539404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MeWz95RBmI6XpSLkAR+cuB3iAEeGC3iRvwSDE5+WIbY=;
        b=vHhtKJL5afd3fDZb5Xvy5G6y/LTvqitLGSe7Ap0XWRSd3UnHwlhXG/jlL1pEDbro5N
         dDLdwGPIJVRIvCgJf+ooSRVUmcxTfsxV8spRGbOdGMiu0Yjabnu9Hv/mjHGNPXQ8lvjN
         cHe5ugODQYhlOZWDVDxVyYBUABgPfEhUNhPdKeF3/9v5wJk7oZDOr605S7tVuPNd8wTF
         bx6a/0ODqm177Gf9vkkLZzZXwHE9nR4G62csYL1zJ90eb79s5EDQerAqVGy4fDYuhuFx
         gXu3jujaXU5RPMtaZlFQ+OKGBp5RSLJJ0rYp6O8X402TZk6l3E92wW+w0z23pJ8wZvpJ
         eSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MeWz95RBmI6XpSLkAR+cuB3iAEeGC3iRvwSDE5+WIbY=;
        b=Ty+fo6+NO2htevaH5Kmea0387IR/IWqmAx5hzfED/5608OpgjRlqkQej77Pi4z1PlU
         YBJqaIWaEGDQ8gPVq8XtUy+aXjRj37qBVyiLeIT5S1u8Q6Qoh4I0EImyq1NAhqaCudty
         bySK14jFayGuko/JnMyHOu2iD1OF/y1HL7KLz01Ai3pNirDa6X9tmUvNchLyBf4M8qcA
         Kvit1ZSdUpRvKD8Ex0qN/5C43nkILsloCTcPnIOrMOzPLhsJlpZjg9W8NqbVKhK7GpWj
         h10+NW+sUI2FK6qaJawo0ib12zUZOg56HTf/LI+co40ahbVbPKZjFZdp2rHA0IapX+08
         veAg==
X-Gm-Message-State: AAQBX9ce8lCVNpXMwH9RNarq5LWgj11P96LCp8jiaNFohsuyt2eROds6
        PEYueBeb/zUcBFnpZDC56j0wwg==
X-Google-Smtp-Source: AKy350YS4e1dI8mZhrbLOs96X7qTnH/JqlEPq688zdETFGPGyW8pAjyNj4FhzEJY/Pp8fKqk3yTMRQ==
X-Received: by 2002:a17:906:3da:b0:931:95a1:a05a with SMTP id c26-20020a17090603da00b0093195a1a05amr37358230eja.62.1680539403777;
        Mon, 03 Apr 2023 09:30:03 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b009486efb9192sm2073196ejc.11.2023.04.03.09.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 09:30:03 -0700 (PDT)
Message-ID: <f881883e-23e1-66e0-78d2-da86533b038f@linaro.org>
Date:   Mon, 3 Apr 2023 17:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/49] mtd: nand: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Naga Sureshkumar Relli <nagasure@xilinx.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Valentin Korenblit <vkorenblit@sequans.com>,
        Wang Weiyang <wangweiyang2@huawei.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
        Han Xu <han.xu@nxp.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chuanhong Guo <gch981213@gmail.com>,
        Roger Quadros <rogerq@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Miaoqian Lin <linmq006@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Kerello <christophe.kerello@foss.st.com>,
        Jack Wang <jinpu.wang@ionos.com>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
From:   Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 4/1/23 17:18, Uwe Kleine-König wrote:
> Hello,
> 
> this series adapts the platform drivers below drivers/mtd/nand to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> As all drivers already return 0 in their .remove callback, they can be
> converted trivially.
> 

I'd make a single patch per subsystem for trivial changes, but I don't
mind having them split per driver either:

Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
