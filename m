Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28ABB6FF61C
	for <lists+linux-mips@lfdr.de>; Thu, 11 May 2023 17:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238558AbjEKPiC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 May 2023 11:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237708AbjEKPiC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 May 2023 11:38:02 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96F84C20;
        Thu, 11 May 2023 08:37:57 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-50b8d2eed3dso13374910a12.0;
        Thu, 11 May 2023 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683819476; x=1686411476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/XBZtudt4Nd+ty/JtcmV3cTusiipTZDBIaE6R8LRoA=;
        b=qOtT6b7lHWVNrmrNuqrhTt6juE6JXKbIA5WcUgGMkKq9NfHaedwIBYcfMbdJuWN22C
         YwL/4VL47QR6+YHx56QGshP6NONVgDPUgm4VEA94ZBq7ySe/viFBPlZZNo9BPZi6UTSu
         BR3yuegtPlm4rJonJMhTr6IPOz+M43c95GOEoQKZSReN/RjeDfvXdMzbUnX4VwV0aJ/d
         rulAgJ921hReVnbIdbenk3gRvgJE6W7TAmUSKOIe5xDx7jJKN6nMt9fe+6j0Cc0PWXrD
         QlP1p9FZ/GXtdiv+ZBzW8wBDU78kA9qmHw8KoXsVuFFslLOn6SZ0Sv6ZAKHMQFQ5BNp2
         4kgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683819476; x=1686411476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/XBZtudt4Nd+ty/JtcmV3cTusiipTZDBIaE6R8LRoA=;
        b=KQaG1jwwkQAyOFEO37MTrgyey2Zya/pk1BOM2t/zIPB5ZbyJbjOH9ot3LKCt7PZlbi
         BiX2Y4XdR4RgIdupxQU36/ogfKiVrOkwS9xkOGyFH6HhSXDHfiKDrsJgoZ3Lkcx1FwoH
         9Wb4oryYuEkCK1J01li0TphrZGMiLQiogz3HLXHcApLSTtzxyZtCU8ZyfyWPTyMn+Puq
         Gq8mULxFQpiustjgl6Ela1hqE7scK/w0vC14SFC8lh05iRh0Ys+GeUFTGUSo3yy5GKqm
         dTpw19ZVX97qtj6aIfG4YqDaNt7G044VYSf6W5XY4Q+lDzm7O9l3oIj9wwnl7Fi33qDI
         ICaA==
X-Gm-Message-State: AC+VfDxBIhFT5PCeoAeIJ6682ioAzQyP7zR+tGlo8jfBAzIsZmiXYl8r
        waUNkfHx/TYl3PlKv1LlxfL1oDkV61nfGw==
X-Google-Smtp-Source: ACHHUZ4iqMvGOSLbvHNZB5g+BiVMVbS1nPR9KcWwQrGU3Zp4ofc/uTdt7Ykq6H7zw8WrwtqyH7Zm9A==
X-Received: by 2002:a17:907:25c3:b0:933:868:413a with SMTP id ae3-20020a17090725c300b009330868413amr18158995ejc.15.1683819476122;
        Thu, 11 May 2023 08:37:56 -0700 (PDT)
Received: from flagship2.deu.mlau.at (p200300c02712e50000000000000002af.dip0.t-ipconnect.de. [2003:c0:2712:e500::2af])
        by smtp.gmail.com with ESMTPSA id r12-20020a1709062ccc00b0094e954fd015sm4194192ejr.175.2023.05.11.08.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 08:37:55 -0700 (PDT)
