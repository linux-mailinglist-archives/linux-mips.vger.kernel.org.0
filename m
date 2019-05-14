Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA7B1CE24
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2019 19:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbfENRiW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 May 2019 13:38:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44295 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbfENRiW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 May 2019 13:38:22 -0400
Received: by mail-pl1-f194.google.com with SMTP id c5so885286pll.11;
        Tue, 14 May 2019 10:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yQwlOtBHnK6CRRjE4ab4v9zRwfsos8oSSPSf6ns3DeM=;
        b=fYamd2nfaPVrWYUlTU2JQo4Hjv80wsUG5q2CIWedan+EMdJUs8r6IroZINOLDxuk4t
         hUd+rrb1Ggo5A9sXY/vhycaQNaoO4ea/Q7Kr6TKg3Qe8DOwZcxiaSTU8TiuZxZXoKvTm
         djuup/Bb+CIIhKlnKHjAMoqJweQ7zu3xQNDcOLoGBSUSsbD9MUrKHniw239K4dOOpsPW
         CgkL7fZ4e2yvAue4fa2pPYBIQ03R8VNGlqj5T8sruSi/4icWRCBTKaYUPy1w3X5ErU/H
         WNHIC36xyhikn+ZM+yRT2vtYa4SFdW/wpwHXD1tJQriZsiuTnN30YMmu2rYs0fl4s8nP
         ot7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yQwlOtBHnK6CRRjE4ab4v9zRwfsos8oSSPSf6ns3DeM=;
        b=Y7ms9/rOGBK97x7oyD7Xo4a6D9F5CQkf70tFsC/+wRCB5dMpkLqNDvVCRRVJqSXKiK
         bAtQBJChYGbBEaTGulWd0oXRAnIDrHs/DIqXvQ+zqKnxMsmzjcD0tEPIqb3uO0cKy/nN
         v6TABkdMR5Jt9GJU/62R1NkyGx8xbWTFq89Fjlr+x5U72kA5IHd0kmzbngdwBPx+75NR
         qBdxUcTcjmnIRN6fH14qhwQMTjkv4j8eWlTwDQsGeaYFJ4yiYe35KEaOiTy+m/UaSxBa
         866txLLHhppjwTdOt+Ja7xFGo0o2TYXl0//6pOs5YKe9kgAmqEL2IEJJOg0xrjhmIqB1
         qYxA==
X-Gm-Message-State: APjAAAVrrAJB0qo8SvVGU80NY17nM7+Kk48SIEWXEvP7YfO5k/n2eAGP
        e68Nov1CJoL8TI1CPmwn1YTSOUfM
X-Google-Smtp-Source: APXvYqwIkqz2URE7Givd+nsWZchVlcnU3FFpVXxK/+Y/f80GPujaPxXDenUc3ZH3hMItbKNhPcLPTQ==
X-Received: by 2002:a17:902:4624:: with SMTP id o33mr21139240pld.268.1557855501351;
        Tue, 14 May 2019 10:38:21 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id a80sm46115717pfj.105.2019.05.14.10.38.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 10:38:20 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     joe@perches.com, Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org (open list:BROADCOM NVRAM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] firmware: bcm47xx_nvram: Correct size_t printf format
Date:   Tue, 14 May 2019 10:38:14 -0700
Message-Id: <20190514173816.17030-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building on a 64-bit host, we will get warnings like those:

drivers/firmware/broadcom/bcm47xx_nvram.c:103:3: note: in expansion of macro 'pr_err'
   pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
   ^~~~~~
drivers/firmware/broadcom/bcm47xx_nvram.c:103:28: note: format string is defined here
   pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
                           ~^
                           %li

Use %zu instead for that purpose.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
Changes in v2:
- Use %zu instead of %zi (Joe Perches)

 drivers/firmware/broadcom/bcm47xx_nvram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index d25f080fcb0d..8698c5dd29d9 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -100,7 +100,7 @@ static int nvram_find_and_copy(void __iomem *iobase, u32 lim)
 		nvram_len = size;
 	}
 	if (nvram_len >= NVRAM_SPACE) {
-		pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
+		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
 		       nvram_len, NVRAM_SPACE - 1);
 		nvram_len = NVRAM_SPACE - 1;
 	}
@@ -152,7 +152,7 @@ static int nvram_init(void)
 	    header.len > sizeof(header)) {
 		nvram_len = header.len;
 		if (nvram_len >= NVRAM_SPACE) {
-			pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
+			pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
 				header.len, NVRAM_SPACE);
 			nvram_len = NVRAM_SPACE - 1;
 		}
-- 
2.17.1

