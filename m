Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4346F370B9A
	for <lists+linux-mips@lfdr.de>; Sun,  2 May 2021 15:09:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhEBNJ5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 May 2021 09:09:57 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:11944 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhEBNJ4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 2 May 2021 09:09:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1619960936; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=rrYm0s2AeKoUram284OazedvzXEb190T6zyFhfFIyi99aUCGS9/HT74W3rPdg3Y8xQ
    634/MUWzSkhJgTyDoEiFgUG1XTzKLDkREgWOULipXsxANTp/mr7pb98H24MgpNq6lHyH
    1bBPJSYi99XR1lADpAiKlGfsgwtVYthi1KNCP6McP1YeGpdYrFHjdjQFJ7/H4RpqE42t
    dh7I6tEoFJGOJnZs5vqhvgA/rhl2kqpX72FHqfOb4Ck5JkRs61DLnTcTfhPR8ZlDSDMW
    40T/GtAHSlw47pvLXEBdBiQHdANm2NGHi+KIlpLMovcE3uAmedewI0p/GR7+foBMx7S+
    689g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619960936;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=PnHjKegTtwRmpr11RIcWdd+iwYXSfLmt2v9dbXMfP5g=;
    b=im8n74/2yMA+drEJiHnilyNlHQBVI7ZGac3Gjf+4HGSbRJcUK2hKkRFJYpGZ2STm4U
    /DtmNY3tCNb0pg5Mmfqy3AGflSNDVVDGcrAnMqEhrQTPtbEySdIMI0qVdlYBoz3IgyOV
    PJpOEXS4Ub9Jr0TxuFmyobdJKHGcDZHhZ/j3gze/LkqtrsCptRadcKBAYOzREUpMDkA5
    LfWIZskfMO3TqaNT5/M9efT3SRL8dUYiQkV5KkAQF++pR/DRz3zvfrFKftB2eulB6Q88
    FZPnhjPYv4VnHSwxDyNCmPVcPZYMgFyf3hc+GmHkuelwsPMw239EhpSTJFA3W3HKkSnk
    rxeQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619960936;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=PnHjKegTtwRmpr11RIcWdd+iwYXSfLmt2v9dbXMfP5g=;
    b=Znf0t1aRQOrwXi1yRLBxw/7lUavCgnW3j5zy1xNfp/r5D4DCnAsKqP1ZYC9B97JX37
    hXuqMfS6taiHP6k+sLDM4lCT0oo6BjGBMHI62irA1fqH95Fle7IBLn1l9XplS9PA0L7a
    MWz9DnhFMdiBPSJWg2r445lbGhqGiDbhve9khWpLh1oGoHTiBHrlYblJJCTPO05nv50G
    Q14JbLMFhXvODdM+GrdExcFdvvXYLsJZhMvW8EgpsYWFQux7K7d0hDg+f3di11WwDrav
    DSZ0PKoHtlGa0bp71YCdCEQVlLCYkmh3GLtS9XeECwy+UBRZSzOm+QplmyFg9GoDo5+8
    PSGQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH4GJ9tiK2/"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.25.2 DYNA|AUTH)
    with ESMTPSA id i0b37fx42D8uOF0
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 2 May 2021 15:08:56 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     linux-mips@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] ASoC: jz4740-i2s: fix function name
Date:   Sun,  2 May 2021 15:08:55 +0200
Message-Id: <56f9c8518870263698b00d10de4821d2dc8932be.1619960935.git.hns@goldelico.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This driver is not related to I2C protocol.

s/_i2c_/_i2s_/

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index 47d955c0bb6a1..fe5b3a2b239c6 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -372,7 +372,7 @@ static int jz4740_i2s_resume(struct snd_soc_component *component)
 	return 0;
 }
 
-static void jz4740_i2c_init_pcm_config(struct jz4740_i2s *i2s)
+static void jz4740_i2s_init_pcm_config(struct jz4740_i2s *i2s)
 {
 	struct snd_dmaengine_dai_dma_data *dma_data;
 
@@ -397,7 +397,7 @@ static int jz4740_i2s_dai_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	jz4740_i2c_init_pcm_config(i2s);
+	jz4740_i2s_init_pcm_config(i2s);
 	snd_soc_dai_init_dma_data(dai, &i2s->playback_dma_data,
 		&i2s->capture_dma_data);
 
-- 
2.26.2

