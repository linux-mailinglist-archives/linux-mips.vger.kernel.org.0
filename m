Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 177B26ABBFD
	for <lists+linux-mips@lfdr.de>; Mon,  6 Mar 2023 11:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjCFKYW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Mar 2023 05:24:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbjCFKYS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Mar 2023 05:24:18 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C142311F
        for <linux-mips@vger.kernel.org>; Mon,  6 Mar 2023 02:24:16 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so7791028wmb.3
        for <linux-mips@vger.kernel.org>; Mon, 06 Mar 2023 02:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvWdgHEM8PQ7SoWDcA2H7KmuhKKYQWfHxKMKCzpTfQ8=;
        b=g4y/rF7hG1lF9BSA8L5LfjIbBco6VPJVz6EJhOPhrgHf4B9kPm+gJBCsVaYOI1tBD7
         +0iRMhCGkvi6hF45v38v0y56clJ+ium+qEvdIExKLocNweosbYeup/scUzC6xKYmx+3/
         V3t6vt/EALjj00N1eDowiY8Fdi+Eh574KeXIN2zi3+3PQBGaWih1iMXgBjuX3aabSBe1
         GNmUmSQ844moawgyOc8ZmxWZbcI7NT6mu/1yLUIUON8iAftH2QlEoj6oDcFxrTH6Vw1c
         qsSQeMqwzsYpYY6ASwJvnkybb7u8WOgsDyZAWlw56DhIQurBDaj7hpuvM3vgWhHKkgmH
         woZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvWdgHEM8PQ7SoWDcA2H7KmuhKKYQWfHxKMKCzpTfQ8=;
        b=L6qXPysmwUQzPh1/osAeed3ziHCVq9ATkcwn+zDSBLNzRSBvahWjD4mwHpCsdFOXks
         fqrQ3p5rZ7eDA3+SXQbj7UBj5gigATy1YTPqBIF2TtdBnUQa8G5mJ7LrC0upxobyAVXd
         nlT+sWlZucXFqDQWaNIx0/t7nGhHzDhZUKQy0YoeoqGX9BPLw7PSEZAhGEmkQmpjLNhl
         RbZh79aZ5ss6GT+9dt4x5YOYVh3vd2yAKwfNnN8Wg8IiS86P2gDR87jzz3wfuRLFkgmQ
         v5VAuwvDct4clsQD18HayiAH0ZOBGigwL1Nv4mbToPEMRB+ELfZRgoO4RGBCrbc4xhMB
         Q+pw==
X-Gm-Message-State: AO0yUKWjFTFPPeES+K/zDsCm3r7nMcZZ22h7kLYb5DFvlijOKgZpi8ij
        9/Ic666GwomrQlgtSWYP8xYQDA==
X-Google-Smtp-Source: AK7set8RG4V0ks0aMJA1LUxsbHMeWCrefKcK9poPDOieWycOu3lDEUvWSbUcLi1e63S3ckyGBK45aw==
X-Received: by 2002:a05:600c:1990:b0:3e2:20c7:6553 with SMTP id t16-20020a05600c199000b003e220c76553mr8721082wmq.13.1678098254731;
        Mon, 06 Mar 2023 02:24:14 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id t14-20020a05600c450e00b003e1fee8baacsm14047907wmo.25.2023.03.06.02.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:24:14 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
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
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 18/26] microblaze: Remove empty <uapi/asm/setup.h>
Date:   Mon,  6 Mar 2023 11:05:00 +0100
Message-Id: <20230306100508.1171812-19-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
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
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/microblaze/include/uapi/asm/setup.h | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 arch/microblaze/include/uapi/asm/setup.h

diff --git a/arch/microblaze/include/uapi/asm/setup.h b/arch/microblaze/include/uapi/asm/setup.h
deleted file mode 100644
index 51aed65880e7..000000000000
--- a/arch/microblaze/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2007-2009 Michal Simek <monstr@monstr.eu>
- * Copyright (C) 2007-2009 PetaLogix
- * Copyright (C) 2006 Atmark Techno, Inc.
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License. See the file "COPYING" in the main directory of this archive
- * for more details.
- */
-
-#ifndef _UAPI_ASM_MICROBLAZE_SETUP_H
-#define _UAPI_ASM_MICROBLAZE_SETUP_H
-
-# ifndef __ASSEMBLY__
-
-# endif /* __ASSEMBLY__ */
-#endif /* _UAPI_ASM_MICROBLAZE_SETUP_H */
-- 
2.37.2

