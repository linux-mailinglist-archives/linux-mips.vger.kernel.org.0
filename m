Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE0021AF76
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 08:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgGJGc2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 10 Jul 2020 02:32:28 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:40620 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbgGJGc2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 10 Jul 2020 02:32:28 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 589A51FF13;
        Fri, 10 Jul 2020 06:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1594362747; bh=mKcRZRz0SOJEYqGXRTX5Rcjg9hStrtnxlG5utBmVrdg=;
        h=From:To:Cc:Subject:Date:From;
        b=b/lZnQyFE1L7HDw+cKy7OX6z/eFeKFaGpm1RK7vM2GpP3vcshS4KDW/4JGRvh8upL
         xCNI8u4vSLmFHipoNd+5WOXa5IGzpuJ6vIrIkR43LvQWLc3fKBXSyh4f79ZNffYLlE
         IJun9AO8nktgZdm/ThbuOYyU9rEepnd6ThkzkPTzzWXTnvQlUs/9EGhMb1mvnKzDSN
         Fx7wK5lgokP2S2qCglv3OmBHrwWCVM2Sh10d1eVWZHF+cKLDrGxdwj2Qi609pfRHIg
         KwgfYTyIKuh7ujoGTcvpPaiqJw66TFIRcNy0O/i+dTQnuvtXrJQLTkM7TBQu0Q5MfH
         BfvOQBCQkP1Rw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@pm.me>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: [RFC PATCH 0/3] MIPS KVM related clean-ups
Date:   Fri, 10 Jul 2020 14:30:15 +0800
Message-Id: <20200710063047.154611-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Retire some features that never worked in the real world.

Also I wonder if there are any actual user of TE KVM.
Will Huacai or Alexsander take care relevant code?

Thanks.

Jiaxun Yang (3):
  MIPS: Retire kvm paravirt
  MIPS: KVM: Limit Trap-and-Emulate to MIPS32R2 only
  MIPS: KVM: Remove outdated README

 arch/mips/Kbuild.platforms                |   1 -
 arch/mips/Kconfig                         |  20 +-
 arch/mips/configs/mips_paravirt_defconfig |  98 ------
 arch/mips/include/asm/Kbuild              |   1 +
 arch/mips/include/asm/kvm_para.h          | 115 -------
 arch/mips/include/uapi/asm/Kbuild         |   2 +
 arch/mips/include/uapi/asm/kvm_para.h     |   5 -
 arch/mips/kvm/00README.txt                |  31 --
 arch/mips/kvm/Kconfig                     |   3 +-
 arch/mips/paravirt/Kconfig                |   7 -
 arch/mips/paravirt/Makefile               |  14 -
 arch/mips/paravirt/Platform               |   7 -
 arch/mips/paravirt/paravirt-irq.c         | 368 ----------------------
 arch/mips/paravirt/paravirt-smp.c         | 145 ---------
 arch/mips/paravirt/serial.c               |  39 ---
 arch/mips/paravirt/setup.c                |  67 ----
 arch/mips/pci/Makefile                    |   1 -
 arch/mips/pci/pci-virtio-guest.c          | 131 --------
 18 files changed, 6 insertions(+), 1049 deletions(-)
 delete mode 100644 arch/mips/configs/mips_paravirt_defconfig
 delete mode 100644 arch/mips/include/asm/kvm_para.h
 delete mode 100644 arch/mips/include/uapi/asm/kvm_para.h
 delete mode 100644 arch/mips/kvm/00README.txt
 delete mode 100644 arch/mips/paravirt/Kconfig
 delete mode 100644 arch/mips/paravirt/Makefile
 delete mode 100644 arch/mips/paravirt/Platform
 delete mode 100644 arch/mips/paravirt/paravirt-irq.c
 delete mode 100644 arch/mips/paravirt/paravirt-smp.c
 delete mode 100644 arch/mips/paravirt/serial.c
 delete mode 100644 arch/mips/paravirt/setup.c
 delete mode 100644 arch/mips/pci/pci-virtio-guest.c

-- 
2.27.0

