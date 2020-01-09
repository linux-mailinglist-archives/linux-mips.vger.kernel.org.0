Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C24EC135942
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 13:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730955AbgAIMeJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 07:34:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:37970 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730950AbgAIMeJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 07:34:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 50FEFB2204;
        Thu,  9 Jan 2020 12:34:03 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] Cleanup SGI-IP27 and prepare for SGI-IP35 support
Date:   Thu,  9 Jan 2020 13:33:37 +0100
Message-Id: <20200109123353.5656-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGI-IP35 alias SN1 is very similair to SGI-IP27 alias SN0, so most of the
IP27 code could also be used for IP35. The differences will mostly be in
header files, which are selected by CONFIG option. This series cleans up
IP27 code/headers and prepares them for IP35 integration.

Thomas Bogendoerfer (14):
  MIPS: SGI-IP27: use nodemask instead of cpumask
  MIPS: SGI-IP27: use cpu physid already present while scanning for CPUs
  MIPS: SGI-IP27: use asm/sn/agent.h for including HUB related stuff
  MIPS: SGI-IP27: get rid of asm/sn/sn0/ip27.h
  MIPS: SGI-IP27: move IP27 specific macro to IP27 specific header file
  MIPS: SGI-IP27: Move get_nasid() to a IP27 specific file
  MIPS: SGI-IP27: Split kldir.h into generic SN and IP27 parts
  MIPS: SGI-IP27: Use union instead of typedef
  MIPS: SGI-IP27: Use structs for decoding error status registers
  MIPS: SGI-IP27: Use specific get_region_shift
  MIPS: SGI-IP27: Move all shared IP27 declarations to ip27-common.h
  MIPS: SGI-IP27: Only reserve interrupts used in Linux
  MIPS: SGI-IP27: Store cpu speed when scanning for CPUs and use it
    later
  MIPS: SGI-IP27: No need for slice_map

 .../include/asm/mach-ip27/kernel-entry-init.h |  12 +-
 arch/mips/include/asm/mach-ip27/mmzone.h      |   4 +-
 arch/mips/include/asm/mach-ip27/topology.h    |   2 +-
 arch/mips/include/asm/sn/arch.h               |   3 -
 arch/mips/include/asm/sn/hub.h                |  17 --
 arch/mips/include/asm/sn/intr.h               |  17 --
 arch/mips/include/asm/sn/klconfig.h           |   4 -
 arch/mips/include/asm/sn/kldir.h              | 193 +-----------------
 arch/mips/include/asm/sn/sn0/hub.h            |  22 ++
 arch/mips/include/asm/sn/sn0/hubni.h          |   8 +
 arch/mips/include/asm/sn/sn0/ip27.h           |  85 --------
 arch/mips/include/asm/sn/sn0/kldir.h          | 186 +++++++++++++++++
 arch/mips/include/asm/sn/sn_private.h         |  19 --
 arch/mips/include/asm/sn/types.h              |   4 +
 arch/mips/pci/pci-ip27.c                      |   2 +-
 arch/mips/sgi-ip27/ip27-berr.c                |  40 ++--
 arch/mips/sgi-ip27/ip27-common.h              |  12 +-
 arch/mips/sgi-ip27/ip27-console.c             |   5 +-
 arch/mips/sgi-ip27/ip27-hubio.c               |   8 +-
 arch/mips/sgi-ip27/ip27-init.c                |  25 +--
 arch/mips/sgi-ip27/ip27-irq.c                 |   5 +-
 arch/mips/sgi-ip27/ip27-klconfig.c            |  51 -----
 arch/mips/sgi-ip27/ip27-klnuma.c              |  16 +-
 arch/mips/sgi-ip27/ip27-memory.c              |  39 ++--
 arch/mips/sgi-ip27/ip27-nmi.c                 |   5 +-
 arch/mips/sgi-ip27/ip27-reset.c               |   2 +-
 arch/mips/sgi-ip27/ip27-smp.c                 |  33 +--
 arch/mips/sgi-ip27/ip27-timer.c               |  28 +--
 arch/mips/sgi-ip27/ip27-xtalk.c               |   1 -
 29 files changed, 315 insertions(+), 533 deletions(-)
 delete mode 100644 arch/mips/include/asm/sn/hub.h
 delete mode 100644 arch/mips/include/asm/sn/sn0/ip27.h
 create mode 100644 arch/mips/include/asm/sn/sn0/kldir.h
 delete mode 100644 arch/mips/include/asm/sn/sn_private.h

-- 
2.24.1

