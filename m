Return-Path: <linux-mips+bounces-14447-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHfJKMGy+Wld/AIAu9opvQ
	(envelope-from <linux-mips+bounces-14447-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:05 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9474C91AC
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 98417300C303
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259D1359A91;
	Tue,  5 May 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T2kKxvgc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmw6ZodW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CBA3C0636
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971903; cv=none; b=aUFryuhTI1VsQmkFrHHUClKDyZq+Fhm2XGzWQy6vEMXg+eofjAyZrnQB71L0UXs77mTDcBU10fBKXG76gbyjyVlOTchQSb8z16EbpdtnEgibWsUrEVfR7bn7Y/izqOPXBinR3a+ra9q5LXQM6pcs0Ut6jPh6i0SRvjsJqD27KQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971903; c=relaxed/simple;
	bh=E4YEioKQ2KcR0c/giN3Gjw7npkp2eE3t8WRJKY47g+Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K9LrdNOvakc9mvsQTl5nppI+tEjxr2pDH9CodWjRXr5QGYgPDgDZZjRgV364YtxyU1rRAcR2o9TFrJ2BmrDKxHZB1cgycGqc1KreEI94OeyJtvzFZ8ny1+MjLbi3ghbn85aVC6QEoJAr7pfupryvQovBCvtWu2u3xtLazF1IT+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T2kKxvgc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmw6ZodW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6452fCfk4128666
	for <linux-mips@vger.kernel.org>; Tue, 5 May 2026 09:05:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5x6x8f0E8Nn75TPzv6PuVG
	MBPFzdS9379y/AFh1si7Q=; b=T2kKxvgc9ClsOeZyiTaSC1ftQogjxZ00dq3l7b
	ezaCCAvVYEKKHQ4V/CTPcXXgtmYmcunZy+4XEvq/dO7+2pQTbEmLtlGd1yeHStWK
	AYv14n5akHVXuJo7YL95ldpuBCCufr7cQ5J+ll3hAbQ5LgGRnqIoR9iyGDeZpAcA
	7rAv0Sk7mxQr5MCkbi5Q9o43xyWjBHToetch4o79BCZozRGT2G1OAJzWQnd2LjOo
	GWHqtVACvJMsTvDphaq5gu1m3OW1hSw11Wv757nTeQXY8oTkqGuPwW7agu5OTm96
	UqV6+bo4CVVdcNXADGitmagi4arfqP21TFbmq7wk6dDvnmiQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw49cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 09:05:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf01172bso139633701cf.2
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971900; x=1778576700; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5x6x8f0E8Nn75TPzv6PuVGMBPFzdS9379y/AFh1si7Q=;
        b=dmw6ZodWCCgxWST/0ICLpeR7HOrgr7/IiksQ2xKhyHzlq7qyJwu8UIoIRtfsTcSmxY
         FqTCSpvPkLixOunLzjU4m306sd0rxBYXozkpZtzWfLI87gJlyUF7pv2pAhXoUllB+ygy
         7RRpLC30McfMzPHG1/su1rkbCMTd8DjFZ9Mhe7fobjk0gEarmCsRU6RGdgpy1h+WHUJn
         eEENKhP0TIy5RCJqZUnt0DbC2L/PDxcdaQfHk02CVdPI59KUXo7MZ8UTJc9jVXTho6k4
         IfQARyI3dsunkhG1UXNB/QOC36WjuOcDOVXL1YLM/K9NXdG686+KfAXIgfvr/TE6CIim
         34+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971900; x=1778576700;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5x6x8f0E8Nn75TPzv6PuVGMBPFzdS9379y/AFh1si7Q=;
        b=XO+wdQqHgGVAdUSy1A5Al62VPehCfPSNdMXvZQP5mdJZNbVArIjJ07vGsmXFh7SbCx
         fKT11+xWfAzNF1tIjW5BL6yIgx29xyCjNfu2y0EsgRcw4smD+mphfaTXwxgWf9FO8nwP
         FzolCZjOO/YZWFxXt/z/atnv1JAsygPrYG49j0CRPaZFUfDsnnMxE7xjJyoBPWXoVRgF
         EcoqoETas7LWmp9NSkpE1l35LW/vx6TPkIQXa2FfaGKQXtUqAR13KKal7FZcV8GtfiFJ
         6DfxAzJI+S0jlcL+b43r4GXG0Kn3+CBperhT3/MjIU+qZ6yNI5cdraX5A0WTziDRKrJ5
         W0HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tOBEScmnNGUtI8bwICdDJF7EK7moHmxZwdzFtyhdgYNiLF/gd3NpG02wXOBX0lagIG2DKjvXfg5Ri@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy4K8hQSSbs/hFnLBVx24oHPxxDg40e3OVpgP9f98Q86ISinlm
	SKtf8jnBGpEBNJX7a8HHFoccQ5abXQyIbZ3mQT4doQsLYUpkJc/qKMFL19g0uOxbRFKHs9ec/KB
	AVKSJIh8mDnJf3igQlP1F270KpT6SWpaA9B5ADGgoH6q9iJsNpo3F4WNqon98paYP
X-Gm-Gg: AeBDievpEYMFRGNKZ/oKWuunvtTPazZygtlt3WVzmU2iny1A89oSyYb5kvKU1y1D8/m
	zcME2hTTTNoM3ZPGK9UU+QenFjlCNBNjwAY9jQvVAyPZT/7Rq0WHCF0azC/sAcus377YgYkKSaF
	3tCRCcncfgARhDkPTYWPCtyPyQboiLWWFJN/TProIUKS59S89u34DO+EI7IjsZ6hiHFUmRh78S4
	j5HPeVnUOMHMBqpBDVQdakNUED1tN8wHG+gMHc1Eby/CZHdT/YF/CI4EcfhmaSLEWFt9gTJ7nfG
	7Xyz+TRS1rqd/udUfc9N0ZJ2azSJ4LhymLBbX9gtnlYu+ODgyKaJwbzdvMUKVqyOXHJYBvPAunO
	MlVTV4yie2VdFe9wQ4KYuXzj9zF22QVH/cJV1nbtuiSCpNQv1FcUxlwHqc/GyrA==
X-Received: by 2002:a05:622a:2b06:b0:50f:bd79:2643 with SMTP id d75a77b69052e-5104bf0a262mr197256231cf.34.1777971899874;
        Tue, 05 May 2026 02:04:59 -0700 (PDT)
X-Received: by 2002:a05:622a:2b06:b0:50f:bd79:2643 with SMTP id d75a77b69052e-5104bf0a262mr197255891cf.34.1777971899436;
        Tue, 05 May 2026 02:04:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3276:ff51:bd0f:7f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14d1b4f6sm14133385e9.12.2026.05.05.02.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:04:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/6] MIPS: alchemy: attach software nodes to GPIO
 controllers and use properties
