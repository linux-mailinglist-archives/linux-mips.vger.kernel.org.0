Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED47544DB6
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jun 2022 15:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239844AbiFINcV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jun 2022 09:32:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238801AbiFINcU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jun 2022 09:32:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2E223CA05;
        Thu,  9 Jun 2022 06:32:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43946B82DE2;
        Thu,  9 Jun 2022 13:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1062C34114;
        Thu,  9 Jun 2022 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654781536;
        bh=z1uhxQdjX7oKygIhJ5n3vdkXs/MdE4hzoVbc7kac5Pw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=hMlmSDIOYJ+7b9WtKMfh6cgzJtzXooKB9Ak5wfc8T3UmN/WAUfnlQCqpv4GR0YjgG
         DWU8hxNDaAM1ZQt9W4THFQE6z0aY044Vscbzm22b4jgWPoF+LLoB4e3e4PGCUo8JaV
         hSxS8BIZYoLxBWGpe2pGg8ILRHwpznXh3kv7Kleqvg381zngU5Ik1Kyq+svQaNR7TJ
         Wq//i/RIqX99KrUBuYgO0bJ7T/gHcisYcj5pPKpQXMPx0I11l8o3/lQLUVPzaidmUb
         2RVz40d6hmCZ5zasbu3JfAz+I5RjDPkDu2c05iawkPzEg4Z20NkuVbFND0UQ7GKmsV
         DsOgIPzAWiAxQ==
From:   Mark Brown <broonie@kernel.org>
To:     ckeepax@opensource.cirrus.com
Cc:     linux-sunxi@lists.linux.dev, peter.ujfalusi@gmail.com,
        pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com,
        krzk@kernel.org, jarkko.nikula@bitmer.com,
        linux-xtensa@linux-xtensa.org, cezary.rojewski@intel.com,
        shawnguo@kernel.org, linux-mediatek@lists.infradead.org,
        nicolas.ferre@microchip.com, patches@opensource.cirrus.com,
        linux-amlogic@lists.infradead.org, srinivas.kandagatla@linaro.org,
        daniel@zonque.org, linux-mips@vger.kernel.org,
        linux-tegra@vger.kernel.org, nsaenz@kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de,
        alsa-devel@alsa-project.org, kernel@pengutronix.de,
        jbrunet@baylibre.com,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        lgirdwood@gmail.com
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Message-Id: <165478153064.1052094.1721875477574787769.b4-ty@kernel.org>
Date:   Thu, 09 Jun 2022 14:32:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 19 May 2022 16:42:22 +0100, Charles Keepax wrote:
> Currently the set_fmt callback always passes clock provider/consumer
> with respect to the CODEC. This made sense when the framework was
> directly broken down into platforms and CODECs. However, as things
> are now broken down into components which can be connected as either
> the CPU or CODEC side of a DAI link it simplifies things if each
> side of the link is just told if it is provider or consumer of the
> clocks. Making this change allows us to remove one of the last parts
> of the ASoC core that needs to know if a driver is a CODEC driver,
> where it flips the clock format specifier if a CODEC driver is used on
> the CPU side of a DAI link, as well as just being conceptually more
> consistent with componentisation.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/56] ASoC: core: Add set_fmt_new callback that directly specifies provider
        commit: 905f3a04e184854555fc248ca4e692fdbf2f2547
[02/56] ASoC: amd: vangogh: Update to use set_fmt_new callback
        commit: ab890e0f83a65624d20b0ca4a7cb6306b8511558
[03/56] ASoC: atmel: Update to use set_fmt_new callback
        commit: 0fd054a577180cd807992e32c7cd394e54c85903
[04/56] ASoC: au1x: Update to use set_fmt_new callback
        commit: fee11f70849b21a244e6e27d281f3858b671bfea
[05/56] ASoC: bcm: Update to use set_fmt_new callback
        commit: 04ea2404468b7885c560c3673f6f2fd368f305a2
