Return-Path: <linux-mips+bounces-12704-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3FCEE9AF
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 14:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B16A3051AC1
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 12:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D8E30DD31;
	Fri,  2 Jan 2026 12:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmpnDve3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/PbkM2i"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B39314D2D
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358196; cv=none; b=dXbO8+SsfJkXKSdKxpcB49eyja7zjMQ2EJFd+Y9r3hNUW1F1pUDAOiUXEwhQMy2Vm8OPZlCiD7gjLpmThWSJPsvys+tR5m/LR2e/wu+xWpsxQiHGHmj9O9KmAF01b9XlsotHqeOpusMhWOC8RTDRD8N3mI1nWswyhrmSSh/4IB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358196; c=relaxed/simple;
	bh=F7Kk+7HLc+g1YYGm+o1eCX8RgtT9tyzfifARk7ozNSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFZKyH2D3KjLtfxfoTciBFbBCMreXeu7+H7VJhDlCd51BVl9pROOIkdakn7v8RUDqP/R+HufNBysI28q4qnLnNtCL1lwgAlzTdOnyP/ckg040E7NmDOlBpEWoiKXL2t90/yKDsVWjgIn6MDzAeTPglEIBYABT0hCX0pIwLRVRf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmpnDve3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/PbkM2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029VwUv504469
	for <linux-mips@vger.kernel.org>; Fri, 2 Jan 2026 12:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyANrbDJtTc
	MsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=; b=DmpnDve3awo0W3rdfyzH5C22aqa
	TORbWNdcJzQNWZg56Zjt6rO8lbBHlW8IkQx2duah75UjtnKbB/KB8/fmnCTFti+T
	cPMneOyIkO5q8R/0dSjzMq4cr990VmIEsKcQUb78yCe3lCoVKMfNiOPa1JGDW7as
	pskqdbw04ACjQaLDlXHIKjIbq/1diRDzkHPJ9fg9p1wLPzW15PIJhQ+3/d/z99PM
	/rM6Mj0v9zmn20aI17yAEBFiXrWnIlACaeVSN96YnnsSgW4dZjYrU/kzlf6M/HsS
	VMOU7stcLEjKi1wGZO9BjX8n/NddUJSVEYkb0L1CZb7RPpZ+ZUnpWaJEWuA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be8bk8qjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 12:49:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4fb2f0cb59bso67844641cf.3
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358189; x=1767962989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=V/PbkM2iCp07GjIFBU83r9qXfxYpQFlyrA6q9yge25Ujj01pXlAJNEYKwmQnp5FMwU
         x8EMT9ha/UVIr3iPNJNbwVfeBeYfa4NU7Ul50qYmI2q05frAVe4DcsGj95j4dMwfan6L
         FOm8xc3AQHew+5HKzyfLxDR7vPbsXJbpbVJkHJ79OGVHTO2fdCps/KhBfXf9wKlnRI7u
         50fnaYwim1y2tzrDHd9ih8w2Tgm+gUHloaS5Ecl2bEqOCYK2Eea59uiVByqGkJev3Lyh
         RA2dVALx3lpWYagDSuDDWfraZSElow+tSJGq+DIvj3ZZlrHZSjnRA8VMbT920byub5S7
         Hlnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358189; x=1767962989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=dRiIf+EvZBJCK/njgy9UnE8oonsn4Z3Rllm28SeMq5gEQWJietD8utijkXRI7PZw8y
         DV5pl6lX+ZyGB+knDN43DWMDiwSU8v8iC/LrGjxY1ii929ur+WXyQnbaCwYdQCtC6WqH
         4fFToCp3jIOEHwyJL4j2nSBSOujFdq3Z4PNg/EfN3zw6WfvEY19PTFJKKLsfl2LyZ7vT
         V/aJk4MoXyXLAqGDRtDo24/OrjL5NW44+KmVHdD47A/o4XdgCCsYDJOAzj/ym4PqExCR
         vbacKxXciNuNkk/8EjyOVKP12jMHLhtk/tCue6LSGi75YDgsA0VRtwto1++DnAOBVj6G
         w/aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyz2wYgKQywyG6xORoaOGqZ80kt7dU29CRiSWcwpI3Wquu1tZss+6w0h2TKpqiQzGG8V9iHrciByhh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5UyL8o9M1D/I7IuOopmLc/h39k1J+09WtaG/JQPMjTRxios69
	D9Tqq9mu66u9UwDMUJ1djDhplbCBeI/VuvM6SJri7LG+Viu1khPYUKgTCtRVUJyFgQKw0yPJd+z
	LGJXKgwXEvghAPG8SLcHLMiwAVWZmXHTR2pB6lY8PLxqrqjIp79KzE5Cr0MSZp7l7