Date: Tue, 05 May 2026 11:04:40 +0200
Message-Id: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKiy+WkC/x3MTQqAIBBA4avErBswy6CuEi3KRh0oDYV+iO6et
 PwW7z2QKDIl6IsHIh2cOPgMWRag3eQtIS/ZIIVshRIK7c4B0+nDQjit2tF2Yz0b0+mqItVoyOU
 eyfD1X4fxfT/YeIU3ZQAAAA==
X-Change-ID: 20260505-gpio-swnode-alchemy-3bff9c11e54c
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2364;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=E4YEioKQ2KcR0c/giN3Gjw7npkp2eE3t8WRJKY47g+Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+bKu2/A2vxjpHBIWet8BdtHFwQXV0PgWzCzP5
 zhdCCOqa9GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafmyrgAKCRAFnS7L/zaE
 w5VZEACw65MScPYk6Qv+LuXMCGkh9/v1csFLMvZt3jp4BM12hUNLkh/YXuStHyTbPw+vjEStKzk
 BQdqmYnumLVGkoeP9H7kpiPo8MLUfFETHA+42F7TuhQ50BKNuCuDI2NeoEkXgP01t43a+SPnN2k
 1r1gsn2GdflPeVxk/6+UAfKxSQBRjim1hjTlv8hBzfDRjo7fwlJdAvMefJkbNELjiyWh4mCnFS2
 RmHThLJj75DVzTArNAnb7ko/XFGaF5pfTmsv11UadPRLCePRo7TcC7srBiJXFprPdEpXC4JBg7r
 Jdy3TdEhRQIQDJj0/p5NWRXLRfpzBOYLK5sUKps8tp+Q3q8xaj0rlFDkkk+/5bkxlfdE4xXjmTT
 95LPMPjFXhqLi+02pZA4knm5eQ6iCEx10Kk5GOVkyW1QC/po8VexqPT6HVYPMPey9kCSG3lP7VD
 l/qpQSkhLXY+5aeHgLBsDmYw7aLFLYm5LEBz0bHVBfB1dhfrGlYYWmdp9Nw6OT5xNFE1t7ObPA5
 TY1e0g+yhdTlwuCfroE0Au8uaM9W0761QfJIy3p9Zmmw7Zcnhs2KMrFzaLvJ/0NO+JNP/ClyQ2h
 k+o0DazL1w56KJuri7ezk65MP00a8hE+lctWW4G24+D9apuKlsEWgtV6A/kpOjfH4mFq6rX9N8j
 BHu/nZ4irqJHgVA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f9b2bc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=rp0JIyO04VhZ70VToYIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: e30bHluQkV4YksomGpaiZN2lxkTbcVhL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MyBTYWx0ZWRfX9PcwBMU2kIKi
 CpgC2yZq3RxggCzXZpXvIFbt7DJvY+xW0eM1MJ1RzoXbBzD6IyWPJEUYTlByRq4A7SKsAP3/OUc
 GkfYCYUrUNhYuKGNuNz+2+Td0AP6DnkoiqXFPt4aHp4aqOvJP1fwOBYeBIsg9q74u430V4h9E2b
 AreumHJrUGAYoOhGL/XqpXmf0qyEvRP2mTL6gds6dH+pnFVXKh9TwqiP+oazzXQrjdh53FHiaED
 D4HHe2sfwMTwXaoXX493fuS75gZ8wC6FUB2F3HKPeg+T1nYoJ/6UBlfRhUC59tOGmqv/o4653Vn
 fSWizdvcZAEReo9K8xRvJfEMx+aLiuSu6C/FVuIp9qO8cPeU0PXlAmU7RClXsEh1y2lLf91Ehe7
 PJel/gwLFF6WdzZ+efvtjUuSNw7me+5hIxTBshOftsFfD39X2z5/m0ZYjRTSOpX3ZK+511kzJZJ
 F7yCQY8DOK2vFNS8O1w==
