Return-Path: <linux-mips+bounces-14449-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKkmNAS0+Wly/QIAu9opvQ
	(envelope-from <linux-mips+bounces-14449-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:10:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CC44C942D
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A679930B68DE
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7223D171B;
	Tue,  5 May 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGjK5RwR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOkjHY4b"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7443D5649
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971907; cv=none; b=WLn6WPoMpObLwPeQ7y9YE1p9K4c6X6MS4fgc718QrhDrh3k4/PfbfeibQTJ43bCpZpSTlUbkx27ib/UvrOMepXCXN2JZEhlaq63TmbDRasSy+Z0cS8/HEY2nr1XsQxuHybGw45GBvy5YTM5R1JYz5TrJy65u+CK4J+jDLdP0/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971907; c=relaxed/simple;
	bh=4C1M3xokr9dwclUwlwMby/uPN4AVox532J2reF6RiTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKnLiXMtnJfL4M+UPWwuWNDXHXVdqN4yQHZX/W/LVnCbn8LBDMv9GBlErVO+nQohtgZRbhpYA2rFTxnE37rJNaSaLjRuRpJs012jXlQy8LJocPmsffw3TchLXthA02K3EipN3MnLiDb7I9vUMdGWyuXZlX9dP8/tveSFTlWZUmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGjK5RwR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOkjHY4b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645407Ui4128676
	for <linux-mips@vger.kernel.org>; Tue, 5 May 2026 09:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSHCcIxehKEC1qJOhQDWXY/YcEZoST1UqNXv2uVWJlU=; b=PGjK5RwRtz/hTW7C
	70vkYCyt3poAoILV8cspIY5wnVKzgwiYDd30HAdm0TF/+eey3ziKbZTIZnkX5Dyd
	akijtMCLuWVq9OIJaGyYANYPBeScyqTg4FsxIMW2yx1BiYWGMDkLmqVIw5di1Dl4
	N/QaOzZCyaUZGctWfKDsR2nusQUZ2gwOSmOiIvS6M6w0sb9uUOXFE8cHHW+JgvaD
	pvPDPCbNYMQXkvBpv7H8Yt6f/zLgFD59k9pJENOth/NXtaMB6suKOMskmKvxrKv3
	UuaCzvkdcz4tIkotQ23rs8mJCTsuhHcc5X7+BWRhsR1tGVBJwdKeA9J0X8o8L/EQ
	n9Rwnw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw49d3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 09:05:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3c7b989so91575271cf.0
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971903; x=1778576703; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSHCcIxehKEC1qJOhQDWXY/YcEZoST1UqNXv2uVWJlU=;
        b=TOkjHY4bYk2W3ifdlXTpJMhBgzdm9TJKnaTqyl6CIogqZjURTSRWSzRVOtIhO0TBmd
         iRhjKNOz8CtN71ro6ErHx8N73RpirLYXlNWRIzd23cth8U/mHzDO56y5jz5q9MprXNkp
         7wyhEnyFFccVrYWazcEj4dH4FIZqY4AniCVIiQqAOsYmOTZiSIRTKdeV8x/eR7EJsXCW
         CwnS7xXH2/KCHfUQhVg1Npjt52Mvlkxorf9aWzrAZ/kSqUH+CcekmnnWsh463jG/MULv
         UMh3dNhDyFfGdXqsz5RWCYV6plrV05a7uOu0x3pEzfbg4Xf4N0mL1BKZ7poLeykgwpRr
         jRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971903; x=1778576703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WSHCcIxehKEC1qJOhQDWXY/YcEZoST1UqNXv2uVWJlU=;
        b=CexCIl3KdBr3oZV18DxKrXofVIntCaSq31sADkayixGkXQJ+KTAfn5Xvaa+gtJtNtF
         SPzxcwNbcRJXrHh9lCTkn13ewFkdPijoZ1C7RxC6ygenbltvxMiuVflyktcyHWgBXxyV
         lDu9JWjCqRB9Rovt3+e/Ou0ncShHnvRHn2jRw3TvhGEeAMV0Ou2qOP+JY6TeMzV3rApr
         4TQ5B61US7rchilkzwOzypB97Ms1ruY8/RfE6uWBdlsZ422/uhA5nH7/doFvcVMdzU9R
         8N2x+NPZ6CtR37j+c9kvDjcgBSbF66eJjnFS/xeF4ad2CD35HNnsTobtmUayWKG7v+5T
         iMuQ==
X-Forwarded-Encrypted: i=1; AFNElJ/22UMmqaWmlt3qogcW3XHP0bhSAHiChEsglsQUDIin7WUEjKLVzwkZHfuLIyQEWReYxuWlMy1VrCtl@vger.kernel.org
X-Gm-Message-State: AOJu0YzhNSqt0O9h1ZONFQAFG3/s+3QpRy3XzuGDpnLxMRHlGS5Zt8Q2
	YIZ2tTdO/CQQsLefcTAJam0tSxed2U1by4TriuUhxlRKsuIT5LHQ1SX8Y8A4OS+dwpIsBwq1s4X
	bQDbbaAz74jypJCJTAjXrbxtHme3AmYs7pCVPFW1gSngOvbBg0vbbqIEUDPlkpN/iYkH2cM+8
X-Gm-Gg: AeBDieu2sx3CUq5hUTXd1e712oU6ocNVraD0/XS320YjpbbXydrMtFQCi9LUDR3w2cY
	m5ekGP8YvkzKlqlzHOWWq6hDVWdgl3qZPZoXGgC0Qikx/gmebx1nQgeyKYYqYUH086GiFC1Lr/j
	ki0flq+eU+wvLbI9gtdGWDUetqK6l/ByI8iP0xCUjlNhB6z7vi+/ZYmWUIAfuSH+TtN1Bat8tBZ
	b87YS+qm194yZfTz9YMOhzhUO/UVbcoE1oGBt78mMagcZscz6X47Fsk21IB3eUVwchIjemiDVfL
	s61sWEQ/XpNtQg/2LqljX2fjRKWA59kw/ALh12I/ad8HBknY4KGVS+W0eAFw/VK3lZMdXGGxYvW
	XS4g5RlJf4vx0h1rf93w8Cj/psY+4DQDCewHV6mAQP4Oh3XyIe7+oG6WPuzTQew==
X-Received: by 2002:a05:622a:156:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5104bdefba7mr198354101cf.5.1777971902775;
        Tue, 05 May 2026 02:05:02 -0700 (PDT)
X-Received: by 2002:a05:622a:156:b0:50e:5fe2:83a9 with SMTP id d75a77b69052e-5104bdefba7mr198353701cf.5.1777971902359;
        Tue, 05 May 2026 02:05:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3276:ff51:bd0f:7f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14d1b4f6sm14133385e9.12.2026.05.05.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:05:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 05 May 2026 11:04:42 +0200
Subject: [PATCH v2 2/6] MIPS: alchemy: provide visible function prototypes
 to board files
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-gpio-swnode-alchemy-v2-2-cb208afc5b56@oss.qualcomm.com>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
In-Reply-To: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4C1M3xokr9dwclUwlwMby/uPN4AVox532J2reF6RiTI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+bK03LDhM1gvbb4rYb4J0fzqe/PbTlIJ+nBga
 XFa+rs+06KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafmytAAKCRAFnS7L/zaE
 wyCvD/4wX1lPJIA13zvIXwpVWcdT6XFKpkjqv8o+UnbJx/GT04Aui0pzuk1wI0gWjJbvZ4d1/OV
 WPhYUYFeQ+byYn8ZcVtRPq0UzykKTbcwGnVfMhKbEhidH2ii1MUDT9JdFGccsqNfWUwsrwlxLU0
 GIT0mxrCX6LGWiJ4INmcdc/fvoQTR3T38ieXISHJXpdMk12hEqOMUM2FXztyWAPkaJXpLHKHb9K
 lMCo7Hb+i9behroI+40YLRHY/rXkh0d9SI5DICCa5SYfrUnaeDMXsMuxDvSW0SUBOtiv7S9tIUK
 EMyZfAciKa0eBbTCj/vj7z/7UOFkwKeYullKBUIqlBVvpFmEAwGaV8tupL9m1UZP0G2QnGWkZsx
 8S42La5TiqfCX6VQA4KshrPipRvvl4DLKms6PWWu68Nm/86IxYFikRmSNcbVVtt4CuBPrxHG+h7
 IJYgyWqvwbEnTeoTzG2mjV3475/Chvpj0+YBozkbzXA2qqZRnCmnxDzzHokbsNGzq2vjJRhY3Nn
 asKBKlywWIFDvR0ppMWFfsMHXjaJvirNKAfkdXvHa+XUTLxF1JCSrB+5Ec813HJ5UKPktaqma5v
 yUqLoWXugs+Ea1xGMpSeCdreixcgJwVLR8Yopn0VW1CPfM2g1iSGC/8nA+EjhqXq49Yy/G7i9RL
 XT5lIAICKJ6Lpyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f9b2bf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=jNKtMNL_tjeZMJr_EBMA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: S1gUXNJggw_XHTmP_r30x3YAWAGgMUh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MyBTYWx0ZWRfX6iqE4Fg0e/SO
 brkE4YTrA1gUhyvMznOcsH8Of8m7tdqCRUE6/pC4EnFY3BcgFLgVwpXTOsSytMkmRGiovVXPuyc
 Vhj5I/ysGFouT/n0DUUwEz1nxI9I2d5+n9hO3oMxLBuwHzlv+KvZxag935ucyM55LWhIo8JvA2F
 XzYsQTTyuA1AOzNYRwRaDl+wOdvvEXddflT9xUj0Q/VTPSrW3bOd8EKxWuR2d0K4+C6dEIwOBlB
 oz79pUa76ycSIrURNCzUbGg/4lVtY4eGr11GYyzxtiN8hXIjHbeWtGDW8FEQd2myl7GiwEiuKTE
 nWsIA02U/9/IrJnQEdA4gTOO+EkWcYjyEaBWOvtu7cCUGsghjzwXoNHjapLQXsrsE98e9Ow2tzd
 hskn2XmcVERxJrF5BBQhE1Xr/5/0J6JkOLvQtUavk+ibdu7EWN3Of/n12+UYsHVsDdbe08kOVnb
 +4uxT1KJLxgrGgA/mHQ==
X-Proofpoint-ORIG-GUID: S1gUXNJggw_XHTmP_r30x3YAWAGgMUh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050083
X-Rspamd-Queue-Id: 32CC44C942D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14449-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

Board files under arch/mips/alchemy/ define functions called from
db1xxx.c but their prototypes are only in that .c file instead of being
declared in a common header. This causes several build warnings about
missing prototypes. Provide these prototypes in a new header and include
it where necessary.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/devboards/db1000.c |  2 ++
 arch/mips/alchemy/devboards/db1200.c |  1 +
 arch/mips/alchemy/devboards/db1300.c |  1 +
 arch/mips/alchemy/devboards/db1550.c |  2 ++
 arch/mips/alchemy/devboards/db1xxx.c | 11 +----------
 arch/mips/alchemy/devboards/db1xxx.h | 18 ++++++++++++++++++
 6 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/arch/mips/alchemy/devboards/db1000.c b/arch/mips/alchemy/devboards/db1000.c
index 6984cd5169b5fda48d9dcbeb1f72a5de4473100d..65238f14f28d61ef3eddfd571c7d61f01e7434fd 100644
--- a/arch/mips/alchemy/devboards/db1000.c
+++ b/arch/mips/alchemy/devboards/db1000.c
@@ -27,6 +27,8 @@
 #include <asm/mach-db1x00/bcsr.h>
 #include <asm/reboot.h>
 #include <prom.h>
+
+#include "db1xxx.h"
 #include "platform.h"
 
 #define F_SWAPPED (bcsr_read(BCSR_STATUS) & BCSR_STATUS_DB1000_SWAPBOOT)
diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index 67f067706af27342317c4265d2b3dda97681d391..de2a9083ed9a35b3f87bcba7e05da1de175615b1 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -30,6 +30,7 @@
 #include <asm/mach-au1x00/au1550_spi.h>
 #include <asm/mach-db1x00/bcsr.h>
 
+#include "db1xxx.h"
 #include "platform.h"
 
 #define BCSR_INT_IDE		0x0001
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index d377e043b49f86539b88fd6f79c5395f1a42278d..b46f5e47da2c32be3b44bcb80ea4b6e2623f735b 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -32,6 +32,7 @@
 #include <asm/mach-db1x00/bcsr.h>
 #include <asm/mach-au1x00/prom.h>
 
+#include "db1xxx.h"
 #include "platform.h"
 
 /* FPGA (external mux) interrupt sources */
diff --git a/arch/mips/alchemy/devboards/db1550.c b/arch/mips/alchemy/devboards/db1550.c
index 6c6837181f5555f3f9b8ebf495c03a22bef735b4..b8295a5c2e9a1e782e6d460b2e912c7155066ad4 100644
--- a/arch/mips/alchemy/devboards/db1550.c
+++ b/arch/mips/alchemy/devboards/db1550.c
@@ -28,6 +28,8 @@
 #include <asm/mach-au1x00/au1550nd.h>
 #include <asm/mach-db1x00/bcsr.h>
 #include <prom.h>
+
+#include "db1xxx.h"
 #include "platform.h"
 
 static void __init db1550_hw_setup(void)
diff --git a/arch/mips/alchemy/devboards/db1xxx.c b/arch/mips/alchemy/devboards/db1xxx.c
index e6d25aad8350ed639683b2c6fa6d013690c74913..2e8c68d97b34a829af00a8e622ca0955c1d8c2ff 100644
--- a/arch/mips/alchemy/devboards/db1xxx.c
+++ b/arch/mips/alchemy/devboards/db1xxx.c
@@ -7,16 +7,7 @@
 #include <asm/mach-au1x00/au1000.h>
 #include <asm/mach-db1x00/bcsr.h>
 
-int __init db1000_board_setup(void);
-int __init db1000_dev_setup(void);
-int __init db1500_pci_setup(void);
-int __init db1200_board_setup(void);
-int __init db1200_dev_setup(void);
-int __init db1300_board_setup(void);
-int __init db1300_dev_setup(void);
-int __init db1550_board_setup(void);
-int __init db1550_dev_setup(void);
-int __init db1550_pci_setup(int);
+#include "db1xxx.h"
 
 static const char *board_type_str(void)
 {
diff --git a/arch/mips/alchemy/devboards/db1xxx.h b/arch/mips/alchemy/devboards/db1xxx.h
new file mode 100644
index 0000000000000000000000000000000000000000..f39e3551e3b3a738693b2bae8133a6e01a6aabaa
--- /dev/null
+++ b/arch/mips/alchemy/devboards/db1xxx.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_MIPS_DB1XXX__
+#define __LINUX_MIPS_DB1XXX__
+
+const char *get_system_type(void);
+int db1000_board_setup(void);
+int db1000_dev_setup(void);
+int db1500_pci_setup(void);
+int db1200_board_setup(void);
+int db1200_dev_setup(void);
+int db1300_board_setup(void);
+int db1300_dev_setup(void);
+int db1550_board_setup(void);
+int db1550_dev_setup(void);
+int db1550_pci_setup(int id);
+
+#endif /* __LINUX_MIPS_DB1XXX__ */

-- 
2.47.3


