Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E4836A307
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 22:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbhDXUw2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 16:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbhDXUw2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 16:52:28 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B600C061574;
        Sat, 24 Apr 2021 13:51:49 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id p12so37546004pgj.10;
        Sat, 24 Apr 2021 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3G6NHDjgueqecPC+DIQ83EyjTtN9T+z5aXetAH36gBA=;
        b=GAl/xoxlywkewB1mC9ua8K58fvMlTEmIJRwBA/Yz6FkriimxEByWePigZnIRcW8XeZ
         wzr0HGM8B/oElTZDqDrLqjgbFOxRR/GS+Hu881FVw+q6yiH/7GkzvO5/FivJMir59llB
         eZWIJvAPLY4zNg/cz6ActnUSFti5h4Ut9H/qFISGBor20GNubSOv9Zway7bkSn92oHyD
         u8EwUqb7L6c7M7Sf73TxGQr7In4LUgLy2OUh96vPAJePGnJZBmDaKnGbvAIgtObiquH3
         obGCMI5YSnZ0j0pyEGQp18h6/EWO2NwAEZHVLSGxweqepDPrI/JKhnw9k8Qr/x3okxYZ
         prXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3G6NHDjgueqecPC+DIQ83EyjTtN9T+z5aXetAH36gBA=;
        b=Lph3c5RSxp1GoLBW/UIWu0gOZdFCzMUqPmavDJsCkFUsv7KLSCEm+rFQiXOGYDGTYt
         5GYXKt97zBzR8QfbAX99xPwPyqxyLi58w/zz01jAzHmJ/9x94ieagdEr5GIyd2SRQDpg
         h5j0B1hink3Yyxmj8uuUBa6KY/tdG1K+/hjh4nnaj9TU0KWKkmN38MIqyKp7ZyfP/uJe
         ki61biQbW7eUhosfNpfV3fXfjTStw6dWbZdsepl/VY+gyglB4vmCRfT3Su2HpJHVNa7g
         JSJCSPYYnU2OiWBFlAj+4w8RZAifKZpSOUaWcVnyLstUyWsjUbhWf6MamIqim9eLSsnR
         x8zQ==
X-Gm-Message-State: AOAM532KG4tWN4sC20paJXtz2W5bo2gGY1SfW56jpOO1cose5XLiaF0d
        DgbeuJlrKswVGkChGGOhJ24=
X-Google-Smtp-Source: ABdhPJw71RKsYxumsh8IYqv6990LHmQjr2pHpeHkQIK3a9zUyQ/fb1DX1MjobsaPCHLnx2cAyemD4Q==
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id a19-20020a62bd130000b029025c5ec4c2f3mr9882863pff.35.1619297507909;
        Sat, 24 Apr 2021 13:51:47 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id w9sm7584489pfn.213.2021.04.24.13.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 13:51:47 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] MIPS: kernel: proc: fix style and add CPU option reporting
Date:   Sat, 24 Apr 2021 13:51:24 -0700
Message-Id: <20210424205127.396630-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix checkpatch errors and use seq_puts instead of seq_printf where
possible.

Re-send an old patch that adds CPU option reporting.

Tested against MT7621 on OpenWrt running v5.10 kernel.

MT7621 output:
  Options implemented	: tlb 4kex 4k_cache prefetch mcheck ejtag llsc
  pindexed_dcache userlocal vint perf_cntr_intr_bit cdmm perf

Hauke Mehrtens (1):
  MIPS: kernel: proc: add CPU option reporting

Ilya Lipnitskiy (2):
  MIPS: kernel: proc: fix trivial style errors
  MIPS: kernel: proc: use seq_puts instead of seq_printf

 arch/mips/kernel/proc.c | 215 ++++++++++++++++++++++++++++++++--------
 1 file changed, 172 insertions(+), 43 deletions(-)

-- 
2.31.1

