Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E21D35EB6A
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbhDNDZN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:25:13 -0400
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:41333 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232296AbhDNDZN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Apr 2021 23:25:13 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R571e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0UVVUQd-_1618370679;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UVVUQd-_1618370679)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 14 Apr 2021 11:24:50 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     paul@crapouillou.net
Cc:     lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-mips@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] ASoC: codec: remove unused variable
Date:   Wed, 14 Apr 2021 11:24:37 +0800
Message-Id: <1618370677-4559-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following gcc warning:

sound/soc/codecs/jz4760.c:201:6: warning: variable ‘ret’ set but not
used [-Wunused-but-set-variable].

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/codecs/jz4760.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index e8f28cc..ad5e859 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -198,15 +198,13 @@ static int jz4760_codec_startup(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_component *codec = dai->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
-	int ret;
-
 	/*
 	 * SYSCLK output from the codec to the AIC is required to keep the
 	 * DMA transfer going during playback when all audible outputs have
 	 * been disabled.
 	 */
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		ret = snd_soc_dapm_force_enable_pin(dapm, "SYSCLK");
+		snd_soc_dapm_force_enable_pin(dapm, "SYSCLK");
 	return 0;
 }
 
-- 
1.8.3.1

