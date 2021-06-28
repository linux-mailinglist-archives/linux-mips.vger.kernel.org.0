Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3CE83B6A97
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 23:50:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234967AbhF1VxD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 17:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234265AbhF1VxC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 17:53:02 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCF4C061574
        for <linux-mips@vger.kernel.org>; Mon, 28 Jun 2021 14:50:36 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id 12-20020a05621420ecb02902766cc25115so19012066qvk.1
        for <linux-mips@vger.kernel.org>; Mon, 28 Jun 2021 14:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=Efx/CmGo/FdaMXlXsMHfWQRW50yqOipsxfJJlDF/4yk=;
        b=onGcYsLRLjFf3RAH61MoUB7D2nXjgCWe6Uo9AucG/nj6RToGgTJV9SKAVeaj23m49b
         Z9Xx9WL3C/R+2LTZGTmJIal03rqc8WTNvvvPlwEmdebcKTH/cHulfl0CZ6ruIQj20Pwh
         DCcYvFm/6NYXjp/Gk8ajpJWXHcEKcy4uia8P1drzWtcG1r3AtXP5ezCe63sMPHYP/3zI
         PSOBSjHZp175jq3ECsZ46DGtU46TJa+X5L0FUtVseV1//9cvi/T4gAIVmLBOnROL3mnD
         +9+NtoWISi9kzTSXWcreeE642fRWwmBMmjs1pgF4NYvq3y9OIwRIaV8TK9OiMyth4EHn
         y1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=Efx/CmGo/FdaMXlXsMHfWQRW50yqOipsxfJJlDF/4yk=;
        b=ccFkUGILgYhVkaUwBr7ppyhfv2yZUDzeOQgu2hxsFIPhKrwe3eXQwReclCe40owPkg
         624JH701uJWCiRplwYIke8FpoYdwYW7yewObymogD7GZVR6yRxBf5fz5to1Vs7iynWDP
         S4cphNb74jkL2GCROJ+SAoXiNGyeTbltWhFTe9OK55bYvuBBzVpHX12NoTj5c3HOOGGi
         u1VlBHUTbXJL8r1Cq1XZQmA5Ckjb7c98yrbsZW3b69vWxdSvov/ZBF5qFIyEy2FL4Pdj
         GEY/4alieOeJT5G9hypyb1X8osSD7NfJHWU5PnwAdjNnr950vJIzKPrS9YOtNHMSFpH3
         3JcQ==
X-Gm-Message-State: AOAM532a/uDPHli4wIoy9p0SyiyaYOmcjdrgvKBW0QgHkUogjoGZquTu
        vZS+Ju0Nbd+uavmgyPyTdmFI4rAEMQLz/FFe8bU=
X-Google-Smtp-Source: ABdhPJy4BY4aRXNo6XdUzkLvWs4Q0JK5z6m8y+V6yIj6L4ipTZZx2DX3HKlLdGjOdxeWXqDnklp6zpSVuUvp/+yvAOE=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:6f7:d09:f550:3380])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:1383:: with SMTP id
 g3mr2924928qvz.3.1624917035540; Mon, 28 Jun 2021 14:50:35 -0700 (PDT)
Date:   Mon, 28 Jun 2021 14:50:26 -0700
Message-Id: <20210628215029.2722537-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
Subject: [PATCH] MIPS: set mips32r5 for virt extensions
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Nathan Chancellor <nathan@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clang's integrated assembler only accepts these instructions when the
cpu is set to mips32r5. With this change, we can assemble
malta_defconfig with Clang via `make LLVM_IAS=1`.

Link: https://github.com/ClangBuiltLinux/linux/issues/763
Reported-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/mips/include/asm/mipsregs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 9c8099a6ffed..acdf8c69220b 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -2077,7 +2077,7 @@ _ASM_MACRO_0(tlbginvf, _ASM_INSN_IF_MIPS(0x4200000c)
 ({ int __res;								\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips32r2\n\t"					\
+		".set\tmips32r5\n\t"					\
 		_ASM_SET_VIRT						\
 		"mfgc0\t%0, " #source ", %1\n\t"			\
 		".set\tpop"						\
@@ -2090,7 +2090,7 @@ _ASM_MACRO_0(tlbginvf, _ASM_INSN_IF_MIPS(0x4200000c)
 ({ unsigned long long __res;						\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips64r2\n\t"					\
+		".set\tmips64r5\n\t"					\
 		_ASM_SET_VIRT						\
 		"dmfgc0\t%0, " #source ", %1\n\t"			\
 		".set\tpop"						\
@@ -2103,7 +2103,7 @@ _ASM_MACRO_0(tlbginvf, _ASM_INSN_IF_MIPS(0x4200000c)
 do {									\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips32r2\n\t"					\
+		".set\tmips32r5\n\t"					\
 		_ASM_SET_VIRT						\
 		"mtgc0\t%z0, " #register ", %1\n\t"			\
 		".set\tpop"						\
@@ -2115,7 +2115,7 @@ do {									\
 do {									\
 	__asm__ __volatile__(						\
 		".set\tpush\n\t"					\
-		".set\tmips64r2\n\t"					\
+		".set\tmips64r5\n\t"					\
 		_ASM_SET_VIRT						\
 		"dmtgc0\t%z0, " #register ", %1\n\t"			\
 		".set\tpop"						\
-- 
2.32.0.93.g670b81a890-goog

