Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F73D21AA84
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgGIWb1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgGIWb0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:31:26 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B327C08C5CE;
        Thu,  9 Jul 2020 15:31:26 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l17so3730073wmj.0;
        Thu, 09 Jul 2020 15:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=1ZXHHJyT4ZWtPPZc+bM/HKDR03mHSzkUIiQvXIJuh1o=;
        b=t2NUbC/F7fOEsFIbvEwoVqdBw7F0qnNn3BG/fu08kTJXPNrqeqm26mMRqlsvo9Oluj
         CSW+lsriyYwfgl9llQa6RQA1LBUmsJ7sBD5wgYgH8BS4UOJpWZ81/kbU2enpH2UL3LFh
         Holg4gYg/fEv0ZU9c48UFTpbPMLjiwHKVxpYsjheTU+2c6xKp7FOLYEQ+Ub3O7XT1HJL
         XzmqoJ4if2WRn8VBWeZdVk+0fq8nQxW3Te4Uqp+3w66EZaQdW0Tvl01Iwb1erAie3ib6
         lFBMcntOva/OaP/1Ahfza8o+p+a+G2p2traFPrCyEqELB626fm+dJyJrA0nuUynL9na2
         K5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=1ZXHHJyT4ZWtPPZc+bM/HKDR03mHSzkUIiQvXIJuh1o=;
        b=rzxK+ouNJOoNtuP4t4m0WGj999ZsrfCeDpMZGsKvqaLW2VAUVyiVskPXeWO5i0oAgb
         j58gchgWqF2sZaxY5luf2/3CLZsbJIMuvDkOQCYb2awH0J2wYM3gEFjPutsplMZMqjT8
         mnJ4lVWUd5nG8F6a8VVRRZA3WN4GzGtPRyH6R8ydjr8WGjFyJtPmRgtSM4vlNhbGUpT9
         l0JS95WreIJhQExK44T9jguBYd4BA0WMABlNmhC9iDE4X/S+zACtl3KFn8G/o8DZV0jw
         MwA9DMg3FVNko8tRl2HIGKvqfwnHhhtcrJUVzeZl+GgsOsKNJKIFbXbGA0+iRrnlXqpM
         640Q==
X-Gm-Message-State: AOAM530pbuFp/KP+9E6FuG0vwL+FAz+CsLc5LPFe/XueO8o/UGwbRcuM
        yhGmLD/bE3/GnZuopwMD0CfiesNt
X-Google-Smtp-Source: ABdhPJyQMem+AdS3FQG91slu/e8CNlip8v9odOwgRMv7PyWemUE9qtN8mi7LNpKFSPiaZ03uwOzPmg==
X-Received: by 2002:a1c:e910:: with SMTP id q16mr2058462wmc.188.1594333884718;
        Thu, 09 Jul 2020 15:31:24 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10sm7375267wru.4.2020.07.09.15.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:31:24 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE)
Subject: [PATCH 0/6] irqchip: Broadcom STB interrupt controller updates
Date:   Thu,  9 Jul 2020 15:30:10 -0700
Message-Id: <20200709223016.989-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Marc,

This patch series contains a number of updates for Broadcom STB L2
interrupt controllers to enable them as wake-up interrupt controllers,
and add missing compatible strings that should be matched.

Thanks!

Florian Fainelli (3):
  dt-bindings: interrupt-controller: Document Broadcom STB HIF L2
  dt-bindings: interrupt-controller: Document UPG auxiliary L2
  irqchip/brcmstb-l2: Match UPG_AUX_AON_INTR2 compatible

Justin Chen (2):
  irqchip/bcm7120-l2: Set controller as wake-up source
  irqchip/brcmstb-l2: Set controller as wake-up source

Kamal Dasu (1):
  irqchip/brcmstb-l2: Match HIF_SPI_INTR2 compatible

 .../bindings/interrupt-controller/brcm,l2-intc.txt        | 5 ++++-
 drivers/irqchip/irq-bcm7120-l2.c                          | 8 +++++---
 drivers/irqchip/irq-brcmstb-l2.c                          | 5 +++++
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.17.1

