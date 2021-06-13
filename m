Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5EBD3A596E
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jun 2021 17:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhFMP63 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Jun 2021 11:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhFMP63 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Jun 2021 11:58:29 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175E3C061574
        for <linux-mips@vger.kernel.org>; Sun, 13 Jun 2021 08:56:28 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 3-20020a05600c0243b029019f2f9b2b8aso11342096wmj.2
        for <linux-mips@vger.kernel.org>; Sun, 13 Jun 2021 08:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WcWXY1H/tcjwWXrjK7sGg/H6izhQyfGF6Ma3AVimpBU=;
        b=HEbM5nM8IHDEzMdD3sztOA9THxULFR4v8Z3E2Fvii9hlMDTtptfpVaiPLdLYnSvk+0
         NTVwVp7GOcNpM8gtJafnfqtSo2gRkzUbCOCXnt1Hyh7joulJKdVs0TBy0NDzVRha3+oH
         ytSQ0/gvM1ltmbnXirtLVlCkTqxYlHK58VDN79RPpE1rtCeRE2nNBmIFp89xpMw4k2Ej
         xEeeSONozXVj/bm8pCu0jqEASSM1HsSG5cvz+jmpKiY59koi1j//UB+fE3a3OsUdNQhS
         DjXE2hwHJFaqvad1GEFWivXu2sIRYVfTq1zj/zfTDUZVS+fixR2x09HT4qJkZDkA3izK
         2OYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WcWXY1H/tcjwWXrjK7sGg/H6izhQyfGF6Ma3AVimpBU=;
        b=P1Y1+HuVBN6IHrUyHmDtU4GpPNT6qVMoM6UmP4WTbuVjZ6p03lsBFIFYctXxzy2bsG
         PNr7p8/nYZM6pPag/a7arepNmdVhlcBc5fnR4ZuXFqyN8CohMvacDNm9tcPSNixca2ZP
         yI/sQvQS5xlg+POO5afWH67dLlB/F70wqHXoFHYHZJV60LIV1dV7B5RHukKqbli240Lo
         Z1w3KgtwaESldTdHADRbA/Vz4hLyUfcXsv3xgyj05+qrm2VlYtl5PpuGk3fhfVTt9M9b
         SkqOzjVG9wkrM6yt/bQE/OTJsVd7AJ42jIe3JowXsq9Dhjws7wi4CM25sy8a+oI7FLw8
         ZL3w==
X-Gm-Message-State: AOAM532L32U+SSCM+v/Dw84tcbDmUyV02RbWViR1kSqQiJEpfgWVRvLA
        ZmggSAgg7tk+yXH60xrd4GU=
X-Google-Smtp-Source: ABdhPJzC7esJXQAJvVqwSLn+AHewwNmrMQCmETANKdSzUN9Gdtf2/VJaUyahh1RjHJVC4574vp7ZRw==
X-Received: by 2002:a1c:453:: with SMTP id 80mr12034421wme.171.1623599786485;
        Sun, 13 Jun 2021 08:56:26 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id g17sm17539746wrh.72.2021.06.13.08.56.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Jun 2021 08:56:26 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: [PATCH 1/3] MIPS: ralink: Define PCI_IOBASE
Date:   Sun, 13 Jun 2021 17:56:21 +0200
Message-Id: <20210613155623.17233-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
References: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

PCI_IOBASE is used to create VM maps for PCI I/O ports, it is
required by generic PCI drivers to make memory mapped I/O range
work. Hence define it for ralink architectures to be able to
avoid parsing manually IO ranges in PCI generic driver code.
Function 'plat_mem_setup' for ralink is using 'set_io_port_base'
call using '0xa0000000' as address, so use the same address in
the definition to align things.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/include/asm/mach-ralink/spaces.h | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h

diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
new file mode 100644
index 000000000000..ec58d4a9ed05
--- /dev/null
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_RALINK_SPACES_H_
+#define __ASM_MACH_RALINK_SPACES_H_
+
+#define PCI_IOBASE	_AC(0xa0000000, UL)
+#define PCI_IOSIZE	SZ_16M
+#define IO_SPACE_LIMIT  (PCI_IOSIZE - 1)
+
+#include <asm/mach-generic/spaces.h>
+#endif
-- 
2.25.1

