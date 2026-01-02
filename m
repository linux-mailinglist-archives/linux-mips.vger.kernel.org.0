Return-Path: <linux-mips+bounces-12702-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B7CEE9A2
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 13:59:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4606A301D5D5
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 12:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC63B314D26;
	Fri,  2 Jan 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANicxl1W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwaM8ZV7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61443314B60
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358191; cv=none; b=SIBaDUY5zoCD9HqBjf3cZjhEnbMhESl2fk0k/lswZxLorB2co648uFMATz7uEBQEGUTrTWD5g1M3KyAwiZjN0d51fSml0UyrG9C6ucDujGThkpuCyFZqalSj05bC4XgXifP8P/ehUQLhiYSjbRks6DbQoxwOcNTJs322Pyl7948=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358191; c=relaxed/simple;
	bh=WKsUzSB5NIe1xJgJA3iTvoyEJt/voq3uK5YhgnzvsDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zt52PKKE4MZVcudyAEgm30ESTzjqJnFFe+gGH4dHqLPKBsprfM13hnoXqSBsIWdtLoRyIy3ChOnWXSYEHj6aX/2sQipJS+e4LuxhInlHcEr+2JI041ujOeLQho1Y36D/2srDbdsks+qB/7+K6GjnP4xNnyr6fY8OXqPurvJrDRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANicxl1W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwaM8ZV7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WE4w207478
	for <linux-mips@vger.kernel.org>; Fri, 2 Jan 2026 12:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0a4z7tWbV7c
	PqM6DrSE7hr2il6yV/9/oG4yDR65zbps=; b=ANicxl1WbcX990IM/vlgkJskL4a
	7BFSuJdJ5lcP5UzYZs3UnEj0B/5G2CRPSaWawBH3rMnGV8Fy2XBEUPdjYfcKDGIJ
	7uFWj37UeFwBCAUqjk46HQ28gZiZplJd509Ga8cpD7wxB/mfQBKhn+aGVr22Kfds
	j4RzvYxGY++uhkG9j+GpcDlKdUQowqqE3VudfhVKHSNNYpeUP+iCkP4H9ry9dlrS
	LtLCCst09PY3mYVNXo7WIyQgPoGmhq7X+DFajHY4aFECQw6I9o+zwDlc2owOanSj
	aJmHTIDgW3i9mbrINKO679uoNrwPNzR3vaTzPhsnO1EfGY9dPjw4YZgw4YQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cghy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 12:49:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so453122061cf.0
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 04:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358186; x=1767962986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0a4z7tWbV7cPqM6DrSE7hr2il6yV/9/oG4yDR65zbps=;
        b=DwaM8ZV7F2Mx0tihG2vkk45cwa/ZOSceqhmVxB8TCguddAfuMXJUazKykxyL7eEs0q
         bovI8A/ATUmhfhLEdTekiGuU7A/7UmwMn53GxTpXxWBtrdaJSyZh+HsRGbPyU99mt8hm
         pxajUsbuuYTky1MLvRmoEEAEp6AKf1FyWRX9RFTUs9Jxmx1htEU0J4j2AgNbKBgIFOl7
         a+gsD4PgWcYOZ1odb6ESv7sLiYCKae9G8O2zHxeR/D2EP9mNtCY4ZqMgaWEkhrp5CEuv
         1FkjDgLF/XMcq6ak4lK2im0ohlzL4PlUS5FTVeIAXF+CyqqPoLZW35tzjwjmNIZ+MUFs
         MnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358186; x=1767962986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0a4z7tWbV7cPqM6DrSE7hr2il6yV/9/oG4yDR65zbps=;
        b=XYMMn8wxRUBVZZnWTwPe/mZQm1HB0mKxp4b3ev+gEcquKT4ZOapc7itDjx0NAAQHeM
         Nlt2Rf7Z2fdjxTvJTPpL9n3cvC3SNhtfK5JowgBfKOkZLiNotSY+PXJ3JfctQ+oyl+KB
         AbWpAGaPA1+mqsZeEK+Or1YAfT4lk/68al/zDhl4Gmx6YuuDr1SgumONegG2vT3IkwkW
         vBbMvfYRLHgS9rAedTCigV9Ov1Iy6CIchZFoUBpT+t9EPm7Pj+XT3ed0XBcIl2ugHOVe
         ecZkoGTcgNrbozOe31pDSxuAPezBZauzQnosKjBEnRJD6r2O405wCvTP7aCKwuGXMDIJ
         xPAA==
X-Forwarded-Encrypted: i=1; AJvYcCUhmlUzamGYNQB51TqbRjhEU6/9LDlWXQtpB/UUMmPSx0EVRu6s90e0kSvhT9JPwKrG8UTdBABvFtnn@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0Smqcy1tyzzlKRLP5/mjLdFcy60GCRBg/hq/aYnL4gC+Fb7Y
	StFKnXMLWg5kiTI9cNqgZFcm6YfejGAOrBUcI2h2gGiDa76VODXfQL2CpQKDT5Y9xoDQ/H2kh02
	/GitPwFR+x2u3N6lAX5/xsOIeSajHiny/EymAnYCe/BhRzT5r6cUg9RZYIQP13Ynl
