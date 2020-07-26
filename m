Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07F7122DBA5
	for <lists+linux-mips@lfdr.de>; Sun, 26 Jul 2020 06:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgGZEPv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Jul 2020 00:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725298AbgGZEPv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Jul 2020 00:15:51 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BADC0619D2;
        Sat, 25 Jul 2020 21:15:51 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d188so1278620pfd.2;
        Sat, 25 Jul 2020 21:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=7AQ10n8WxOIRajF8SVvmlmOSQuEAYpiIBCnqGBfxk6E=;
        b=j85B1CguTHpxjXAI1smMfbIaNRwR/EXWKRDqBrlIa9CsHVZaPg+4msxv8B3v1tUVOQ
         w+Jz3gFroj/cU1xFWbjhs4paPEbW70ajWxjbF5cEKi9Vhml1ANdLUq/NSXH1oBxmPize
         X9HDBrXgEeLxxSKf4auKXoQenN9fkRULf6bkMrHhfOPc+M4pX/FJWO/QncIrR1m6sJwx
         JzVn4xhB+GwjZ8HWBVoOrvFOkRfs5LkZko3YaYYskMohriwcgRFVH2gzrfhiAX3LTn8/
         8QElaPIB3xXksryRjo4CydYDq7y8a8flPFS+6ZMn1mSFOnNbrk6IDNL3AhNrIFyPuq78
         UrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7AQ10n8WxOIRajF8SVvmlmOSQuEAYpiIBCnqGBfxk6E=;
        b=cSOyBf55nATxX70dS0wSMvtEsUY2S8+amEci8KCuM+FTYqZJBVL/6JFfA+cExCExXf
         Z/uiyNjFeSIdQ0p3lu/nEykCa2GLjDZRXnl7aDchCGa+0wHrV+iPWHqGiobTrInDHdqK
         Cwq3wK7sOUbm1t+tetZpEMwwQEHDGFNIHtTWwFAwwwE82isY+zCamahbD4ci9PeJbBTO
         Jsysf4TxBzhJObb/BOLAh5uUx/zetovN6iaZmNJHKdPbffQxWm5KqrIXPezbxTah1fTw
         agQvkXHNzCLxL4gkbe1KWROJ57UMnAiJ1Ang0MGkGPjWZyGNpui3+1EgfApWpjoxIbF5
         njCg==
X-Gm-Message-State: AOAM5312qLR/gKqkeL2rvUjUNc5KiQo5of374STKCge8Q8QKmgzHJyEp
        QcuKzVsouuDVJRonFTHB4CU=
X-Google-Smtp-Source: ABdhPJyxF6gop/TfKeYzxoiw5llAEEmd3bwiMtmWPnFDuAKNWN2ZWlOkk0l51+aK5yYbu1HpAUibMQ==
X-Received: by 2002:a63:8b42:: with SMTP id j63mr14906024pge.131.1595736950553;
        Sat, 25 Jul 2020 21:15:50 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id d16sm10725568pfo.156.2020.07.25.21.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 21:15:49 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org (open list:BROADCOM BCM47XX MIPS
        ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/2] firmware: bcm47xx_sprom: Fix -Wmissing-prototypes warnings
Date:   Sat, 25 Jul 2020 21:15:19 -0700
Message-Id: <20200726041521.5398-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

This patch series fixes W=1 -Wmissing-prototypes warnings for the
bcm47xx_sprom.c firmware file.

Thanks!

Florian Fainelli (2):
  firmware: bcm47xx_sprom: Fix -Wmissing-prototypes warnings
  MIPS: BCM47xx: Include bcm47xx_sprom.h

 arch/mips/include/asm/mach-bcm47xx/bcm47xx.h |  4 +---
 drivers/firmware/broadcom/bcm47xx_sprom.c    |  1 +
 include/linux/bcm47xx_sprom.h                | 10 ++++++++++
 3 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.17.1

