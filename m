Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE80465A416
	for <lists+linux-mips@lfdr.de>; Sat, 31 Dec 2022 13:41:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbiLaMlL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Dec 2022 07:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235597AbiLaMko (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Dec 2022 07:40:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B034DFAE2;
        Sat, 31 Dec 2022 04:40:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4BD1160B3B;
        Sat, 31 Dec 2022 12:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AC0C433F1;
        Sat, 31 Dec 2022 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672490411;
        bh=LqReXyv6bHkP798hlCUkWphBaWw4H0d1COaqso5R+Bg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cgFQLYikBkg4sH5gYPlYPg0AzG7O3EJfN6104eUK89TZ5ikwkOzjNjIRtJlFvRqBa
         yCdwhPANz83tOvaHSa/SSk74NZdrUnP24ItM8aiXM56fd/F36MbBpUxSVoX0qO64mQ
         4fKQq07c43l+VsxCPMQy+0i0Pn6XZpg6gdk8ZbBsPevL/vVVqqJ5IZ1va13ONc9uV3
         wELapPquOUklxkTsZVyPNaGJOCUCDwiJDWKydKT2dDXAizHWVD2HZqI6pnQhUM3EE/
         pwXKVFWyqdYjJjPzwQvY92Z5kA+roQTBuSsMSXe3EGU7HuZxlSAzeDH+T21fPT8Trl
         Q3GQoMtgrivkw==
Date:   Sat, 31 Dec 2022 20:39:59 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
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
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/11] ARM: dts: vf610: Fix pca9548 i2c-mux node names
Message-ID: <20221231123958.GU6112@T480>
References: <cover.1669999298.git.geert+renesas@glider.be>
 <d1c5038b36d10282f01d8c722f94821b1710d2e0.1669999298.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1c5038b36d10282f01d8c722f94821b1710d2e0.1669999298.git.geert+renesas@glider.be>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 02, 2022 at 05:49:21PM +0100, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/arm/boot/dts/vf610-zii-dev-rev-b.dtb: tca9548@70: $nodename:0: 'tca9548@70' does not match '^(i2c-?)?mux'
> 	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     arch/arm/boot/dts/vf610-zii-dev-rev-b.dtb: tca9548@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3', 'i2c@4' were unexpected)
> 	    From schema: /scratch/geert/linux/linux-renesas/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
>     ...
> 
> Fix this by renaming PCA9548 nodes to "i2c-mux", to match the I2C bus
> multiplexer/switch DT bindings and the Generic Names Recommendation in
> the Devicetree Specification.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks!
