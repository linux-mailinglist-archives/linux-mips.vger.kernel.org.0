Return-Path: <linux-mips+bounces-14451-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAHREfCy+Wld/AIAu9opvQ
	(envelope-from <linux-mips+bounces-14451-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8284C91DA
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C8E1301A4CA
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC093E023E;
	Tue,  5 May 2026 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kiNyaDEs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMXFKSCJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16033D300A
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971909; cv=none; b=Q+ElSKIgabScszkPhbJQqfy4QjW6MudM96j3KSrHVjLnc3sYgH94TAYSjikALYlApBUJ9dd1pD+m8K1fbNBIARXsMYS5TCgI8Kg/XSIa3JAyDkaRuPD3p0WiZuKTg32Vue58cMfp5iCU7KE2i3TfYc5pzmfV8Rx1MyTAGD8rGGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971909; c=relaxed/simple;
	bh=M8VKYv8Tims9RPDNC221xaGJLfI+X/Qrex54RK77Qjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9WrcuHolc9flcSqHoeEb3zuXmHmozJ35O5Kr9dYLLiPLw1XyJ/Hlyx9r9ujrGJG+nqAqx5aFSUEFf6QNyna5gim1y41sa62cUb+25QPtM2laPB9b+DOVZ/TzV2D9x6a+sETu2OGut6eP2i7kMdvNf7OQxWCZ2CDspyDcX2bME8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kiNyaDEs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMXFKSCJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456lidu3187553
	for <linux-mips@vger.kernel.org>; Tue, 5 May 2026 09:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I5jy80JYHeF2BjFAE2h0JGSWCl5wFaXXTQpjOy37ZtU=; b=kiNyaDEsKagc0pQy
	Tim6QiNqY6ZQYWCUcjEVIFjOdsr/JSQXEy2RS7i/HyU5BBNRVYZ42McdoS6rsbaN
	ubQ+cEsS+/3ZFOddO4RVSSszHbEqaR4mmy9Jw9LidjEOmheuxFnhf5ZkEaSZbHLK
	IqlgtbIFP8q4R0760vU0lYGdwy72WNIreu8PTEcUoc9pAS01AI19HpKnaJCJFb55
	AchT9OHMUpO5jpbpDuKnlDBh9cfeQ5MLaTRQ5ELcMWh0ZOfjCF5S4mk4fQNZQwKF
	aMHjrz3/obGRZ9/ROwzt3tHgCyMvaaJ919PfvEzVJ51MgFzCBrvJAEj9SnhiwzHl
	iFVX8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dybkk8erm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 09:05:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d826ed6f9so135128721cf.1
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971906; x=1778576706; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I5jy80JYHeF2BjFAE2h0JGSWCl5wFaXXTQpjOy37ZtU=;
        b=HMXFKSCJHc8zsdoom9D/btgz5eZhuf4vnm6wTLNarcNwtPCFOwsztwmGcTTiY9TpyR
         U8KpYsEQjWneQJqlrygAL99EGHV+8exzPreh+dx9OqWwGjcUjjmp0P0T4vKOhD4jOufK
         OlOL6C93EYZKvkvVKy6M3I4rTjBiximiNuAS43CTZ7IoKVxZkjg+0mQNhufCgik1UPje
         YLAov+jAhtdl60Sw7in5J9UBIP5d/r4AiHRH0lzgz7fcy9TVJAWV2U9KtcPqDFDXCYZo
         8w8WLhP7dlZzxpTLJ7gWugBHjf4GKUqNOKXXDsP6UU0aAMRfMxcsIkVfN7xXVn/cZ+VK
         2AYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971906; x=1778576706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I5jy80JYHeF2BjFAE2h0JGSWCl5wFaXXTQpjOy37ZtU=;
        b=i3zTOkFrZweBtNF88xx5iZ2rbgxw8KvuvV4w8bFg8rgrxzPSk5k49WcrFvmxytOhgz
         Bij0zkfgNuNzZwbGO6z9viECtqvcqlLX04vVaqgjpM5Mco73Y+OXUA2fDDD0WVeGTDLB
         PwhfmfSl62vgg3ymCnk6oCwWP2M/mTy8Hoe1FakhdSnqpKLf+iB3uJMkK5mIOVdELCh2
         0k5Hsjss+xFD6GJdp6tspe6WHB3bvF7yqQ1X/LvAA7vtm4MwfwP15fY3ajmYKerKaOzf
         9uSXFAybBBshWZbSgjhCrXRT/eOxkiqoMLf8a+94Uzol14KGUAeXJJLKpjKZNWdpWAuT
         KSCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bGcQlgMgeEiYsT7YLJDIpwHADvlshgCjKZZLSMsbkPb2L7KeszTSzi28OP1C8FrqcO1jQ+2CJ41dg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywez1a2FsA1B96p1/3+st6W6H25VpXZNyFJrL0g8X03onn3kl3U
	MAp3wntwRTgPd0tk6e8AVuwKauAZ/RlPbJLRQWlAaowvQL9W6i7M5D6yIebaGD+tI0/eXil2lp+
	WtVZbTkX2s7FMF4vZlj8njuKz6/p9UpiBAchD2Sp1WgkLcLa1ctBXF7QFUExqTd3Z
X-Gm-Gg: AeBDievDuHmpky+kqlwkavJzAG5poNIVKNPIy7L/DTW40ozokIekEyo2tUn4vKSIEbq
	i5pc16tsYmEkJlwoyg+e7aYxMGwasLKjxKQ4c5INoz5JMlnvcMGW4y1k+QGi61eeAOokvSNOaNC
	7McKOeY9mYlSQ+0RSOSAluALqAZBDgReN5IszLvaBJ/WVsVwb3S1VdjtSyhATrQcojGjx33iEAb
	+OGPDTFi9Di5i/PQCODcMw9EHKZjkSZiPsu7L+Uex11mFMQRd3vAIZxl8xJ9uDW+xLvkR7I2aRl
	QyBwse43ouIj2azPQltSNOOrv/OxnGrbZ0GSjzCg9b6USugwWdXxUUve0rGmS2FJAsQnU2Fz4kf
	nMxvdL/Yahj3uNryz/rjMHDpcPCcXHogRupxdOXW/ZKsGZkg6ZCO/KOUkjkf/dQ==
X-Received: by 2002:ac8:7f51:0:b0:50f:ad91:8906 with SMTP id d75a77b69052e-513052ffe4amr37714031cf.20.1777971905767;
        Tue, 05 May 2026 02:05:05 -0700 (PDT)
X-Received: by 2002:ac8:7f51:0:b0:50f:ad91:8906 with SMTP id d75a77b69052e-513052ffe4amr37713691cf.20.1777971905331;
        Tue, 05 May 2026 02:05:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3276:ff51:bd0f:7f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14d1b4f6sm14133385e9.12.2026.05.05.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:05:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 05 May 2026 11:04:44 +0200
Subject: [PATCH v2 4/6] MIPS: alchemy: db1000: use nodes attached to GPIO
 chips in properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-gpio-swnode-alchemy-v2-4-cb208afc5b56@oss.qualcomm.com>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
In-Reply-To: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=aC5QVefr3ubGnFmOzf5c/QciGWESiMBn2UEMi6iIXF0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+bK2NmzEfXbN17JsrT8eOYRfDRIVfHn4pKMhu
 8JUYcYkqWSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafmytgAKCRAFnS7L/zaE
 w76GEACkoWDAx4PoSB+g8fYRG3Q/5EQkg1wtYzLhNXOvR1ehO+thh/QPI7uSQsH7NzMuio0L+Eb
 u0voXk4coGt///JbdVJKS1FS7rn8PmbE5bvzFfpGYwfwxnitNHMwFbQx6u/pk6G4Y2NlEvgDlde
 Spdg68gsC+ZICVM1hLzNTBbZ091tDIS6LANost61GsrM81X7dey1y7Lt0UYHBb9ZkPUZ+1qCvks
 p+UROV/cKLY4HZ4CcAIZzV1MkHrWbwf3SExVqFG+hOqfRBKXPTyAjcfDptxW5q50QlG4s7EVeqp
 GJtDb/DDSOYRtVGuNZiso+KZwL6CInNTRC0ADJOo+mt/v1McIk4fstmAX+jKZK95fnPYKUqDxXl
 6o49W9hSckaiYFej2u/SWFH6/lwANSp9H18hUOglLaHM5cjyUbxdzMdozRklDIb+PxXH1UjNW94
 SwuSixq5qYp58Xdq1VcgKIrCFioE/GHJJp1MAzZ5bt2Z8eE6Fjf28+9f3e2Q9Fp/wiKfM+9X3Jj
 I3u/0WpW1iNmvQzW9CIrOZOj+HK5P5WsCgyU0wNTsip3qUo/5YK6M8OQiZlStw2wG+q3JF8O7Im
 X9tgepwsJ/IBms5CYV7eQNQqT6mDPVte9BRIQ0ilY+rw5JoHUMGZBjcAXHYJsGJj1zF3WCNSdBS
 52/AKH+j4pbjL8Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MyBTYWx0ZWRfX6mtCKyFA/vR3
 5wODE9i1yEwPBBjHMjZUutlFTYQME5GrwYbHztuunTvuPtTxIm+HplVyHQn4EppW9fahlJN6g/0
 GG1f61yglwXtCcrKzGzDOdCYaZRUh+sfqo1NSHeBj0naKB54VRLhKtsYZ0pcbqP0UKvAqR/mv4m
 me3KQ0Ib1yR6pvc7Z736VqN+3nuNSMutZO6ZkeAEjc2YOFn9h3f9gRelg+ElY/PsfoTS+Tr3FSj
 A6LPC+KRmpylpc3Gr4PkHGVnRcySC8BrLiPqk9eBaMxx/uTqWTuuzAK/9vLLSNaIc78OedhHXkz
 tyVhu3yA6EVSGcOdalMrCdJipJPfsjOMvQhPpGvwiwsrhZe7e3J50pHMP2DL3nDbSdLx9PP/JjW
 HA8Rv0VnvUfey1yzRY6sQSqrkyAGQ6bPJE064tY/Gpx4cYRSFEKbEsHs8Zs/8JHLt3+oZFwBxJp
 p5R4vxoxwgLlOmFizMg==
X-Authority-Analysis: v=2.4 cv=SPBykuvH c=1 sm=1 tr=0 ts=69f9b2c2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=hCAPRvFqaSTltk-sYtAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: HDz42L_Mai_GKv5k7GiKmV0OGm94tZ4E
X-Proofpoint-ORIG-GUID: HDz42L_Mai_GKv5k7GiKmV0OGm94tZ4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050083
X-Rspamd-Queue-Id: 4E8284C91DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14451-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

GPIO subsystem is switching the way it locates GPIO chip instances for
GPIO references in software nodes by doing identity matching instead of
matching on node names. Switch to using software nodes attached to gpio
chips instead of using freestanding software nodes.

Also stop supplying platform data for the spi-gpio controller since
spi-gpio driver can derive number of chipselect lines from device
properties.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/devboards/db1000.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 65238f14f28d61ef3eddfd571c7d61f01e7434fd..a23dba3d62b7862db1baa69c3f9034a10848706b 100644
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
@@ -377,20 +376,14 @@ static struct platform_device db1100_mmc1_dev = {
 
 /******************************************************************************/
 
-static const struct software_node db1100_alchemy2_gpiochip = {
-	.name	= "alchemy-gpio2",
-};
-
-static const struct property_entry db1100_ads7846_properties[] = {
-	PROPERTY_ENTRY_U16("ti,vref_min", 3300),
-	PROPERTY_ENTRY_GPIO("pendown-gpios",
-			    &db1100_alchemy2_gpiochip, 21, GPIO_ACTIVE_LOW),
-	{ }
-};
-
 static const struct software_node db1100_ads7846_swnode = {
 	.name		= "ads7846",
-	.properties	= db1100_ads7846_properties,
+	.properties	= (const struct property_entry[]){
+		PROPERTY_ENTRY_U16("ti,vref_min", 3300),
+		PROPERTY_ENTRY_GPIO("pendown-gpios",
+				    &alchemy_gpio2_node, 21, GPIO_ACTIVE_LOW),
+		{ }
+	},
 };
 
 static struct spi_board_info db1100_spi_info[] __initdata = {
@@ -405,32 +398,26 @@ static struct spi_board_info db1100_spi_info[] __initdata = {
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
 
@@ -483,7 +470,6 @@ int __init db1000_dev_setup(void)
 		pfc |= (1 << 0);	/* SSI0 pins as GPIOs */
 		alchemy_wrsys(pfc, AU1000_SYS_PINFUNC);
 
-		software_node_register(&db1100_alchemy2_gpiochip);
 		spi_register_board_info(db1100_spi_info,
 					ARRAY_SIZE(db1100_spi_info));
 

-- 
2.47.3


