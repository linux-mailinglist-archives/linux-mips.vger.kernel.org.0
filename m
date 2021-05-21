Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B39EA38BAA8
	for <lists+linux-mips@lfdr.de>; Fri, 21 May 2021 02:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbhEUAGO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 May 2021 20:06:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbhEUAGO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 May 2021 20:06:14 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BABAC061574;
        Thu, 20 May 2021 17:04:51 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x188so13586294pfd.7;
        Thu, 20 May 2021 17:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+WD1bA7qEE56Fcg4L44BJACIdsdydoY9l3pDTKqewqc=;
        b=EGakKBwPKC/CpT1NEr2Vt8BM4b1JRvz0hHMeKJl4aNi13WSiwMzF4iyCkuwSlwGxur
         Zpu0qGXMDEF4timdIZ8B9Z3wK+lSwmwoTap9ceJfP7CyaBZ0l3GoTiNoSkV6rNvhNzAI
         Uq/7WdQOISrGud4e5hWWbh1KThzII/ZPZcGxsYNTM/3JhcPGolSImLRlv1z5ndWZS95/
         lrJVfk8nCmX4GBrlna9c8zq2oJrByhF3s7aTx071JnV7RTdNZtw/IXUwur4/IO9+pPeJ
         xPEaeptQTq5bBaCpOwcvav5W3Mw6kguRClbAtrODO5UStKJFQqHetShoH/QFWTWbxxFK
         HosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+WD1bA7qEE56Fcg4L44BJACIdsdydoY9l3pDTKqewqc=;
        b=Cv21GVS9aOk76yKK6T6FMBFGUT6c31Olequr9IUCMWz+F52Fh29CCoKaoSOqfTs9sb
         CA7v0TUCJ8hbri+PLXMmYndZ36lOnXUIXkIA6MBWMAHc40wJDApH6TiyJgvT0jr2KQp1
         /F6keUoj1gQ1csdRSofv7w+wtie32mF9apZ5J4EjTTbRnPdbxsTEkX62MRSgHStGJ68i
         yjpklN+ocuD5YGgbPs4kP0t9eVwxsHLZKcHySRotPj7+QyPux1uVBc4cbsh5rFq7FalI
         W4Ho23ImE92XmyyQAIYxuVeqVvWYsn/ExRnjT9ucoNeszGQpJr5W/flLU4m9eRqV0FTG
         GGug==
X-Gm-Message-State: AOAM532aAWOWgwlnSPbllhYd3UjDTERbOmg1uwmwdFqdvwZi4gwPX5zL
        qM8bUrsINpPa4gzXPtkw4nfnC8w/aNxy/w==
X-Google-Smtp-Source: ABdhPJzyXixnJwT3dIdVGaBn1fJ2Fdw9+FACZ1FT4k74jrqH5GUqcCD/2IbwMorrUqcLQ6vpe/E9EQ==
X-Received: by 2002:a65:4689:: with SMTP id h9mr6909294pgr.347.1621555490434;
        Thu, 20 May 2021 17:04:50 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([117.173.227.56])
        by smtp.gmail.com with ESMTPSA id t22sm2736016pfl.50.2021.05.20.17.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:04:49 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH 0/3] MIPS: Loongson1B: Add dmaengine and NAND device
Date:   Fri, 21 May 2021 08:04:02 +0800
Message-Id: <20210521000405.4387-1-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patchset is to add dmaengine and NAND device
for Loongson1B.

This applies on top of mips-next.

Kelvin Cheung (3):
  MIPS: Loongson1B: Add dma_slave_map to DMA platform data
  MIPS: Loongson1B: Add Loongson1 dmaengine device
  MIPS: Loongson1B: Add Loongson1 NAND device

 arch/mips/include/asm/mach-loongson32/dma.h   |  7 ++-
 arch/mips/include/asm/mach-loongson32/nand.h  |  4 --
 .../include/asm/mach-loongson32/platform.h    |  4 ++
 arch/mips/loongson32/common/platform.c        | 63 +++++++++++++++++++
 arch/mips/loongson32/ls1b/board.c             | 37 ++++++++++-
 5 files changed, 107 insertions(+), 8 deletions(-)


base-commit: 33ae8f801ad8bec48e886d368739feb2816478f2
-- 
2.30.2