From:   Manuel Lauss <manuel.lauss@gmail.com>
To:     alsa-devel@vger.kernel.org
Cc:     linux-mips@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>
Subject: [PATCH] ASoC: au1x: fix dma data provisioning
Date:   Thu, 11 May 2023 17:37:53 +0200
Message-Id: <20230511153753.880266-1-manuel.lauss@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide data in the dai probe callback, which is early enough
for the dma components.  Makes audio playback and recording
work again.

Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
---
without this patch, the dma components will report ENODEV in the 
 pcm_open() callbacks since dma data hasn't been provided at
 call time.

 sound/soc/au1x/ac97c.c    | 30 +++++++++++++-----------------
 sound/soc/au1x/dbdma2.c   | 10 +++++-----
 sound/soc/au1x/dma.c      |  8 ++++----
 sound/soc/au1x/i2sc.c     | 10 +++++-----
 sound/soc/au1x/psc-ac97.c | 12 +++---------
 sound/soc/au1x/psc-i2s.c  | 10 +++++-----
 6 files changed, 35 insertions(+), 45 deletions(-)

diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index a11d6841afc2..faba360b299b 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -187,20 +187,15 @@ static struct snd_ac97_bus_ops ac97c_bus_ops = {
 	.warm_reset	= au1xac97c_ac97_warm_reset,
 };
 
-static int alchemy_ac97c_startup(struct snd_pcm_substream *substream,
-				 struct snd_soc_dai *dai)
-{
-	struct au1xpsc_audio_data *ctx = snd_soc_dai_get_drvdata(dai);
-	snd_soc_dai_set_dma_data(dai, substream, &ctx->dmaids[0]);
-	return 0;
-}
-
 static const struct snd_soc_dai_ops alchemy_ac97c_ops = {
-	.startup		= alchemy_ac97c_startup,
+	/* no ops necessary */
 };
 
 static int au1xac97c_dai_probe(struct snd_soc_dai *dai)
 {
+	struct au1xpsc_audio_data *wd = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &(wd->dmaids[0]), &(wd->dmaids[1]));
 	return ac97c_workdata ? 0 : -ENODEV;
 }
 
@@ -271,29 +266,30 @@ static int au1xac97c_drvprobe(struct platform_device *pdev)
 	WR(ctx, AC97_CONFIG, ctx->cfg);
 
 	platform_set_drvdata(pdev, ctx);
-
+	ac97c_workdata = ctx;
 	ret = snd_soc_set_ac97_ops(&ac97c_bus_ops);
 	if (ret)
 		return ret;
 
 	ret = snd_soc_register_component(&pdev->dev, &au1xac97c_component,
 					 &au1xac97c_dai_driver, 1);
-	if (ret)
-		return ret;
+	if (!ret)
+		return 0;
 
-	ac97c_workdata = ctx;
-	return 0;
+	snd_soc_set_ac97_ops(NULL);
+	ac97c_workdata = NULL;
+
+	return ret;
 }
 
 static void au1xac97c_drvremove(struct platform_device *pdev)
 {
 	struct au1xpsc_audio_data *ctx = platform_get_drvdata(pdev);
 
+	snd_soc_set_ac97_ops(NULL);
 	snd_soc_unregister_component(&pdev->dev);
-
 	WR(ctx, AC97_ENABLE, EN_D);	/* clock off, disable */
-
-	ac97c_workdata = NULL;	/* MDEV */
+	ac97c_workdata = NULL;
 }
 
 #ifdef CONFIG_PM
diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 3d67e27fada9..b6ad5d00703c 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -279,13 +279,13 @@ static int au1xpsc_pcm_open(struct snd_soc_component *component,
 {
 	struct au1xpsc_audio_dmadata *pcd = to_dmadata(substream, component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	int stype = substream->stream, *dmaids;
+	int *dmaid;
 
-	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
-	if (!dmaids)
-		return -ENODEV;	/* whoa, has ordering changed? */
+	dmaid = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	if (!dmaid)
+		return -ENODEV;
 
-	pcd->ddma_id = dmaids[stype];
+	pcd->ddma_id = *dmaid;
 
 	snd_soc_set_runtime_hwparams(substream, &au1xpsc_pcm_hardware);
 	return 0;
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index 7f5be90c9ed1..08661540ec3b 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -192,16 +192,16 @@ static int alchemy_pcm_open(struct snd_soc_component *component,
 {
 	struct alchemy_pcm_ctx *ctx = ss_to_ctx(substream, component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	int *dmaids, s = substream->stream;
+	int *dmaid, s = substream->stream;
 	char *name;
 
-	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
-	if (!dmaids)
+	dmaid = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	if (!dmaid)
 		return -ENODEV;	/* whoa, has ordering changed? */
 
 	/* DMA setup */
 	name = (s == SNDRV_PCM_STREAM_PLAYBACK) ? "audio-tx" : "audio-rx";
-	ctx->stream[s].dma = request_au1000_dma(dmaids[s], name,
+	ctx->stream[s].dma = request_au1000_dma(*dmaid, name,
 					au1000_dma_interrupt, 0,
 					&ctx->stream[s]);
 	set_dma_mode(ctx->stream[s].dma,
diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 064406080d72..de5aa1990a6c 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -194,22 +194,22 @@ static int au1xi2s_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int au1xi2s_startup(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
+static int au1xi2s_dai_probe(struct snd_soc_dai *dai)
 {
-	struct au1xpsc_audio_data *ctx = snd_soc_dai_get_drvdata(dai);
-	snd_soc_dai_set_dma_data(dai, substream, &ctx->dmaids[0]);
+	struct au1xpsc_audio_data *wd = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &(wd->dmadata[0]), &(wd->dmadata[1]));
 	return 0;
 }
 
 static const struct snd_soc_dai_ops au1xi2s_dai_ops = {
-	.startup	= au1xi2s_startup,
 	.trigger	= au1xi2s_trigger,
 	.hw_params	= au1xi2s_hw_params,
 	.set_fmt	= au1xi2s_set_fmt,
 };
 
 static struct snd_soc_dai_driver au1xi2s_dai_driver = {
+	.probe	= au1xi2s_dai_probe,
 	.symmetric_rate		= 1,
 	.playback = {
 		.rates		= AU1XI2SC_RATES,
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 9fd91aea7d1a..08503eaef595 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -319,21 +319,15 @@ static int au1xpsc_ac97_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int au1xpsc_ac97_startup(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
-{
-	struct au1xpsc_audio_data *pscdata = snd_soc_dai_get_drvdata(dai);
-	snd_soc_dai_set_dma_data(dai, substream, &pscdata->dmaids[0]);
-	return 0;
-}
-
 static int au1xpsc_ac97_probe(struct snd_soc_dai *dai)
 {
+	struct au1xpsc_audio_data *wd = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &(wd->dmaids[0]), &(wd->dmaids[1]));
 	return au1xpsc_ac97_workdata ? 0 : -ENODEV;
 }
 
 static const struct snd_soc_dai_ops au1xpsc_ac97_dai_ops = {
-	.startup	= au1xpsc_ac97_startup,
 	.trigger	= au1xpsc_ac97_trigger,
 	.hw_params	= au1xpsc_ac97_hw_params,
 };
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 52734dec8247..430f188df42e 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -254,22 +254,22 @@ static int au1xpsc_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return ret;
 }
 
-static int au1xpsc_i2s_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
+static int au1xpsci2s_dai_probe(struct snd_soc_dai *dai)
 {
-	struct au1xpsc_audio_data *pscdata = snd_soc_dai_get_drvdata(dai);
-	snd_soc_dai_set_dma_data(dai, substream, &pscdata->dmaids[0]);
+	struct au1xpsc_audio_data *wd = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &(wd->dmaids[0]), &(wd->dmaids[1]));
 	return 0;
 }
 
 static const struct snd_soc_dai_ops au1xpsc_i2s_dai_ops = {
-	.startup	= au1xpsc_i2s_startup,
 	.trigger	= au1xpsc_i2s_trigger,
 	.hw_params	= au1xpsc_i2s_hw_params,
 	.set_fmt	= au1xpsc_i2s_set_fmt,
 };
 
 static const struct snd_soc_dai_driver au1xpsc_i2s_dai_template = {
+	.probe	= au1xpsci2s_dai_probe,
 	.playback = {
 		.rates		= AU1XPSC_I2S_RATES,
 		.formats	= AU1XPSC_I2S_FMTS,
-- 
2.40.1

