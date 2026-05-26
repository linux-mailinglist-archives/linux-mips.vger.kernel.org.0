Return-Path: <linux-mips+bounces-14780-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNnwNuHOFWrkcAcAu9opvQ
	(envelope-from <linux-mips+bounces-14780-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:48:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D55DA0E4
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 18:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 637D83032B92
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:41:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA873D6692;
	Tue, 26 May 2026 16:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kNmjT9XO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EirfU01h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3B3D3333
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813663; cv=none; b=pmeKoXmmKPfliOEgNWra6e+nkCVFIwS/cfmROBBTXk0vnJwCZcsi9ehKbUKEhE9hod9DQd4r+iixap0hwnXU4OPzJ7HcTLsUutg8bxcP+pnIfTWlag+5ZjjgowaZg6Povg2723RmuFunqCk6p+Eql0b4zDHWvekLjkyjqW1nH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813663; c=relaxed/simple;
	bh=N0RB6AQLNrwpLK7FtcX6JFIVcikEeNv9URuiabwhcEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TTe7Q2V6wTVui9pg/Fe26drvOSlA3T+36CHSITn10QoA/g2lBk+lc5Ber6Jb/BlXnobDC51mZlvK/VlBSGRQO22kbpd7Y12Lobleo8dnM3t1KLxet9PQMzQjT/d7tWQNMUULmIaaRR6QXaXzoc7I5uzPbHU22ReJUGIgiHMk4o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kNmjT9XO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EirfU01h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QGQUG93211328
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	msLy3/nz6/x8yP3I2lLtGY6/kXl77Iaf0aU/v5oIHQM=; b=kNmjT9XOlMGvQmw7
	rhoQEMT4nTfiQW0F9q/RCoWGzkhlt5CxURCFIt/pj/yMBsxpzPBVc2TKm57bBJWu
	M+l/k9Z5TdRVLFNdd4UgXvdMtCSbQuHg74J98eoztNZ+ImRZj8mupswrYiYDQZ7j
	G56QP7yDcIEkcLWlptKiMDsIEog20FACdt+DFp744M/YHJifCGFRqiEEH24tqsRm
	SGsTEdWkWWTalXEzxN5c1PPy7XUuaByiC0k3NunoF/24MO5P2QhgLJvp8ktsmIY2
	ER//9/r3RqNNTI5GDDuMEhIXI4Hevl3p9n3VAFTEhsD5GS/iVEVnWLeUasXneT3I
	XajqrQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edf1j81te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so295476411cf.1
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779813658; x=1780418458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msLy3/nz6/x8yP3I2lLtGY6/kXl77Iaf0aU/v5oIHQM=;
        b=EirfU01hMnKCd8GoPwNAj5mE4Mzz5waqkqgetTwYBBKaHSE8g+4MU0H3Wdrp8NR2kO
         FjP76uTPs8GdFy+CCIgFGYwqSVPabL7dXmCdD7zSqabRIFcB9kiaPGjrO9Cq5aOxQi0x
         mZCznAPiOHA6d7Vhenf+DD9hgv+Zqypx1L4sGNbmcy6i8a2A0B1ldF6C9ph+3m+i3D4a
         nFWL4k6YKa3JrAgeloBe+5CnBlX1Su+8pZgRRBSBertD+dFl08l8/c7TLb/4OQt1AJUS
         2EPWS5Am9FkFYB34UXFilHWa0u072hHr3OKpj9Eh8scPGm5AYuD+YXoXXDrCk5p5nDEh
         vRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813658; x=1780418458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=msLy3/nz6/x8yP3I2lLtGY6/kXl77Iaf0aU/v5oIHQM=;
        b=Sp8rFFYPBd9rfig6HHibYqeISeQPgrUINSFjnqaT1/RfmIwWhCkDRNY0A95U47JJJV
         AdI4vvH9EKZ6zfeaixDvh5e4Su3+L3LGNIMRflW0lOOFMmszsfpS0QOuNw6wqmJQ1uJy
         v6J/Yxb+KV6orOqXdq22fhsKm94rTjcc8EWx0bVRitfxDjaNXoro/pwxG4q3AlY6XV5K
         WeVDqHyejKDtPFQD6fJrwNNV7PmoVH/rS/AP0g/B87FVDFIBj6jxvhnHNNZ8lGfKePl5
         p5FNPzYY1XG8qQr+BXYPOza9z2o2nrgw7Cl1h6aIg4CT78nPebMZFHNArazU9AYJCNnp
         ohxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Cq+cRjub+3NW8HYOz+gOhfEpUh3jvK+XGo8Hq+z0N1jFUw/80ucOtfZNuNGkRUVIozc20rHlzf7i8@vger.kernel.org
X-Gm-Message-State: AOJu0YwmR2+U3Y315Wfre467frq5mbPzkC5V7tj4AV4B3UKgPdeRGX0L
	0TN2HTOz7gQeWFstT+MQUhcPoF6UHYkiEbU4ipXcgo5hTJEU43ox6uADiKnQieIXC9oFPJbgUSm
	GD5y5ms0RHpyWNLKABMWJfA26UlbZDHmvrE37wOiPJavvUWnq4feXZp5uyRyVXotT
X-Gm-Gg: Acq92OERHRN792dFtjjGGng47kUFkp/2wbADnOmj6F2iADZ/ZM7UAq8BUsKD54oMQL2
	jNpqzMPs5aUB8+onsPMXziKs2pqdfTy+dtScrRQqk5sBm88Kx9jdl/ARbuyw+CrORQRFn4cExUj
	VBcuQJ8+jOVrVk+NbGXTL+aw9D1rmZ6Y0BRsFNo06suhthHE13rEH5jZYX4C7jpS3MZKXepsDlB
	7B4Vl6T4Dmm9lMwSfX3qAdl/eGSIX3rKH1BYhPeAxGahCLQI0yk2TklWiS7uDXoE47THAv+C4nB
	Lbb6+6XEi/2zoUN/GVmgFEx62PpuJ7XM6RY32hjaD4d5vJMfkqf3McVEUhUJ48IhkvguLewa9uN
	97qiFxeaSXVdOQs33pD8pFqYx80uLyoZohvd3p6hvYA5vFIa1g10=
X-Received: by 2002:a05:622a:1103:b0:516:dc50:a019 with SMTP id d75a77b69052e-516dc50a4d3mr233838091cf.49.1779813657838;
        Tue, 26 May 2026 09:40:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1103:b0:516:dc50:a019 with SMTP id d75a77b69052e-516dc50a4d3mr233837691cf.49.1779813657292;
        Tue, 26 May 2026 09:40:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c518:e53b:f5c3:921d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm35605880f8f.20.2026.05.26.09.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:40:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:40:34 +0200
Subject: [PATCH v3 3/6] MIPS: alchemy: mtx1: attach software nodes to GPIO
 chips
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-gpio-swnode-alchemy-v3-3-2aaa1238ae4a@oss.qualcomm.com>
References: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
In-Reply-To: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8471;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rxJCAmLXHTqDKpPHsRfv0+TRB0eOgFoYLQ8w8SyxOfk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFc0NfcktmDnk7EFiQe3epXeUzk+iaEc5brBye
 fiz+Z8Yug+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahXNDQAKCRAFnS7L/zaE
 w0bREACS39pPJw8JujD5qO2TGqdfHzZSTDjF2D1mxfoYsfZXTy+qru/MqCbM9nJbtWG2pfSHhkN
 ODYiEkD2YglkGqi7+pW27HHmcpBcpbhfHGcp5xXYiTI/iYSyHB+zgC34Zagr7Wa7Nh9/kQM92cF
 8UE0GeAXDdFJ+O0ROiGez30HaBUQr+6uGEP0IVXOuT+zu2p46P25H9u60OH7stIQuZZu9H5hB5Y
 Kj3W5oYuZ3sfgTi96A8X3QSMuuoZ6jQErKi3zVTaMpAsn9IVCqiavOVpcHxTx/YU43hVzUg5Qlj
 PEqJwauGLVDDtRDZkDUYbulwMAzxwIH+5X+7Ohqr/7IdCkaHVYmuCJD7YCEJ+FMTI905QdA/l5L
 wcYjrhZHJyGoyin+5yhq3ULsDczhy2Mt/HUJmdG6CvjTynay47eyEzcKkvag2nKLrKUXiJg9Fpt
 sQGhuwc7tOOsZmihHbTIU2m0xuQpR+7R0lzBJmdMCKeSNYzmqpWiqExBhLr/CJlrU2Mtmw2Zc9G
 VUZsjC7BftHfUnJsGVhZM8U9MJlp85L5l6qKsFvKsTvGlv/wr/rqVAHgvCQiMvDr6EvCeL0wHi/
 17aIyLCy+waXCs/v+JOLnYf+xFo1y+vaHenloVMfXdYlDdXc4zKnK3N6uVobO2EZdbyj59oDfzC
 drwZ3/cbk2cnPGg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZNjnX37b c=1 sm=1 tr=0 ts=6a15cd1a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=tWZPv7H_HbOMA4K40sMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NCBTYWx0ZWRfXwSLyC/VyzBgO
 XVoYuh11Zf3+vWtrT+2J53dVII0/yS5Q4TqNndwmQUvPAzSayWDAm5p8wtSqicFo/z+3amTr5uE
 MYZJ9q7PbqGXd8GcHTynvD9Xgyd8lgmhE8u0CnbyM23PIyOn4TgVeLSqGWix6VeI3GA9HDPSnmE
 31aUdsWi1dr6PsDY4XDi+H7xrXTpUF7YeSrQvrtDTSUBNCLA336oA2lTg1+iS770jF7g80oV1hU
 lw4MeqUhTrhxQZF1U19xbcvIoufLnYET10Hp2mHTsS+RVA4CdgGbl2ArNtnYMXUSogo7gjc9XhO
 tC+PxOgh6m6ixf/Ci9N8zGypFKq4Jf/O9gi7ev8H+lxHqMmURnq0MI7/q5kOxN7CyPvOrAEWLlE
 iUuWoR7+yljZhwKuZ7sKx97lwg0KWP4vMkYRKNyTUkspOdb0SDuz6ocowdcsqQK8Z8D67fREl/m
 H0qtzKtuWNyIWeKLcpA==
X-Proofpoint-ORIG-GUID: BrSp3UjV-35IfkuqRET0eSk2w3zMb-Gc
X-Proofpoint-GUID: BrSp3UjV-35IfkuqRET0eSk2w3zMb-Gc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14780-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E12D55DA0E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

GPIO subsystem is switching the way it locates GPIO chip instances for
GPIO references in software nodes from matching on node names to
identity matching, which necessitates assigning firmware nodes
(software nodes) to GPIO chips.

Move the node definitions for alchemy-gpio1 and alchemy-gpio2 to
arch/misp/alchemy/common/gpiolib.c, register them there, and attach
them to gpio_chip instances. Adjust MTX1 board file to use these nodes.

Note that because nodes need to be registered before they can be used in
PROPERTY_ENTRY_GPIO() we have to do the registration at
postcore_initcall level, otherwise (due to the link order) MTX1 board
initialization code will run first.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[Bartosz: use platform_device_info::swnode]
Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/board-mtx1.c                  | 34 +++++++++------------
 arch/mips/alchemy/common/gpiolib.c              | 39 ++++++++++++++++++++++++-
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |  5 ++++
 3 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index cb6be58808a08e667a401573d6ba515d70a58aa2..88c20c0ca96d4fc8511c214e3d6dd2c820c8eaaa 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/input.h>
@@ -78,17 +79,13 @@ void __init board_setup(void)
 
 /******************************************************************************/
 
-static const struct software_node mtx1_gpiochip_node = {
-	.name = "alchemy-gpio2",
-};
-
 static const struct software_node mtx1_gpio_keys_node = {
 	.name = "mtx1-gpio-keys",
 };
 
 static const struct property_entry mtx1_button_props[] = {
 	PROPERTY_ENTRY_U32("linux,code", BTN_0),
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 7, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 7, GPIO_ACTIVE_HIGH),
 	PROPERTY_ENTRY_STRING("label", "System button"),
 	{ }
 };