X-Proofpoint-ORIG-GUID: e30bHluQkV4YksomGpaiZN2lxkTbcVhL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050083
X-Rspamd-Queue-Id: 3B9474C91AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14447-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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

This series of patches updates board previously converted to use static
device properties/software nodes to attach and use nodes attached to the
respective gpiochip devices rather than simply defining unattached
software nodes with matching name. This is a requirement of newer
gpiolib code. Note that there is currently a workaround preserving the
lookup based on the software node name, but it will be removed soon.

The additional 4 patches convert the remaining 2 boards to use software
nodes as well and fix some build warnings.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Add two patches fixing build warnings with missing prototypes
- Use the new swnode field of struct platform_device_info
- Link to v1: https://patch.msgid.link/20260309-alchemy-v1-0-f55e9dc60ba1@gmail.com

---
Bartosz Golaszewski (2):
      MIPS: alchemy: platform: add missing include
      MIPS: alchemy: provide visible function prototypes to board files

Dmitry Torokhov (4):
      MIPS: alchemy: mtx1: attach software nodes to GPIO chips
      MIPS: alchemy: db1000: use nodes attached to GPIO chips in properties
      MIPS: alchemy: gpr: switch to static device properties
      MIPS: alchemy: db1300: switch to static device properties

 arch/mips/alchemy/board-gpr.c                   | 122 ++++++++------
 arch/mips/alchemy/board-mtx1.c                  |  79 ++++-----
 arch/mips/alchemy/common/gpiolib.c              |  45 ++++-
 arch/mips/alchemy/devboards/db1000.c            |  38 ++---
 arch/mips/alchemy/devboards/db1200.c            |   1 +
 arch/mips/alchemy/devboards/db1300.c            | 210 +++++++++++++++---------
 arch/mips/alchemy/devboards/db1550.c            |   2 +
 arch/mips/alchemy/devboards/db1xxx.c            |  11 +-
 arch/mips/alchemy/devboards/db1xxx.h            |  18 ++
 arch/mips/alchemy/devboards/platform.c          |   2 +
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |   5 +
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
 12 files changed, 329 insertions(+), 207 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260505-gpio-swnode-alchemy-3bff9c11e54c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


