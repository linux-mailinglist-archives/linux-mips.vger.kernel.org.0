Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 289596A7EA8
	for <lists+linux-mips@lfdr.de>; Thu,  2 Mar 2023 10:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjCBJtp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 Mar 2023 04:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjCBJtR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 Mar 2023 04:49:17 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DB23B65D
        for <linux-mips@vger.kernel.org>; Thu,  2 Mar 2023 01:49:06 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so1257618wmb.3
        for <linux-mips@vger.kernel.org>; Thu, 02 Mar 2023 01:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677750544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWYHj4zorz+dwOxhMMH91bCZKZH71c0fjl4K1DE3I7g=;
        b=5ZAduxFul6L7EVkksZXQoF5FC+Qs5CE+kacCXrUHWZ3TJ0yCKeUAKLKJ07uicTV70q
         LQsgm/jmq2KCMoFJ578o6RAIwJkN7gGISYXJQe10UuriBSeUq7lbQtkAIS8BY2BeARmS
         31IglhADRLPfhbaZFX5LDdD0n3Q7iFMvdO/DOwlMH+YFjuAUrAPTgWMzaW5hF4H4mYzK
         RTyIBHnjTUketA0x1tW26QPOF9qEKPq2gzT29yvIYG3yJFlw8xXEBKf+MpCjoMR1VBQO
         YIefltuD5/sttNs7ScBSEtHsI7p/Xfp+ix5EfpGForpJ63h+UsK8LCZ8yKzwirXzDTbF
         ZD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677750544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWYHj4zorz+dwOxhMMH91bCZKZH71c0fjl4K1DE3I7g=;
        b=H/atoSBPnmQ0K3xK0JpDk9yb6qBbP6Rtc1BTkIypzCgdabjuDKecJwzezuh/N8t6Qb
         mW8A4A7PK65Z+8UlGeg9dW3N1Mju3VahxzmkLrl5CfZ6DPPnI/Gl8D+IC0x6YsdVSGDv
         iGB4LWhwQ40SZbv1WxJwjSzoliFYIYykeRLQV9dFVGm/ZfQhZw9opvXd3omM5Rjmwi3d
         qugN7b9sG24ysG9SszJC3qYNMQDktI9t2My2zXMUzzYRCU0rK0VmQtIKeA5mZlaxB1/5
         Uw5bSembKedP/8/fdGtlgXM8cSryIQcDQ0kWvKJ5VrsAfhevlBa8ljYyRHjxHqHf7GPL
         F7ww==
X-Gm-Message-State: AO0yUKVIZ8qcV7M2tyYjpibA65SpgqlHaB+u61q6bagEo9ht/PaN0vPV
        555ZiawJwLM9T+/eheXAdFTSkw==
X-Google-Smtp-Source: AK7set88lqwO9nn1OscJpPt0thHXrtHDXGZD3aB0G9YKxw4Vj46KvgCx268yC1Jntrsig4/PZ4t1vg==
X-Received: by 2002:a1c:7c16:0:b0:3df:9858:c02e with SMTP id x22-20020a1c7c16000000b003df9858c02emr998087wmc.3.1677750544556;
        Thu, 02 Mar 2023 01:49:04 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s8-20020a7bc388000000b003eb2e685c7dsm2382812wmj.9.2023.03.02.01.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:49:04 -0800 (PST)
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
Subject: [PATCH v4 13/24] alpha: Remove empty <uapi/asm/setup.h>
Date:   Thu,  2 Mar 2023 10:35:28 +0100
Message-Id: <20230302093539.372962-14-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
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
 arch/alpha/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h

diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
deleted file mode 100644
index 9b3b5ba39b1d..000000000000
--- a/arch/alpha/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI__ALPHA_SETUP_H
-#define _UAPI__ALPHA_SETUP_H
-
-#endif /* _UAPI__ALPHA_SETUP_H */
-- 
2.37.2

