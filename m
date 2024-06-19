Return-Path: <linux-mips+bounces-3736-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B983A90E112
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 03:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35AAF1F2370B
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 01:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D019524F;
	Wed, 19 Jun 2024 01:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hKFLppKa"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72868EDC;
	Wed, 19 Jun 2024 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718758911; cv=none; b=LHoRdfmPbDrjqsZniLoAdN3LW4cCqbDrQ78Sii2LXViNBtK5eQAgbW0GnyxnFhjY5yzKoY/MV7IGOXut5peausqIZwFyiKf7LkzcVt1jYT/H/O3NAkIm0HZ7TxVrMi3Sm/i4BWlZuo/1ce8xH60jWreXg14PzYJZ0+c4C0pPyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718758911; c=relaxed/simple;
	bh=+39AZubS+hg4CRo3u/U46R2iKurRlJVqaALw0AM9A7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=e0QSv6NSXEj4xPmOtMKN/Flb0LaVKaI3ZkNNVMOgDzgWS3keraqxuPXE0llTkxfqYwJ6MxbKx9VzGa80hcPTcU4EP6bb14BE+/rCPZXLqE6a/q6Xdi6qSJbyid3vlsGYjfNPrwgqea6V0MdCrH3L6NAoOxhbpz+hsMAs16AQ/io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hKFLppKa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ILepET026456;
	Wed, 19 Jun 2024 01:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cJqIaYok+7/VUeaqZ0FZsV
	RqtKvMcUBtJZOpeR6SDO0=; b=hKFLppKaz92bIiEhIvMmGGQFu6atE89N6sy+b0
	7jh6lG/A/AbDPKsjHptODbHJ2PtBRneAnO+IDvHvtwEGPTRTiOgExImWCPiaeGlO
	rTxlOUXQoApgrfmhnMCwUQPT71Gotc4eG8Eu23vmLSJL7A/FwQtazcHKg0wJRtNX
	Qx+QHcC+jGfou+v1E4VE2sI480+ZGvc6gaO2a+Wyp7Lmj3RAF9q5V5sucjWQ4qVR
	chL2i54W3q83rNI/Nmtbu1ixan0iUwScn76KwYLNblFG3/nWP4rDcLPeY/ZRmeV+
	7QlxemmpKP2pAWqp0u7TJr6R3tIgiGLuIx/u6Jy3+jZhEHyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yujc4ga4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 01:01:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45J11VjZ007448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 01:01:31 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 18 Jun
 2024 18:01:30 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 18 Jun 2024 18:01:29 -0700
Subject: [PATCH] crypto: mips/poly1305 - add missing MODULE_DESCRIPTION()
 macro
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240618-md-mips-arch-mips-crypto-v1-1-1ba592871112@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAOgtcmYC/yXMQQ6CMBCF4auQWTsJJaDFqxgXpR3tJLY0M2gwh
 Ltbdfe+xfs3UBImhXOzgdCLledcYQ4N+OjynZBDNXRt17dHYzEFTFwUnfj4X17eZZnRjCc7hHH
 ojfVQ70XoxusvfblWT04JJ3HZx2/wwfm5YnK6kMC+fwCwo2HniQAAAA==
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: <linux-crypto@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0lE7O43GVlYP2e2ofOSJZDEEltanySQj
X-Proofpoint-GUID: 0lE7O43GVlYP2e2ofOSJZDEEltanySQj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_07,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=918 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190007

With ARCH=mips, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/mips/crypto/poly1305-mips.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 arch/mips/crypto/poly1305-glue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/crypto/poly1305-glue.c
index bc6110fb98e0..867728ee535a 100644
--- a/arch/mips/crypto/poly1305-glue.c
+++ b/arch/mips/crypto/poly1305-glue.c
@@ -186,6 +186,7 @@ static void __exit mips_poly1305_mod_exit(void)
 module_init(mips_poly1305_mod_init);
 module_exit(mips_poly1305_mod_exit);
 
+MODULE_DESCRIPTION("Poly1305 transform (MIPS accelerated");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("poly1305");
 MODULE_ALIAS_CRYPTO("poly1305-mips");

---
base-commit: 6ba59ff4227927d3a8530fc2973b80e94b54d58f
change-id: 20240618-md-mips-arch-mips-crypto-19785d95418c


