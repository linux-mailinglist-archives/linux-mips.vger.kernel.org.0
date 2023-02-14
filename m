Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B776695CA4
	for <lists+linux-mips@lfdr.de>; Tue, 14 Feb 2023 09:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbjBNIPG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 03:15:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232062AbjBNIOy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 03:14:54 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C834BAD1D
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 00:14:51 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id bk16so14714047wrb.11
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 00:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjnDXT2YCrpWOoVnrYNkTuZIq4oC+7zvNAb1MUNa5/c=;
        b=doj3ihw2ryLRC8f29i99NL2fwaGqn4CpXMd97+dwyictmuXkOTVA3vSN+VHk/PL0kf
         FxQRafQ1Jt/CNIN6lVBhNNArczrIy10FqfWYvnAbdsShwiby/3DTFWhrBeUy18cY73Eu
         E3vQL2utHUsfq64MZdoEZbAML53OwZSFv1czAWyM31Shgci31oFfy6gfRTZFzd55RXjO
         XSWJuB7qGztVLm0ISy6iV/oGFJm6s+0D0JcCtuAy6rPxbA8LU7KapUgGY7jLMRciHJGu
         tSDQUfV66Cg6ku0ogdvTEqZppDCuIdWj8dYNveiHQUMsl6bUb56BPhszaqAKgBoZrOa/
         fCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjnDXT2YCrpWOoVnrYNkTuZIq4oC+7zvNAb1MUNa5/c=;
        b=MoL20HlFBmuXr3fQ3N0ib7xnhQCXVLVJgr59R9yZTybtHlAQkDMGhQFjMq3IhxdwRY
         vLi03irnUEx2T16Man6lTuT7VHkNpQTHcbxBdYwFlG0IOD1Qwy7RIE1L311p8luYTDaW
         tRdTbO1yG4lF7Ku5pfeHSpgvgnLwOJFxv1MY2/B8G3/T8s07VDoiGiF7WnmRyrD1ljwl
         31jrxG+NIM4ADXFaRvmwe0lC/3QH46b6SUzlzouqMbgvZPilLPgU0pgKukgFil4r5zWd
         Nws4bc3QIo2wKptxBY9u8H1finPAxi25aXysH1VpDRevvYPmzy1sluLzcztqsKTNqKhF
         BNDA==
X-Gm-Message-State: AO0yUKVZcOtwns7ZuJPRHGNhpWjguYYDpa9PeK2YYqMIN9iRvEKmWwBo
        cRyk8pSiLXHL4ZaKoe197ac73g==
X-Google-Smtp-Source: AK7set/msAZJj448Cov5vdV+SLyxrlNLKv4T+REkQ+fV1an22f34T0IiaHil6N7s6KZj8YpicdZPqA==
X-Received: by 2002:adf:f04e:0:b0:2bf:dcdc:afb8 with SMTP id t14-20020adff04e000000b002bfdcdcafb8mr1245734wro.64.1676362490423;
        Tue, 14 Feb 2023 00:14:50 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d67c2000000b002c53f6c7599sm11659511wrw.29.2023.02.14.00.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 00:14:50 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 24/24] s390: Remove empty <uapi/asm/setup.h>
Date:   Tue, 14 Feb 2023 08:49:25 +0100
Message-Id: <20230214074925.228106-25-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214074925.228106-1-alexghiti@rivosinc.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/s390/include/asm/setup.h      | 1 -
 arch/s390/include/uapi/asm/setup.h | 1 -
 2 files changed, 2 deletions(-)
 delete mode 100644 arch/s390/include/uapi/asm/setup.h

diff --git a/arch/s390/include/asm/setup.h b/arch/s390/include/asm/setup.h
index 177bf6deaa27..99c1cc97350a 100644
--- a/arch/s390/include/asm/setup.h
+++ b/arch/s390/include/asm/setup.h
@@ -7,7 +7,6 @@
 #define _ASM_S390_SETUP_H
 
 #include <linux/bits.h>
-#include <uapi/asm/setup.h>
 #include <linux/build_bug.h>
 
 #define PARMAREA		0x10400
diff --git a/arch/s390/include/uapi/asm/setup.h b/arch/s390/include/uapi/asm/setup.h
deleted file mode 100644
index 598d769e76df..000000000000
--- a/arch/s390/include/uapi/asm/setup.h
+++ /dev/null
@@ -1 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-- 
2.37.2