@@ -98,7 +95,7 @@ static const struct software_node mtx1_button_node = {
 	.properties = mtx1_button_props,
 };
 
-static const struct software_node *mtx1_gpio_keys_swnodes[] __initconst = {
+static const struct software_node * const mtx1_gpio_keys_swnodes[] __initconst = {
 	&mtx1_gpio_keys_node,
 	&mtx1_button_node,
 	NULL
@@ -127,13 +124,13 @@ static void __init mtx1_keys_init(void)
 		pr_err("failed to create gpio-keys device: %d\n", err);
 }
 
-/* Global number 215 is offset 15 on Alchemy GPIO 2 */
 static const struct property_entry mtx1_wdt_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 15, GPIO_ACTIVE_HIGH),
+	/* Global number 215 is offset 15 on Alchemy GPIO 2 */
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 15, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
-static struct platform_device_info mtx1_wdt_info __initconst = {
+static const struct platform_device_info mtx1_wdt_info __initconst = {
 	.name = "mtx1-wdt",
 	.id = 0,
 	.properties = mtx1_wdt_props,
@@ -147,7 +144,7 @@ static void __init mtx1_wdt_init(void)
 	pd = platform_device_register_full(&mtx1_wdt_info);
 	err = PTR_ERR_OR_ZERO(pd);
 	if (err)
-		pr_err("failed to create gpio-keys device: %d\n", err);
+		pr_err("failed to create watchdog device: %d\n", err);
 }
 
 static const struct software_node mtx1_gpio_leds_node = {
@@ -155,7 +152,7 @@ static const struct software_node mtx1_gpio_leds_node = {
 };
 
 static const struct property_entry mtx1_green_led_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 11, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 11, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -166,7 +163,7 @@ static const struct software_node mtx1_green_led_node = {
 };
 
 static const struct property_entry mtx1_red_led_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 12, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 12, GPIO_ACTIVE_HIGH),
 	{ }
 };
 
