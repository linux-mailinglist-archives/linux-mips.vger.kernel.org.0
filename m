Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE1736526F
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 08:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhDTGlb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 02:41:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhDTGla (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 02:41:30 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 000B9C06174A;
        Mon, 19 Apr 2021 23:40:59 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id g16so2271428plq.3;
        Mon, 19 Apr 2021 23:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7+QGbNN4XGQqzSpMblrh9U55SNG2B814LfT0acp5AwI=;
        b=LK1jsnU6kPomI5mAvI8dytkhIYftLbm6EhSajQDbNelizA0oFFyaZfRJMHC31I2xlu
         aPnuvtOr9apvUKqILCE6CjYixsjwaWcT1mVk0gPGLiH/rPRKEqyibLlZ+BwZW2QIO5NU
         EIpq4cjwd/G6lYxhMTyanWKNRkh3HB9Ll7NMcE/UxbMk5tC96k6BkjAZtZs0HB5ryCI1
         E0pofN4AwbEbP8n0pWHXt6qUxcbCdWpjjUg7H+Nl8SrwDexqy4jIXjYAU7I3qynfPA7a
         11GbbfYFxAD6kgfsCgISwYwgN4Sh3ByZFYhif/HiEWP/d+ouTG/RCbDtkLemi/Jg6sw7
         g9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7+QGbNN4XGQqzSpMblrh9U55SNG2B814LfT0acp5AwI=;
        b=Encoy+ZRQ2kRLEymnB/3QzX/U+yfJyfHcuPrlMVJPCYkFHhSRaxu5rjfPs7nD4RYZi
         8R5zC2a1mq6875qxfvwmfrn2BQ+78HPYcynw5tN4qQR8A4CbV66c9K37SrTuULXJnfbl
         K7Vq6FTMUDvOkxTCSLh1w0PWLJVit3vrdxsYVkuhTyRkz7Is9+peVbnfHeGeefPhofwD
         Is0ZUKmE221B0Y2UtH+NDcw1tzC+MtJe1qjz8/eU5iDPzuNB31OfhFW3S8MDhn7upW2R
         B5VueQB+Gr7S5xbDk+mWBM6bJF8iR4O5v46paYz2FLyoQknmQbP+EPSxBqbPpqqVKZtN
         qYJw==
X-Gm-Message-State: AOAM532qRZH6YGLmzzqrgyT6MIt4izIKaBikeJ9zMNLi8lLvU52zSz/M
        at8tiaHG8Hp8PZWJT+A9jDsoq5WCn6eCTThG
X-Google-Smtp-Source: ABdhPJyNVCJoe8kwWM/hHm4TT66sJhmmc38ZfQNv3ISufm//f1HtvghsAPix86SmKkFBguK8c/F0cQ==
X-Received: by 2002:a17:902:9685:b029:e9:abc1:7226 with SMTP id n5-20020a1709029685b02900e9abc17226mr27665255plp.64.1618900859030;
        Mon, 19 Apr 2021 23:40:59 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id z62sm690956pfb.110.2021.04.19.23.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 23:40:58 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MIPS: pci-legacy: revert "use generic pci_enable_resources"
Date:   Mon, 19 Apr 2021 23:39:43 -0700
Message-Id: <20210420063942.7041-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210420052319.GA162457@roeck-us.net>
References: <20210420052319.GA162457@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This mostly reverts commit 99bca615d895 ("MIPS: pci-legacy: use generic
pci_enable_resources"). Fixes regressions such as:
  ata_piix 0000:00:0a.1: can't enable device: BAR 0 [io  0x01f0-0x01f7] not
	claimed
  ata_piix: probe of 0000:00:0a.1 failed with error -22

The only changes from the strict revert are to fix checkpatch errors:
  ERROR: spaces required around that '=' (ctx:VxV)
  #33: FILE: arch/mips/pci/pci-legacy.c:252:
  +	for (idx=0; idx < PCI_NUM_RESOURCES; idx++) {
 	        ^

  ERROR: do not use assignment in if condition
  #67: FILE: arch/mips/pci/pci-legacy.c:284:
  +	if ((err = pcibios_enable_resources(dev, mask)) < 0)

Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
Guenter, sorry about this - let's just revert this for now to minimize
turmoil to the legacy PCI code. Obviously, this needs more testing
before applying. Thanks for your report!

 arch/mips/pci/pci-legacy.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index c24226ea0a6e..468722c8a5c6 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -241,9 +241,45 @@ static int __init pcibios_init(void)
 
 subsys_initcall(pcibios_init);
 
+static int pcibios_enable_resources(struct pci_dev *dev, int mask)
+{
+	u16 cmd, old_cmd;
+	int idx;
+	struct resource *r;
+
+	pci_read_config_word(dev, PCI_COMMAND, &cmd);
+	old_cmd = cmd;
+	for (idx = 0; idx < PCI_NUM_RESOURCES; idx++) {
+		/* Only set up the requested stuff */
+		if (!(mask & (1<<idx)))
+			continue;
+
+		r = &dev->resource[idx];
+		if (!(r->flags & (IORESOURCE_IO | IORESOURCE_MEM)))
+			continue;
+		if ((idx == PCI_ROM_RESOURCE) &&
+				(!(r->flags & IORESOURCE_ROM_ENABLE)))
+			continue;
+		if (!r->start && r->end) {
+			pci_err(dev,
+				"can't enable device: resource collisions\n");
+			return -EINVAL;
+		}
+		if (r->flags & IORESOURCE_IO)
+			cmd |= PCI_COMMAND_IO;
+		if (r->flags & IORESOURCE_MEM)
+			cmd |= PCI_COMMAND_MEMORY;
+	}
+	if (cmd != old_cmd) {
+		pci_info(dev, "enabling device (%04x -> %04x)\n", old_cmd, cmd);
+		pci_write_config_word(dev, PCI_COMMAND, cmd);
+	}
+	return 0;
+}
+
 int pcibios_enable_device(struct pci_dev *dev, int mask)
 {
-	int err = pci_enable_resources(dev, mask);
+	int err = pcibios_enable_resources(dev, mask);
 
 	if (err < 0)
 		return err;
-- 
2.31.1

