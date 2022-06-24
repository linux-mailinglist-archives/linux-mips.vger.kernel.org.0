Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4420D558FD1
	for <lists+linux-mips@lfdr.de>; Fri, 24 Jun 2022 06:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiFXEZJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jun 2022 00:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiFXEZJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jun 2022 00:25:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81FE1680B6;
        Thu, 23 Jun 2022 21:25:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2387DB8266E;
        Fri, 24 Jun 2022 04:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0687C34114;
        Fri, 24 Jun 2022 04:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656044705;
        bh=3ofsG0+fqo2VqX2279Vp6KsempNjI6fWtI6ny6qteEw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QllQgw+Ri6XNAsWcIFs07OVlBE/AksnQiAY538Aiyghx+J5UsJRoGo3YBQAjTPG72
         +wRTzRJOAFm+Mc0852z7JLjKFUAZlaGdobe3C/mZ+je8tYtvUsNb4BUiArhJfnZNHL
         8+eZCZpayWwGyS6LNKWyckaWmCPGoApBIGT9LpLZxufSPBbEAPHmdhH862Uljavi+o
         Ag0vH5hxLFY7AMfL6JdQm3DxoeezDVOgw1YS5od8ZyWC36/NyRBXxgnhcv/xbHEmEl
         FdEkTi8swLOE61IoRKPv6ZsrN2oi7WDA6f/8oxmr4RSE7//+weuU2N9CUzjAH97H5w
         DJTjTykyDjUIw==
Date:   Fri, 24 Jun 2022 09:55:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        kuninori.morimoto.gx@renesas.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, nicolas.ferre@microchip.com,
        nsaenz@kernel.org, shawnguo@kernel.org, linux-imx@nxp.com,
        cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
        linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org,
        daniel@zonque.org, srinivas.kandagatla@linaro.org,
        linux-rockchip@lists.infradead.org, krzk@kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
        heiko@sntech.de, jbrunet@baylibre.com, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org, frattaroli.nicolas@gmail.com
Subject: Re: [PATCH v2 02/96] soundwire: intel: Migrate to new style legacy
 DAI naming flag
Message-ID: <YrU8nRLVJghIzAEb@matsya>
References: <20220623125250.2355471-1-ckeepax@opensource.cirrus.com>
 <20220623125250.2355471-3-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623125250.2355471-3-ckeepax@opensource.cirrus.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 23-06-22, 13:51, Charles Keepax wrote:
> Change the legacy DAI naming flag from opting in to the new scheme
> (non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
> This driver appears to be on the CPU side of the DAI link and
> currently uses the legacy naming, so add the new flag.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
