Return-Path: <linux-mips+bounces-1934-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FEA86CDA9
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 16:54:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C84A1F224DD
	for <lists+linux-mips@lfdr.de>; Thu, 29 Feb 2024 15:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F5615E5B7;
	Thu, 29 Feb 2024 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKrP2moq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6569915E5B2;
	Thu, 29 Feb 2024 15:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709221767; cv=none; b=cz/WFO3mdQbDXq4uu0A2Px8GXBz6SayYzoOmOajUWfXoPwhRTOG1qRK9tEnetU3A689BsjDeroxHTYLaTah+SBMGNGWimvEh2Qr3qTr9wI1l+cLTdaujyQt0b2Gmb/Xj3fGpCFfo4jK9J91mju+q6dOUKzF6+JTSI+/AIK1kxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709221767; c=relaxed/simple;
	bh=YPRtis0IXaoNDc9pCeoWs6Weo9a+oWw+h2fuU+s0gXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mD3x4pBdpZwSbpCblgaY6dYEb0zIFN1OtCCV7B2NjGpnaP6jexqlLsFhYblxLvQfc6XGRcv9otxvoS8fihFA/eAF1HOgwYlj5uF8/8FUBDxmLgwNWR+brBGp/vGhA/ICZp7YkCqzw3xs3iiSfjgWQiOt04X1kZAHPg41drutMq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKrP2moq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166AAC433B2;
	Thu, 29 Feb 2024 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709221767;
	bh=YPRtis0IXaoNDc9pCeoWs6Weo9a+oWw+h2fuU+s0gXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iKrP2moqEyQQ0TfsR7hP8kkGKj1D5msl3YGz3CuYX3Ehd1HQTkR+/GQLkuME22aUv
	 1feskNvAOBckhjvl1/sQ/ggZlERntLwQW0GD7xmPTt6BPo0ziulkD4rZSRkajslJIz
	 wRcoP9cTyZbhg03DZlp006rLMxFdpNUwDRRn50tO3r7g9extVdtFj6WGQWW34QLpaU
	 Kd84D0ivi1P4+GZ+VlidkAjbSBljdj6d1W4UPrvkwgX7EfAbEsy5iHLq96gORFfxNA
	 yYlEDnpbwQU9DDNUsEEKo8WBlg/33iaqEPGBuElAWmtF7swoyUmMGDfVQMODTEHm+K
	 rx5K/2L2hYE7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	oleg@redhat.com,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 19/26] MIPS: Clear Cause.BD in instruction_pointer_set
Date: Thu, 29 Feb 2024 10:48:38 -0500
Message-ID: <20240229154851.2849367-19-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229154851.2849367-1-sashal@kernel.org>
References: <20240229154851.2849367-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.6
Content-Transfer-Encoding: 8bit

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

[ Upstream commit 9d6e21ddf20293b3880ae55b9d14de91c5891c59 ]

Clear Cause.BD after we use instruction_pointer_set to override
EPC.

This can prevent exception_epc check against instruction code at
new return address.
It won't be considered as "in delay slot" after epc being overridden
anyway.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/include/asm/ptrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index daf3cf244ea97..b3e4dd6be7e20 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -60,6 +60,7 @@ static inline void instruction_pointer_set(struct pt_regs *regs,
                                            unsigned long val)
 {
 	regs->cp0_epc = val;
+	regs->cp0_cause &= ~CAUSEF_BD;
 }
 
 /* Query offset/name of register from its name/offset */
-- 
2.43.0


