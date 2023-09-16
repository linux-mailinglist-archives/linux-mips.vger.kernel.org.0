Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D986D7A2C3F
	for <lists+linux-mips@lfdr.de>; Sat, 16 Sep 2023 02:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238742AbjIPAdA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Sep 2023 20:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238766AbjIPAcm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Sep 2023 20:32:42 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 374C61FCE
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:31:59 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1bf6e47b5efso25507835ad.2
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 17:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824318; x=1695429118; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=I1k7UlFLK1e3KB496SGnrZE1fwTPdTtkvkYnZUVfXtU=;
        b=lseo9L1/jBB6ERFsVcrklzOw152JBvVjSAVuQrW9I2BUrY5Xycghdsb8xzIUyBC1/y
         a+cO6Os/+olItJ4ggzA1YxvtvKJKwTIVUFfxeKR3ueGBXvf3YBIO2Mupa0tLpzQjtE+v
         9umKJktMvZo0DvfYB1C9qj2fNS9wEmSXR7z0ZPmaqvw/kYbKwy4J0FdaaHTfuveshnMo
         yfgURvaJra4OS5CeXl/Ceq5K0FJKdKAeKlw0R5Dwd5AkOYYLPknw5/JLFR9NTHdEJgTR
         DcIqO/CWRqlIhU7s9D56/kK9uR23DO9H7h+znQx3YcDlOZcx6wB10zEQRjTQY0kU+ljm
         Ebcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824318; x=1695429118;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1k7UlFLK1e3KB496SGnrZE1fwTPdTtkvkYnZUVfXtU=;
        b=vnex+iiXeJT2pCwzx8IPmsk2crTeCrUX+ZjI4b+Yt0xaSB+W51wGPj5XobsSvVlCtd
         sTxx9vUbL0mrFkmJESX6QfCauo9glCo/tlclV2spGJcf1icUfgwb52xePKyn7OvN4903
         JMEj/yiKdN8KAEc/+oeqf1KQwAAxvjSCyRRYyoiV02OaMPktoB1u+tAeTXMdCvIowwpk
         2BoIllXjoGhz1PAdwc0NBiCRth4sf9xhqOuhGCTVhHs0TTGXCU3wGZ1M7htWWutFr9w7
         Z0JmzG4cIOxuAK+jcEEC8NyEWRaO3ssBe9Clje6imDtuYpdGwIw65X7dxPAf1irRjua6
         C3Dg==
X-Gm-Message-State: AOJu0YwmdcRnVCehjYdCi+kde7L9qWlYkynam/EryhRn4GxlqCw5QcBW
        5HOUWjwRYB5x8kpXdySLhKy2B+iMrKM=
X-Google-Smtp-Source: AGHT+IFCF5MUMD869yhPhgA85k1sz5CoJq/QTd908FyvX67dvIc3xBcuRDs8mX3N7g5mT6MCs9yGRfwK12c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ec8b:b0:1bf:cc5:7b53 with SMTP id
 x11-20020a170902ec8b00b001bf0cc57b53mr68748plg.1.1694824318653; Fri, 15 Sep
 2023 17:31:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date:   Fri, 15 Sep 2023 17:31:11 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-20-seanjc@google.com>
Subject: [PATCH 19/26] KVM: Standardize include paths across all architectures
From:   Sean Christopherson <seanjc@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        Huacai Chen <chenhuacai@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Anup Patel <anup@brainfault.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sean Christopherson <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Tony Krowiak <akrowiak@linux.ibm.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Jason Herne <jjherne@linux.ibm.com>,
        Harald Freudenberger <freude@linux.ibm.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Andy Lutomirski <luto@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        Anish Ghulati <aghulati@google.com>,
        Venkatesh Srinivas <venkateshs@chromium.org>,
        Andrew Thornton <andrewth@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Standardize KVM's include paths across all architectures by declaring
the KVM-specific includes in the common Makefile.kvm.  Having common KVM
"own" the included paths reduces the temptation to unnecessarily add
virt/kvm to arch include paths, and conversely if allowing arch code to
grab headers from virt/kvm becomes desirable, virt/kvm can be added to
all architecture's include path with a single line update.

Having the common KVM makefile append to ccflags also provides a
convenient location to append other things, e.g. KVM-specific #defines.

Note, this changes the behavior of s390 and PPC, as s390 and PPC
previously overwrote ccflags-y instead of adding on.  There is no evidence
that overwriting ccflags-y was necessary or even deliberate, as both s390
and PPC switched to the overwrite behavior without so much as a passing
mention when EXTRA_CFLAGS was replaced with ccflags-y (commit c73028a02887
("s390: change to new flag variable") and commit 4108d9ba9091
("powerpc/Makefiles: Change to new flag variables")).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Makefile   | 2 --
 arch/mips/kvm/Makefile    | 2 --
 arch/powerpc/kvm/Makefile | 2 --
 arch/riscv/kvm/Makefile   | 2 --
 arch/s390/kvm/Makefile    | 2 --
 arch/x86/kvm/Makefile     | 1 -
 virt/kvm/Makefile.kvm     | 2 ++
 7 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index c0c050e53157..3996489baeef 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y += -I $(srctree)/$(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 96a7cd21b140..d198e1addea7 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,8 +4,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y += -Iarch/mips/kvm
-
 kvm-$(CONFIG_CPU_HAS_MSA) += msa.o
 
 kvm-y +=    mips.o emulate.o entry.o \
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 08a0e53d58c7..d6c6678ddf65 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y := -Iarch/powerpc/kvm
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 common-objs-y += powerpc.o emulate_loadstore.o
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 4c2067fc59fc..ff7d5f67e229 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -3,8 +3,6 @@
 # Makefile for RISC-V KVM support
 #
 
-ccflags-y += -I $(srctree)/$(src)
-
 include $(srctree)/virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index f17249ab2a72..f8153189e003 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -5,8 +5,6 @@
 
 include $(srctree)/virt/kvm/Makefile.kvm
 
-ccflags-y := -Iarch/s390/kvm
-
 kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
 kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o
 
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 80e3fe184d17..d13f1a7b7b3d 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y += -I $(srctree)/arch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
 ifeq ($(CONFIG_FRAME_POINTER),y)
diff --git a/virt/kvm/Makefile.kvm b/virt/kvm/Makefile.kvm
index 29373b59d89a..e85079ad245d 100644
--- a/virt/kvm/Makefile.kvm
+++ b/virt/kvm/Makefile.kvm
@@ -3,6 +3,8 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
+ccflags-y += -I$(srctree)/$(src)
+
 KVM ?= ../../../virt/kvm
 
 kvm-y := $(KVM)/kvm_main.o $(KVM)/eventfd.o $(KVM)/binary_stats.o
-- 
2.42.0.459.ge4e396fd5e-goog

