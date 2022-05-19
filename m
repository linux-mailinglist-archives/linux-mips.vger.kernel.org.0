Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8E452D8A5
	for <lists+linux-mips@lfdr.de>; Thu, 19 May 2022 17:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240760AbiESPrA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 11:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239279AbiESPp7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 11:45:59 -0400
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6317C167;
        Thu, 19 May 2022 08:44:17 -0700 (PDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J6k11k002261;
        Thu, 19 May 2022 10:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=MlGxWDEhiLEzJWCOMp9mdKZ4UoXGVcox5jqQuGHbxDo=;
 b=RWaMdznvIU2lGGFbbZqLnazWKn7WdbFPod1LyghGyiX1bAYvx1tXUz1khhTPssBL4CvN
 YizXNjIgNZ9sXE2DkOH/p/dMRqkC7mZKDd/rWKkD48PfWzA8n0823+2DxJT1rFsP2Qj2
 EgaHNy5cAU07DAdhIBrSek/8OiHShLZS5aSQ8C576M35GdygnSATUckJxwxoAzdDoyE/
 yHJQxbDkC3VqIMZ6WGeCiSlK5KtsOVZgGBzcI6D8GKIEXN5Pf0lZcAWu1IwL6FTAvSRt
 rJBT7w3B6dZRfekQZXUmfA9mmFODrTKAMvgmhbQZ4ne7BOa2lmpK230EVR5timL7X2l3 Zw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37mcf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 19 May 2022 10:43:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 492E7476;
        Thu, 19 May 2022 15:43:18 +0000 (UTC)
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <broonie@kernel.org>
CC:     <lgirdwood@gmail.com>, <kuninori.morimoto.gx@renesas.com>,
        <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
        <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
        <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 00/56] Specify clock provider directly to CPU DAIs
Date:   Thu, 19 May 2022 16:42:22 +0100
Message-ID: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HFsp4N4C1dfLI4kl_Yax3agDBYSk2Vi1
X-Proofpoint-ORIG-GUID: HFsp4N4C1dfLI4kl_Yax3agDBYSk2Vi1
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently the set_fmt callback always passes clock provider/consumer
with respect to the CODEC. This made sense when the framework was
directly broken down into platforms and CODECs. However, as things
are now broken down into components which can be connected as either
the CPU or CODEC side of a DAI link it simplifies things if each
side of the link is just told if it is provider or consumer of the
clocks. Making this change allows us to remove one of the last parts
of the ASoC core that needs to know if a driver is a CODEC driver,
where it flips the clock format specifier if a CODEC driver is used on
the CPU side of a DAI link, as well as just being conceptually more
consistent with componentisation.

The basic idea of this patch chain is to change the set_fmt callback
from specifying if the CODEC is provider/consumer into directly
specifying if the component is provider/consumer. To do this we add
some new defines, and then to preserve bisectability, the migration is
done by adding a new callback, converting over all existing CPU side
drivers, converting the core, and then finally reverting back to the
old callback.

Converting the platform drivers makes sense as the existing defines
are from the perspective of the CODEC and there are more CODEC drivers
than platform drivers.

Obviously a fair amount of this patch chain I was only able to build
test, so any testing that can be done would be greatly appreciated.

Thanks,
Charles

