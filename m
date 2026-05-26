Return-Path: <linux-mips+bounces-14779-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDUnIobOFWqwcAcAu9opvQ
	(envelope-from <linux-mips+bounces-14779-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:47:02 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F455D9FF2
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AFBD0307F4F8
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12913D6469;
	Tue, 26 May 2026 16:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBnriCJs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fU+tdP0c"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB43D412B
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813662; cv=none; b=qp9EheAR65DMF8eA8RQPEAqu2LGoa8fvazOcuI+zWYAI4mFUNwuHyRA/zFPdlFy7L2BbNaslWyzFlY8DA0HSeA+opqTp2z3dEnjbM9qd+3b7GEE2oxv16LiT9qTISV8sqK/6hqbtNeQ6q9/GmpervI3bmREo9uiVcVfPMWjYCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813662; c=relaxed/simple;
	bh=KDgfA9NJVtZOCSJDkjVA36L9fao2alrfopyPw6MH3bI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CMY6Uyl7MGs3TBJi9ipwftD1Ix686rAdY+/yoZMiHbzmOiZ4s+ggp165niBH0tdP9PIcBvvr/QM2w7IL/QnUFHZkdBgufGrW4D25YlL7R/DR8lV/lKEg+KnQHu2U9pzMnESi0YXlBaNQiFX4FBB0LHkDeXTlIlzkcB5gemdUlls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBnriCJs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fU+tdP0c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QFlQU82901968
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYfZL0b6m9bBSQL/bhrwbJ+Cos/NeA7E5q0W+G8V86I=; b=lBnriCJsE99nCe/B
	YF2qF0TMMIpo5FtWzcgYA7r0LYDg/iEBascgcsCMz4d5v3xogeAC3zFoy7s0iMBN
	u/1vvLmbVWt2RM///J2U9DPAyzMaop1B7+fSDOBD2NqCnCLMqlmtQAyzZAC6jhA9
	OiwvGE79ivptrRc/kOYJ5nTR1kI9SpwRns6SNS5BY1iKJzz9Ha2UsQMeKQu+HQpe
	BxWDxGvxR5+h2vMiKlBkiAgSZXJBd2zF5L4qz0gx3UNQwvt+A75GTvHrN8QyVmsk
	lJIU9f3daQtAsBFHwf96i8AexUPZKdF2ykUYwiu7YTHDKGk59DQVrz8OI+fF4kok
	wrfZUA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edeff09hf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516458449d4so66006091cf.1
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779813659; x=1780418459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYfZL0b6m9bBSQL/bhrwbJ+Cos/NeA7E5q0W+G8V86I=;
        b=fU+tdP0c3llrgmCU/ScuEiYsvmXHX7NrFsgRaAXkFKDNn1r8SqQvfb7a+7XAv9ENaX
         dK64fFJmRd14I3t/+3WlbbOLuMsypLkwFZrgHhf03JRrQgyDX73I3iTUjpX4zbtqGQb/
         GpYx7wNepFdihdEZLhRNLM7Lv/3NLYeEnhhrR5RYnqHteKTBPdIMR5PPnimZBs/yy8oV
         8h1I2ToUeYMXgHIL1RGtc7NtkrVMunWfB4Z+vQ4LIyPGuV0Tvy0M4PKq1d456zLWV6AJ
         tzo4T4jrfbW/ZFmIhHUVeUg3HgRIvFpx2tf2PC8ni8xmGnFzQa0eC+aah7JrRmpT/wW/
         QIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813659; x=1780418459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OYfZL0b6m9bBSQL/bhrwbJ+Cos/NeA7E5q0W+G8V86I=;
        b=Mk1jXXg5fchdNM6BsJFHft6yRoafOOMQekWn0+I59HqFtqbpUpzhVZY+uAEGpSa9PW
         mrWhq/QUmA5XAFSdxML1ifCSxHqq9CqfhzYIbDN16cFQ1afyJZHScEtJ0EWA8jSxbwl7
         VD22f4MPjOc/tQ2qDZw9vzXlLTc4S4XtxjmyWnuzCaqBKX6zCBRlZmvu1Boi5qirHccm
         wjiSQ7xgD0WwQ9vEn1j3s2cIr+eSHk7Xs3jXXmI3M+h6b2+toXHh1rYl98XaxDwuv49w
         zgAV/jphneU2SBVhHVkRbbxxh7Q3cYogFQI7OQ4pjf2kSiYPAAmR3rzz4tK/eYpWTbgg
         vSCg==
X-Forwarded-Encrypted: i=1; AFNElJ9NlziLgz8VgGUuwgnOJ+6MjB19ImezkMJlRTSYkNMY7Xyejthyif+3csmFOaI2PNyTgVQCE/XGFjCd@vger.kernel.org
X-Gm-Message-State: AOJu0YxmgYp3ng3aqgGLa/k5loRCJjldlKwN1mxtwJ9kXONOqS4v4CCH
	a+rXhSns3dt5hxictXSmeEmznIKE7QIcrrSeQKqQCuWHw6PYwIv1WSibRYEZiH8d20v0z1W0MLD
	1Q+eXSDam7R9X/6nYujt4J7nkGxkrOUPxI/tbiLil7E+JGPwG2Cid6M1uLaYKOXzx
X-Gm-Gg: Acq92OHkxJT7xPQShMMMdc6wFVctodkt5zm5PDWwVl+16USA7ZQuYYSzoVon0LOU+NT
	ZmJ/ze0qMB8qgGa0Zhr2n/jaTdpc/2AQruC9cLH9siB0AETwFaA7HtYLDbrz5Fd6w8bfyLebtVb
	psayZg6Vw/ZJiKJN+4RXEseaI6RslBxsl5tSxn9MhyTLwRD3eGn5foOGO3bOrZ+qLMHfEcSX2Z5
	vuV4GvkHbe1fzW7DSqBueVKFC6RUWt8pKwBRfuGCwNCs3iz6UZx9qDfM2NqVszFVU/fKAAjahJK
	d15dMUWoByTmBW5KZ/g8gmeSB7VCWBwB+qVwRuq57tvU7xjC86CCtPxKV91JfFcNcxLCrucdL+i
	MX21VoV+aOxhIxmsC0A7Cnp2e7b77h0oO6XbAIpIzbR64XDKZW+I=
X-Received: by 2002:ac8:7d0b:0:b0:516:d70e:32e1 with SMTP id d75a77b69052e-516d70e35b5mr261529291cf.2.1779813659010;
        Tue, 26 May 2026 09:40:59 -0700 (PDT)
X-Received: by 2002:ac8:7d0b:0:b0:516:d70e:32e1 with SMTP id d75a77b69052e-516d70e35b5mr261529001cf.2.1779813658588;
        Tue, 26 May 2026 09:40:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c518:e53b:f5c3:921d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm35605880f8f.20.2026.05.26.09.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:40:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:40:35 +0200
Subject: [PATCH v3 4/6] MIPS: alchemy: db1000: use nodes attached to GPIO
 chips in properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-gpio-swnode-alchemy-v3-4-2aaa1238ae4a@oss.qualcomm.com>
References: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
In-Reply-To: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3791;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8KDmwMLOlYAs4XDgs6J+fzejIAXw+erYtv5ijM3IQEg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFc0PtEjpvAusMd4ksZNmq4x3dVS/r77k0P946
 qAQxwx4xNqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahXNDwAKCRAFnS7L/zaE
 w7/mD/95HvJjPdD87xIv/Qc47mG/xq3jiS4pjYkBwNaZ5E/GO/yepllCvaG3R6k1EfkS5AsICzq
 7rAKueRQUY+FiEvRGteVfKSlJe9uSaV/gq8E/O0ns8oF7BvA9bArsisTPvB8KYDJnjgLCPQfKYs
 G41y2AX908BXk9QLMe9G3ssrTYXMXNkhvzWKqhbTkvYz/VpIpgLC8u48YmjRnH5Wlc0s5GLozBm
 hXfESaB0W4ASMolHE0Es9Gw0VqTsEjDyIayPTyhgezICRNS+bjknbmwp72/rVco0DJSmIg9j+N2
 4cMxSu5qDU5UbIJTB4tlx0Qw5rVF9E7XgwLLe7Y4qDvFsEc3TzbSvVgY3UN6HktMUev0/X3iFqx
 QlS/LxgZwrmcqcreTLFUV39NmOeXp0oOl6fBDSlB5tXwZN3yPNBI6Vciv8cKxX5VbLZAcKD7MsL
 XoD4N3ZpkyxRZp5ZoYuwD1j1eSGy+4gP9Pwlrq+kXyXJKipxbPCiWhRRnoAi40znjtFcA+0e6OR
 e5Aab1YWYyzhke4ah+nTYfnVseTawaNCdfZoqY5UeOmrCGyxcxdZlQk3iQi88prLWnwKAJMNRAw
 mFqQCzHFhLibNdSi8betTLfnTdURgXQaaJZBpU3kkqGpu9Cmzig4ForjLnigIAI0EhB9UoubZb4
 GzZ0g6M/1ZVZI/A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ONEXGyaB c=1 sm=1 tr=0 ts=6a15cd1b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=hCAPRvFqaSTltk-sYtAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: Zk6PZJKqRuD1ADp_Tha65S_iaYwEK_P9
X-Proofpoint-GUID: Zk6PZJKqRuD1ADp_Tha65S_iaYwEK_P9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NCBTYWx0ZWRfXyLuhSfwAN5WE
 3xdqdlB8844E+CE5Of7JywLKztDUL3QAs6xj4z0I4pxS4uyYwHvmLxxVBVbuxNodo6INoltrTXz
 iv3qvCsDSLei9mNafifkYMiVEkyyDqFz1ZPHfPeB4x8IEGcjArrZp+gM/SMFXIl8MXPL0nLtmd8
 981NDnjh+rip0yxnU2Q5/iUwvxUBYNqwHMl203oV4ncG0dPg5Zpt7FGlZIaO1/IU/jz7Mf7JGwU
 cdj7P/wAQxaVM9WLhFdGVcv0OYZtWdqV7w1LsSnSxxuYuB/VPUn1w/vBtONfJFNQlIbCRLyrQxo
 7rWlI9hhpbIRZO/i+YuUdvOtl55VA27n0JPR9iRT/K4tnYF6BbHPrR3H4imJB7zwoPeUJC5Wc88
 cTF7me+QLBUD5z0rBAhEszSjx5spq/QKOFjCutBGotUsBE+jRoreTHo3orF5ZsnTC9VaT8ZBqEp
 1UGbmJrX7/QLhQRfgWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14779-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07F455D9FF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

GPIO subsystem is switching the way it locates GPIO chip instances for
GPIO references in software nodes by doing identity matching instead of
matching on node names. Switch to using software nodes attached to gpio
chips instead of using freestanding software nodes.

Also stop supplying platform data for the spi-gpio controller since
spi-gpio driver can derive number of chipselect lines from device
properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/devboards/db1000.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 65238f14f28d61ef3eddfd571c7d61f01e7434fd..8fb24b220e3ae0f033a7786c2d1725f4df9d31e0 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -19,7 +19,6 @@
 #include <linux/property.h>
 #include <linux/pm.h>
 #include <linux/spi/spi.h>
-#include <linux/spi/spi_gpio.h>
 #include <asm/mach-au1x00/au1000.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
 #include <asm/mach-au1x00/au1000_dma.h>
@@ -377,20 +376,15 @@ static struct platform_device db1100_mmc1_dev = {
 
 /******************************************************************************/
 
-static const struct software_node db1100_alchemy2_gpiochip = {
-	.name	= "alchemy-gpio2",
-};
-
-static const struct property_entry db1100_ads7846_properties[] = {
+static const struct property_entry db1100_ads7846_props[] = {
 	PROPERTY_ENTRY_U16("ti,vref_min", 3300),
-	PROPERTY_ENTRY_GPIO("pendown-gpios",
-			    &db1100_alchemy2_gpiochip, 21, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &alchemy_gpio2_node, 21, GPIO_ACTIVE_LOW),
 	{ }
 };
 
 static const struct software_node db1100_ads7846_swnode = {
 	.name		= "ads7846",
-	.properties	= db1100_ads7846_properties,
+	.properties	= db1100_ads7846_props,
 };
 
 static struct spi_board_info db1100_spi_info[] __initdata = {
@@ -405,32 +399,26 @@ static struct spi_board_info db1100_spi_info[] __initdata = {
 	},
 };
 
-static const struct spi_gpio_platform_data db1100_spictl_pd __initconst = {
-	.num_chipselect = 1,
-};
-
 /*
  * Alchemy GPIO 2 has its base at 200 so the GPIO lines
  * 207 thru 210 are GPIOs at offset 7 thru 10 at this chip.
  */
 static const struct property_entry db1100_spi_dev_properties[] __initconst = {
 	PROPERTY_ENTRY_GPIO("miso-gpios",
-			    &db1100_alchemy2_gpiochip, 7, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 7, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("mosi-gpios",
-			    &db1100_alchemy2_gpiochip, 8, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 8, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("sck-gpios",
-			    &db1100_alchemy2_gpiochip, 9, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 9, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_GPIO("cs-gpios",
-			    &db1100_alchemy2_gpiochip, 10, GPIO_ACTIVE_HIGH),
+			    &alchemy_gpio2_node, 10, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
 static const struct platform_device_info db1100_spi_dev_info __initconst = {
 	.name		= "spi_gpio",
 	.id		= 0,
-	.data		= &db1100_spictl_pd,
-	.size_data	= sizeof(db1100_spictl_pd),
-        .dma_mask	= DMA_BIT_MASK(32),
+	.dma_mask	= DMA_BIT_MASK(32),
 	.properties	= db1100_spi_dev_properties,
 };
 
@@ -483,7 +471,6 @@ int __init db1000_dev_setup(void)
 		pfc |= (1 << 0);	/* SSI0 pins as GPIOs */
 		alchemy_wrsys(pfc, AU1000_SYS_PINFUNC);
 
-		software_node_register(&db1100_alchemy2_gpiochip);
 		spi_register_board_info(db1100_spi_info,
 					ARRAY_SIZE(db1100_spi_info));
 

-- 
2.47.3


