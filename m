Return-Path: <linux-mips+bounces-4455-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A75B6939D5A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 11:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 516141F22CE1
	for <lists+linux-mips@lfdr.de>; Tue, 23 Jul 2024 09:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B6714D2BF;
	Tue, 23 Jul 2024 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="OE5TaDbs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jPxibuab"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D44914D2BD;
	Tue, 23 Jul 2024 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721726157; cv=none; b=kKlYiUKXv2K9Y0NrG2Xl7ZtUP0ZxCIGRWDgA2BezLzT+ANvhNUW7HtVPSuEI3QSEFA+JLoL/bCPP1+yWyoZQpZzKOlr1DMCx1FZVKEg7aBrbvhL2pKGYCzrA3ScjU8kQZHYIfxe6baOYs00Ib25q8yD5xzzm/YHSwIEK/AvQeug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721726157; c=relaxed/simple;
	bh=mROYaCllljLDe6KGxHnovReLJUhId6M0dmLIG9l0n0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ayCwo+tRHPnniEXaOfsqZZXqwO3s7E9Kz6wDIUkjlH1kEvAPea9SGU5dseuCbkDLXdJ+bTULD4zK1+BBtezemu2SenkTIspDuCQdLWnRQjm1M/mK6Rjr+kOfT3L4O7fv2q16LorkaGUQcAh2YXsw5ZHMjgIOo8QS+dlKF0dNe0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=OE5TaDbs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jPxibuab; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8FE8B11403DB;
	Tue, 23 Jul 2024 05:15:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 23 Jul 2024 05:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1721726154; x=1721812554; bh=tD
	qMYLk9bvSzGB4EmLXkD24mybY+SdczVkc8SGPEb44=; b=OE5TaDbsaJ0dv3+rnd
	aHwOimBlMGy+0kmbC8+x2nrm13rwZRIDDrTtoGvFN0eNrbnnITlxjD3DqDFv0h8M
	VTowhflMyqvL59fJiHhSZb5fc0r49kIgnBnEKDE2Tb4qR4qsxaJUTTS3VD/T3f6m
	JXuo8hOa0evvC2r468Sv881AD5/qWYAZD3Nl2OOMbQvZ6KePC5yhHdia3Qw6DboG
	VjZRJCPlm7NNgfHBD2WuGtaA01pkuV+lRbn6cVwcbOP+ELk3eyO8zUPWTs1yfBsT
	PQ04dCjHRPuPt9ssc6sOQYbL47o22NLl8uc1EEpouSKv6hOLhB17PDR3E1A+y0t0
	z/MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1721726154; x=1721812554; bh=tDqMYLk9bvSzG
	B4EmLXkD24mybY+SdczVkc8SGPEb44=; b=jPxibuabEJpcgYzDEf1fDBcNdeWdH
	WDsLQbYLHSUKnEppzfABOOyc4u16WO3Ef9cAKwRj2ENkDRDDJz1CRCRyTjhGaOvU
	umtlr8xyQU4wc+Argm8dPuOm+e7FErOmQxqrgqwCwyO6jlfIWYcfNkIdjbHxQ8Sd
	g/uGr81et/38DzkVg9VactOT6MN75tByb5xPPhCJG1uJJsgX+LM2isa2TH3gJ0ZL
	jK0uV+blDlRsBLqreWY+WPVXUf2V8TQWEmZHTmrkkKG+AfT6atNSP9PCM27Px5if
	AtTsrtTOEL6iuAL9QEr7/c+TxgPQUN9QQkFr9J2Vvs/rbKfJUrrqGaIug==
X-ME-Sender: <xms:ynSfZtq4fXBzjzBv8rpGUrOHppXNRzLJR17HUkRiW2YOH4GiV0kvbw>
    <xme:ynSfZvqsiZbDYiULVM_NcKnuDn8wBK6D5KRb47oaq9mlbGcqyJ_pTAFkXMS8r4kON
    -G3UrpfMVf0LAZoV4c>
