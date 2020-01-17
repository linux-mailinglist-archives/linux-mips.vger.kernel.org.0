Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 231D71404C6
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jan 2020 09:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbgAQIDi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jan 2020 03:03:38 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51846 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbgAQIDh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jan 2020 03:03:37 -0500
Received: by mail-wm1-f65.google.com with SMTP id d73so6447234wmd.1
        for <linux-mips@vger.kernel.org>; Fri, 17 Jan 2020 00:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i++Wnr6lskfdyTEf2bt4TSLzH2Xad/WDR/WNYAW09E4=;
        b=V7pcvnC73rYBS0KY9vSQuPPoEpxAvmkxo2YQx7SaJqwU7P4l65Hxjt9kOwliECjw9P
         YSW/B284rrNNrsol0MpsGM3wcVvOQakDsgmtc9GVvvGrDYey7UrZ2qH6NscydWjrDnci
         N+w0eDBnqHXYHUDgbLNnU7vcr4iOoh8jEH0sW2C5UZ751dm6PAdbcuF6gKQqUGWShSp6
         PLLBJbhrzE2b9vaANhz7QeZU70gLhGkoDA6DM7CgZHpV6A4EcMED9tJUSQb67/A+gmZp
         eAE04AXEcX//EN3QzjxcaulB9DofVRVeo85B4JZCm5LtlBV1DZROEdJRinPTDd/wuMyP
         cD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=i++Wnr6lskfdyTEf2bt4TSLzH2Xad/WDR/WNYAW09E4=;
        b=o6LS8P/4xyC+Cgok7Fz1bDBVHWYBm4ebTDCgFGhsx0i1zyt9zXq0fVu02d9snxHF6Q
         GMrbJmvdr0nMmJ+CJ4abbAtMcSXMTv+qlqEcTQJX0eDs6yuRnlZRwY7FnHRlVak0j/xj
         gySolNhpGOCplzNhOXQP3Ma5sVsKvrTZQHkRg0MveQV1Y4nvC8ZTOQekwy2CeKctDSVt
         NvEoacpvBaOTd5t1XyFwOSq1IsAI9SDgxRUrhC5IKWP6gViCby5iouQfFyX44bf6YjhJ
         AlUNbWAgqNuz6zk/FtZ9G2f/OXHCq1ovYUOt5PVMbvIwCRC+GLasOp67zZEj2U2V+xQl
         O8bw==
X-Gm-Message-State: APjAAAV+qRuAdI/0jpUwOTvSE4gVQDVyNuH8KwsicKiEoYqbaw7n6Uan
        ClkrLeksMUI0mwhYUXhuhqUWxg==
X-Google-Smtp-Source: APXvYqxl96ObJwT48mJl919pgWBhjJ834NW1hgROfepdvC4HdYZrfui8PwfpswFTjDrAhkPvRoSP8Q==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr3383409wmk.52.1579248215057;
        Fri, 17 Jan 2020 00:03:35 -0800 (PST)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id w8sm3110202wmd.2.2020.01.17.00.03.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 00:03:34 -0800 (PST)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, git@xilinx.com,
        Christoph Hellwig <hch@lst.de>
Cc:     Paul Burton <paulburton@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>,
        Borislav Petkov <bp@alien8.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-mips@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
        linux-s390@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        x86@kernel.org, Guo Ren <guoren@kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Wesley Terpstra <wesley@sifive.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org, "H. Peter Anvin" <hpa@zytor.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Will Deacon <will@kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Deepa Dinamani <deepa.kernel@gmail.com>,
        Chris Zankel <chris@zankel.net>,
        Manish Narani <manish.narani@xilinx.com>,
        Ingo Molnar <mingo@redhat.com>,
        Waiman Long <longman@redhat.com>,
        linux-arm-kernel@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        James Hogan <jhogan@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Guo Ren <ren_guo@c-sky.com>
Subject: [PATCH v2 0/2] microblaze: Enable CMA
Date:   Fri, 17 Jan 2020 09:03:30 +0100
Message-Id: <cover.1579248206.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

the patchset enable CMA on Microblaze. Based on Christoph request I have
created the first patch which makes dma-continugous.h mandatory for all
archs before Microblaze wiring.

Thanks,
Michal

Changes in v2:
- New patch suggested by Christoph
- Align commit message
- Remove adding dma-contigous.h via Kbuild because it is done by previous
  patch

Michal Simek (2):
  asm-generic: Make dma-contiguous.h a mandatory include/asm header
  microblaze: Wire CMA allocator

 arch/arm64/include/asm/Kbuild         | 1 -
 arch/csky/include/asm/Kbuild          | 1 -
 arch/microblaze/Kconfig               | 1 +
 arch/microblaze/configs/mmu_defconfig | 2 ++
 arch/microblaze/mm/init.c             | 4 ++++
 arch/mips/include/asm/Kbuild          | 1 -
 arch/riscv/include/asm/Kbuild         | 1 -
 arch/s390/include/asm/Kbuild          | 1 -
 arch/x86/include/asm/Kbuild           | 1 -
 arch/xtensa/include/asm/Kbuild        | 1 -
 include/asm-generic/Kbuild            | 1 +
 11 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.25.0