@@ -176,7 +173,7 @@ static const struct software_node mtx1_red_led_node = {
 	.properties = mtx1_red_led_props,
 };
 
-static const struct software_node *mtx1_gpio_leds_swnodes[] = {
+static const struct software_node * const mtx1_gpio_leds_swnodes[] __initconst = {
 	&mtx1_gpio_leds_node,
 	&mtx1_green_led_node,
 	&mtx1_red_led_node,
@@ -185,9 +182,10 @@ static const struct software_node *mtx1_gpio_leds_swnodes[] = {
 
 static void __init mtx1_leds_init(void)
 {
-	struct platform_device_info led_info = {
+	const struct platform_device_info pdevinfo = {
 		.name	= "leds-gpio",
 		.id	= PLATFORM_DEVID_NONE,
+		.swnode = &mtx1_gpio_leds_node,
 	};
 	struct platform_device *led_dev;
 	int err;
@@ -198,9 +196,7 @@ static void __init mtx1_leds_init(void)
 		return;
 	}
 
-	led_info.fwnode = software_node_fwnode(&mtx1_gpio_leds_node);
-
-	led_dev = platform_device_register_full(&led_info);
+	led_dev = platform_device_register_full(&pdevinfo);
 	err = PTR_ERR_OR_ZERO(led_dev);
 	if (err)
 		pr_err("failed to create LED device: %d\n", err);
@@ -335,10 +331,6 @@ static int __init mtx1_register_devices(void)
 
 	au1xxx_override_eth_cfg(0, &mtx1_au1000_eth0_pdata);
 
-	rc = software_node_register(&mtx1_gpiochip_node);
-	if (rc)
-		return rc;
-
 	rc = platform_add_devices(mtx1_devs, ARRAY_SIZE(mtx1_devs));
 	if (rc)
 		return rc;
diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index e79e26ffac99e6b12b430ab60df1cc7d42afd4a8..2141eae5ce4502aad920333cba1f7a6e08411f9e 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -30,6 +30,7 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 #include <linux/types.h>
 #include <linux/gpio/driver.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
@@ -95,7 +96,21 @@ static int gpio1_to_irq(struct gpio_chip *chip, unsigned offset)
 	return alchemy_gpio1_to_irq(offset + ALCHEMY_GPIO1_BASE);
 }
 
-struct gpio_chip alchemy_gpio_chip[] = {
+const struct software_node alchemy_gpio1_node = {
+	.name = "alchemy-gpio1",
+};
+
+const struct software_node alchemy_gpio2_node = {
+	.name = "alchemy-gpio2",
+};
+
+static const struct software_node *alchemy_gpio_node_group[] = {
+	&alchemy_gpio1_node,
+	&alchemy_gpio2_node,
+	NULL
+};
+
+static struct gpio_chip alchemy_gpio_chip[] = {
 	[0] = {
 		.label			= "alchemy-gpio1",
 		.direction_input	= gpio1_direction_input,
@@ -157,6 +172,28 @@ static struct gpio_chip au1300_gpiochip = {
 	.ngpio			= AU1300_GPIO_NUM,
 };
 
+/*
+ * Software nodes must be registered before board-specific code (that runs
+ * at arch_initcall level) attempts to use them as GPIO targets or as fwnodes
+ * for registered devices. We can not do registration in alchemy_gpiochip_init
+ * because it also runs as arch_initcall and runs after board-specific code
+ * because of the link order, and so we do it at postcore_initcall level.
+ */
+static int __init alchemy_gpio_nodes_init(void)
+{
+	int ret;
+
+	ret = software_node_register_node_group(alchemy_gpio_node_group);
+	if (ret)
+		return ret;
+
+	alchemy_gpio_chip[0].fwnode = software_node_fwnode(&alchemy_gpio1_node);
+	alchemy_gpio_chip[1].fwnode = software_node_fwnode(&alchemy_gpio2_node);
+
+	return 0;
+}
+postcore_initcall(alchemy_gpio_nodes_init);
+
 static int __init alchemy_gpiochip_init(void)
 {
 	int ret = 0;
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
index e6306f6820e64e193b1be5e258211cca509edaa6..de7f857cb333a209c43fd6ca7198d2aa988c0bd7 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
@@ -40,6 +40,11 @@
 #define AU1000_GPIO2_INTENABLE	0x10
 #define AU1000_GPIO2_ENABLE	0x14
 
+struct software_node;
+
+extern const struct software_node alchemy_gpio1_node;
+extern const struct software_node alchemy_gpio2_node;
+
 static inline int au1000_gpio1_to_irq(int gpio)
 {
 	return MAKE_IRQ(1, gpio - ALCHEMY_GPIO1_BASE);

-- 
2.47.3


