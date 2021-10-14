Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF5642D1E1
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 07:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhJNFm3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 01:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhJNFm3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Oct 2021 01:42:29 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19053C061570;
        Wed, 13 Oct 2021 22:40:25 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id m21so4451149pgu.13;
        Wed, 13 Oct 2021 22:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A98Ys7qW2gz8IVASiaeqvMCkSRB3YOOfj8JCEF28bo4=;
        b=GaojE3W8GYvHMRj7tsp7qszmyRShPbrRwPI2iheCutTH4j+QE8GEaPadpls8K4uWiT
         ORWgxJINipdvrmZUj9Bsd75G3u+eYkQXtDJwFPIoM+N7D7rjKqw9iRQa/lzNLbKMcO5a
         P0pWuz58N29T58Vrv5r56FLN6AmForGLx3t2Dt2Z5z6Rfz3UIrR6fORvFUUE/PGYMuDS
         T8PFelgUf9kF/bhqvZ+msYV3CzF8c5FiULpnRedlvOZJ9A+IU/TB/nDlUlnMVtquEwgQ
         Lmp6J8Q0cVqnvVAuLqD8jRsELzRocdTKhR9EIxEjq6VV74Asa8hv11UxzvH5veqmHreC
         rF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A98Ys7qW2gz8IVASiaeqvMCkSRB3YOOfj8JCEF28bo4=;
        b=uTq7zs6TNVOOki/Ea7169YIeKKU5zPRtYzYuNlhTYQaEtAYz+IN1tGMdtVsX2nb1CE
         JbWVtKKLm9SVMAzGJu3GoYVDbhsohBcr8HTW89rraw2AuvnmQSXAZVkMdd40qesSZcTS
         +/1OB4k26ThwEmvoXavbysgD7n84Z7NHJtLDOLodRUwTCgyW9PLuqTfyUVfay79Jo759
         GeXtuSgFzRt14Jx/bULmuEPHRgk9q6QVN19WoEywMkGSFzm0iyso046tGvC1w8u9Udu+
         ijB8NEF/An552NCAip7s2Pr5isHwJ85zITrjdCqDZC6rd9jxU6bmM+C29pIuwBL3yvtl
         A9dw==
X-Gm-Message-State: AOAM532jqZxT2Y43zxM85BeiBv2DPS3GX3//TiAIHTdYvjC7pBrzXGKj
        K1lvmanDDYAPQixASq95sDVXQC0XkeM=
X-Google-Smtp-Source: ABdhPJyVlpiUXDZiWEs9LEy0UMfshMdZANNiDFaV8KrHlHTg3DSxoIi6vbS5XufAeOSp26IPehj9QA==
X-Received: by 2002:a63:6c02:: with SMTP id h2mr2738692pgc.173.1634190024490;
        Wed, 13 Oct 2021 22:40:24 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7360:b000::9d4])
        by smtp.gmail.com with ESMTPSA id mu7sm1257318pjb.12.2021.10.13.22.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 22:40:24 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v3 0/3] MIPS: kernel: proc: fix style and add CPU option reporting
Date:   Wed, 13 Oct 2021 22:40:15 -0700
Message-Id: <20211014054018.6179-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.33.0
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
  Options implemented   : tlb 4kex 4k_cache prefetch mcheck ejtag llsc
  pindexed_dcache userlocal vint perf_cntr_intr_bit cdmm perf

---
v2: Add missing options that were added since the original patch
v3: Resend after 6 months and add Hauke's Acked-by

Hauke Mehrtens (1):
  MIPS: kernel: proc: add CPU option reporting

Ilya Lipnitskiy (2):
  MIPS: kernel: proc: fix trivial style errors
  MIPS: kernel: proc: use seq_puts instead of seq_printf

 arch/mips/kernel/proc.c | 227 ++++++++++++++++++++++++++++++++--------
 1 file changed, 184 insertions(+), 43 deletions(-)

-- 
2.33.0

