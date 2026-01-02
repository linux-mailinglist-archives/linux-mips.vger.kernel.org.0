Return-Path: <linux-mips+bounces-12701-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B41CEE99F
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 13:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 03836301C08D
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 12:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF93314D21;
	Fri,  2 Jan 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqP83ciq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zc1hvuDN"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EA6314A83
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 12:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358190; cv=none; b=ZOi1IWpxcUnrhNyLCRyt2cTsvbnSxwMpBBzkes3RRIfMewJtcyuiHe79QJyllO/qFOFEotzzUXPTzpusjaILVj7YoxXND/diwA+EnR9mXMWfaNFfvJXQOXVcKopnxA4eqNxtOGPTyXGP6CfI90whArCuzkjlwijMD/7gkcWFK2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358190; c=relaxed/simple;
	bh=BrOZrPc6bseLN+K6r5ZwNFA65cvJt1kgK4mCCBkPf3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8OHYaEDXmv4q70GdNAIZU3/H0+81scdgbLvTXHtWFInj1bflpDuMoOkrgs8Uj4M/ohPmzNw4T4WA7hpjrewKa0MjDIG/hKfEYzB+e7R61QvrlVc2GXJTHL2O43Qhnd0zeMAtmENEzdqIVpUCsSjoGWEERLv3rMXc+AU7wRclJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqP83ciq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zc1hvuDN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WUm1207657
	for <linux-mips@vger.kernel.org>; Fri, 2 Jan 2026 12:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=19EDiqJvxY+
	UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=; b=CqP83ciqt467pUr+SB3/w3DT/ci
	dZMXyyhczbWpROV6nXCwz+9Ma88UycGXeJhfymtm117L+LPNOrRe/yoIzb0FRjuv
	+j9vyfGDSosPP8YbhazWBBlvNHgH02a+Q3QQNmqo58ccziY6A3PaHHLi5yykCcId
	/ULMD4F3C8RIgJgARrUs7coy+nHzV9s5Z1ByKSIEPXzcH05Zzkn5sPiinFrLfD0J
	EF92feTyoe7u4I3674/n5mXeWGZ9Ekkx/hZ/ZRDvmC0ovsq8NDeGTz6z1aoC6XC2
	bbMOPcmC3+xvGkkJ1BMsJOArMnsw/R+fktsDa+QfiBzA3oahr7Pv4YsCWwQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cghq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 12:49:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0995fa85so365906301cf.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 04:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358184; x=1767962984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19EDiqJvxY+UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=;
        b=Zc1hvuDNzHMKgdwiJKt2d2BGCo1hqYkA6PWGMzAUp74rQXSRIN2YzfPfgRgszn63of
         5BM0Nv50XNBzpct7jGzZ9nMBfdrO3AsOMLFb63B4p9fnbYmDQegSGpU0SHIUZZ/BceTJ
         inIUy1lrwfIp3vyKNN92Peao4A4VPjHkmwalG1LOX5kPCBG03hGAtxJFEP8lvPlbf3Qo
         29NPdq6hzslnqZsNmKaazsenkt4trK0xwsRANKWQP7AtDBl3wS3OwyMKq4e1G1flAJaS
         mThGJBpLB24btCqMtyuOqSBE23VwQy1oHwnxISv36Dxosk+maZ9TsIx0NGL8aL7DCMwT
         BvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358184; x=1767962984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19EDiqJvxY+UJO1aSOASDk8Ku0ojEKI8jArYLNxDU5I=;
        b=jW6J7rwbmlaWnUZPT/i/TmN2lTdBFLISeV1LnLJIeww/Fe5tmLPTxO5RawrPJ2GI0T
         W/wvg0bJIBeUllVk8NuBJpu3wbNwX4IXo8q8g4H1aj3/mXxupdkdc9HgRwmBRMTbJmN6
         RT3ccYiIPduOYwcIhgVKxKIqAD+ppZAqTqaKSVVwCfUjS+RJD9linqGGpEn0pj2d7/aK
         WZvgQzE7UJcMsH1VtPi5aSvYM2VhqfOgj3eAEWoywvlO9h/qvvaa3c2EhVcf2gpreFFj
         K3NsBmVKz2co6RDOpzuEkRXNdRt+BDwcN8anfDHONZ2uBMgFrLDcvrFkBwqwWA+vX/fd
         F5Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW65ZQRra6/VfD0oNGwwstIh3QEOVf7O4+9OXZ9+FW092/2uhUfFjsoL73MmNkhR2OlBDTxbQ5adfaL@vger.kernel.org
X-Gm-Message-State: AOJu0YwpWlroxktZTPKFFlIsJahxaaU9cHLZZAZHCugEOGSwOtUrj3En
	b8tItWanAgzynK1iy2MuN8OrmgEbaTgboFJ5waHPx/o7hH9UZzFaeHKph4/IKE70MjYdOXpZ4gr
	nn/R6mw8BhnWM433QUGuRYlmBrP7cSdDtAHs0GoDgjLCf8Y4x+k+pPP4+3tiOZLQK
