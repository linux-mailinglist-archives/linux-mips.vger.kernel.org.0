Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED45B3A203
	for <lists+linux-mips@lfdr.de>; Sat,  8 Jun 2019 22:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfFHUsc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Jun 2019 16:48:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44613 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727364AbfFHUsb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Jun 2019 16:48:31 -0400
Received: by mail-wr1-f68.google.com with SMTP id b17so5394654wrq.11
        for <linux-mips@vger.kernel.org>; Sat, 08 Jun 2019 13:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfoN89ez9eO3wraKc+6QrYXVGhd9S9Rz3z9Gsd3RcLI=;
        b=lZX5LRqp3l9rxcNCzYiysTttfDxrC4DPoyyMLRgQIFWgQmSnjL/OTleEjItgrvcLPP
         ru5612Ch3PtctqkpiiiId/nNGMR6MvSzi+U9v0nfK1Qb7Z0uAA1UuBT8gti2hL3k2auJ
         rHiaFsQgUYsp4LxaVBD0iZQUI7rVreR3Zvd5uD4KuLKPUPL+LMFgCUNaF/Y2S1b2t34f
         mh+TXpmebMEGgr+chumgrjs0FI4Ygobu+JxGlohzcouhj8fMYP01gEMb0HakjfOQ5cWV
         HoWhO5M511GVjfX8kt258gS3lCzfRskhKj0v2azwGEk8x7+l1DGt3Qay20UnKq7dDA54
         VeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YfoN89ez9eO3wraKc+6QrYXVGhd9S9Rz3z9Gsd3RcLI=;
        b=BMSwpoKrGBRdWkfcPYgcKa3bMWAN6tOPKJtaojs0rritvWADIkBrPVOCoO/lvwbH6Q
         OqQ0fLYQZ7goJIBkvGFIenjQp47gFhsSgaLim7CTQX+Jrq3wnxe1MjjDFSpQxsEAU9Rh
         vLPVUFVKV0aGrvUciMhvQzRwbwpdRKAbxuiZcHV8uGtwcR1bPXOOd8fJDpgudn4JxI4T
         JLew1ZUZA78s6a7TQiiXPJ0jqUC3FBQxZNqDXDW5QckFaxQVCd4TIyEVMijnfcgmJxzV
         bWj/FFOIxJbzfeThri6lIPbc8GPc4La2hvbepkc3ulqdy/Dr/Eqo4xCtzcJq5I1OwGRB
         ytwQ==
X-Gm-Message-State: APjAAAVXqbCKNhsOO55gwC/c9FAiB6dcuvbcUTBANIz3Dt3b47v0PzRD
        934JiSApgTcmnlhdRu4K7L4=
X-Google-Smtp-Source: APXvYqzUU3xrEON5FVBY9IwHcYbFx1/MTlmt73Mpeud0lcvjQoRoqsj/fnIkDFDAYt3pRdEuOUhrKw==
X-Received: by 2002:a5d:534b:: with SMTP id t11mr622183wrv.61.1560026909963;
        Sat, 08 Jun 2019 13:48:29 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-359a-8d64-e90a-f663.ip6.tmcz.cz. [2001:1ae9:ff1:f191:359a:8d64:e90a:f663])
        by smtp.gmail.com with ESMTPSA id f204sm4986394wme.18.2019.06.08.13.48.28
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 08 Jun 2019 13:48:29 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v1 0/7] MIPS: lantiq: irq: Various fixes, add SMP support
Date:   Sat,  8 Jun 2019 22:48:03 +0200
Message-Id: <cover.1560024463.git.petrcvekcz@gmail.com>
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
a second interrupt controller (ICU) for the second VPE. The last patch
of this series adds support for it. The code is different from intel UGW's
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

The SMP has an algorithm taken from MIPS loongson64's ht_irqdispatch().
Every IRQ enable the line get routed to the other VPE (constrained by cpumask
set in the irq_set_affinity function). This can be effectivelly disabled
in the userspace by constraining the cpumask set to a single VPE or by
commenting out the AUTO_AFFINITY_ROTATION macro definition (the code will
then prefer the first VPE from the cpumask). The default affinity during
the boot is the first VPE.

The code was tested in nosmp configuration on TPLink W9980B in openwrt tree
(patched kernel v4.14). The lantiq devices other than vrx268 were not
tested.

Discussion on openwrt related parts for lantiq ICU SMP is here (devicetrees,
things not in the vanilla kernel, RFC versions of the patch):
https://patchwork.ozlabs.org/patch/1100832/

Petr Cvek (7):
  MIPS: lantiq: Move macro directly to iomem function
  MIPS: lantiq: Change variables to the same type as the source
  MIPS: lantiq: Fix attributes of of_device_id structure
  MIPS: lantiq: Remove unused macros
  MIPS: lantiq: Fix bitfield masking
  MIPS: lantiq: Shorten register names, remove unused macros
  MIPS: lantiq: Add SMP support for lantiq interrupt controller

 arch/mips/lantiq/irq.c | 202 ++++++++++++++++++++++++++++++-----------
 1 file changed, 151 insertions(+), 51 deletions(-)

-- 
2.21.0

