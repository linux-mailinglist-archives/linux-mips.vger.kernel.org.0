Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62624DCCF
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbfFTVj0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:39:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40287 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfFTVjZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 17:39:25 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so4488232wre.7
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2019 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Xk4hez7/mS6XBmLs1KNEHdoO4X2B42iD/8NGVo28lA=;
        b=gGTfeNjDIzNM9k3EwYZY6jKw4puyD1fr5zWze0YHHgUca/2hrB/y6elMyC92KH4TvW
         NTGcGnw9BFUn9QTmeR7DHiRgjQtDI2hudJdUqupxZkXacxHxVRpOpmuu/RCun8zHKqYC
         BopsCbCb/09hHSNpJswoPlIkstAo8KnP5YVSCRZky6VQfqowRCvezoNOKoYVNL0htj1n
         RaQTeRMro+lc1lpxwtCR0IDT1f0ht7OwVPaARe6EfST1JXTU28qiWvMrpYbZ0jBgsWa8
         g8GST5dWsxAD9678nLdun7n/R/g8UKi4I4egm2w0EcrZg3dcn6/wDkCe9XTTLtC1xTm1
         H0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7Xk4hez7/mS6XBmLs1KNEHdoO4X2B42iD/8NGVo28lA=;
        b=ib/hDSRaimrbrtWh1Eia3A5vERNn00KuTt9bwFnuGsh6a+5fsApF7TjB0VFcKg5/sq
         beBjEfuVDaEEZafiWuFk5evFXSFY6BUMb6sYjFDoGlN3B2GvWKUvfqAqnFpf0D+DTOHT
         rhgJoHlEpx+RGWC7pxvc+9PfST/7r6YSfS66nR0jsQOwtK6NEl8y8UsMMFld9xpeFEMm
         G0v+Tj5LTRYKsZIYCj/SkwwYDTIFvt7M3fLHut++2pHL6AvoKYriue2KC9KQmW/v4q/M
         ZBhBHrKIWVXQioJbL42LneXDlLM7TfMoYl9ehZlS/ivQG+tXzcAnVgHxH6w5UdAX5h5g
         1Z4g==
X-Gm-Message-State: APjAAAX0RRPahYsvffeeicNW4YtqTKUjB+J3A8ka9vVh6zqHbCVKBCkH
        aL8qAg2vT5aBpjj0h67BqP8=
X-Google-Smtp-Source: APXvYqzw82nOMGtzkv5+JVz+jTNPz4eel+zr0vy9Eb+Uy7VeVKoHeeMqLq95b5s/XHaRq6eBkY2vYQ==
X-Received: by 2002:a5d:5491:: with SMTP id h17mr366714wrv.46.1561066763893;
        Thu, 20 Jun 2019 14:39:23 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-ecaa-d74f-d492-3738.ip6.tmcz.cz. [2001:1ae9:ff1:f191:ecaa:d74f:d492:3738])
        by smtp.gmail.com with ESMTPSA id j4sm575426wrx.57.2019.06.20.14.39.22
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 14:39:23 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v2 0/7] MIPS: lantiq: irq: Various fixes, add SMP support
Date:   Thu, 20 Jun 2019 23:39:32 +0200
Message-Id: <cover.1561065843.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

Hi,

While hacking with my modem in openwrt I've found in the lantiq vrx268 SoC
there is only a support for the processes SMP and not for interrupt
routing. After some looking into vendors released source codes (probably
intel UGW) and by observing SoC's memory map I've found out there is
a second interrupt controller (ICU) for the second VPE. The last patch of
this series adds a support for it. The code is different from intel UGW's
set affinity function, where the interrupt line gets enabled (switched)
to the second ICU. Instead only the cpumask gets changed in my set affinity.
The change will be written into the hardware after the next irq enable call.
This was changed because of stability reasons in the high irq load of
the SoC.

The first part of the series are more or less cosmetic changes of long
names, different types and few fixed warnings from checkpatch. There is
a fix in part 5, where I've found the missing bitfield clear before ORing
with a new value.

The SMP in part 7 changes devicetree definition for a register regions
of the ICU. Previously, there was a region for a single IM (a mask/unmask/
enable/... set for 32 interrupts). Now it is the whole ICU. It match more
the hardware layout. There is no compatibility issue in vanilla, only
openwrt was affected by these devicetrees.

Also in the UGW's ltq_enable_irq(), there was a status bit reset before
the actual IRQ line enable. It was marked as "Bug fix for fake interrupt".
The code seems to work without it (vanilla and new SMP), but I've made
an assert if this bit is set before the actual enable. The assert reported
these IRQ sources:

	22:00004000     spi_rx  (only when SPI is accessed)
	63:00800000     mei_cpe (permanent 1s)
	112:00000100    asc_tx

But the code seems to run anyway I didn't include the status bit reset part.

The SMP affinity update is done every IRQ enable, where it extract the first
valid VPE from affinity cpumask. This is standard in the kernel.

The code was tested in nosmp configuration on TPLink W9980B in openwrt tree
(patched kernel v4.14). The lantiq devices other than vrx268 were not
tested.

Discussion on openwrt related parts for lantiq ICU SMP is here (devicetrees,
things not in the vanilla kernel, RFC versions of the patch):
https://patchwork.ozlabs.org/patch/1100832/

Changes since v1:
 * Added a define for IM size
 * Changed ltq_icu_membase array size to NR_CPUS so for_each_possible_cpu()
   will not overflow
 * Removed affinity auto rotation (can be add later from v1 if required)
 * Commit messages wordings

Petr Cvek (7):
  MIPS: lantiq: Move macro directly to iomem function
  MIPS: lantiq: Change variables to the same type as the source
  MIPS: lantiq: Fix attributes of of_device_id structure
  MIPS: lantiq: Remove unused macros
  MIPS: lantiq: Fix bitfield masking
  MIPS: lantiq: Shorten register names, remove unused macros
  MIPS: lantiq: Add SMP support for lantiq interrupt controller

 arch/mips/lantiq/irq.c | 177 +++++++++++++++++++++++++++++------------
 1 file changed, 126 insertions(+), 51 deletions(-)

-- 
2.21.0