Charles Keepax (56):
  ASoC: core: Add set_fmt_new callback that directly specifies provider
  ASoC: amd: vangogh: Update to use set_fmt_new callback
  ASoC: atmel: Update to use set_fmt_new callback
  ASoC: au1x: Update to use set_fmt_new callback
  ASoC: bcm: Update to use set_fmt_new callback
  ASoC: ep93xx: Update to use set_fmt_new callback
  ASoC: dwc: Update to use set_fmt_new callback
  ASoC: fsl: Update to use set_fmt_new callback
  ASoC: hisilicon: Update to use set_fmt_new callback
  ASoC: img: Update to use set_fmt_new callback
  ASoC: Intel: Update to use set_fmt_new callback
  ASoC: js4740-i2s: Update to use set_fmt_new callback
  ASoC: mediatek: Update to use set_fmt_new callback
  ASoC: meson: Update to use set_fmt_new callback
  ASoC: mxs-saif: Update to use set_fmt_new callback
  ASoC: pxa: Update to use set_fmt_new callback
  ASoC: qcom: Update to use set_fmt_new callback
  ASoC: rockchip: Update to use set_fmt_new callback
  ASoC: samsung: Update to use set_fmt_new callback
  ASoC: sh: Update to use set_fmt_new callback
  ASoC: stm: Update to use set_fmt_new callback
  ASoC: sunxi: Update to use set_fmt_new callback
  ASoC: tegra: Update to use set_fmt_new callback
  ASoC: test-component: Update to use set_fmt_new callback
  ASoC: ti: Update to use set_fmt_new callback
  ASoC: ux500: Update to use set_fmt_new callback
  ASoC: xtensa: Update to use set_fmt_new callback
  ASoC: core: Always send the CPU DAI a direct clock specifier
  ASoC: amd: vangogh: Rename set_fmt_new back to set_fmt
  ASoC: atmel: Rename set_fmt_new back to set_fmt
  ASoC: au1x: Rename set_fmt_new back to set_fmt
  ASoC: bcm: Rename set_fmt_new back to set_fmt
  ASoC: ep93xx: Rename set_fmt_new back to set_fmt
  ASoC: dwc: Rename set_fmt_new back to set_fmt
  ASoC: fsl: Rename set_fmt_new back to set_fmt
  ASoC: hisilicon: Rename set_fmt_new back to set_fmt
  ASoC: img: Rename set_fmt_new back to set_fmt
  ASoC: Intel: Rename set_fmt_new back to set_fmt
  ASoC: jz4740-i2s: Rename set_fmt_new back to set_fmt
  ASoC: mediatek: Rename set_fmt_new back to set_fmt
  ASoC: meson: Rename set_fmt_new back to set_fmt
  ASoC: mxs-saif: Rename set_fmt_new back to set_fmt
  ASoC: pxa: Rename set_fmt_new back to set_fmt
  ASoC: qcom: Rename set_fmt_new back to set_fmt
  ASoC: rockchip: Rename set_fmt_new back to set_fmt
  ASoC: samsung: Rename set_fmt_new back to set_fmt
  ASoC: sh: Rename set_fmt_new back to set_fmt
  ASoC: stm: Rename set_fmt_new back to set_fmt
  ASoC: sunxi: Rename set_fmt_new back to set_fmt
  ASoC: tegra: Rename set_fmt_new back to set_fmt
  ASoC: test-component: Rename set_fmt_new back to set_fmt
  ASoC: ti: Rename set_fmt_new back to set_fmt
  ASoC: ux500: Rename set_fmt_new back to set_fmt
  ASoC: xtensa: Rename set_fmt_new back to set_fmt
  ASoC: soc-dai: Remove set_fmt_new callback
  ASoC: simple-card-utils: Move snd_soc_component_is_codec to be local

 include/sound/soc-component.h                |  5 ---
 include/sound/soc-dai.h                      |  6 ++++
 sound/soc/amd/vangogh/acp5x-i2s.c            |  4 +--
 sound/soc/atmel/atmel-i2s.c                  |  4 +--
 sound/soc/atmel/atmel_ssc_dai.c              | 18 +++++-----
 sound/soc/atmel/mchp-i2s-mcc.c               |  8 ++---
 sound/soc/atmel/mchp-pdmc.c                  |  4 +--
 sound/soc/au1x/i2sc.c                        |  2 +-
 sound/soc/au1x/psc-i2s.c                     |  4 +--
 sound/soc/bcm/bcm2835-i2s.c                  | 20 +++++------
 sound/soc/bcm/cygnus-ssp.c                   |  4 +--
 sound/soc/cirrus/ep93xx-i2s.c                |  4 +--
 sound/soc/dwc/dwc-i2s.c                      |  8 ++---
 sound/soc/fsl/fsl_audmix.c                   |  6 ++--
 sound/soc/fsl/fsl_esai.c                     |  8 ++---
 sound/soc/fsl/fsl_mqs.c                      |  2 +-
 sound/soc/fsl/fsl_sai.c                      |  8 ++---
 sound/soc/fsl/fsl_ssi.c                      | 22 ++++++------
 sound/soc/fsl/imx-audmix.c                   |  4 +--
 sound/soc/fsl/imx-card.c                     |  2 +-
 sound/soc/generic/simple-card-utils.c        |  7 +++-
 sound/soc/generic/test-component.c           | 18 +++++-----
 sound/soc/hisilicon/hi6210-i2s.c             | 18 +++++-----
 sound/soc/img/img-i2s-in.c                   |  4 +--
 sound/soc/img/img-i2s-out.c                  |  6 ++--
 sound/soc/intel/atom/sst-atom-controls.c     |  4 +--
 sound/soc/intel/boards/bytcht_cx2072x.c      |  2 +-
 sound/soc/intel/boards/bytcht_da7213.c       |  2 +-
 sound/soc/intel/boards/bytcht_es8316.c       |  2 +-
 sound/soc/intel/boards/bytcht_nocodec.c      |  2 +-
 sound/soc/intel/boards/bytcr_rt5640.c        |  2 +-
 sound/soc/intel/boards/bytcr_rt5651.c        |  2 +-
 sound/soc/intel/boards/bytcr_wm5102.c        |  2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c |  3 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c      |  6 ++--
 sound/soc/intel/boards/cht_bsw_rt5672.c      |  2 +-
 sound/soc/intel/keembay/kmb_platform.c       |  4 +--
 sound/soc/jz4740/jz4740-i2s.c                | 10 +++---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c  |  6 ++--
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c   |  6 ++--
 sound/soc/meson/aiu-encoder-i2s.c            |  2 +-
 sound/soc/meson/axg-tdm-interface.c          | 14 ++++----
 sound/soc/mxs/mxs-saif.c                     |  4 +--
 sound/soc/pxa/magician.c                     |  8 ++---
 sound/soc/pxa/mmp-sspa.c                     |  6 ++--
 sound/soc/pxa/pxa-ssp.c                      | 22 ++++++------
 sound/soc/pxa/pxa2xx-i2s.c                   |  6 ++--
 sound/soc/qcom/apq8016_sbc.c                 |  2 +-
 sound/soc/qcom/qdsp6/audioreach.c            |  4 +--
 sound/soc/qcom/qdsp6/q6afe.c                 |  6 ++--
 sound/soc/qcom/sc7180.c                      |  2 +-
 sound/soc/qcom/sdm845.c                      |  6 ++--
 sound/soc/qcom/sm8250.c                      |  4 +--
 sound/soc/rockchip/rockchip_i2s.c            |  6 ++--
 sound/soc/rockchip/rockchip_i2s_tdm.c        |  6 ++--
 sound/soc/samsung/i2s.c                      |  6 ++--
 sound/soc/samsung/pcm.c                      |  4 +--
 sound/soc/samsung/s3c-i2s-v2.c               |  6 ++--
 sound/soc/samsung/s3c24xx-i2s.c              |  6 ++--
 sound/soc/sh/fsi.c                           |  6 ++--
 sound/soc/sh/rcar/core.c                     |  4 +--
 sound/soc/sh/rz-ssi.c                        |  2 +-
 sound/soc/sh/ssi.c                           | 10 +++---
 sound/soc/soc-core.c                         | 14 ++------
 sound/soc/soc-dai.c                          |  3 +-
 sound/soc/stm/stm32_i2s.c                    |  8 ++---
 sound/soc/stm/stm32_sai_sub.c                |  8 ++---
 sound/soc/sunxi/sun4i-i2s.c                  | 18 +++++-----
 sound/soc/sunxi/sun8i-codec.c                |  6 ++--
 sound/soc/tegra/tegra20_i2s.c                |  6 ++--
 sound/soc/tegra/tegra210_i2s.c               |  6 ++--
 sound/soc/tegra/tegra30_i2s.c                |  6 ++--
 sound/soc/ti/davinci-i2s.c                   | 32 ++++++++---------
 sound/soc/ti/davinci-mcasp.c                 | 10 +++---
 sound/soc/ti/omap-mcbsp.c                    | 12 +++----
 sound/soc/ux500/ux500_msp_dai.c              | 36 ++++++++++----------
 sound/soc/xtensa/xtfpga-i2s.c                |  4 +--
 77 files changed, 279 insertions(+), 283 deletions(-)

-- 
2.30.2