X-Gm-Gg: AY/fxX6EgVsz0Gr3YL0xCHivKyatVOlcBD4oS1ta4NFdrp2r+T0OahTvfVIPZOZmHQP
	0x9uYk2wusRaYNkFyEUd1ritwDN5cm7ku0kwDuiPXjvjdhelIjKrEfE5GLUsX2v7DA6DbjT+7Ui
	USXQ8Rhh2xNXvcHtPiKISGXiftYstPTWhlcg7xEOjpnohYWbxfpxntAoy+Od9mlIpB0gTleXR8B
	jpoZOqzXxxettbOMqosYwyxF//X+2PJKOwyArw8+xXI6veOwAe96MdnwYBknolIRC9vgsZVbdfF
	ChpA074VNRresnOOf1S8Vmw/hcKf9mP3c12oJBhr9CoTJLOEsOnD8zjFuVl+BY8aSWEPoMiS4q5
	VoyQ+rtkdhouYese/eGevdE1E4g==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr513642651cf.10.1767358185808;
        Fri, 02 Jan 2026 04:49:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVBupyh1i7Yhgm1qePFT0hVTvPy77WSZBhwL5Nr5X5pvyUlLefbQKpyRSWJBl2fU6acK4kiw==
X-Received: by 2002:a05:622a:1390:b0:4ec:f969:cabc with SMTP id d75a77b69052e-4f4abcb8e00mr513642351cf.10.1767358185429;
        Fri, 02 Jan 2026 04:49:45 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:44 -0800 (PST)
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
Subject: [PATCH 4/7] mtd: rawnand: qcom: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:31 +0100
Message-ID: <20260102124927.64703-11-krzysztof.kozlowski@oss.qualcomm.com>
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
 h=from:subject; bh=WKsUzSB5NIe1xJgJA3iTvoyEJt/voq3uK5YhgnzvsDM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77a78BJV2bdK0UdQDD7V7cRyRBrlL8h7NxaA
 IsGC2wLGYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2gAKCRDBN2bmhouD
 12bID/9Wi7A8E+e9tq4qi7HQTwIcsZvCfBuY+Q750Ud86sGjMaXi49XMxGYCzK7nGlB2aIL447c
 cPGsZrZMv5tam28NeRhX7719CcinVuum/vPTVcadJtsglQN1QPYHjWi6NxCZytriNTx1pJYgx9i
 kJqy2SCOkMUNutSut0pimP6SpghiSVLFQtWhDegMCw4uIJnnb6TH0MiNBQziqgQRXj7FCHQtUuv
 9lWVbchA1nbRg5ai0dSfVCKtZvIR18avdtf0qw/xR2RbutgbO7pWfb57MrFK14ThksnbN6nei6D
 ui0fhayHOnVl7vW3wZ9f8hDGNDlZASyS88C8I43anb4zbyM16OLpQsmbpYKB4rCdabF2n600hH0
 QHpHplaV7/AWxRDT4ogJ46I9e+6Y/yhnR2+IgDgkul+s0rhfeVN2oxQxw8i4ze9dQllfEvW05g7
 sU5E6hEO2Nu9NQYEXOKMHfaNmwFO5qX3iC/R1e2+R967q7K2or9EnDExD0oKUTYM/Y0b92I7Smh
 mbkihOo4wIHw3qcj+X5EuIKn9KoCAVTODAMPtaD7e7lDN1Wxb3gEwO28EHNLaz0uR2qoTBPwAJb
 HdjLy6NM2ndJ55qV4sb859e5KL+xXwn6TJp3nIJGYyzWXaeYIssnofZXJPUmDVAIuqrZtnoAAt2 BMsAqbWd5SmJKnw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9T-IdZpAagf3rv-4973aXH15MjCHs2DS
X-Proofpoint-GUID: 9T-IdZpAagf3rv-4973aXH15MjCHs2DS
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957beea cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Wn3wlxd-YHlgXba-soAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX6425zA/7z5o9
 pmCgxEGP301qxwuDQ8WbldDo+w6Q/H4R2vrUxHDHaQD04Kq95xmpzchPvhGq7q4s1Vf+nKlngRd
 P90jOy4yJX/Mxv9JIKiG2Qx5t8jqB2io7xM5OFp3m0L5a75NlKjjn/lMvQHJLhkB60pbkQBigEe
 fEU3IK8NhDHk9phpjITC8UZKcC7GF1Miv/bF4J/d/fp1LD1RY01lPRcAlr3dbHgC7Nl+J64i7y6
 Fzew+T7sYyOny1zSZ6wvpRvZDIK8tkQ850UWo4yGah9+CjbmEBQqJ/EiuUrh8gKKBUxWBeeBXIp
 16jBXFKMnuC9IaBRBnmj5eN+J+Tx/Kq3R3RxPUTjxUxbUbIjJ8BpO6se+bnuj96x8iGz0gcEeHH
 SrYzGVYeFsuNemE9Wuo8eIFuvz2+0QgKOaXDpPsrsEWAXf6zde4cQyLqFgEuJn9bKLj6blDSfD9
 AY6SLDP7coVwfxjJXWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4dd6f1a4e797..b7e79b76654d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2206,16 +2206,14 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 {
 	struct device *dev = nandc->dev;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 	struct qcom_nand_host *host;
 	int ret = -ENODEV;
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
-		if (!host) {
-			of_node_put(child);
+		if (!host)
 			return -ENOMEM;
-		}
 
 		ret = qcom_nand_host_init_and_register(nandc, host, child);
 		if (ret) {
-- 
2.51.0