X-Gm-Gg: AY/fxX6Wm77CWQNrzYN04sD0FE3i9hCtSNsoc42ytNk8syfwCseYLN0wlrO6CTPGVWg
	aaLbKHkieyDyAko+UvDwf91awTLRhMaEryuVVPJICoBLolUCtuaitvnF9gKBbpccyGowNcXLVJo
	MNE8eZVxX4nJhas+yIa/gs+Wy7AK22S+4KQAZrqUD4wFbxVLlowtE0n8yPnVcAktHx3ppMKM2Jq
	YUHDzpVF1vJDIz1KokUTYiAYxsUDgnhEoXlb3ldOm02Mln/TLODGnWCsxf+UY0PAe4Sh1yH/ak8
	N0YiBePXInqmdY3kDuxgnruU7pBEJCT8AHaix0R5UillARvPrMHzEfUY/VT5yL8YPGNEe3ho9S+
	DRNScbz7tsZJamNJsTu2Sw46O8A==
X-Received: by 2002:a05:622a:108:b0:4ee:c1a:f11f with SMTP id d75a77b69052e-4f4abdd30demr605631481cf.84.1767358183783;
        Fri, 02 Jan 2026 04:49:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQe3uglgGNR+qklPNQjuO2p+WFlVQPaOVJXoxxcfmLW7UGRPm8JS8xJPkf3hKH9eFSuLo+KA==
X-Received: by 2002:a05:622a:108:b0:4ee:c1a:f11f with SMTP id d75a77b69052e-4f4abdd30demr605631151cf.84.1767358183409;
        Fri, 02 Jan 2026 04:49:43 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:42 -0800 (PST)
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
Subject: [PATCH 3/7] mtd: rawnand: ingenic: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:30 +0100
Message-ID: <20260102124927.64703-10-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BrOZrPc6bseLN+K6r5ZwNFA65cvJt1kgK4mCCBkPf3Y=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGlXvtmjRJQ/CGih+wivKTkGTWlmFMe8ev0DJktZN4XBFnVnH
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJpV77ZAAoJEME3ZuaGi4PXiBgQAIPj
 k04vQPYnOHjYCyieHRtlHWoHx8lw66rdY7P1LYZsDJWufIdsgM9PI9I21BAxiQYEHbdIzqtjKL9
 VzrNHmjbT0oqQuai5r0LgvzfM3U13fKpOX2CXAYAJ2L8wCVjhrPpsOOhAnejS2aWJdMUPQdpbhb
 T/1FhKHxcgNSKkvecy1DiqOu186pbe0nvK97Z8N4VzCxBDp3TX8a4A3lkSQ8QT/1rw5gsiqhf8g
 RjpaQXbDKuHUgxTOB5js8jnKrtKzpyu9ojn6ZqNZzN0Zv8U/ae4CRm6O5QXs8uR/FbK7ZeebldR
 5i51ikNsKa+0xDhfXm8Bg4r3RBoubBoQkxVCSdSLA6bEGcuUL359zvPi2oYnh+7SMIPcGrbLmig
 T0PzYWlAkZObdQ8nGhF8SbcWBiMpYz7UecX0a1rTPJxfMICEP+DxJwcrU/zIsPtNEE3Jc2DfJLq
 csoGQT21G4RzS+mD2jDOS3lEm3JnSxnzGqS+sYZpgK2KS3eSeM6TVYlLH93M/kRMHZW9K4zsuO0
 hOanEPnS8AJH9ohlpuDAmEsq+o1mQ4ymzfGoCTGDm8DkHTPhxqN4EcS/fA8FmmpYp3b4QTk3OSa
 AKbAvM76pWQxj1/PM9yWef3dj9+6j2O4YhXip7xxv3yeoG/tSyiwCoSG3pX7f8ZcPQcXtfJSXTB IAT0A
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZgEW3DJeCxGC62QElHJ2oZS_Mw5ZOBUb
X-Proofpoint-GUID: ZgEW3DJeCxGC62QElHJ2oZS_Mw5ZOBUb
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957bee8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX7nF9uILnlc9T
 FEWyk2N2COE6EQ67+xRvP5STA86FpX+8Q2yV/td8ZwDLAjbhZBzCu6wijZqphn6cP/YANqecOAA
 VR0j9UNOvB7+MgONYUg9h8LmCdb9aBXm9cCEypFc2gE+TRZ7y1LhJ0rTeYUqbeLa3luUJ20JszE
 j658NTsMzR9loOPgdSrr+74XHxhwsUbJYbnytWnEkS5yYSKUsXOCnAe1NRTDmgvxslN+/sd5uhO
 LrAIYBIc9rtvlzfpgOUI6/rLsu1POMwQoW3yTSGBZg8xZwrI6VeaxqAbD+5Hd8qLfQlONzORcJM
 K1GooUrjlVhaRR74qkN+ufW1hJr/Fd9r1zC3wa7WjnsVdfziEWMbgkQP1lKubtClcsbLrCCR5Sx
 DoEMOlxjvv0faLenAyn8pEaUzWksyg1F5UGvZVmS/s8v0ODMPxjLK80QjHuh48xbalM3qO7YLix
 /lpL0TPei3xQRJnp/nQ==
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
 drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
index 47dc3efcee92..f1e2c82936b3 100644
--- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
+++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
@@ -438,7 +438,6 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 				   struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
 	int i = 0;
 	int ret;
 	int num_chips = of_get_child_count(dev->of_node);
@@ -449,11 +448,10 @@ static int ingenic_nand_init_chips(struct ingenic_nfc *nfc,
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		ret = ingenic_nand_init_chip(pdev, nfc, np, i);
 		if (ret) {
 			ingenic_nand_cleanup_chips(nfc);
-			of_node_put(np);
 			return ret;
 		}
 
-- 
2.51.0


