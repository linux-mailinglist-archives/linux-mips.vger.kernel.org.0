Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4731BF44
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2019 23:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfEMVxX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 17:53:23 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43136 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfEMVxX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 May 2019 17:53:23 -0400
Received: by mail-pf1-f193.google.com with SMTP id c6so7899019pfa.10;
        Mon, 13 May 2019 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=X/D9Rbuw++npzUD5iZbLDGr4TpmDR63qCN78PuJyDwk=;
        b=p+9KUnOJUmGKNIyHHVYFV1ZnbwVq32m5jBtFAzpTzPYiZqrFgqUeM9ZUEQQgKXorye
         SJMxakHFA7DDoGIHoYyJZgr8b7ZgkCLLI4LTG3JTZKprgvmJIH1OQWBKpaXx97K8sDRS
         Y+v0ql5wHATrL1RUrHp6kXTCac7PHdQ32AkZtTomEfJHtCmVBvqha3sQpZ6xd8BbTlIW
         eNJq0ZAtxI4oiwNV8OjynHR5m8p4WlrOOgnzh15hcMzFb7fFcOfgJsKv3LUMbSr19VRf
         E6m3AO1vZrnyOW+MHtYbdGaRBPG9Ta8Oi3DDRmbH8UEwVyhJ7277+loQrdcEmMU5OIt1
         vgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=X/D9Rbuw++npzUD5iZbLDGr4TpmDR63qCN78PuJyDwk=;
        b=ValQ0l7L1O196y/0fC2CYsqZVT8zVM4UvlfBOFT+tCOCHH0XSytsLg95gg7in4/tBy
         ruZc3QYzCqzafFg8k1KA9ge12hsIldoMOa8zvU7KWLcRsEfxJs9j5bHNcyc14+h9smId
         71rqbnRaeYQvJF2b392kWkgnzB2WrTO/nF6LMoyeo96H4yFx2AKSc7pQUc+qsIlDQHUV
         9103/XgoUnxTJdBSms3nZqc97XKBF7utwGEBcwjTN0S5+4RW8N7mWMNlbfmV4W99SAMp
         ksfKQNcrq+YNDBQQRQ8YlVnZuDrCA9D2y8oapWfYrtj7FBf09kM0qSHSuqpA/TyZsF2q
         VCow==
X-Gm-Message-State: APjAAAU6d06v/43dEm1XQVB7/G5wjd2n2I9NiptQ3MpkTiqkrMhUtQn8
        m2LKyE514++miAh+TCRXzsk=
X-Google-Smtp-Source: APXvYqz8m3jfMp/dFmAdKmHIQzo4hRk7Uxsp/wYoo1miaTqn7ufJaZnYfReFruWv2IlAzV7HCK+apQ==
X-Received: by 2002:a63:58b:: with SMTP id 133mr34620626pgf.138.1557784402650;
        Mon, 13 May 2019 14:53:22 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id h11sm13761369pfn.170.2019.05.13.14.53.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 14:53:21 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        linux-mips@vger.kernel.org (open list:BROADCOM NVRAM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] firmware: bcm47xx_nvram: Correct size_t printf format
Date:   Mon, 13 May 2019 14:52:49 -0700
Message-Id: <20190513215250.19246-1-f.fainelli@gmail.com>
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

Use %zi instead for that purpose.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/firmware/broadcom/bcm47xx_nvram.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/broadcom/bcm47xx_nvram.c b/drivers/firmware/broadcom/bcm47xx_nvram.c
index d25f080fcb0d..2d38ebbcf749 100644
--- a/drivers/firmware/broadcom/bcm47xx_nvram.c
+++ b/drivers/firmware/broadcom/bcm47xx_nvram.c
@@ -100,7 +100,7 @@ static int nvram_find_and_copy(void __iomem *iobase, u32 lim)
 		nvram_len = size;
 	}
 	if (nvram_len >= NVRAM_SPACE) {
-		pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
+		pr_err("nvram on flash (%zi bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
 		       nvram_len, NVRAM_SPACE - 1);
 		nvram_len = NVRAM_SPACE - 1;
 	}
@@ -152,7 +152,7 @@ static int nvram_init(void)
 	    header.len > sizeof(header)) {
 		nvram_len = header.len;
 		if (nvram_len >= NVRAM_SPACE) {
-			pr_err("nvram on flash (%i bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
+			pr_err("nvram on flash (%zi bytes) is bigger than the reserved space in memory, will just copy the first %i bytes\n",
 				header.len, NVRAM_SPACE);
 			nvram_len = NVRAM_SPACE - 1;
 		}
-- 
2.17.1

