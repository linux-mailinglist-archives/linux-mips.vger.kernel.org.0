Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7AFC1F8D76
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 08:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgFOGDH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 02:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbgFOGDG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 02:03:06 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B07AC061A0E;
        Sun, 14 Jun 2020 23:03:06 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b201so7372196pfb.0;
        Sun, 14 Jun 2020 23:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=yUzpm4U4So7mXTG9SID/TdypeqlhCiwzjek4wMDLU7k=;
        b=FojUV5IlWvmjfnA+wbO1anfZ21pwGlxKMBOTuK7PQRJDfm0xahFiO3rYa1eflikn8i
         qhR5n6R2to/hcvkKZjHQnB1RBb7rLC7CGA5k+Ra64I9caBkQ/bHg65lnBEEwnSmMD7Uj
         sSf06gNRaimOBFv3O60n7pL88Dgdwkj/Cg6QeBnT75Iy5DLOFyKfXQAcnqXob/tJizW2
         x5sI+3wqxqVJxpKq4o6RpbZxduu3WKjYkqWmaEeFJORLKQ+lC9M8mEqvalFXXYNz1iRO
         Y7Jx/wa/6bt2R9Dkw57WQkyK336kHRc4alLaNoTKhfW9o70cVVdjyFleJlpD4AZ+StcQ
         Gr5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=yUzpm4U4So7mXTG9SID/TdypeqlhCiwzjek4wMDLU7k=;
        b=FrtzYt1qg/kLOoINPGTVGb4+FCADyJMaVTl45x9EzVQgoNdRQ9t7Bn+5cyTddArzrJ
         b3utvVLTMTtS6heerv9/ngPWU4uv05+gGEGhFwtUy5qcWNTf0RxM3lkeIOd2TcyotPYd
         ua7ziovzBXvcvwZ7ThZhJvxs97FT2TFSIzCwYqQ7hsq+qVEsoxdZFCxlJ45oLqzAWy8L
         hVFp5yNXCxK9ud9A5gANmQQbt9VvDT/5u4WLmWa1cWJnBDBVC0fLejUcytL7yGwjqaYz
         EDcJOYr7j+KVXhp1CGTN5FpiHL+0rvwvhKWxjrLeQ53PHC98TXre3cPPF1O5bSuv3Vi8
         +yJQ==
X-Gm-Message-State: AOAM530OrobL013tsUqCqhnNit/jwOn18B8bC7CS42IEDUFysQJ1WXb+
        TZBkloPQzLRIe7AQCbR+LMY=
X-Google-Smtp-Source: ABdhPJzzU0kxox9hnnTk/ddu2XQHTmtE55VKHwxD32Xgk1k7on5sunfpas6e6Szd8oP6VJjol0rbow==
X-Received: by 2002:aa7:8283:: with SMTP id s3mr11814890pfm.90.1592200985514;
        Sun, 14 Jun 2020 23:03:05 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id z1sm11470922pjz.10.2020.06.14.23.03.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jun 2020 23:03:05 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/2] MIPS: Loongson: Rename CPU device-tree binding
Date:   Mon, 15 Jun 2020 14:04:16 +0800
Message-Id: <1592201057-28151-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson-3A R1/R2/R3 and Loongson-3B R1/R2 use the same package naming
in dts, and Loongson-3A R4 will be different. In cpu.h the classic 64bit
Loongson processors are called Loongson64C (C for classic, pre Loongson-
3A R4), and the new 64bit Loongson processors are called Loongson64G (G
for generic, Loongson-3A R4+). To keep consistency and make extensible,
we rename the classic "loongson3" prefix to "loongson64c", and the new
prefix for Loongson-3A R4+ will be "loongson64g".

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 Documentation/devicetree/bindings/mips/loongson/devices.yaml      | 8 ++++----
 arch/mips/boot/dts/loongson/Makefile                              | 2 +-
 .../loongson/{loongson3-package.dtsi => loongson64c-package.dtsi} | 0
 .../{loongson3_4core_rs780e.dts => loongson64c_4core_rs780e.dts}  | 2 +-
 .../{loongson3_8core_rs780e.dts => loongson64c_8core_rs780e.dts}  | 2 +-
 arch/mips/include/asm/mach-loongson64/builtin_dtbs.h              | 4 ++--
 arch/mips/loongson64/env.c                                        | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)
 rename arch/mips/boot/dts/loongson/{loongson3-package.dtsi => loongson64c-package.dtsi} (100%)
 rename arch/mips/boot/dts/loongson/{loongson3_4core_rs780e.dts => loongson64c_4core_rs780e.dts} (93%)
 rename arch/mips/boot/dts/loongson/{loongson3_8core_rs780e.dts => loongson64c_8core_rs780e.dts} (93%)

diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
index 74ed4e3..0516fe2 100644
--- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
+++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
@@ -17,11 +17,11 @@ properties:
   compatible:
     oneOf:
 
-      - description: Generic Loongson3 Quad Core + RS780E
+      - description: Classic Loongson64 Quad Core + RS780E
         items:
-          - const: loongson,loongson3-4core-rs780e
+          - const: loongson,loongson64c-4core-rs780e
 
-      - description: Generic Loongson3 Octa Core + RS780E
+      - description: Classic Loongson64 Octa Core + RS780E
         items:
-          - const: loongson,loongson3-8core-rs780e
+          - const: loongson,loongson64c-8core-rs780e
 ...
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 56d3794..aa5069a 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -1,4 +1,4 @@
 # SPDX_License_Identifier: GPL_2.0
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson3_4core_rs780e.dtb loongson3_8core_rs780e.dtb
+dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb loongson64c_8core_rs780e.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/loongson3-package.dtsi b/arch/mips/boot/dts/loongson/loongson64c-package.dtsi
similarity index 100%
rename from arch/mips/boot/dts/loongson/loongson3-package.dtsi
rename to arch/mips/boot/dts/loongson/loongson64c-package.dtsi
diff --git a/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
similarity index 93%
rename from arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
rename to arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
index 6b5694c..acd53a1 100644
--- a/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
+++ b/arch/mips/boot/dts/loongson/loongson64c_4core_rs780e.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "loongson3-package.dtsi"
+#include "loongson64c-package.dtsi"
 #include "rs780e-pch.dtsi"
 
 / {
diff --git a/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
similarity index 93%
rename from arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
rename to arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
index ffefa2f..433f9c3 100644
--- a/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
+++ b/arch/mips/boot/dts/loongson/loongson64c_8core_rs780e.dts
@@ -2,7 +2,7 @@
 
 /dts-v1/;
 
-#include "loongson3-package.dtsi"
+#include "loongson64c-package.dtsi"
 #include "rs780e-pch.dtsi"
 
 / {
diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
index 853c6d80..930c8a1 100644
--- a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -8,6 +8,6 @@
 #ifndef __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
 #define __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
 
-extern u32 __dtb_loongson3_4core_rs780e_begin[];
-extern u32 __dtb_loongson3_8core_rs780e_begin[];
+extern u32 __dtb_loongson64c_4core_rs780e_begin[];
+extern u32 __dtb_loongson64c_8core_rs780e_begin[];
 #endif
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index d11bc34..3e7caba 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -133,11 +133,11 @@ void __init prom_init_env(void)
 		case PRID_REV_LOONGSON3A_R2_1:
 		case PRID_REV_LOONGSON3A_R3_0:
 		case PRID_REV_LOONGSON3A_R3_1:
-			loongson_fdt_blob = __dtb_loongson3_4core_rs780e_begin;
+			loongson_fdt_blob = __dtb_loongson64c_4core_rs780e_begin;
 			break;
 		case PRID_REV_LOONGSON3B_R1:
 		case PRID_REV_LOONGSON3B_R2:
-			loongson_fdt_blob = __dtb_loongson3_8core_rs780e_begin;
+			loongson_fdt_blob = __dtb_loongson64c_8core_rs780e_begin;
 			break;
 		default:
 			break;
-- 
2.7.0

