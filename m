Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE6DA3EE0D2
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 02:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbhHQAVw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Aug 2021 20:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbhHQAVw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Aug 2021 20:21:52 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17D0C0613C1
        for <linux-mips@vger.kernel.org>; Mon, 16 Aug 2021 17:21:19 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id w200-20020a25c7d10000b02905585436b530so18582319ybe.21
        for <linux-mips@vger.kernel.org>; Mon, 16 Aug 2021 17:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=0flG7tBXqwB6ZGV3wjc6S5xzmJOwRAtpip9gnXv+kK8=;
        b=TarIsOJvY1bE0qOoUbWMmmJpkQMY8ULADIPRKNNtrtDc7Ws2wk90HegcRbVT7dKxdh
         k23RttyME3Q75+8mPkvubTaWfXRV6yWrjFXqZgToyM7yyf0H7wgMNyvMjm49eM4ppUY3
         BekQhk0gn8TMG8cBzDQtfwhquw1pScMhsk8WYgDc2GaohqLE/CcTNb58/fPxpXCB3gj1
         3/upEdc1m4/+2GOxxYB/qld2s3Y/eM5QMAf51TQbOp1MwnT7Z1yjrWzUzn3KD0Or0SkW
         obUxgR9DGtYR6/6ZBb5mu688kqcja4RUnZs6quvA6XC1bB4u0QfkO5lDfXRLXghcFQCb
         87tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=0flG7tBXqwB6ZGV3wjc6S5xzmJOwRAtpip9gnXv+kK8=;
        b=A8qXlLqjBvQA4sDf6kFSwij1G8gc1deG80p0QD3CALpXHTQU19WXMWGF9D+YhDEeSb
         mjBZWY5tFothBLTbSS+O9bRUwnWSXutc54i6gykb691qKz/dZ5G+yK9K3RdPOd3v3S5o
         xhYa26uefuvuQjoakG6oG12ENGGoK9bppdMNF2utaazibARiChcxso42U2qXMRfJSGYw
         xMwPapdYQLYRh09I1Gm8YK9pD43yrT9Xx1AXPMsMhmWEBtPTvIXLeS/Fq8EDqG0CayE8
         +3+OMgmar6mxux4G6XSfYR+orQ86m9qZ7s4Hb3V/NboO8f3tInWOnTXpFbhNlzxkPf0J
         mPMg==
X-Gm-Message-State: AOAM531c7Ohs9LmlQWsAQoS40Kf7n3S9T1k/zNBsUuVWURouuIPiuZx5
        tFOKkBSXDSZvzKN8s0CK1QhylTqyUhn7LLWA0ag=
X-Google-Smtp-Source: ABdhPJwpIAkKNjLf2vx9eVQNWH+HzzufKSeCghOiKW6+XXOeiLmDa9rFRoRAe5/z8iyPTTrjlO3oVJPvxYI2npLP6/I=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7ac6:: with SMTP id
 v189mr870163ybc.485.1629159679127; Mon, 16 Aug 2021 17:21:19 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:21:03 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 1/7] MIPS: replace cc-option-yn uses with cc-option
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to pursue removing cc-option-yn.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/mips/Makefile          | 44 ++++++++++++++++++-------------------
 arch/mips/sgi-ip22/Platform |  4 ++--
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index ea3cd080a1c7..f4b9850f17fa 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -58,9 +58,7 @@ endif
 
 ifdef CONFIG_FUNCTION_GRAPH_TRACER
   ifndef KBUILD_MCOUNT_RA_ADDRESS
-    ifeq ($(call cc-option-yn,-mmcount-ra-address), y)
-      cflags-y += -mmcount-ra-address -DKBUILD_MCOUNT_RA_ADDRESS
-    endif
+    cflags-y += $(call cc-option,-mmcount-ra-address -DKBUILD_MCOUNT_RA_ADDRESS)
   endif
 endif
 cflags-y += $(call cc-option, -mno-check-zero-division)
@@ -208,31 +206,33 @@ cflags-$(CONFIG_CPU_DADDI_WORKAROUNDS)	+= $(call cc-option,-mno-daddi,)
 # been fixed properly.
 mips-cflags				:= $(cflags-y)
 ifeq ($(CONFIG_CPU_HAS_SMARTMIPS),y)
-smartmips-ase				:= $(call cc-option-yn,$(mips-cflags) -msmartmips)
-cflags-$(smartmips-ase)			+= -msmartmips -Wa,--no-warn
+cflags-y	+= $(call cc-option,-msmartmips -Wa$(comma)--no-warn)
 endif
 ifeq ($(CONFIG_CPU_MICROMIPS),y)
