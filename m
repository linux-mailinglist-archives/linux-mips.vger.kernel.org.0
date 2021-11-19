Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890DD456B34
	for <lists+linux-mips@lfdr.de>; Fri, 19 Nov 2021 09:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhKSIDO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Nov 2021 03:03:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhKSIDN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Nov 2021 03:03:13 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 892CDC061574;
        Fri, 19 Nov 2021 00:00:12 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so8127884pjb.5;
        Fri, 19 Nov 2021 00:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
        b=Piq1nJJ8yUxBmd7q2OqqhZ04o/Z/X8wPRFgtRzc8HIEZny/6x/zgzkJJLIzrhAa0e4
         +m/UkOZhCq/qceHyHLy6mrK1/J5X45CiYNHNz4LLNboBkuPFruTDbeHDANZN9gaBX4zE
         BOB6y13oTjWi0vF7xJd+4tsqCwxEUlAfE+LU/vlE+4bU80+Ekh940qsjxgz9xnCUr3Qi
         VmT32x+yuH4lxl7Rhd+Oz9STONwHrFxbc04IdCvrFJWCSYvRIOjZFaZysr2qzarcVla2
         /GqHkfvvxM0BK3O8jT5cWAzBmRaFUrfRWcGlu9hx9ier0QPDw7te7Gc5F9LDdGi5XMS6
         NbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
        b=lOYxKAUMxrenvnNDiLzp59p8WEkf9cmfvFD6MmPaWestxJDLim2PsJ2kgRU8C2ZpyI
         LxFiEiA6LrnRynRgFExLxONgjgf21otzq6hTckkX8w4Y5ZlylyatX2FgqrgtVBQaJlpX
         zrNVcZxzjgihvug7bXtXnfWOv0zsdusAcrxL1kI5EFbjwlWnhdoVLztlia2iS/j3n7/J
         MjQABYJ/kZYLBH3Hq/CCY1JgwwMRo7Be9HVR4dOLNfGXuR3YRpwGE5pG7JCdCtujLRbq
         LS5Qum45qp6MnvxmCPSkpZMg53QhvnUuqkVrM1a2mm9Uv7gxZhSW9kANICEeHIgtR+Kx
         yGBA==
X-Gm-Message-State: AOAM531zoYjR7uoie1MD9A9FHS7jmPNz66Su0c2/Zzff3qVo0/LAG4zn
        KlMLeU5k/39IZj5MOu2wLaE=
X-Google-Smtp-Source: ABdhPJyEWl+rgTyJQilluTm65FmkmgWn+LtcD21UQsyfWBcLVUYOXziJspjYdNkg7WaRzd0koE7wlA==
X-Received: by 2002:a17:90a:8815:: with SMTP id s21mr2424180pjn.82.1637308812121;
        Fri, 19 Nov 2021 00:00:12 -0800 (PST)
Received: from localhost.localdomain ([103.99.179.247])
        by smtp.gmail.com with ESMTPSA id o6sm1791259pfh.70.2021.11.18.23.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 00:00:11 -0800 (PST)
From:   Calvin Zhang <calvinzhang.cool@gmail.com>
To:     Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Jonas Bonn <jonas@southpole.se>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stafford Horne <shorne@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Vladimir Isaev <isaev@synopsys.com>,
        Calvin Zhang <calvinzhang.cool@gmail.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marc Zyngier <maz@kernel.org>,
        David Brazdil <dbrazdil@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        Jinyang He <hejinyang@loongson.cn>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Andreas Oetken <andreas.oetken@siemens.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Zhang Yunkai <zhang.yunkai@zte.com.cn>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Markus Elfring <elfring@users.sourceforge.net>,
        Ganesh Goudar <ganeshgr@linux.ibm.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Atish Patra <atish.patra@wdc.com>,
        Anup Patel <anup.patel@wdc.com>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Vitaly Wool <vitaly.wool@konsulko.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        Guo Ren <guoren@linux.alibaba.com>,
        Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauri Sandberg <sandberg@mailfence.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-mips@vger.kernel.org,
        openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] of: remove reserved regions count restriction
Date:   Fri, 19 Nov 2021 15:58:17 +0800
Message-Id: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The count of reserved regions in /reserved-memory was limited because
the struct reserved_mem array was defined statically. This series sorts
out reserved memory code and allocates that array from early allocator.

Note: reserved region with fixed location must be reserved before any
memory allocation. While struct reserved_mem array should be allocated
after allocator is activated. We make early_init_fdt_scan_reserved_mem()
do reservation only and add another call to initialize reserved memory.
So arch code have to change for it.

I'm only familiar with arm and arm64 architectures. Approvals from arch
maintainers are required. Thank you all.

Calvin Zhang (2):
  of: Sort reserved_mem related code
  of: reserved_mem: Remove reserved regions count restriction

 arch/arc/mm/init.c                 |   3 +
 arch/arm/kernel/setup.c            |   2 +
 arch/arm64/kernel/setup.c          |   3 +
 arch/csky/kernel/setup.c           |   3 +
 arch/h8300/kernel/setup.c          |   2 +
 arch/mips/kernel/setup.c           |   3 +
 arch/nds32/kernel/setup.c          |   3 +
 arch/nios2/kernel/setup.c          |   2 +
 arch/openrisc/kernel/setup.c       |   3 +
 arch/powerpc/kernel/setup-common.c |   3 +
 arch/riscv/kernel/setup.c          |   2 +
 arch/sh/kernel/setup.c             |   3 +
 arch/xtensa/kernel/setup.c         |   2 +
 drivers/of/fdt.c                   | 107 +---------------
 drivers/of/of_private.h            |  12 +-
 drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
 include/linux/of_reserved_mem.h    |   4 +
 17 files changed, 207 insertions(+), 139 deletions(-)

-- 
2.30.2

