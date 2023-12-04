Return-Path: <linux-mips+bounces-501-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0A8031E9
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA4EDB209AF
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D813222F10;
	Mon,  4 Dec 2023 11:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR0thcYr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68322EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2163FC433CC;
	Mon,  4 Dec 2023 11:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691078;
	bh=FOVbSQK19msCaYkNFzSQgPAl8qoB4jWxxmWQ3PGAOHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sR0thcYrUbsQ81aSgyW9X34S+S406cMGfLPksDNE5BQc8zRtMCvJLbelJcKJRa3LW
	 3aIFLaU3XXTNT3EMelhYUu7Tx44s1DI61JZa2x/5a4zeqhiDO2FxtTZZnv6bCyqywf
	 LhP0vtQ5KMKCDsTtKEWG8WL0Ef1wQToiUnGITW2HCmBzK3do0dN0Gzag5E/HaXZD2w
	 OEy3IgT8o3ULCPev3H1kOf1Dm+GuIXhLRY2rTxA94ZKQEv37914w61CPaMMpD1D8eq
	 O7YkFCmX8zHGZaFr3e9edlZDXjV/zk9fXrBHb093MCJTrRzPevk1t3LNdVuu2lhmZz
	 OJm3OfOtBMqdg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 20/20] mips: kexec: include linux/reboot.h
Date: Mon,  4 Dec 2023 12:57:10 +0100
Message-Id: <20231204115710.2247097-21-arnd@kernel.org>
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

Two functions are provided for kexec, but the mips implementation is
missing the corresponding #include statment:

arch/mips/kernel/machine_kexec.c:136:1: error: no previous prototype for 'machine_shutdown' [-Werror=missing-prototypes]
arch/mips/kernel/machine_kexec.c:152:1: error: no previous prototype for 'machine_crash_shutdown' [-Werror=missing-prototypes]

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/kernel/machine_kexec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/machine_kexec.c b/arch/mips/kernel/machine_kexec.c
index 432bfd3e7f22..4e3579bbd620 100644
--- a/arch/mips/kernel/machine_kexec.c
+++ b/arch/mips/kernel/machine_kexec.c
@@ -8,6 +8,7 @@
 #include <linux/mm.h>
 #include <linux/delay.h>
 #include <linux/libfdt.h>
+#include <linux/reboot.h>
 
 #include <asm/cacheflush.h>
 #include <asm/page.h>
-- 
2.39.2


