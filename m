Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F5C395A8B
	for <lists+linux-mips@lfdr.de>; Mon, 31 May 2021 14:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhEaMcu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 May 2021 08:32:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:38372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231450AbhEaMct (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 May 2021 08:32:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8BC6B6124B;
        Mon, 31 May 2021 12:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622464269;
        bh=E3NY0Wohhst6B5rpjC28lQS7joUqhV9RJrr3gZggAGg=;
        h=From:To:Cc:Subject:Date:From;
        b=F9bNs/FYGLl1aRdwAhR61z29+Kzxoye4ebjI0n9W6ClGUlcg06NzsIRMpIjJ8d32G
         MwiCCmrEWR/H+mZnEtNQ13kKEcaQDN+fODqUwWZ1UEczzZBGXKst3/6TMqIHKVKNxB
         LOM1ku9cXUGxQOBTy+aabtQVJQITGUH5LJog20AFwD8nAetKqtTHflac1cPuxe6lgc
         0EO8w9ty7Q9jQ8VHcIM4ZL0aybLJn2JvW0A3IKb7pR7pu7Xo3cBrvmjwfDcFZsmwWd
         xz46CQW3zSe0lNFUGyMbe7/xhMtIt3bvvqYIepHdiEemQ0E2Jpi9dsiRxLFWWdxbyb
         k35L5I2Nw9V9w==
From:   Mike Rapoport <rppt@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, linux-s390@vger.kernel.org
Subject: [RFC/RFT PATCH 0/5] consolidate "System RAM" resources setup
Date:   Mon, 31 May 2021 15:29:54 +0300
Message-Id: <20210531122959.23499-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

There are several architectures that use very similar code for setup if
"System RAM" resources under iomem_resource tree and requesting memory
resources corresponding to the kernel code, data etc.

The flow for resources setup iterates over memory regions registered in
memblock, adds a resource for each region as "System RAM" and than
registers the areas used by the kernel image and, optionally, the crash
kernel area, as children of the "System RAM" resources.

The notable differences are:
* arm/arm64 use [__text, __init_begin] range for kernel code resource and
  [_sdata, _end] range for kernel data, while most other architectures use
  more fine grained ranges.
* arm has "System RAM (boot alias)" that do not seem useful for any other
  architecture
* arm64 has special treatment for NOMAP areas and all the areas reserved in
  memblock
* s390 has crashk_res in parallel with the "System RAM" resource, but it
  seems it was required some time ago but no longer actually needed.

These patches use s390 implementation of the resource setup as the basis
and then switch MIPS, arm and arm64 to use it with modifications required
to support each architecture. 

The generic code loops over all memblock.memory regions, adds the NOMAP
regions as "reserved" iomem resources and "normal" regions as "System RAM"
iomem resrouces, reserves the areas occupied by the kernel code, rodata,
data and bss, if there is crash kernel resource it is also reserved.

In addition, if an architectures selects
CONFIG_ARCH_WANT_RESERVE_MEMBLOCK_RESERVED_REGIONS (bad name, but I could
not find a better one) the memblock.reserved regions are registered as
"reserved" resources in iomem_resource.

It would be also possible to convert other architectures (e.g, RISC-V and
sh) to use the common infrastructure.

Mike Rapoport (5):
  s390: make crashk_res resource a child of "System RAM"
  memblock: introduce generic memblock_setup_resources()
  arm: switch to generic memblock_setup_resources()
  MIPS: switch to generic memblock_setup_resources
  arm64: switch to generic memblock_setup_resources()

 arch/Kconfig              |   7 ++
 arch/arm/kernel/setup.c   |  37 +----------
 arch/arm64/Kconfig        |   1 +
 arch/arm64/kernel/setup.c | 101 +----------------------------
 arch/mips/kernel/setup.c  |  78 ++--------------------
 arch/s390/kernel/setup.c  |  86 +------------------------
 include/linux/memblock.h  |   2 +
 mm/memblock.c             | 132 ++++++++++++++++++++++++++++++++++++++
 8 files changed, 151 insertions(+), 293 deletions(-)


base-commit: c4681547bcce777daf576925a966ffa824edd09d
-- 
2.28.0

