Return-Path: <linux-mips+bounces-490-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 810088031DE
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 12:57:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 770811F20F6C
	for <lists+linux-mips@lfdr.de>; Mon,  4 Dec 2023 11:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC48922F1E;
	Mon,  4 Dec 2023 11:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIT8BTac"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A048F22EFC
	for <linux-mips@vger.kernel.org>; Mon,  4 Dec 2023 11:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92487C433CD;
	Mon,  4 Dec 2023 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701691057;
	bh=4ABSoMNpXusCcWYdVc/Z/1r0KMCswnYJODyq0pzAGhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WIT8BTacH9XtFOb5K998EObxet0tpmzMtldqSatFkYdP4SGnNqZBjAFqqU1HrcA5M
	 NlhZr6RXfYTWdTC+oSNYp67XxNgFeeVIlCBBw6PvI5hvaj68vJfCwIzjS1cz4PB7Q1
	 u3Es51WnXfwdvHS9HTJtmvbq4vWabWEZnA7B/9h8KbRFZrUZ2cUE3qcgXCJ0/s9XpV
	 DZkOcbSVcBAWeOoM0Ry93dLlc85Dalpjj/S9cfJ1/YQA0KuAZ036Ho834gh9QDPft/
	 9K+wjJguaXKveLxXDp8jFFPCWZS6DpfthsMRwn8HuUm5N7zCmwr9ZJSbhJmWs+0c+k
	 L55zu4Gx39PdA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mips@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Andrew Morton" <akpm@linux-foundation.org>,
	"Stephen Rothwell" <sfr@rothwell.id.au>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Subject: [PATCH 09/20] mips: unhide uasm_in_compat_space_p() declaration
Date: Mon,  4 Dec 2023 12:56:59 +0100
Message-Id: <20231204115710.2247097-10-arnd@kernel.org>
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

uasm_in_compat_space_p() has a conditional declaration but is defined
unconditionally because of another local user, which causes a warning:

arch/mips/mm/uasm.c:421:5: error: no previous prototype for 'uasm_in_compat_space_p' [-Werror=missing-prototypes]

Make the declaration unconditional to avoid this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/uasm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/uasm.h b/arch/mips/include/asm/uasm.h
index 296bcf31abb5..b43bfd445252 100644
--- a/arch/mips/include/asm/uasm.h
+++ b/arch/mips/include/asm/uasm.h
@@ -193,9 +193,7 @@ struct uasm_label {
 
 void uasm_build_label(struct uasm_label **lab, u32 *addr,
 			int lid);
-#ifdef CONFIG_64BIT
 int uasm_in_compat_space_p(long addr);
-#endif
 int uasm_rel_hi(long val);
 int uasm_rel_lo(long val);
 void UASM_i_LA_mostly(u32 **buf, unsigned int rs, long addr);
-- 
2.39.2


