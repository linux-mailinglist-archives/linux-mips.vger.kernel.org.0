Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D19D61E465
	for <lists+linux-mips@lfdr.de>; Sun,  6 Nov 2022 18:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbiKFRLJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Nov 2022 12:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbiKFRK2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Nov 2022 12:10:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DDD13F04;
        Sun,  6 Nov 2022 09:07:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3638960BFF;
        Sun,  6 Nov 2022 17:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C140C43470;
        Sun,  6 Nov 2022 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667754379;
        bh=cteLXXsF83r2USnyf9k+VB4O36var5zXb0jrtcODRiw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xpy9XulIx5OWBKSxT4Ok9F46SoOzgDCqyQ9+lMhlQhuTc6D2ob187R7kfcqllYlom
         K5RIIMAmdV01VqMfT05cT9g0WDT2Up8pX19WeivPbdO1Jy4fmK8OGZPVvcekQiWfgd
         1jB6WXKGyEsodVK/aMZ1prfREivJNrGSl7F0qWyjG+QVBd/Zt7cjqbzGM0MPoqPZWo
         Rrubnn5fUxn/kHp2lgXap/gemprwJrakNYCKGBnRYm2JtATNYa5qFTJeVHYUHl5se5
         6VudWK5mLNXLhsvTRcAWW2CzTgp/j19ir8Wp01PzLbN1GdinYHj9bYWF5c1VND5ldG
         us4p/0L3Zl7tw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Siarhei Volkau <lis8215@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sasha Levin <sashal@kernel.org>, paul@crapouillou.net,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-mips@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.10 10/16] ASoC: codecs: jz4725b: fix capture selector naming
Date:   Sun,  6 Nov 2022 12:05:47 -0500
Message-Id: <20221106170555.1580584-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221106170555.1580584-1-sashal@kernel.org>
References: <20221106170555.1580584-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Siarhei Volkau <lis8215@gmail.com>

[ Upstream commit 80852f8268769715db335a22305e81a0c4a38a84 ]

At the moment Capture source selector appears on Playback
tab in the alsamixer and has a senseless name.

Let's fix that.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
Link: https://lore.kernel.org/r/20221016132648.3011729-5-lis8215@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/jz4725b.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 9dc8d76bf104..ab744e375367 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -183,7 +183,7 @@ static SOC_VALUE_ENUM_SINGLE_DECL(jz4725b_codec_adc_src_enum,
 				  jz4725b_codec_adc_src_texts,
 				  jz4725b_codec_adc_src_values);
 static const struct snd_kcontrol_new jz4725b_codec_adc_src_ctrl =
-			SOC_DAPM_ENUM("Route", jz4725b_codec_adc_src_enum);
+	SOC_DAPM_ENUM("ADC Source Capture Route", jz4725b_codec_adc_src_enum);
 
 static const struct snd_kcontrol_new jz4725b_codec_mixer_controls[] = {
 	SOC_DAPM_SINGLE("Line In Bypass", JZ4725B_CODEC_REG_CR1,
@@ -228,7 +228,7 @@ static const struct snd_soc_dapm_widget jz4725b_codec_dapm_widgets[] = {
 	SND_SOC_DAPM_ADC("ADC", "Capture",
 			 JZ4725B_CODEC_REG_PMR1, REG_PMR1_SB_ADC_OFFSET, 1),
 
-	SND_SOC_DAPM_MUX("ADC Source", SND_SOC_NOPM, 0, 0,
+	SND_SOC_DAPM_MUX("ADC Source Capture Route", SND_SOC_NOPM, 0, 0,
 			 &jz4725b_codec_adc_src_ctrl),
 
 	/* Mixer */
@@ -287,11 +287,11 @@ static const struct snd_soc_dapm_route jz4725b_codec_dapm_routes[] = {
 	{"Mixer", NULL, "DAC to Mixer"},
 
 	{"Mixer to ADC", NULL, "Mixer"},
-	{"ADC Source", "Mixer", "Mixer to ADC"},
-	{"ADC Source", "Line In", "Line In"},
-	{"ADC Source", "Mic 1", "Mic 1"},
-	{"ADC Source", "Mic 2", "Mic 2"},
-	{"ADC", NULL, "ADC Source"},
+	{"ADC Source Capture Route", "Mixer", "Mixer to ADC"},
+	{"ADC Sourc Capture Routee", "Line In", "Line In"},
+	{"ADC Source Capture Route", "Mic 1", "Mic 1"},
+	{"ADC Source Capture Route", "Mic 2", "Mic 2"},
+	{"ADC", NULL, "ADC Source Capture Route"},
 
 	{"Out Stage", NULL, "Mixer"},
 	{"HP Out", NULL, "Out Stage"},
-- 
2.35.1