[06/56] ASoC: ep93xx: Update to use set_fmt_new callback
        commit: 5d6124e58d56818249a6266f56d9c3739e72e1bd
[07/56] ASoC: dwc: Update to use set_fmt_new callback
        commit: ca0444f1f7b228ae3b8d1a5c0f0d1b4463171f98
[08/56] ASoC: fsl: Update to use set_fmt_new callback
        commit: 3b14c15a333b8225ea38479e13c0366539d3374a
[09/56] ASoC: hisilicon: Update to use set_fmt_new callback
        commit: 0f362524dd3face4865077a4f7e7e640a95702aa
[10/56] ASoC: img: Update to use set_fmt_new callback
        commit: ed2b384082a678a0c4c8c56deff9e5f46d5e3fca
[11/56] ASoC: Intel: Update to use set_fmt_new callback
        commit: add9ee8c64c617f561a309cdda50104e9e2c12f6
[12/56] ASoC: js4740-i2s: Update to use set_fmt_new callback
        commit: cbb3a19f090d5a41b822caf9ff2058e1c6bc7ea3
[13/56] ASoC: mediatek: Update to use set_fmt_new callback
        commit: 3af99430f8d948a41556156155b0295dec274d41
[14/56] ASoC: meson: Update to use set_fmt_new callback
        commit: f60442bf6eab47aa4ab127aab88afdcc29a09a73
[15/56] ASoC: mxs-saif: Update to use set_fmt_new callback
        commit: f3c0064f1f8e358799c70c7905a09d15c5ec5e5a
[16/56] ASoC: pxa: Update to use set_fmt_new callback
        commit: 84c5b47c8ce4d5059d5e7539d3b44922cc0390e9
[17/56] ASoC: qcom: Update to use set_fmt_new callback
        commit: 1148e16b335f341f36475b646c692b4a71a1855e
[18/56] ASoC: rockchip: Update to use set_fmt_new callback
        commit: 27646d265da1745b2d1d10fec18465631cb1135f
[19/56] ASoC: samsung: Update to use set_fmt_new callback
        commit: 0b491c7c1b2555ef08285fd49a8567f2f9f34ff8
[20/56] ASoC: sh: Update to use set_fmt_new callback
        commit: 2d4dd776e902546389f2d7808ece7fd815aa829c
[21/56] ASoC: stm: Update to use set_fmt_new callback
        commit: 0092dac91ec1c404787841bdd9ecbf3404d1a41c
[22/56] ASoC: sunxi: Update to use set_fmt_new callback
        commit: 7cc3965fde74c9c725ed01de4ac35bc7d562d16a
[23/56] ASoC: tegra: Update to use set_fmt_new callback
        commit: d92ad6633fa77f9496840b77c8effeaa13ac78dc
[24/56] ASoC: test-component: Update to use set_fmt_new callback
        commit: d444c8d246a62392c0d249b1030c3ca271d47649
[25/56] ASoC: ti: Update to use set_fmt_new callback
        commit: 563ff63dc9fbb8ef4b8f145a53c84a5489bbd789
[26/56] ASoC: ux500: Update to use set_fmt_new callback
        commit: ce3467c78478e33927aea9043bf20f46fa4d5688
[27/56] ASoC: xtensa: Update to use set_fmt_new callback
        commit: e945206a0a448ac81dde0609578508368946f7a6
[28/56] ASoC: core: Always send the CPU DAI a direct clock specifier
        commit: 6c076273a326cc5b5162451aacf7b7744bb03c66
[29/56] ASoC: amd: vangogh: Rename set_fmt_new back to set_fmt
        commit: 346f47e784cd48b456f267a66e0daf1ef10d21b3
[30/56] ASoC: atmel: Rename set_fmt_new back to set_fmt
        commit: a839a53b9dc70f94032a671ee019599884612d4a
[31/56] ASoC: au1x: Rename set_fmt_new back to set_fmt
        commit: 2c73f5fd20a845fcb48173578b7c83dbcbacdeda
