Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94FB405886
	for <lists+linux-mips@lfdr.de>; Thu,  9 Sep 2021 16:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349967AbhIIOFR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Sep 2021 10:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345121AbhIIOFC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Sep 2021 10:05:02 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28C3C0363C3
        for <linux-mips@vger.kernel.org>; Thu,  9 Sep 2021 05:04:26 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n5so2186565wro.12
        for <linux-mips@vger.kernel.org>; Thu, 09 Sep 2021 05:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGhvxcJ5e0tWwjSJNqM6XCMaaGd6Uf1B/o2F+QC2P2E=;
        b=G9Aqk2QIyaP4NStdJlI2W+jYyFf2cxdEkKsatz7oGDFsfmYZi9tBWCduPA4+jE5p7U
         BOuY6gqJjmyV8v5QQKYxDwuzwKGa/5XhOO/tgHUHlhmUEBmh3zMhoy6pH4jz/X3mqm+B
         aiFLyQdZrtcHXPQq/wBywud/Lta/EdrBpbrZgbARYUg/fOO/ZsAxLyZc7yqfUK2jqcg3
         720naMUmXaJh+2jyYDvtsgc7dQDFDjt/gHNTBax++79zSiiVG4xnl5N2SAU6gkjrhJJm
         w9rVyMGtlv9iW1cuSRn5jzCsOgqZnJRO0L04W/ii+Is7cQG1OlyTaPAzvogxQD1BYjMN
         IkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TGhvxcJ5e0tWwjSJNqM6XCMaaGd6Uf1B/o2F+QC2P2E=;
        b=N1L14FRjzsrJiKLbu9CrIuLWMXI5vEqHME+c4J+c1tXBUT/Bs3aYJh02vH0BgOL1Mt
         UmFsp4TUVwKiZWWZ392gy4bC6fFY9Orx84NyYda9Ca2nPOmDqKnRMvoAh28Mm4TUnGhv
         swl7HCndrmBr8VF4BXgTVBpKFKgKyQIF+Z4cvoYg+7zi/eKN9JMGuTIS3lzjzQ0sZP0l
         Nos8hlhW5b9AyH4FWpo5LqJYY7R+wnt+FmGm3/Ss0XEtDoHSyIbLrpcylcMdonZHNGBZ
         FzfB5zXfCOCy+9nO+/lONeZF7V5kR8b5pJIl08I/6AZb1Elg9kP0UKt3RHtO8Kx1siiG
         0Raw==
X-Gm-Message-State: AOAM533RJzZA+jNGftHJyW2l2WDce+SPf5doxN/r6/zS3k7uZn9qb8mA
        XiOyptTCpTEd38w8VmjJwZUA4w==
X-Google-Smtp-Source: ABdhPJwXFzB1KuSRyctCLMeToyBav6moCwvyVSJSQ2wA2Una7A66/qiHNzLd3gX+GGFxN1qUveWbMQ==
X-Received: by 2002:adf:de8a:: with SMTP id w10mr3133483wrl.413.1631189065464;
        Thu, 09 Sep 2021 05:04:25 -0700 (PDT)
Received: from localhost.localdomain ([95.148.6.201])
        by smtp.gmail.com with ESMTPSA id n66sm1437498wmn.2.2021.09.09.05.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:04:24 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Borislav Petkov <bp@alien8.de>,
        Brian Cain <bcain@codeaurora.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Chris Zankel <chris@zankel.net>,
        "David S . Miller" <davem@davemloft.net>,
        Guo Ren <guoren@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Jeff Dike <jdike@addtoit.com>, John Crispin <john@phrozen.org>,
        Jonas Bonn <jonas@southpole.se>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
        linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>, openrisc@lists.librecores.org,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Richard Weinberger <richard@nod.at>,
        Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Thomas Gleixner <tglx@linutronix.de>,
        uclinux-h8-devel@lists.sourceforge.jp,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH v2 0/3] power: reset: Convert Power-Off driver to tristate
Date:   Thu,  9 Sep 2021 13:04:18 +0100
Message-Id: <20210909120421.1313908-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Provide support to compile the Power-Off driver as a module.

v1 => v2:
 - s/EXPORT_SYMBOL/EXPORT_SYMBOL_GPL/
 
Elliot Berman (2):
  reboot: Export reboot_mode
  power: reset: Enable tristate on restart power-off driver

Lee Jones (1):
  arch: Export machine_restart() instances so they can be called from
    modules

 arch/arc/kernel/reset.c            | 1 +
 arch/arm/kernel/reboot.c           | 1 +
 arch/arm64/kernel/process.c        | 1 +
 arch/csky/kernel/power.c           | 1 +
 arch/h8300/kernel/process.c        | 1 +
 arch/hexagon/kernel/reset.c        | 1 +
 arch/m68k/kernel/process.c         | 1 +
 arch/microblaze/kernel/reset.c     | 1 +
 arch/mips/kernel/reset.c           | 1 +
 arch/mips/lantiq/falcon/reset.c    | 1 +
 arch/mips/sgi-ip27/ip27-reset.c    | 1 +
 arch/nds32/kernel/process.c        | 2 +-
 arch/nios2/kernel/process.c        | 1 +
 arch/openrisc/kernel/process.c     | 1 +
 arch/parisc/kernel/process.c       | 1 +
 arch/powerpc/kernel/setup-common.c | 1 +
 arch/riscv/kernel/reset.c          | 1 +
 arch/s390/kernel/setup.c           | 1 +
 arch/sh/kernel/reboot.c            | 1 +
 arch/sparc/kernel/process_32.c     | 1 +
 arch/sparc/kernel/reboot.c         | 1 +
 arch/um/kernel/reboot.c            | 1 +
 arch/x86/kernel/reboot.c           | 1 +
 arch/xtensa/kernel/setup.c         | 1 +
 drivers/power/reset/Kconfig        | 2 +-
 kernel/reboot.c                    | 2 ++
 26 files changed, 27 insertions(+), 2 deletions(-)

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brian Cain <bcain@codeaurora.org>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: David S. Miller <davem@davemloft.net>
Cc: Guo Ren <guoren@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jeff Dike <jdike@addtoit.com>
Cc: John Crispin <john@phrozen.org>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-um@lists.infradead.org
Cc: linux-xtensa@linux-xtensa.org
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Simek <monstr@monstr.eu>
Cc: openrisc@lists.librecores.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Rich Felker <dalias@libc.org>
Cc: sparclinux@vger.kernel.org
Cc: Stafford Horne <shorne@gmail.com>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: uclinux-h8-devel@lists.sourceforge.jp
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
-- 
2.33.0.153.gba50c8fa24-goog

