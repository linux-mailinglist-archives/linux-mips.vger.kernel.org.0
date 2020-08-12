Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB0424265B
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 09:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbgHLHwp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 03:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgHLHwo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 03:52:44 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFFECC061787;
        Wed, 12 Aug 2020 00:52:43 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id f18so3675283wmc.0;
        Wed, 12 Aug 2020 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qwUjwkfqICRHh42RRckTZulCKoTgiXL8sF/Vq2ZOcio=;
        b=cp93HeWBHmLrhvB/k2i1QpBuR8xBJWl32nubDbYh/J7WapTEBYyGoVRZvIzqVlRJBD
         DDuijVtYrK+PSr4PUvrXyAXkFtTkcFC88izA/Q3+D3Y1SYXJi1/gsQVCf9HFjgRu27Fe
         KnK71VX4Kq1PV2zdxjNj5cSs/hZJlDs9h1jTn8lyciTH5N9hcZ/sriK3ovr9cTbPKjqk
         3uB/oOltzRhXhth11ycTy+3StUnM2mgqRyNBieiTUQ+vRs/ykcUs9L3gPzdf4rSFPC1Y
         aF/BoPADDEfvmdk0ToAaMuxhfyq0rEXexFoi5KiJkyitBgg/rjBHlw+IxMCFM9mMvr3N
         7VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qwUjwkfqICRHh42RRckTZulCKoTgiXL8sF/Vq2ZOcio=;
        b=VizegPwD9ePsJTJXKsaFnS6ikEoz/p5KBcf770V6DYexU8RAfAmVNZ6oeuaRn0TL7m
         h5YY0N0HFB1VU5qKYqa55JnKIMG5fVYN8YymAw9O7o6E6ENsZWLrPx5ylCNX/pCwQMbZ
         YbQN2LegRnjGEsO6m9UFQVVg9FzsjT5eIiv0tyd3lBMQdYNtyK6yMpkvyok6cTY7ehzP
         QXCdoV+GDbUpUKlllkl6Uz/7widxJ6YCOcbxz0Td266o5duIhlJYtMAL/ZzveG6ASWfq
         JdH9W23CciptLqgqCsDgiisciLzleEDsDzZ2mmnJnsvsg3GSz7/GrQ4QLqaqq9FQmV22
         oT0w==
X-Gm-Message-State: AOAM530CBjXl6adKr0u05OnQLvd9I6rngreoFwnF2oe9mBki8/J0N96a
        g8WmABuTsyKWqTg40lJ87yA=
X-Google-Smtp-Source: ABdhPJxvUAOFT5BOCYK6fO4FCKOU+WOiJ/CtC83HWGoRTX1vBqGPpOdZuwLP/FkuTTuq2QIfZ2/fmg==
X-Received: by 2002:a7b:c2aa:: with SMTP id c10mr7262505wmk.86.1597218762490;
        Wed, 12 Aug 2020 00:52:42 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 6sm2470984wmf.4.2020.08.12.00.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:52:42 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 5/5] MIPS: BCM63xx: switch to SPDX license identifier
Date:   Wed, 12 Aug 2020 09:52:35 +0200
Message-Id: <20200812075235.366864-6-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812075235.366864-1-noltari@gmail.com>
References: <20200812075235.366864-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use SPDX license indentifier instead of local reference to COPYING.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v4: add new patch with SPDX license change.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index fa0acf003a46..01aff80a5967 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -1,8 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
  * Copyright (C) 2008 Florian Fainelli <florian@openwrt.org>
  */
-- 
2.28.0

