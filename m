Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32706416CD
	for <lists+linux-mips@lfdr.de>; Sat,  3 Dec 2022 14:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiLCNJJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Dec 2022 08:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiLCNJH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Dec 2022 08:09:07 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28962CCAA
        for <linux-mips@vger.kernel.org>; Sat,  3 Dec 2022 05:09:05 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id y16so11928433wrm.2
        for <linux-mips@vger.kernel.org>; Sat, 03 Dec 2022 05:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=he4pvbcj9k7gldXO1AUh5F+PmpcqjQDOE40QJU9PQgY=;
        b=IpTDWkg/+W6qtb6/BO+Rextf9MvVMSlQQo2APxxM4BQDnn7qkZcjkB9FFMGn9O0vXJ
         xmbYFo0ZqKzC+reWi5Ui9m8ZE1DJ75WQ/bFAPBwaB3yh9eWT2bus6awgqTyx7PNgfhCI
         BIvAAuR9hVxe/O2K+n3uaJUi0elOaR19s/Wse5pkabhXyOshgLmtSwZzqtvZqzXN08Qn
         kDzAwrurvkG00GxtgVAhvrZdg82nMPvqvv+CKvcporDHyn64rgrQ7nLeu1tWshBlJ8TS
         GDHMfMYnKweZp0ELa2PUHmSv5lLnkW7A+qy+Wew81JoaPQynn0ljjylNO17zoxC18jz1
         TURQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=he4pvbcj9k7gldXO1AUh5F+PmpcqjQDOE40QJU9PQgY=;
        b=ck0ZPKMeLua+u9l7M/sNsmPrt2zImw1LvQbNZV/D/Hno8xQgMCWIhPaYLEAyjmMMSB
         kt53Yj0lEaBt1apzfjIg0gDu9u5RIK106u06Ndwd/1Bfybr2YK9/SzK+k9twxFdqqsuT
         cj73aNavAEAk/POlmgyd9pe8CjwTwkEjA4mXMNWKxmkHuq69CE+rC87LZ7kyaZO6yRVV
         qa+o47ax9m7ZEA/qMFkMLoFGxlmqsm5QKJP1u3ZXPpIkf26TVO8sh9TILTm0/5wluKQI
         nhXOWduVF4g1KocENaKpYBWkGJTfSF2ozOZGKXN4H7N2Ulk3yF1FGpWkAwAm/K/L9vCJ
         74Mw==
X-Gm-Message-State: ANoB5plG1gJo+ZTT7eR7szuFvCHS1gONQTclINa3YxzSaEponwxkV7D+
        9mQ6m83FYMHWzGjGYbYvTaysBw==
X-Google-Smtp-Source: AA0mqf7FEFUrgBHbSYwX9vCImy4IPfSr1vGLJ8MA6ZSfnzZGkyWh6DJhnsHrk4VGpak6bs/xb0bb7g==
X-Received: by 2002:adf:eb92:0:b0:236:80a8:485e with SMTP id t18-20020adfeb92000000b0023680a8485emr38696645wrn.362.1670072944015;
        Sat, 03 Dec 2022 05:09:04 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id n3-20020a05600c3b8300b003cfbbd54178sm19062878wms.2.2022.12.03.05.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 05:09:03 -0800 (PST)
Message-ID: <9bd630af-6f88-baa7-7bd4-e99d818fb977@linaro.org>
Date:   Sat, 3 Dec 2022 14:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 00/11] Fix pca954x i2c-mux node names
Content-Language: en-US
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
References: <cover.1669999298.git.geert+renesas@glider.be>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cover.1669999298.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/12/22 17:49, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> According to the I2C bus multiplexer/switch DT bindings, i2c-mux nodes
> should be named "i2c-mux" (or something similar).
> This patch series renames nodes for pca954x i2c-muxes that are flagged
> by
> 
>      make dtbs_checK DT_SCHEMA_FILES=Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> 
> Please apply where appropriate.
> Thanks!
> 
> Geert Uytterhoeven (11):
>    ARM: dts: ti: Fix pca954x i2c-mux node names
>    ARM: dts: aspeed: Fix pca954x i2c-mux node names
>    ARM: dts: imx: Fix pca9547 i2c-mux node name
>    ARM: dts: nuvoton: Fix pca954x i2c-mux node names
>    ARM: dts: socfpga: Fix pca9548 i2c-mux node name
>    ARM: dts: vf610: Fix pca9548 i2c-mux node names
>    arm64: dts: freescale: Fix pca954x i2c-mux node names
>    arm64: dts: marvell: Fix pca954x i2c-mux node names
>    arm64: dts: renesas: ulcb-kf: Fix pca9548 i2c-mux node names
>    MIPS: mscc: jaguar2: Fix pca9545 i2c-mux node names
>    powerpc: dts: fsl: Fix pca954x i2c-mux node names

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

