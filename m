Return-Path: <linux-mips+bounces-489-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE848031DD
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3C41F20F1C
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E6922F14;
	Mon,  4 Dec 2023 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e0b2PVdL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C18B22EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9769AC433CC;
	Mon,  4 Dec 2023 11:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691055;
	bh=SyiutF6r1lYIBhrZamcCKmSjbvADpqrs+8irYVNoqts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e0b2PVdLqrFPaIeHzatnB0JuZ9dTmwindq3FicXcUcWOKG2XetUUX+fgOaPU6zWE3
	 wwaVaQM6qkPhyo6ZQGmK8EsRLF/7hL7pe7Mo9Fzqabdq083ZidoFeptc55i4cXo8+2
	 AHLLhkPeFGeE8RjrA1GRn1pGavgJ0BAcAxWxcVvUPDaPuKG4M5CPlMg5B1FyQ/965O
	 wQZP+CGclMW5ZTGn+BC25vOJ/95gsZCnD14DJYhzyQM5xxNtrm4JoyHczPeojyb3Oq
	 CvegkX/CPWsFhq5iNEau5i6tm2sU+iKZuWikhNVwBRUSf7Rh+eM/aZzjT19MUSscWx
	 1SWSG4K+pG0XQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 08/20] mips: move jump_label_apply_nops() declaration to header
Date: Mon,  4 Dec 2023 12:56:58 +0100
Message-Id: <20231204115710.2247097-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Instead of an extern declaration in the C file with the caller, move it
to an appropriate header, avoiding

arch/mips/kernel/jump_label.c:93:6: error: no previous prototype for 'jump_label_apply_nops' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/jump_label.h | 3 +++
 arch/mips/kernel/module.c          | 3 +--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/jump_label.h b/arch/mips/include/asm/jump_label.h
index c5c6864e64bc..081be98c71ef 100644
--- a/arch/mips/include/asm/jump_label.h
+++ b/arch/mips/include/asm/jump_label.h
@@ -15,6 +15,9 @@
 #include <linux/types.h>
 #include <asm/isa-rev.h>
 
+struct module;
+extern void jump_label_apply_nops(struct module *mod);
+
 #define JUMP_LABEL_NOP_SIZE 4
 
 #ifdef CONFIG_64BIT
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index 0c936cbf20c5..7b2fbaa9cac5 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -20,8 +20,7 @@
 #include <linux/kernel.h>
 #include <linux/spinlock.h>
 #include <linux/jump_label.h>
-
-extern void jump_label_apply_nops(struct module *mod);
+#include <asm/jump_label.h>
 
 struct mips_hi16 {
 	struct mips_hi16 *next;
-- 
2.39.2


