Return-Path: <linux-mips+bounces-14778-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BnxJuLRFWogcgcAu9opvQ
	(envelope-from <linux-mips+bounces-14778-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 19:01:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 201FC5DA48E
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 19:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0296B312445F
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2026 16:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4BD3D3485;
	Tue, 26 May 2026 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmaPufzH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpxiKmHZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78B3D16E8
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813660; cv=none; b=RZ+2573wDczV4f/OaR067aDbZLz6J3mkO51IB/0kk5UDWYU2dEAMoITFKVCo5qfPfcd5Owk0yYV8iYQiVbuV5LBMv1NkWXOuO2SwjS4+Hed7zorp88U0bbN5ybAV94nz5qsdU/6y6Iq5CEKLXYlA1y3z98Ci5YYcADgaB96fPYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813660; c=relaxed/simple;
	bh=lhgjEO2e6+jKkDXiNFRz3t43DYmKDRbaUTKrI8llfV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZLYBDls2yFmZlW0SOCMJ5TNzEi5DcI3ABaHavUR/TPrSjnJrZTHNMzb4rBK+B60ANZIhyEvkGMHQyaQsIHDmaAyUp0JYr2589CEqRr8EzkgZa3TWyStV0cIpLkk511NE7gIW6avYBRmi2Ca7H8eBboQmstbcNZsg1ZnyYda2Jf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmaPufzH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpxiKmHZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QG0pda3322511
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omZ1XDzbJzuYHKwqtKdcfxQclc+P9szau4J407Rp0E4=; b=AmaPufzHZgxl0WPX
	bBx3AkAGUA7hRZz9RQs17bJshg0c9f6LYjqo8rSCA2FncnKKZCthj5a/s7uQUJR6
	JP9D2TY+SSR1e5zRW9mhUe7fWMYq/iVt+cIgvFUI4EgQI0AyjPZsHwJQ+3VDdOQh
	hd1RmixCI/UzmGbBlYDCWKnbvZGzq4c4CrsbC0Q+4xCSo3RPvJcbqChp7mNaFKmM
	eCGNwTGLl4DHcVx2oPwnuIuLSkRL4agXgEggoUFQpV2obbf7FTFxF1b7cYqR89HH
	4eQEsAM6R4dqDgJpHlz9+L8vm5OiXKI4DuEVceB3w7NqHAMsMR4u9K/1weUqaOs/
	wo6x+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentg7q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 16:40:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516d51ffb59so7049321cf.3
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2026 09:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779813656; x=1780418456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=omZ1XDzbJzuYHKwqtKdcfxQclc+P9szau4J407Rp0E4=;
        b=EpxiKmHZ0QN3GV6GVQdHY4hiFTA6NPiLU3EE3wlTgB+Qi6ATGRfrZN6taNJATCfIXO
         KkHMGQMtwin+Ddw72STzP6pb3WFM6E/d2zEu5lvfMro121C+8NSjJiyKxT6440tbW8wU
         fL/s8qa9Ks2rEs4bbbFeioP3DG+s/5eG2nOJQRJ1yM2/O7X52uJ46RN/MjhaR1zDsKia
         y6LdHuyDOcEbC7lX0DPegKTMzUJZyvyox0JBrLiRhUpCzRdiPRfN5YYTTJqhK6IomYko
         qM39h8rp3h16wtuBhEDSFH2n/qRQbMyNBEr01B4BrSWUnf7vgmOuEalfBsqDA5m27uPj
         NDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779813656; x=1780418456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=omZ1XDzbJzuYHKwqtKdcfxQclc+P9szau4J407Rp0E4=;
        b=abGaH6zei1LVaTRlYWudsvbITiZECGqyyOUQIfy77GVAIrXkAXQdLhZ/xxSSKo7oFm
         7+Nhb7Hjxam+e8OKrOHBQVQaPv0JF7wDVS14guWYLurfEcF1wWvMD2Q8OhYfXZrhsvs/
         7+w2yHwaEIlCt7Tb9rUmnB2dAL/vwV3p2T/TLpR7kZdbGeTUp7y/G8ZRJ3bxa5IPH2qI
         NGUtS9rPV8oEiXc2146+9rOikEpd43lLE9SZxMcSJ8MMsvmfuSPCNW/R6cZFUqUSAoC0
         IKqrDNInyBiXoGnWXJ1exxRA6u/0ssNul3OzMOTNcXEZYvJCf/GaZKiBijPeSdMbqVQv
         0szg==
X-Forwarded-Encrypted: i=1; AFNElJ9ENT85ib0iM9oXwHF9OPHVYi4ASW88yBwlCRPLPGqmuML9fkKP7gMd5DUKXLvvVTn1FOOT46E9jlMA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9GGJ44eY5XyAAdT9kHT0pY23XVkS1Y0o5FB9/bvxmglKG+KAS
	OknwYHB4GYCGGYq3GRz16u+9Xfzy8gvacQpvvqTG2oVRzj6yg+NrC6BpFK/lZRIfgJUX5Z/EUKB
	N7y8KVwtqR4rhg5/XgXtsNqheVmg93FaNYU66QBIef+6xegve+TT/zpdD4ChSXcQT
X-Gm-Gg: Acq92OGqaLT6md1xh6kAYZiTbXpnmi6gRCgQFh/6jzgwhWYI4JNuk3ikAQH2Yusv/zk
	s5mMutFcV96SspG9KCJiBwt2TMrGNP4iTVz5AXE+BlXSDoHiAjzps6hrqQspkcY9tsq7N5JBkYn
	LhYxGcxTiIcwS/az8tPFPGL3jqM364mMG6KfjIyRA0lf8VgJ9XHnhO29DHYwZMCkyE3fkj1uPvS
	/l9T3paJhMhZvEdAEYoD1kVycjZHSwXcZlQi9wsoVWb6RsHBMuOXofYUf2Y63l4ub6wXaQUPLc8
	lzoOWnOpSEiPMmqoJ4usFnToC+J5NoRQyD/lVsknKsXkvFoUdi/TVyn18zHW9IiQXYeYtZq8Kbr
	iN6BqpFgY49UU4gsICNK71zs/+qXcz7MPjNpb8B5sE8qYkCsMTNc=
X-Received: by 2002:a05:622a:250c:b0:516:e290:991c with SMTP id d75a77b69052e-516e2909ba8mr203826841cf.45.1779813656373;
        Tue, 26 May 2026 09:40:56 -0700 (PDT)
X-Received: by 2002:a05:622a:250c:b0:516:e290:991c with SMTP id d75a77b69052e-516e2909ba8mr203826311cf.45.1779813655701;
        Tue, 26 May 2026 09:40:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c518:e53b:f5c3:921d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm35605880f8f.20.2026.05.26.09.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:40:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 18:40:33 +0200
Subject: [PATCH v3 2/6] MIPS: alchemy: provide visible function prototypes
 to board files
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-gpio-swnode-alchemy-v3-2-2aaa1238ae4a@oss.qualcomm.com>
References: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
In-Reply-To: <20260526-gpio-swnode-alchemy-v3-0-2aaa1238ae4a@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4315;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lhgjEO2e6+jKkDXiNFRz3t43DYmKDRbaUTKrI8llfV4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFc0My10lIEEWtt0q6ufoinAsyF+6973p0EF3M
 HcIhqX8LMuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahXNDAAKCRAFnS7L/zaE
 w3zcEACnDdE8ftICOqC4fxOxxVH8g0ZybU2MA8kn3/kD++PyuVtIka5aDTx5zswg+lNbgdCilND
 0lKNFrqOremtrHqPhlPOWTrnsJEfHzmxA0g87brue+WHyomjhxT8P53FP/3M0Nlz8wSfFxU8eTY
 Vhgej+1tPDvH4267dRktyorDiK8ckpNAaRxF4/NHlXdK1bCwxAAyH+jZLTmVfPGCX/ufEv490Ts
 OTUPSOTKAtEdGFGIuY68N5EPoeKGTnqZEuUEcAedU4FzCwRJ3Xqm2Oaw/NbmEh6hfyefvRGuV8a
 5gJ8h2KBDrQ+RzfURM6cVnIAAAF1rkaYXzY2djMdG9G43Xp2Dh1o0ZNwBbsj25NyfeYm0pq4glb
 sJV6PbYDTzLnYjZOZbeY2h0USWI5J0zqcAGpAuX6dZVsB9YuY8+LZAFFTQ8AwB2P83LTG4j7Jlh
 js31IcbRbDY5nSttzMP/2qpZLWOgejXj52onNIVDV3x3GUtaHKKi6MWIWhB4Xx1nzZfGy1WktCE
 nJ4TQpr44nYO3HgeB2zDw3rjDURCWsoWxfIC2k+OVGhWPpYjqR8NsgdctOeJvtAeEugIksKH7s6
 QVo3slD3L5xfn/ieOcC+GywvBrj/YHoGniikk1FXBnslaWzRSU8J7/8EOLs2KkQfxOl0J72S7qa
 yY0sSz8siONk8+A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a15cd19 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=jNKtMNL_tjeZMJr_EBMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: uCDuH85VAqEnSOHdWMGN5mQIrr7ZyPEr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0NCBTYWx0ZWRfXygyWNladHh3q
 ybEM6eZQnrYFAsds/TKP7LqKbVCAVrwWfqUBgsH5p/f3YxB6sXIEWpe7eyc1m3jYULFrQx0Jcm/
 G0vJqMKHXBO7tFTfp8dSXRX+2fEihN+3twtPdk5EKcsXWvKinWtUpcrZjJ0UHpoSk/uIWUGz4cE
 5LAyuH/UYRoUJZqBEakBa8wZumo3LUkgLLxNZGnv/la16pRC+k9O8tnQRkphwqf0ZC/8bklzJM9
 Ld6cOAKiqrYlUpuTRDr2dWbvl9lmM39nhZmiszy+K7mTEyrHX3ZY4RKmHW/COpH05cO6lFrn99k
 SeDfxJDo/ToAKuHllJzABLZLVMWfozK8LABjZZ98Is4HU9qTJB4AlaDt6OqfaMwcjiF/Oq+JnSH
 jg0MUreEtxdusto61Zuz7uR2MTJ1Mr7yLogsqUKeQnBlRA14fhfpqoneTIWfJT0jTNdHggs6n1z
 7ms6L9LZRBCcklwLsyA==
X-Proofpoint-GUID: uCDuH85VAqEnSOHdWMGN5mQIrr7ZyPEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14778-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 201FC5DA48E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Board files under arch/mips/alchemy/ define functions called from
db1xxx.c but their prototypes are only in that .c file instead of being
declared in a common header. This causes several build warnings about
missing prototypes. Provide these prototypes in a new header and include
it where necessary.

Tested-by: Manuel Lauss <manuel.lauss@gmail.com>
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


