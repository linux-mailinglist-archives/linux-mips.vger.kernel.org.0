Return-Path: <linux-mips+bounces-14665-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBztEQOsDmr6AwYAu9opvQ
	(envelope-from <linux-mips+bounces-14665-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:53:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A4C59FB8A
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18AB2303B735
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 06:53:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E10B395ACB;
	Thu, 21 May 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wUrAzzdR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z6b8T3PW"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80D385D93;
	Thu, 21 May 2026 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779346403; cv=none; b=RZW78nnxyQSSdzXmtOR/UHteOXN8xZloBlRME5Oc17NX/U+vqPb9MCpj4BysiWv1dKGf5iIYnnodYvUNNyJUNXISnqsNXwt4KknUGdex9nRkUNBBdlG1C2goDaJH8ZsFi8vaBD+8RrllsITdnCm3Uc1ZzH3vDubH33gok92n07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779346403; c=relaxed/simple;
	bh=2Rhl6KhXOzAWSyrFsPC5B2D8s8CUrLEMqaxta4InEX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMX18ZCljRAfv9u2x+hYRxpOyMGuExUbY4AdHbbLXEMzojeVYmt1/OQQQcp6dt+XrsNr1+kElOMEd1lbCr4UbAY2yYdoW/1vNwyF/n6ZOI99Ei4Zn/Wvn9IU98MadIsGk8osCU9ohugHq4qQ92YrMbPlQ3qYpS/fGokAJkt14iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wUrAzzdR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z6b8T3PW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779346400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Svw1+W0VEOuo1iCigxaI1rSxxspHZtHWaoeRgwTpz40=;
	b=wUrAzzdRMLWPUmEGsoD+9Nu3durxRrIcYHa5Sxh6tvVvllTPUwgKtNN7jhBWtpF92n7Vii
	4HMuh9LblippOU6dOvnM40c1ObNAzpaCWkMSD9dHDC0os4nHJ/QJIeAbPhy5X9leaUsTQ7
	1623T9Gs/e1X6GARgd8CgG3ip/K5kooyzFowWoiyv+ADsxS5OLC6hJbT0yxfdpWAFbto2e
	72jyS7gqNt+aMHEEN3sevSY0ZWdHHTDotb8Skh2FBtfz7nW3YD5a35qPw4kytFF0lYOEvn
	/smqxDboygOmqgfuYvIXBVVuenmfkirR6gFUnaiDMnty/PoUj+drrfEkSuRGjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779346400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Svw1+W0VEOuo1iCigxaI1rSxxspHZtHWaoeRgwTpz40=;
	b=z6b8T3PWxYjxsCCs+OWtkqhRm4eImnD+jD2TXra/+1+T+CCPEU4t+GpH5csS/IaS6++Wur
	2OQQRTct9mK2NqDw==
Date: Thu, 21 May 2026 08:53:17 +0200
Subject: [PATCH 3/9] MIPS: Introduce Kconfig MIPS_GENERIC_GETTIMEOFDAY
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-vdso-mips-kconfig-v1-3-2f79dcd6c78f@linutronix.de>
References: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
In-Reply-To: <20260521-vdso-mips-kconfig-v1-0-2f79dcd6c78f@linutronix.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779346397; l=1327;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2Rhl6KhXOzAWSyrFsPC5B2D8s8CUrLEMqaxta4InEX0=;
 b=jj1zCb1zeSR2FBJed73F5dnKJlFdAW8RRbh8qAvLUkHFwYFN+1e/Ki5Itxgy88g0oilWxsezw
 1id0KswTVeDDlUaYYzngQRtNzOAq9n25TBnC7PJIWLVhe3H2rHMltvh
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14665-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linutronix.de:email,linutronix.de:mid,linutronix.de:dkim]
X-Rspamd-Queue-Id: E7A4C59FB8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The logic to enable the generic vDSO Kconfig symbols is about to become
more complex.

Introduce a new helper symbol to keep the configuration readable.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688..af610af7ed08 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -38,7 +38,6 @@ config MIPS
 	select GENERIC_BUILTIN_DTB if BUILTIN_DTB
 	select GENERIC_CMOS_UPDATE
 	select GENERIC_CPU_AUTOPROBE
-	select GENERIC_GETTIMEOFDAY
 	select GENERIC_IRQ_PROBE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_ISA_DMA if EISA
@@ -51,7 +50,6 @@ config MIPS
 	select GENERIC_SCHED_CLOCK if !CAVIUM_OCTEON_SOC
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_IDLE_POLL_SETUP
-	select GENERIC_TIME_VSYSCALL
 	select GUP_GET_PXX_LOW_HIGH if CPU_MIPS32 && PHYS_ADDR_T_64BIT
 	select HAS_IOPORT if !NO_IOPORT_MAP || ISA
 	select HAVE_ARCH_COMPILER_H
@@ -3170,6 +3168,11 @@ endmenu
 config MIPS_EXTERNAL_TIMER
 	bool
 
+config MIPS_GENERIC_GETTIMEOFDAY
+	def_bool y
+	select GENERIC_GETTIMEOFDAY
+	select GENERIC_TIME_VSYSCALL
+
 menu "CPU Power Management"
 
 if CPU_SUPPORTS_CPUFREQ && MIPS_EXTERNAL_TIMER

-- 
2.54.0


