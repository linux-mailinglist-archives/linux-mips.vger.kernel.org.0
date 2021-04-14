Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CA4B35EB4C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233169AbhDNDNs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbhDNDNk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:40 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CCA4C06138E;
        Tue, 13 Apr 2021 20:12:54 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w8so9314443pfn.9;
        Tue, 13 Apr 2021 20:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwYVR02YUIROEysawud1U32OvU6J+qaFmj26Z/Sycfc=;
        b=EIh5fxJtzBXfY56I/RXhnvQ2XGXaLd4A8j86jLEQ2fzZNm8uon7W57ZAtqOAUb7Xqk
         KJMZnokPYpDhp4vOQCdTKsVvEJjuQ0W8dlfEIeBQLnqcp0ixjSod2Q805vERHHKwWQmz
         4CJ9ys5O55IYaGMRXCBeOFZyYDw2yLkUsiM0PVa4Ak2NacSM1EnjuMEVcqrb+PCWLnMb
         JHrPCz59xTBvbWW/trCakxNnWMj9P95OwNP5S6vdQnT9nKcxLYmO50XUVajyDg5Gqkd/
         GF8hQ4L+56db/FbVXDI3WtFUXQvSrDdIiUNAPnTmzOIM8n3mEKfvWX8WcPcjLIsWHnXO
         UUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwYVR02YUIROEysawud1U32OvU6J+qaFmj26Z/Sycfc=;
        b=mewN/q8XsANagTqJtOmXYtd5jzAZDJvuAYQ2TUjQGqJ09av6vhw4OEEb2wJuVHSf8d
         7Z/185TxFMWzd7N2YtGkq1eH7KPJZX9noIGjruRIR+JFaL58IaZ3YrSj41aQ0HCAFKX/
         1r29IDZcTGIa6B6EKtxn2aGggAGdPXRjD+FFxw+EJVG6BYOR/8CbRqrvIs6YV58TSnf9
         GqwvRstljSSU6brP9BHhNswk2wX19fE7QqDP1jKx2OcubuVOAF3YGESdQO+8JnSUmPlC
         0+o5H4GQu4EJPiR6Cd22yilZBHD0gL1zk7yj0CI1A53RGYids1gRzC4R5wMMBi092jGC
         i3zw==
X-Gm-Message-State: AOAM531sPStAUb3KFGY3Ea30/T7Y9yTGvlbFUq8rdavfU7d2dltoILGb
        Hzyz/FGE3TMIFUVedhMhWGE=
X-Google-Smtp-Source: ABdhPJxDh6XsNuKoi7zTxG8Bw/lpTppmcML+JLevDNNMYpXf/IRxOJRKhm1jtlANGFXck7o9Y4aTGQ==
X-Received: by 2002:a63:1716:: with SMTP id x22mr35851862pgl.261.1618369973731;
        Tue, 13 Apr 2021 20:12:53 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:53 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH v2 5/8] MIPS: pci-legacy: stop using of_pci_range_to_resource
Date:   Tue, 13 Apr 2021 20:12:37 -0700
Message-Id: <20210414031240.313852-6-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
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

