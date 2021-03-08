Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18E53309E5
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhCHJDv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:03:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbhCHJDn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 04:03:43 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E68E5C06174A;
        Mon,  8 Mar 2021 01:03:42 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p21so19770580lfu.11;
        Mon, 08 Mar 2021 01:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QHdcGt7AxJv5t+i0WxNNyS82pcyfDeM2mDcTkiKFnc0=;
        b=MmolS1fvCwl8ZXC6sR8UJiH5ac1tC4I7+oEHFjRqga9PHL9OqdytRUVpEq1M92OgVL
         CV4z2CYnbAS0hRLNPJX7CzxaST/RiPaEvw8dVBy8xvau7HSQHyTxOTcms66C6yhMyvPw
         wzlKIZkTIXjuXVsM2+d7ZrNP6PAd36TILZ5JBjkLy4GERCdwMa3hiU+A1FXIEZ3HyNki
         h1+R3vTy3IZlPe3J38FWzinrci+vWXmBS3ngzxCrF6pKJxxRAEQWm+5ZuOqo19IsD/TS
         LXC0dSaL2/P3UX2mdkXt5xOA5Wl430shguLK5UqyPPBk21FdEoWF9WvskpdFj6wbSAJm
         /iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QHdcGt7AxJv5t+i0WxNNyS82pcyfDeM2mDcTkiKFnc0=;
        b=RjVo0jMPVqLy4gdZpqJMl9BqCw4ixkKcpr+2zltazpQ32+Kww7oypoWz4OPyJ5IlGY
         TJyLXOglFSyYJ2Vca2NWHHYoDOL8D1H/y54FBhmZgE8DsZc1I4TnPbI8QedsvzchCm2t
         Jkz3pv61sEAKgGCP6slryVaVbFBDcbI/IL3OhwwJX3Z86fBDDs0exsO9w9P9DUWWl83c
         +Nhi93YWW1Xc5ME9Nl3M2rfsPryH/IHP23d8AyHN84Ad/LazGrVimFsaVdruVQaMtOda
         7julvgLmfyR+Zx0O0zEXvhSeFqU4dnz0pRRspv6ALN9C9RJwcQbWUaNSPUzHqsPtnj6e
         OrIA==
X-Gm-Message-State: AOAM532SIXhbLJ6SsjLSctUx91phEr8mY6BFzcUiYjTSiYOKou+pHSg9
        bv/onDGTWTVYHk82zpw4iso=
X-Google-Smtp-Source: ABdhPJxuVlWfg/qDGMbGPzKfkNXvjObQ6FjU0FoeUnYoDugW+L1Vmbs+inKq0wO4U5cPyQtRZF2HBg==
X-Received: by 2002:ac2:455b:: with SMTP id j27mr13730978lfm.72.1615194221481;
        Mon, 08 Mar 2021 01:03:41 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id t13sm1410346ljk.47.2021.03.08.01.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 01:03:41 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH  mips/linux.git 3/5] firmware: bcm47xx_nvram: extract code copying NVRAM
Date:   Mon,  8 Mar 2021 10:03:18 +0100
Message-Id: <20210308090320.9765-4-zajec5@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308090320.9765-1-zajec5@gmail.com>
References: <20210308090320.9765-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This simplifies function finding NVRAM. It doesn't directly deal with
NVRAM structure anymore and is a bit smaller.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 43 +++++++++++++----------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index 99f3ec180be6..09f51b95849e 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -54,12 +54,35 @@ static u32 find_nvram_size(void __iomem *end)
 	return 0;
 }
 
+/**
+ * bcm47xx_nvram_copy - copy NVRAM to internal buffer
+ */
+static void bcm47xx_nvram_copy(void __iomem *nvram_start, size_t res_size)
+{
+	struct nvram_header __iomem *header = nvram_start;
+	size_t copy_size;
+
+	copy_size = header->len;
+	if (copy_size > res_size) {
+		pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
+		copy_size = res_size;
+	}
+	if (copy_size >= NVRAM_SPACE) {
+		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
+		       copy_size, NVRAM_SPACE - 1);
+		copy_size = NVRAM_SPACE - 1;
+	}
+
+	__ioread32_copy(nvram_buf, nvram_start, DIV_ROUND_UP(copy_size, 4));
+	nvram_buf[NVRAM_SPACE - 1] = '\0';
+	nvram_len = copy_size;
+}
+
 /**
  * bcm47xx_nvram_find_and_copy - find NVRAM on flash mapping & copy it
  */
 static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_size)
 {
-	struct nvram_header __iomem *header;
 	size_t flash_size;
 	size_t offset;
 	u32 size;
@@ -95,23 +118,7 @@ static int bcm47xx_nvram_find_and_copy(void __iomem *flash_start, size_t res_siz
 	return -ENXIO;
 
 found:
-	header = (struct nvram_header *)(flash_start + offset);
-	__ioread32_copy(nvram_buf, header, sizeof(*header) / 4);
-	nvram_len = ((struct nvram_header *)(nvram_buf))->len;
-	size = res_size - offset;
-	if (nvram_len > size) {
-		pr_err("The nvram size according to the header seems to be bigger than the partition on flash\n");
-		nvram_len = size;
-	}
-	if (nvram_len >= NVRAM_SPACE) {
-		pr_err("nvram on flash (%zu bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
-		       nvram_len, NVRAM_SPACE - 1);
-		nvram_len = NVRAM_SPACE - 1;
-	}
-	/* proceed reading data after header */
-	__ioread32_copy(nvram_buf + sizeof(*header), header + 1,
-			DIV_ROUND_UP(nvram_len, 4));
-	nvram_buf[NVRAM_SPACE - 1] = '\0';
+	bcm47xx_nvram_copy(flash_start + offset, res_size - offset);
 
 	return 0;
 }
-- 
2.26.2