-micromips-ase				:= $(call cc-option-yn,$(mips-cflags) -mmicromips)
-cflags-$(micromips-ase)			+= -mmicromips
+cflags-y	+= $(call cc-option,-mmicromips)
 endif
 ifeq ($(CONFIG_CPU_HAS_MSA),y)
-toolchain-msa				:= $(call cc-option-yn,$(mips-cflags) -mhard-float -mfp64 -Wa$(comma)-mmsa)
-cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
+ifneq ($(call cc-option,-mhard-float -mfp64 -Wa$(comma)-mmsa),)
+cflags-y	+= -DTOOLCHAIN_SUPPORTS_MSA
+endif
+endif
+ifneq ($(call cc-option,-mvirt),)
+cflags-y	+= -DTOOLCHAIN_SUPPORTS_VIRT
 endif
-toolchain-virt				:= $(call cc-option-yn,$(mips-cflags) -mvirt)
-cflags-$(toolchain-virt)		+= -DTOOLCHAIN_SUPPORTS_VIRT
 # For -mmicromips, use -Wa,-fatal-warnings to catch unsupported -mxpa which
 # only warns
-xpa-cflags-y				:= $(mips-cflags)
-xpa-cflags-$(micromips-ase)		+= -mmicromips -Wa$(comma)-fatal-warnings
-toolchain-xpa				:= $(call cc-option-yn,$(xpa-cflags-y) -mxpa)
-cflags-$(toolchain-xpa)			+= -DTOOLCHAIN_SUPPORTS_XPA
-toolchain-crc				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mcrc)
-cflags-$(toolchain-crc)			+= -DTOOLCHAIN_SUPPORTS_CRC
-toolchain-dsp				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mdsp)
-cflags-$(toolchain-dsp)			+= -DTOOLCHAIN_SUPPORTS_DSP
-toolchain-ginv				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mginv)
-cflags-$(toolchain-ginv)		+= -DTOOLCHAIN_SUPPORTS_GINV
+ifneq ($(call cc-option,-mmicromips -Wa$(comma)-fatal-warnings -mxpa),)
+cflags-y	+= -DTOOLCHAIN_SUPPORTS_XPA
+endif
+ifneq ($(call cc-option,-Wa$(comma)-mcrc),)
+cflags-y	+= -DTOOLCHAIN_SUPPORTS_CRC
+endif
+ifneq ($(call cc-option,-Wa$(comma)-mdsp),)
+cflags-y	+= -DTOOLCHAIN_SUPPORTS_DSP
+endif
+ifneq ($(call cc-option,-Wa$(comma)-mginv),)
+cflags-y	+= -DTOOLCHAIN_SUPPORTS_GINV
+endif
 
 #
 # Firmware support
@@ -277,7 +277,7 @@ ifdef CONFIG_64BIT
     endif
   endif
 
-  ifeq ($(KBUILD_SYM32)$(call cc-option-yn,-msym32), yy)
+  ifeq ($(KBUILD_SYM32)$(call cc-option,-msym32), y-msym32)
     cflags-y += -msym32 -DKBUILD_64BIT_SYM32
   else
     ifeq ($(CONFIG_CPU_DADDI_WORKAROUNDS), y)
diff --git a/arch/mips/sgi-ip22/Platform b/arch/mips/sgi-ip22/Platform
index 62fa30bb959e..fd8f1d01c867 100644
--- a/arch/mips/sgi-ip22/Platform
+++ b/arch/mips/sgi-ip22/Platform
@@ -24,8 +24,8 @@ endif
 # Simplified: what IP22 does at 128MB+ in ksegN, IP28 does at 512MB+ in xkphys
 #
 ifdef CONFIG_SGI_IP28
-  ifeq ($(call cc-option-yn,-march=r10000 -mr10k-cache-barrier=store), n)
-      $(error gcc doesn't support needed option -mr10k-cache-barrier=store)
+  ifeq ($(call cc-option,-march=r10000 -mr10k-cache-barrier=store),)
+      $(error $(CC) doesn't support needed option -mr10k-cache-barrier=store)
   endif
 endif
 cflags-$(CONFIG_SGI_IP28)	+= -mr10k-cache-barrier=store -I$(srctree)/arch/mips/include/asm/mach-ip28
-- 
2.33.0.rc1.237.g0d66db33f3-goog

