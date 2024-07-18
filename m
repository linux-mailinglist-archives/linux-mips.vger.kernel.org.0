Return-Path: <linux-mips+bounces-4375-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A37DF93710C
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jul 2024 01:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CD6E1F22056
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jul 2024 23:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7901465BD;
	Thu, 18 Jul 2024 23:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Veshcnca"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C469146599;
	Thu, 18 Jul 2024 23:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721344694; cv=none; b=EJ8AnH6VFGF6F4ZdRbIK+ad9iFiHQRM9qXo3H9kSTOiJ5RhZopvCXyvpheJbUt0o/OCNCKm90Ph1VthfZnImVfZsrul81D4KObqmuDOu1ApGP0rWvd0Pog+LSQZPATPIVI4PJ18F7aB4K+FgTt3ILTvXM6lI8zJQEj0ZXrUhiJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721344694; c=relaxed/simple;
	bh=2JBzsHda1J1U5jMvpS9Q+LbRz69BUu1Ay8embQrCzHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=KY450pS6M8S0alidCgkL0oyCqGmwD/bF8U5fsCMVZBCF56JsVx1fQmTm/+q6SIkb7rk4jrPRWu7dW5fzIfLrSt5/ZEqxzAm8AfbWdTcuXwD5bJyPiadNPnJykQklJsKRU/rOOTts9CLURbO7OMwymK8cQBJSOwyoIgFUadw1wFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Veshcnca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46IF2SJo029179;
	Thu, 18 Jul 2024 23:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JEB4y2v+1AWVQ5lu+Qmj49
	sje/vzHJWbPjhA22ZTVpI=; b=Veshcnca5vwq213RgPQRuZ4SZO7iS+rNvHzboE
	q1yCFejmYW6cTcnsxTvQzMYelTZDSPUunskwJ9isj1bcQZFzgWnqa9dx/6bVch34
	ounRazxdVas7R1A5VL7/qngTdw6VVlagaLhIuBq1Y/UZOGs2eMUAMBJdOxaZ9jyj
	fRmgD4Y766uZr5E6HX93iqkAcfuxEchlGjKFhLHTxP0u0ImtBZTB14glTJqTxL6h
	II5XCf6qsptDJTEtLQIQct2As7aFu52y8eypj6ljYkcHhuurnqM1mVKOv9XOl7K+
	3EBvY0kee54+B2gAL7HuY3TSIWyWKa3PbDBU+aSR3N1E05zA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwj1pw5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 23:17:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46INHwwC002056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 23:17:58 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 18 Jul
 2024 16:17:58 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Thu, 18 Jul 2024 16:17:52 -0700
Subject: [PATCH] mips: sibyte: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240718-md-mips-arch-mips-sibyte-common-v1-1-49b29b0555eb@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJ+imWYC/yXNSw7CMAxF0a1UHmOpCaACW0EM8nGJJZJUdkFFV
 fdOgNk7k/tWUBImhUu3gtCLlWtpMLsOQnLlTsixGWxvD/1gTpgjZp4UnYT0X8r+PROGmnMtOIS
 jiefe781ooVUmoZGX38P11uydEnpxJaRv98HluWB2OpPAtn0AEJdxs5AAAAA=
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aPpEAgIKQo1k1PFfkSAcWi26QZhb9AGq
X-Proofpoint-ORIG-GUID: aPpEAgIKQo1k1PFfkSAcWi26QZhb9AGq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_16,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407180157

Since commit 1fffe7a34c89 ("script: modpost: emit a warning when the
description is missing"), a module without a MODULE_DESCRIPTION() will
result in a warning with make W=1. The following warning is being
observed when ARCH=mips and CONFIG_SIBYTE_TBPROF=m:

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/mips/sibyte/common/sb_tbprof.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
I'm trying to fix all of these issues in 6.11, so please take this
through your "for current" path instead of your "for next" path. If
you don't have a "for current" path, Greg KH has indicated he'll pick
up the stragglers before the 6.11 rc-final.
---
 arch/mips/sibyte/common/sb_tbprof.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/sibyte/common/sb_tbprof.c b/arch/mips/sibyte/common/sb_tbprof.c
index af5333986900..149a9151bc0b 100644
--- a/arch/mips/sibyte/common/sb_tbprof.c
+++ b/arch/mips/sibyte/common/sb_tbprof.c
@@ -589,4 +589,5 @@ module_exit(sbprof_tb_cleanup);
 
 MODULE_ALIAS_CHARDEV_MAJOR(SBPROF_TB_MAJOR);
 MODULE_AUTHOR("Ralf Baechle <ralf@linux-mips.org>");
+MODULE_DESCRIPTION("Support for ZBbus profiling");
 MODULE_LICENSE("GPL");

---
base-commit: 51835949dda3783d4639cfa74ce13a3c9829de00
change-id: 20240718-md-mips-arch-mips-sibyte-common-7c51d90b31f2