X-Gm-Gg: AY/fxX4U1xtlegCet4FyIUlCPpycIGMNMeEtPPemEPXKTHZ07Bvm5TKQhS/S/6dUpJ0
	oMaCdtMtCiejtbjoTVavMWgX5oO/4l8GRtHGhuzNoC5gZXaHJ2RHJmtHq2CRTr9p2PVO+JhJc7y
	bfpR1IlFFYRjPbGuKunUJD8hY4wXLOeQOWYIv2wbr5RNFUTbzY/BEWxU0czT+DpZNLcau965nGo
	fh6r/s0nScgQMbYh2MkcOfuHflnCGRaleLY/+ECsYvfu3AOHolUtY19Hr4egKB4FRuImyFl7r85
	cGqb8y/TIjWXtAptu4W6WJGmZOdDAFmcB57f+vZSW16JAfTDy95xYy32ROO5gKmmowINjlHnI6y
	UkxX3dzSDhX4f684Nx9NqYw19KQ==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688793731cf.33.1767358189629;
        Fri, 02 Jan 2026 04:49:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEE/q2Fdco9ouztC8TyOboLodLR4WhdA5l56Xei6ZNTD5e80NDvaw2UNX8OTeAHWG46RcFDg==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688793431cf.33.1767358189222;
        Fri, 02 Jan 2026 04:49:49 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 6/7] mtd: rawnand: vf610: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:33 +0100
Message-ID: <20260102124927.64703-13-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=F7Kk+7HLc+g1YYGm+o1eCX8RgtT9tyzfifARk7ozNSQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77cLysMrmgaG5ns/nrL5d4zYXzAy0uQLWg8q
 0r5eyNewxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3AAKCRDBN2bmhouD
 13FXD/9fEjxdaWR32ImdhxvYI31+PdVTzd9S/Q5khkafnHnb8EKMGaE7OsNzBLBHJG4AOWrgBCl
 CWgzHBZiLc47tW++MIdBquoQjyPW20dk7ZIO9pM5KN+iQRXFYUBEq/qc0GihzXg3wN+1EE3EelX
 Tk6gedm9V8pTx9Q53pJBoPGI/ZbKapdK6+ocpHrzoI+zwOr3krbdJLxBQcLvCuxZC9Tvdh6oEh4
 qF5BjyN1d/0LoOeCEnVvHmgRBoZOtbZGGc9H2D3vg8Uc+Q9l2TRzsGtRHPhKbUq5y4SdiL5enw1
 eb++MnKmb/DXKIMKZqNA6Q0rXksdUe3xalqwXUO4kB+hUYuvpdlFx2Z3jrx7yfy3K749BMLFECk
 0zvPnXff7zmkT3aTFHHM+45A4GDHHNcov93/1/c6uFJTsMfAm1yatvEpcE/7jhXCLwMPiMsCjT1
 YP/3hzKfctE4HyqHOTpo8Pn4XhXUWfKajWtWayuYTUAiKVZp45XJhOv1cfP0Tcd5oou5ME6xQ0+
 JULIMJZAXU1KgkWUUGK0kSZO2HZetOzthobPuj2rpTfZUDlVzgHzp1sp3hEKtqtb7WvTKHmMZW8
 rSRlT3WRjDyQ3eTMH0wJt80Vf0yxE8Fh6Qom/7VAx9fyRLMgIQaRTm0FbxrTOO6buxu6X2ev02U kJETjK/2HOFFt8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX6hcHX9dgwzKs
 drzwtKMfH88RFD65n/5Dy9eC2wozEaKGhj27DvVc8CM8EV6Lbqn0TMfbIC0f7AWCcmO4WteAlWN
 /4x/+REF/585DJDwwSecfY31Ft1lBgyYJHJMR2k/geF9uSZhx2Iohbm3JQH12htC42PWSUXo1zT
 YyO9oFlF3hiilgDB20oUUmzE5N62En0wV4UVD0bMwXwdGEYGcnxK6ARCMcEafYiZKhHsndL2M/6
 2RgtK679VVFbd4MdZRGpesQmpUehsbAv2s8B46XnP2YxcSqeyeOycK2hADc9fi4U0S/+GEWxadF
 ibwcCaZXRAQ6SaefQffraO8c9R5o7RF0YtDg8M9tXQ8ysE1Uwbc130y0NVLDItaFDfJdnUXHPY8
 3e0DlMutMNoYW4kK+bfyexlxh2v+NgPZY+DdIdawYnXz+UeT7Eh7lST7tv1gmJl09BbwBVjOpGX
 Y9qG0Zmc7+hNNUckwwQ==
X-Proofpoint-ORIG-GUID: qVzvpIUXsSkxgMX596mbDOe_jW_d9N25
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6957beee cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: qVzvpIUXsSkxgMX596mbDOe_jW_d9N25
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 1955dc50b40a..9940681810cf 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -810,7 +810,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	struct vf610_nfc *nfc;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
-	struct device_node *child;
 	int err;
 	int irq;
 
@@ -844,13 +843,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (!nfc->variant)
 		return -ENODEV;
 
-	for_each_available_child_of_node(nfc->dev->of_node, child) {
+	for_each_available_child_of_node_scoped(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
 
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				of_node_put(child);
 				return -EINVAL;
 			}
 
-- 
2.51.0


