Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68D93A5FAE
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 12:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232579AbhFNKI1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 06:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbhFNKI0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 06:08:26 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708D6C061766
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 03:06:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id n7so7718581wri.3
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N0fsKa0m+ct2TNQQ9Pb5MMJ8S0hfbem4WCcQmEP55Aw=;
        b=alZqxe/iNgMwZ4sWImtm00CDmdvzVwc0Fe2Ol7kiL2X2JKrhnquF+MUcRTvC/sjvwW
         aug8+vpOmTsktZH4AOE0DWwMMAMUsNXAPgxON3hjkOlsFpZyT10qeWvpZOrB79rkC5Tr
         7Hx3FekROUivbEnrigJ7s0+7bXFfZsOLlT6c9+Pp9MpNVZV+VHq95YLZM/gAoNlqqHnE
         LlszW+ORwsdXV6Mhfrcmx+R9OyYXuNHtTQuabohzy9k1epJznKP50fnWPZbssZRA7wyL
         +7ym7O7R9TDSyVguePFoiw5uziIkNiUIWxOtwgz9WWr8JiSUoXIdB5mkKOtDGCQcaI9j
         TMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N0fsKa0m+ct2TNQQ9Pb5MMJ8S0hfbem4WCcQmEP55Aw=;
        b=Bi01bPEyIQSYgJwX8yVOq8yYCKIAIgbfcUxsj1PPr+J9HfDehd+bvgllzCZgTlMeCB
         0+BGzL9YgFt01DptZI7l2yoTq6QgzWrmL9lORCVp/INfO9ksKHuCPapL7BvBgt3PKv8j
         irf6nC/xqUC6AxIjA8qWN9f2SzEwoBLJNuUiTJf6mjaabqNCU48CAQq7r8YEw/XqcQKk
         FMPOFZG4Cft0ftc/mhrdxMuG1fvgRDKlY8iyxwLU4X6G+fFgDrbdXmmsfi9/L0hT0Jh5
         3EW3MrOn2ihr8+HqH8W1KMZsjjv7j+vcus98VhoroF3ToiLpYoST9wm8NRjIdpIAWtt1
         nBsA==
X-Gm-Message-State: AOAM533WigvHX/xs6afxp9HgUgmhp7A2ro7m61LpnmWqX7U86G3oQCS/
        qkQwPysYbRLB+hmP05eDNOQ=
X-Google-Smtp-Source: ABdhPJzF4cE/D7foVs4lkEe8wDLIxb9sDkQiX242rhjvHu3/KfrF25c7Jc6fMYsZzwriWltz1gRwaA==
X-Received: by 2002:a5d:4538:: with SMTP id j24mr17707142wra.391.1623665179977;
        Mon, 14 Jun 2021 03:06:19 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id k5sm16476566wrv.85.2021.06.14.03.06.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 03:06:19 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: [PATCH v2 1/3] MIPS: ralink: Define PCI_IOBASE
Date:   Mon, 14 Jun 2021 12:06:15 +0200
Message-Id: <20210614100617.28753-2-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
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
index 000000000000..87d085c9ad61
--- /dev/null
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_RALINK_SPACES_H_
+#define __ASM_MACH_RALINK_SPACES_H_
+
+#define PCI_IOBASE	_AC(0xa0000000, UL)
+#define PCI_IOSIZE	SZ_16M
+#define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
+
+#include <asm/mach-generic/spaces.h>
+#endif
-- 
2.25.1