[32/56] ASoC: bcm: Rename set_fmt_new back to set_fmt
        commit: 1a267dd98c246237be00587b6e71f969bf75f10d
[33/56] ASoC: ep93xx: Rename set_fmt_new back to set_fmt
        commit: 324a4db8de05290237793dc3d7da887846ae90c1
[34/56] ASoC: dwc: Rename set_fmt_new back to set_fmt
        commit: 765fb623a2cd925c550370f73efe2137c52a1b25
[35/56] ASoC: fsl: Rename set_fmt_new back to set_fmt
        commit: 00778276cf4c611882219ab7aba9664c48981f1a
[36/56] ASoC: hisilicon: Rename set_fmt_new back to set_fmt
        commit: b9a7972818b84a15d46505df7808fd86c3fba5bb
[37/56] ASoC: img: Rename set_fmt_new back to set_fmt
        commit: 1830a30ec4cf1642a429e80dbbeb86aa7825c71a
[38/56] ASoC: Intel: Rename set_fmt_new back to set_fmt
        commit: c14a6ce9848571cf67faff206b02e212bec82761
[39/56] ASoC: jz4740-i2s: Rename set_fmt_new back to set_fmt
        commit: 1724cc38e7685ad8b01413acd70a4a731fc105ae
[40/56] ASoC: mediatek: Rename set_fmt_new back to set_fmt
        commit: 00ca2d152ef0fa9f4beb2a590e176499440de8fe
[41/56] ASoC: meson: Rename set_fmt_new back to set_fmt
        commit: eee6b5b9f3af0e906085022713ef41e56d03eca8
[42/56] ASoC: mxs-saif: Rename set_fmt_new back to set_fmt
        commit: 1a805faeb4915496671cd24bd2a75cc97a85dfc8
[43/56] ASoC: pxa: Rename set_fmt_new back to set_fmt
        commit: 8e2cc2b241bc0bb905231f301e6dfc80dc79f8a8
[44/56] ASoC: qcom: Rename set_fmt_new back to set_fmt
        commit: f1bd2fae856384f9377ca3faed0583d929002640
[45/56] ASoC: rockchip: Rename set_fmt_new back to set_fmt
        commit: 059f16bc0e02164617312435c31dffdc419f113f
[46/56] ASoC: samsung: Rename set_fmt_new back to set_fmt
        commit: b99d00c724bcf395558cb3028e823bd8f554fee6
[47/56] ASoC: sh: Rename set_fmt_new back to set_fmt
        commit: adced68031f96642272fae4e8c36d45d13797306
[48/56] ASoC: stm: Rename set_fmt_new back to set_fmt
        commit: 02ba0d9680feee645a321d65012f38d0a368b559
[49/56] ASoC: sunxi: Rename set_fmt_new back to set_fmt
        commit: 15011b2388d020a6cdb323539fc69c31b04d9f21
[50/56] ASoC: tegra: Rename set_fmt_new back to set_fmt
        commit: 475f2af6a2ff33e828900601a162e324b9986f9a
[51/56] ASoC: test-component: Rename set_fmt_new back to set_fmt
        commit: 408c122ef9de99220f7919594ab8af98194a19e8
[52/56] ASoC: ti: Rename set_fmt_new back to set_fmt
        commit: 9ff1836023ae19013c01f230e6a091fad6835213
[53/56] ASoC: ux500: Rename set_fmt_new back to set_fmt
        commit: e24ba1a21e244e7174e75ca0c4020beaff0ad369
[54/56] ASoC: xtensa: Rename set_fmt_new back to set_fmt
        commit: 58e23e21d18532aaa404e1db87ec92762e1fecd5
[55/56] ASoC: soc-dai: Remove set_fmt_new callback
        commit: 19423951a4b5c4f0ca107d6a4bed23f3f63718ca
[56/56] ASoC: simple-card-utils: Move snd_soc_component_is_codec to be local
        commit: 28086d05ada6d03daa886aad0e469854b811311c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
