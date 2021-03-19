Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6F2434149E
	for <lists+linux-mips@lfdr.de>; Fri, 19 Mar 2021 06:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbhCSFSF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Mar 2021 01:18:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbhCSFRn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Mar 2021 01:17:43 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04633C06174A;
        Thu, 18 Mar 2021 22:17:43 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id f12so5926127qtq.4;
        Thu, 18 Mar 2021 22:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7GBqNazUCS8f3IXmAbu/F6we9dSa3HP+urE7g3LmVI=;
        b=LHlOHWCpE2sS9I/uXTnfcUpFC0V6wv24qc+YHUZpyjmaw6/v1vc81WqLjG47elYp3S
         TsW9fVw6/xjq9xE8Ig1kUsaq6W/HklJlH2Q7xeK7MBSibiMYY6CdRvwNZz6HIs1yeEVW
         lvvR6uRCpk2UcV28We4TAJDkZPPAJc63r9wA51fD2esLchey7uzPUHj4Qp6c6pB6OPNZ
         Yi7ja5LVcGQu3E8/F2tWzEgAbth4WcMBirpfZqN1h87h+CKRJ8Qazi6VRTfE6DZEiyAM
         1o04JK29G18ER00+hWjt7K9tPcvV4sTgmEfJpf/azThmNe4iXJ9ycSkaoDY5iWI8jyAl
         M/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y7GBqNazUCS8f3IXmAbu/F6we9dSa3HP+urE7g3LmVI=;
        b=QTDAK280LUJE2CeL9+T7ihUHFAwHuisoT+A61io9755rr691rv+ByILfcuUJY+LHuh
         ITmRnFEn/RC6HlvZPmce8N+6qfGHOtf8gi+t586CVBq5yXsusbQjsQ8pCuk2w/jci9I8
         RCE0oL1fdc6w49u3+RteLcNWcUYaAHaGxQoci+X1E5tc9KsCEJ0ZkjaoSjq0E0UlB38v
         95K6QtsusB4tAOJLA1yz73KmOF+8/lteY1T7DTilb+Dtcs1b96aGxxD+FgiEWqRkTHoA
         REb6XStLZMYHR+95GZhCj7ZVXkjYfkdF7dFU/JX5fyeyml2c4AGJM545C6tycoJnm3DQ
         hCqw==
X-Gm-Message-State: AOAM530zmfdpxkmIUC0GrDpIp6gZZEe/Nfp6m+Pg6Wv85VxVmcves1hc
        oboW8XrcKQ0AQnmSN4Mc5dQ=
X-Google-Smtp-Source: ABdhPJzvKI7AU+6ZJMzYkC1Q0SRQ4gqU8Ik7AlGuDV0zvkoncbmdzbo8Qy0r8wIaWHQVrnRiNUJxPw==
X-Received: by 2002:ac8:4718:: with SMTP id f24mr6965439qtp.270.1616131062323;
        Thu, 18 Mar 2021 22:17:42 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.87])
        by smtp.gmail.com with ESMTPSA id r17sm2938983qtx.62.2021.03.18.22.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Mar 2021 22:17:41 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     tsbogend@alpha.franken.de, robin.murphy@arm.com,
        tglx@linutronix.de, bhelgaas@google.com,
        andriy.shevchenko@linux.intel.com, maz@kernel.org,
        unixbhaskar@gmail.com, jonathan.derrick@intel.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
Subject: [PATCH] MIPS: PCI: Fix a typo
Date:   Fri, 19 Mar 2021 10:45:14 +0530
Message-Id: <20210319051514.16447-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


s/packt/packet/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/mips/pci/pci-xtalk-bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/pci/pci-xtalk-bridge.c b/arch/mips/pci/pci-xtalk-bridge.c
index 50f7d42cca5a..d2216942af18 100644
--- a/arch/mips/pci/pci-xtalk-bridge.c
+++ b/arch/mips/pci/pci-xtalk-bridge.c
@@ -385,7 +385,7 @@ static int bridge_domain_activate(struct irq_domain *domain,
 	bridge_set(bc, b_int_enable, 0x7ffffe00); /* more stuff in int_enable */

 	/*
-	 * Enable sending of an interrupt clear packt to the hub on a high to
+	 * Enable sending of an interrupt clear packet to the hub on a high to
 	 * low transition of the interrupt pin.
 	 *
 	 * IRIX sets additional bits in the address which are documented as
--
2.26.2

