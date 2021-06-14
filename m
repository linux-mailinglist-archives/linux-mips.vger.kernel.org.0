Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 599873A5FAD
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 12:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhFNKI0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 06:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbhFNKIY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 06:08:24 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7BFC061574
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 03:06:20 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id h11-20020a05600c350bb02901b59c28e8b4so12144241wmq.1
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 03:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZWPfS1j+ZHcYwLa9t4ZB3v5pOc9zAsYC3fSyZAd4gAE=;
        b=GcEj5ddWydc/sAv5he2N/y5bpXlWw5mx0y3eAO9ji5dLRl1Xuz0qKZ7T0mn32RS/nP
         cvcKgIcwBU0wI71qVnfWvGDHNyczVw49QI/ml1dp0agfc/xTpcysI8WoC9gzUyP1evnw
         xEXxjRDbzKGMnaeHFBT13PglA0quivN+A4ZFb1FrpWu4VDhPRIRmMZec+m13MUZHpQFt
         BMcFyZ9YUp+hbc/4iEIfv+lI3MRkvFEbx5NJBYClmiph5dYHq6+qKPPvKnjG+eDbEjUr
         76E++oYvIRT/wV5sVS+Vb/gzEZhcl1M4zuGuEmFdsdbdGGFvOz++IAwhyQJl5caOVOdE
         F/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZWPfS1j+ZHcYwLa9t4ZB3v5pOc9zAsYC3fSyZAd4gAE=;
        b=Vj9bVp5GlqgVULhNVlXRNJl2BAIwhJDABZDWolvfItQbC1JNizpCxscOJA6VkN8rpl
         gTtAc8pIcV/3od0pptgpS2QhGeJR1+D1UP8Rw+0F9qCunlmkot5OCFjY4jOgKAvsg5w+
         +NLDhJIlnSUwM2hC+MIhn8DQzlJNQW1+yhPlRBHL9X3z9vQ+2FUnRVTvEVdzhT28rhu2
         s+JN8TM6kbAzO7OBBPUG0EMU4tT0fSUJ6Q0HWYLXqESmX6aJX745GTAxDEm0sFjRSBNt
         cfCOd4GSDQoWU90PBU4B2uYPHqImP/Wmh6s/4R22RS0X64Hhnj4XDaB14IdrPmipknQK
         CZNQ==
X-Gm-Message-State: AOAM530MOBG3Ym/xxKgnDs2pLEGAiSwxuON+yIpZWr36mS9WSZyg1r5p
        ZxRD+07RZAhSeu6SGUBQo70yJhb/px0=
X-Google-Smtp-Source: ABdhPJzzcuILbxNELcXrkQEB9Y1VJl9xbp0YX6DYhYIpF2TAv5LsbxGNbfhW6dKyCOgz3kUMhc5CRg==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr15046481wmh.183.1623665179095;
        Mon, 14 Jun 2021 03:06:19 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id k5sm16476566wrv.85.2021.06.14.03.06.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 03:06:18 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: [PATCH v2 0/3] staging: mt7621-pci: define ralink PCI_IOBASE to avoid manually ranges parsing
Date:   Mon, 14 Jun 2021 12:06:14 +0200
Message-Id: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ralink MIPS platforms do not define PCI_IOBASE. This ends up in
pci generic apis not working with io resources when calls to function
'of_pci_range_to_resource' are performed because internall function
'pci_address_to_pio()' is call and it results in getting 'OF_BAD_ADDR'
as result. If we define PCI_IOBASE pci generic apis properly works for
ralink pci controllers. In this particular case, we can remove all
manually ranges and resource from driver code decresing LOC and being
more standard.

In the future, this is also useful for mips pci drivers which are still
using pci legacy apis. After having PCI_IOBASE defined, only defining 
'pci_address_to_pio' for PCI_LEGACY might be remaining to also make 
work 'pci-rt3883', 'pci-mt7620' among others. Sadly I don't have devices
to test that so I haven't write the code by myself.

Thanks in advance for your time.

Changes in v2:
  - Fix PATCH 1 indentation converting spaces into tabs.

Best regards,
     Sergio Paracuellos

Sergio Paracuellos (3):
  MIPS: ralink: Define PCI_IOBASE
  staging: mt7621-pci: remove 'mt7621_pci_parse_request_of_pci_ranges'
  staging: mt7621-dts: fix pci address for PCI memory range

 arch/mips/include/asm/mach-ralink/spaces.h |  10 +++
 drivers/staging/mt7621-dts/mt7621.dtsi     |   2 +-
 drivers/staging/mt7621-pci/pci-mt7621.c    | 100 ++++++---------------
 3 files changed, 38 insertions(+), 74 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-ralink/spaces.h

-- 
2.25.1

