Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B4535D7ED
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344994AbhDMGWa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344974AbhDMGW2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:28 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBA59C061574;
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id w10so11202487pgh.5;
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwYVR02YUIROEysawud1U32OvU6J+qaFmj26Z/Sycfc=;
        b=X+bDAUy+00SdlM+CAyMblhT7maNTy8m35exxYTZBeyg+ctbq3tevcvC6SaIKIdCC5S
         kRuCFSiQJtGXRIiv8Cmxnyhf7PHVXdkVZ0GPU08BW7mI5XYuU9pLE2cBG3QCtK09JOCW
         rmiT+qzf+hvDwvWPXWrg90LPAuZ8Kz3tL6uoll32Ft4q0ywft7xmb+4Tss7QUUcs7IKd
         hazgPXiQbmbMbwWwPi/rWlpfHq/ddXexaxGe+1SekicOqWNzX5mRFl8E1lrPeV0gJVSs
         EH60T3AIaLX+8s9RdUQDI+bU560Y/iLyypkh9N32oBJhv5dJkH+Bsk0Rlwdk3XKkuEdf
         xfVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwYVR02YUIROEysawud1U32OvU6J+qaFmj26Z/Sycfc=;
        b=l1Dx+CHVAJ+aCEal2SEKv35oenZ+oJfVNRIOfBLV/gJgTcvJtQYWRyAiCWXeni5V2a
         upAxeBJkPdkR+rgYRZAvcM8EByx+VUzV1siV1fi6tv1BIVj1K/2B47qtBTxPW/OxmvuW
         /cCQnWcaal7ZTJjncQ5tsboUHKQqkALMRQF2+hZxdsPclGSmHJxOsxrhzKrb+S25yvN8
         6EMYkBybPIFSs9XwRxJGdvFZf8N5vdtQs+eVDVXGpeigAowuY9cOZwYU0MbfTzWuwK+B
         5GSTGfUusik+BR4KIGUyq+sBWiCIit0HCTYv2X92ICDKFCqLyc8y3K5rxacgkWtsg2yI
         aKgA==
X-Gm-Message-State: AOAM530i55M4sWx/nIV9GsRjW4dbTHJRcVLmkV+NYIqUxBZal+oMvWGK
        PIm0jIM+IkROJHhaK2W7drU=
X-Google-Smtp-Source: ABdhPJw/1LOlptr8bx+KqL9frx8H53syWy5r+fw7Bdi6JJIffPm4LqrAE2ddVvm4Yeg3JUR320B48A==
X-Received: by 2002:a62:754c:0:b029:242:22d1:58af with SMTP id q73-20020a62754c0000b029024222d158afmr27274148pfc.11.1618294928535;
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 5/8] MIPS: pci-legacy: stop using of_pci_range_to_resource
Date:   Mon, 12 Apr 2021 23:21:43 -0700
Message-Id: <20210413062146.389690-6-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mirror commit aeba3731b150 ("powerpc/pci: Fix IO space breakage after
of_pci_range_to_resource() change").

Most MIPS platforms do not define PCI_IOBASE, nor implement
pci_address_to_pio(). Moreover, IO_SPACE_LIMIT is 0xffff for most MIPS
platforms. of_pci_range_to_resource passes the _start address_ of the IO
range into pci_address_to_pio, which then checks it against
IO_SPACE_LIMIT and fails, because for MIPS platforms that use
pci-legacy (pci-lantiq, pci-rt3883, pci-mt7620), IO ranges start much
higher than 0xffff.

In fact, pci-mt7621 in staging already works around this problem, see
commit 09dd629eeabb ("staging: mt7621-pci: fix io space and properly set
resource limits")

So just stop using of_pci_range_to_resource, which does not work for
MIPS.

Fixes PCI errors like:
  pci_bus 0000:00: root bus resource [io  0xffffffff]

Fixes: 0b0b0893d49b ("of/pci: Fix the conversion of IO ranges into IO resources")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
---
 arch/mips/pci/pci-legacy.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index 39052de915f3..3a909194284a 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -166,8 +166,13 @@ void pci_load_of_ranges(struct pci_controller *hose, struct device_node *node)
 			res = hose->mem_resource;
 			break;
 		}
-		if (res != NULL)
-			of_pci_range_to_resource(&range, node, res);
+		if (res != NULL) {
+			res->name = node->full_name;
+			res->flags = range.flags;
+			res->start = range.cpu_addr;
+			res->end = range.cpu_addr + range.size - 1;
+			res->parent = res->child = res->sibling = NULL;
+		}
 	}
 }
 
-- 
2.31.1

