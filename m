Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746BD34A111
	for <lists+linux-mips@lfdr.de>; Fri, 26 Mar 2021 06:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhCZFfW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Mar 2021 01:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbhCZFfO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Mar 2021 01:35:14 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D42C0613AA;
        Thu, 25 Mar 2021 22:35:14 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id u8so3477219qtq.12;
        Thu, 25 Mar 2021 22:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fio+eNqKIZMGxoTBS2oX9UsnA5xkc2RWawLuG0+HOLI=;
        b=Db6EG7LpLtDK5ttxJY5gmbz2BnXdPp9k1UPT7O/u58DyyGlBySDBRPoHHe0WbTJdSN
         z2aTP83Ka6wdx3k2YjUgy/Dg6NqS+lu99Ufdh/fya/LARDehr0QVOWVVyfqOS/6bPZ20
         VXWaAuej4UbCOyV/sBVqV1bV0YRC7zHYiZ2Hj9J5nXenoLrAAJ8KcR0ovT5szR8LSzFd
         dz5xIZmEo5/H6i07d3U0ebMTBtYkz6B22vYUNgnly1YTPPziRFYDfYHjIdN2fOwGFzqs
         zgT4iDQqHqdRPGsPBmRViA4Qzgs7Byz9c/o4nQVvqV7pkKR729MWD9kxLmJDptmTiCRP
         uJtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Fio+eNqKIZMGxoTBS2oX9UsnA5xkc2RWawLuG0+HOLI=;
        b=AJvotqX7e4hYVV5IbcUfKDeE9tvubKNRGMyAg4AJ06OalzH/Hwpdv+NHglg0fWoMo5
         rbptdOFTAOmiRxe2fy6Ktfj8dOULhTvYjV6yijuXxyLQP3iAaLIAqgnNmpyYcSwcYA1J
         Q/pWww1XGls0T3UMNh6rjjGo3fe4AzX9EXJh1Bd7khwxE9L+WDYbVU5YU2k8X9+P8T8n
         XNEaJhBqXMZtZtMCm0v+Z7vCkzxCo37U0bv1Z7pr6XGwfYkeLtqCtGIpDd2YR23N2NHR
         MA0i3H6e4kvwVmphdPKRhqhCr9YUvPZqCRS7ThzXy0VjRTsUp71nPRuVJav1HPAFkmWN
         idOw==
X-Gm-Message-State: AOAM530HVOlhyHWvFspCt4TcIts4f+Boq+Db5hbf/VMUTbKmYtVM8T3s
        qk5HUuz+lUyXdFvzKZTm6U1MKpRiAFM/Kjre
X-Google-Smtp-Source: ABdhPJzHtAujBAwUPJjS0E2pAusfcfAtaNANtzYoRJ+uUm3R/HBC7RqPCy+Nz1tHg5nl+VoP2mFbMQ==
X-Received: by 2002:a05:622a:250:: with SMTP id c16mr10625902qtx.7.1616736913057;
        Thu, 25 Mar 2021 22:35:13 -0700 (PDT)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id j24sm5945325qka.67.2021.03.25.22.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 22:35:12 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        fazilyildiran@gmail.com
Subject: [PATCH] arch: mips: fix unmet dependency for MTD_COMPLEX_MAPPINGS
Date:   Fri, 26 Mar 2021 01:34:56 -0400
Message-Id: <20210326053456.42020-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When CAVIUM_OCTEON_SOC is enabled, and MTD is disabled,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for MTD_COMPLEX_MAPPINGS
  Depends on [n]: MTD [=n] && HAS_IOMEM [=y]
  Selected by [y]:
  - CAVIUM_OCTEON_SOC [=y] && <choice>

This is because CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS,
without selecting or depending on MTD, despite MTD_COMPLEX_MAPPINGS
depending on MTD.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/mips/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..39b1c8030842 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -998,6 +998,7 @@ config CAVIUM_OCTEON_SOC
 	select NR_CPUS_DEFAULT_64
 	select MIPS_NR_CPU_NR_MAP_1024
 	select BUILTIN_DTB
+	select MTD
 	select MTD_COMPLEX_MAPPINGS
 	select SWIOTLB
 	select SYS_SUPPORTS_RELOCATABLE
-- 
2.25.1

