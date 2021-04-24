Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED63736A34B
	for <lists+linux-mips@lfdr.de>; Sat, 24 Apr 2021 23:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhDXV5A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Apr 2021 17:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhDXV47 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Apr 2021 17:56:59 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC385C061574;
        Sat, 24 Apr 2021 14:56:20 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id y62so3796123pfg.4;
        Sat, 24 Apr 2021 14:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYDyVnxYEAToQiB2ckQ4jrI22QtejDeh2ep2F7nGXR8=;
        b=VHhhdYD7bdxBqCAo9+2i9irmu2wRHBjJxLx2LJZhwl6uYl+yP4+WwbMEuoazTFiqoJ
         zuzDULcR3WBM4JiNJyrcmyOV4hhiCAkTLHZuT74mMO4STmvZ5Me3f1ayF7BPFljqDj0K
         RUdfAyFDPuGipVGO9MG+rPwkfy1vSBxsESY0ARF/FkMmb/9pVDR6mMhEyslMvpQB45aR
         Ja043J/UgX66+X2oTPf8zTQTaw2H9ThzcFr1uNy/yv4wYF5WVh1SRTitXcsjbgZV4oPm
         mPfKbEcdHWHouzy954Oi5zOU+4DOpVoaakSg3HLhd1jsnUQSkOdI6HiPa2ceN1Zaz13X
         bviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pYDyVnxYEAToQiB2ckQ4jrI22QtejDeh2ep2F7nGXR8=;
        b=QytQoJOVsNB/60fxEitK1YvykxiN6HzSTjzhAHhqUmvMEg8ko4j7jrzBh0bWPRx70B
         M470DHWg4Em8q0CuaesnB3aGMFZe3USVjmPPxq3zk6KatUNxeeCW2ktrCmKc9w/zJ6UM
         2YYo7pZ0L2Nic0lvb5l7vO1gjVr7JlfOa66aPNmehWQ3x212i68q9gSg5p9lIeQfGsy7
         hm2JWh21O1LAN7FqxubcsQNK4yos6j0yn5xCADcQH9U1hi6YEDLmLUQ0XE3I8HhTwCyR
         ALKghS1tlLCtP1kIfRlyZy5D1I8/qiCpeyh4Yik0LLIhmJnWzW+E1vg1pW+nE8PcGHrz
         aslA==
X-Gm-Message-State: AOAM532JnXefyldbywj+Gg65KyCpSKJnQduT75BzcWvOJ1YR5K5dSss9
        iqCBtqp4gWAH8Qp75H1nv38=
X-Google-Smtp-Source: ABdhPJwX3PfSd06DKyHsilZtOjvTDmAKYfFx8gZeuPd0vaZhkCbJS+NdPb/P4dDkogFLxW6JkcTKug==
X-Received: by 2002:a63:7802:: with SMTP id t2mr2568670pgc.269.1619301380268;
        Sat, 24 Apr 2021 14:56:20 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id y10sm10344112pjt.22.2021.04.24.14.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 14:56:19 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiri Kosina <trivial@kernel.org>,
        Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] MIPS: kernel: proc: fix style and add CPU option reporting
Date:   Sat, 24 Apr 2021 14:56:15 -0700
Message-Id: <20210424215618.1017539-1-ilya.lipnitskiy@gmail.com>
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
  Options implemented   : tlb 4kex 4k_cache prefetch mcheck ejtag llsc
  pindexed_dcache userlocal vint perf_cntr_intr_bit cdmm perf

---
v2:
- Add missing options that were added since the original patch

Hauke Mehrtens (1):
  MIPS: kernel: proc: add CPU option reporting

Ilya Lipnitskiy (2):
  MIPS: kernel: proc: fix trivial style errors
  MIPS: kernel: proc: use seq_puts instead of seq_printf

 arch/mips/kernel/proc.c | 227 ++++++++++++++++++++++++++++++++--------
 1 file changed, 184 insertions(+), 43 deletions(-)

-- 
2.31.1