X-ME-Received: <xmr:ynSfZqOa3wME0Ke0ciBvOQyX2p8YPxfLyojqO2a3VkodWkEquGo2_eelXlhAE7Zir0c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheelgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfhirgiguhhn
    ucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtf
    frrghtthgvrhhnpeffteeugeektdfgjeevuedvgffhgedtvdfghedugefhgeehteeuudeh
    udevjeethfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthho
    pedt
X-ME-Proxy: <xmx:ynSfZo61SrhzKxsvWEPiLH28jSwoxonpBceqSBMdcJPRzsxggo8O8w>
    <xmx:ynSfZs6lGFazHS_VS9E3DJP-6IzbVRpi2WoNlY8EYxmWeRT6L5ItyQ>
    <xmx:ynSfZghJRMxHiDnYxxVZHu9Cjcb1gL5qEiAHqV5yzofbBgUsFNT0rw>
    <xmx:ynSfZu7ZrQiaZflbo4LJdEYK1w8iy-LiM8YDhjRdCTWps7Ae21qCZw>
    <xmx:ynSfZmSRd7omp1SFrWzOBEH1p_sMscpE4uWZ7ONzRHz8Rf7geINUM6qE>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jul 2024 05:15:51 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Tue, 23 Jul 2024 17:15:44 +0800
Subject: [PATCH] MIPS: Loongson64: Set timer mode in cpu-probe
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240723-loongson-exttimer-v1-1-974bef8c2f88@flygoat.com>
X-B4-Tracking: v=1; b=H4sIAL90n2YC/x3MQQqAIBBA0avErBPULKOrRAvLyQZKQyWC6O5Jy
 7f4/4GEkTDBUD0Q8aJEwReIuoJlM94hI1sMkkvFtWzYHoJ3KXiGd850YGRCzapHbWxrOyjdGXG
 l+3+O0/t+FyovMmMAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=mROYaCllljLDe6KGxHnovReLJUhId6M0dmLIG9l0n0Q=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrT5JccPX0q4anrDnd+rS4NbSdEunVU2c31PSSKvkZfhu
 j0TL5R3lLIwiHExyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwETCPzIynLda4ezFki39vTZP
 vzDtEHvtlo8H+9aHJrt2OLbNuPHmBcP/yODzyZanJK/I1uTMP/PveFoaZ+SUmtlxqfFLnvAHHbT
 hAgA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Loongson64 C and G processors have EXTIMER feature which
is conflicting with CP0 counter.

Although the processor resets in EXTIMER disabled & INTIMER
enabled mode, which is compatible with MIPS CP0 compare, firmware
may attempt to enable EXTIMER and interfere CP0 compare.

Set timer mode back to MIPS compatible mode to fix booting on
systems with such firmware before we have an actual driver for
EXTIMER.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
Please take this patch via fixes (or second 6.11 PR) tree so it can
reach stable faster.

Thansks!
---
 arch/mips/kernel/cpu-probe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index bda7f193baab..af7412549e6e 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1724,12 +1724,16 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		c->ases |= (MIPS_ASE_LOONGSON_MMI | MIPS_ASE_LOONGSON_CAM |
 			MIPS_ASE_LOONGSON_EXT | MIPS_ASE_LOONGSON_EXT2);
 		c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
+		change_c0_config6(LOONGSON_CONF6_EXTIMER | LOONGSON_CONF6_INTIMER,
+				  LOONGSON_CONF6_INTIMER);
 		break;
 	case PRID_IMP_LOONGSON_64G:
 		__cpu_name[cpu] = "ICT Loongson-3";
 		set_elf_platform(cpu, "loongson3a");
 		set_isa(c, MIPS_CPU_ISA_M64R2);
 		decode_cpucfg(c);
+		change_c0_config6(LOONGSON_CONF6_EXTIMER | LOONGSON_CONF6_INTIMER,
+				  LOONGSON_CONF6_INTIMER);
 		break;
 	default:
 		panic("Unknown Loongson Processor ID!");

---
base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
change-id: 20240723-loongson-exttimer-14b48e7ad5d6

Best regards,
-- 
Jiaxun Yang <jiaxun.yang@flygoat.com>


