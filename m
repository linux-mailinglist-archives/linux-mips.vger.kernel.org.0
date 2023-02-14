Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E125695BA0
	for <lists+linux-mips@lfdr.de>; Tue, 14 Feb 2023 08:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbjBNH7l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 02:59:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbjBNH72 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 02:59:28 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097A62D79
        for <linux-mips@vger.kernel.org>; Mon, 13 Feb 2023 23:59:15 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r2so14688646wrv.7
        for <linux-mips@vger.kernel.org>; Mon, 13 Feb 2023 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKk4GN0spR9gtNWG0hZUgVWkUK+7Um33RqMXGa01caM=;
        b=5mP6q9BM0qHn9ItmjYG+RAEsvlPcjV7W6jVv8m3uX6Xy8xX47dHXqzHeQe7TjqTIgD
         XdTQ4cnNLsqCvrZ2I/lG623c4t+EyMZX0oCCn2FSvdSyqBnxHSzgs0fZG07Sz+fzhW9k
         wcTpQ/rtBWqG579EawU5Q1Hl1pgPrnrUYqlA9iTGlPxxW88r3XpZcdpG1DpAhZWxL/7Y
         jg6Podz4ehO6/h/Vuc3goKhWZ8oBqxvn53/Ru/S9ao0uNcA8foQScWbCR0TmDs2+3G5b
         ayxaQ/GeBeBoCjGRs9sJRYCMA6Mo1hIpNscNciXeJfZuC+bbej7aWHI78NSYxMHnjPmH
         6tYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKk4GN0spR9gtNWG0hZUgVWkUK+7Um33RqMXGa01caM=;
        b=EI1tGWwHRK9sttbb8O92C6zWWlI5va6t9Ut+wB1ZeClnLl1Irje58JUbwAHf2Xnomk
         2MXWnvhTbPbfU7JbgcTHeVbWzql0iOCDthdrwKMf1qiu0fWkm2wj/FX/0DIX3wPcwFpr
         PDa/VXY/Ja939YlCJ8PolmZOGNM/oOfkZtRLYiLVqMfS+x8lbe9pwli7spIr2xENeFYZ
         MNZxKHtNd6eEPR1BitPAjJ8rA7fjAWRhnZWSKg/lPPCpNcqkLxREd1FsNDkRcQssgR6X
         Aw+9Gu8Rpd+xyUD8Qzp+XFg6oNUO1N4oki8w1kMiXc84yauTiyeCOZ+a8/JQb3eSMWXL
         BeEA==
X-Gm-Message-State: AO0yUKUTo+73WqV1avpz0JiDT2St8mpm4J2schfmxYyYQb6WMS5aAJnK
        2DLOadqvbpSWB7+1z0Hy4EpI1A==
X-Google-Smtp-Source: AK7set8lqeB9mVjVbFOfgyWnY8813vnjKKFmjbTcrsvjzmsHHkFtSxC/mHYd2secDiukidPqMYXitw==
X-Received: by 2002:adf:fac4:0:b0:2c5:5357:60b8 with SMTP id a4-20020adffac4000000b002c5535760b8mr1023860wrs.48.1676361553556;
        Mon, 13 Feb 2023 23:59:13 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id g17-20020a056000119100b002c54e26bca5sm7843497wrx.49.2023.02.13.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 23:59:13 -0800 (PST)
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
Subject: [PATCH v3 09/24] powerpc: Remove COMMAND_LINE_SIZE from uapi
Date:   Tue, 14 Feb 2023 08:49:10 +0100
Message-Id: <20230214074925.228106-10-alexghiti@rivosinc.com>
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

As far as I can tell this is not used by userspace and thus should not
be part of the user-visible API.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/powerpc/include/asm/setup.h      | 2 +-
 arch/powerpc/include/uapi/asm/setup.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index e29e83f8a89c..31786d1db2ef 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_POWERPC_SETUP_H
 #define _ASM_POWERPC_SETUP_H
 
-#include <uapi/asm/setup.h>
+#define COMMAND_LINE_SIZE	2048
 
 #ifndef __ASSEMBLY__
 extern void ppc_printk_progress(char *s, unsigned short hex);
diff --git a/arch/powerpc/include/uapi/asm/setup.h b/arch/powerpc/include/uapi/asm/setup.h
index c54940b09d06..f2ca747aa45b 100644
--- a/arch/powerpc/include/uapi/asm/setup.h
+++ b/arch/powerpc/include/uapi/asm/setup.h
@@ -2,6 +2,4 @@
 #ifndef _UAPI_ASM_POWERPC_SETUP_H
 #define _UAPI_ASM_POWERPC_SETUP_H
 
-#define COMMAND_LINE_SIZE	2048
-
 #endif /* _UAPI_ASM_POWERPC_SETUP_H */
-- 
2.37.2

