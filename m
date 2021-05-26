Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D153918DB
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 15:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbhEZNdR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 09:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233872AbhEZNdR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 May 2021 09:33:17 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3ED1C061574;
        Wed, 26 May 2021 06:31:44 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ml1-20020a17090b3601b029015f9b1ebce0so324217pjb.5;
        Wed, 26 May 2021 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxxONJls2WeKipXE4u+uXlbzc7jh2SR2a8MqzSenr2w=;
        b=odTkBA574G8cyDw0IfXr0CWEEoN2Ixg3FhLU4rVfwLuNjXhCjq0TOYTkS2utZ1CzPz
         94c8FRbK26Q/I4u+42xih1Wes3J02xEl0KCjkgUQJhqh9KxG14mUmObOAsII3f5T4jy7
         gqaKTVtpZK96nfuEmVPzZm+35rTkD8qHp+Q7TwUFx8kwmTSJLdiS0LcJTJFdAvFmrDYe
         CRhsytP0UtBwk6fGVroVvJzc2K05S118DsI7Cynu2MqSeEtwcCA0lwx9lFcAXHi+5j9/
         YJ+3xVcu7j7/t5UOnVWslfIQSPg+y8s181It90N9sHRsEyOwovrVrwVTohKELEPeqhjD
         ai+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AxxONJls2WeKipXE4u+uXlbzc7jh2SR2a8MqzSenr2w=;
        b=PGP+y0ac8/2+aWloBVrbeDcHxZqpg2tmITkGZjaBdQck1fJzxPvKMnOZmGYB5uLdh8
         BYToKa/DzsrTxK0AgEybZwNJTC2bAI5q6OtE4E7DNPns5/3HV4FvTK/EXBtEKtNebTjY
         j6cVZ4isMuGNtYZQIJYPOkdUUwvndAuKfJTDQYE3VtkCOMNOZ5L67cZVliXeUSEmTw32
         4hS5SQGS9Yq0UR61cj4iDZMzL/Ye6k28gXPjcJUKN/7D61G09kvaLwTyI+CVF4MFM0Sh
         l/76ajNDWW7AGVpeP0V5sOT/VqXvb4Vs8uRvMEFrFrf/xPNS51p3iMXB0uz4PQI0mXeG
         ncgw==
X-Gm-Message-State: AOAM530asyWXshEQXw8Wcl59Hs+oLWYVs1Xco8i1Uw/ozLgKN1h74PZi
        3gZu7ejpO6npyHJA+Atij4LkYvJd5lxWEg==
X-Google-Smtp-Source: ABdhPJzBEcqrVxFyzaxjyYzZ+5MTyYBehG5Q8ShwpounCtutiWZv5dWFUuA46DnkNeFOL5RV3TAv4w==
X-Received: by 2002:a17:90a:d24f:: with SMTP id o15mr4024511pjw.83.1622035903864;
        Wed, 26 May 2021 06:31:43 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([112.45.97.46])
        by smtp.gmail.com with ESMTPSA id a15sm15223088pff.128.2021.05.26.06.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:31:43 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 0/4] MIPS: Loongson1B: Add dmaengine and NAND device
Date:   Wed, 26 May 2021 21:30:56 +0800
Message-Id: <20210526133100.436048-1-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patchset is to add dmaengine and NAND device
for Loongson1B.

Kelvin Cheung (4):
  MIPS: Loongson1B: Add dma_slave_map to DMA platform data
  MIPS: Loongson1B: Add Loongson1 dmaengine device
  MIPS: Loongson1B: Add Loongson1 NAND device
  MIPS: Loongson1B: Enable NAND by default

 arch/mips/configs/loongson1b_defconfig        | 13 ++--
 arch/mips/include/asm/mach-loongson32/dma.h   |  7 ++-
 arch/mips/include/asm/mach-loongson32/nand.h  |  4 --
 .../include/asm/mach-loongson32/platform.h    |  4 ++
 arch/mips/loongson32/common/platform.c        | 63 +++++++++++++++++++
 arch/mips/loongson32/ls1b/board.c             | 37 ++++++++++-
 6 files changed, 113 insertions(+), 15 deletions(-)


base-commit: 33ae8f801ad8bec48e886d368739feb2816478f2
-- 
2.30.2

