Return-Path: <linux-mips+bounces-12700-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23333CEE95A
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 13:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 74A853009857
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 12:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9A3314D15;
	Fri,  2 Jan 2026 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCrAMEE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RG3QjPmx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A7314B6A
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358185; cv=none; b=ZEuJZnDTgYW2ILtP192vk3tBa5di91sSlHVlyh9NYO00fKfkpdJTE0bsG67BhkdvvCUj2q6+njXHVHwTFrLa4HO2KHdTxCafvJh4TeeboCyAhODkhjQKGlNs6coAqcfeHRQ24RxO9/lb+TFz2RYM4alMsHQ4uAGwh6sgkwi9T/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358185; c=relaxed/simple;
	bh=sBSnKcyMGQZIqcjce3lbMUghOycYQyfzC3HJXcyHbGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qmjTA6qSkok3OhI0tkd6WSJWJQUCkv3mGkBL9pQMXN0qqNSsIpRB/XnF2lDMjJfZalXO9vwp355aUVxuaXNASdTmzVcbq89pB+VdWlnvnISZraS9Zf0JYOfNSDiw8pOmEc24UatU3Z682UbVzeJVfqyFD0YiHtUyFMQRf6PrVuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCrAMEE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RG3QjPmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029X18b210086
	for <linux-mips@vger.kernel.org>; Fri, 2 Jan 2026 12:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imFOXG0sly0
	peMhXKSlV52oA/rftbzRYv5spTS32Zjk=; b=FCrAMEE9y+id5h8z0DN8Iv3OAug
	LLDwb3y27vUY1LWNYcWH419RuN2r7zqKpuzEtAErsnFf02A+ZmyazLwhnXaW4NnC
	VAMdG+SQG0MiQe6wb3bBKYlM0bLiOkDVNX4898z5ahnuspizgZpW1Kp7R66024XZ
	EkzwENB6GGwYlvnOjGe4/qtgUPJFNDI887RRJQ75JEyF8Y8DZAuZFGuTcIeeMtzK
	k/PHYlbnqsXMlSCfZ+n/eIYxlBvqDgb6hfrB/sM9vbPR2GunbwGDt1632bKwN90M
	B0r4aW6wzD1BmxYKXtyi0uDRFrq3qkpKzdjhNsI34K9YdAWVZC/VeHxwD5g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cghf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 12:49:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b22d590227so1372499485a.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 04:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358182; x=1767962982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=RG3QjPmxOVfw00RTZxr9/HXrK8Ml1hBI8UIuqvxHfTHrPGyMUDp394BQlv1L9rhPdF
         Jfzti7q+s+xExy34ZF9UFJdNGdDaE9nG4e03UmQxjqKe24poVu3GowXem/6EO8aHXye1
         nRZvI+09mhnd3Gp9I1vpqG0Z7BjVxdAUR+Wsalf1wyKN8K8bzKsM/fNPJ5JfEFfGW8m5
         bharEDAPyeeRjH7COwjOi4QnhpGB6JCSQr6nZBzOwVmhSUn8PZMhvzN9frSlbjPQxj8Q
         gocDqB69SWchXRLVX4xTFBog05DxWrdl9CoRz+hdzNknXYlVTgctzObw6omRZs7Qop4D
         HycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358182; x=1767962982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=KrMPCXjRe1dNCjMA7g1dLBnlAQb6BaP80XS9G/at/uUz3GNNT/W6ewkWGB2GGDoJ9O
         rH6RWlA6c9L/rSYOffKjgk5QRwEbI2gcG5WGsiPSFqpeD/a1MuH7OHxWyBwARzXA4BS0
         1KN3v4WaFopVp1myLl079AcQ9WePHEpiYY4sWtt3Ge92IK8spgLdVDCcJZx0a9C3YiAV
         DaQWiF34CXACC3Tr65G+Q4U6Ve3QFVYjP9o+ZK3FN7nJIPInmKIGmObJQzaDMerwnhPb
         anCBeQDe2gApIxUupfuaqt/7cwbjw3rmbxPxBhfS6zz3yzkrWJqm6XHFHeaw7SDnoHUC
         5tCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAvnJIgaZFQ8M3XFEmD6lKJsTgdvEjnPEg4/vl3daBH3CnPbMTGmQuSNffS2nDWiFG3yzdzycwblgv@vger.kernel.org
X-Gm-Message-State: AOJu0YyeG/aWJMVP6u0U5wLXI4bDRK7bMMkGlJ0tQFZqPMx8de1PWl3q
	x0aeNkEPfnsxo5Gn0hXP5zY3bFmYScIYp5KfgJte/rcXFREk6PNmQNgDgDJEquz/XmjOd0ViYW/
	nHcTjkNkDdjQtefJBgF1FHiUn/y8VTKQBaN4LajbGF8O2ZCWwjTvliFIyLpVdKSL1
X-Gm-Gg: AY/fxX4lE+UUeH9aLnwqCDy6aEygnA0bk2UluW+3jbE3tLnSAVCe5+BZTCH81oBVaZn
	/5eBZrp20g56wDGAwLx2+ZVlQyeQNbYoRDoAJZO59DfDFuamhIZZjImHqPEoLANafUyYcB4K3Cr
	tlib+sHjNSyRVYTW6HvbbsxZejLU3ww870yQVYy+8BMqQHBOT7wLbp0BXT4MEdic9o7L9W7K93Z
	ewYLPNYqdbs/tQlE+nyKytfTl2oQdsnv8UFWQ9ygOBKpfdvutm0apIke10NuwWE54jKmx9llsjr
	ZQisjk5DUFJe65PAkMyKpj5kHz0ISW3lamgiFuO1ouQ30GhoWegIVrlSk1JUBAMmGq/vdqKMTKM
	2iWPxJfzBzeDg4cySsHONdQN8dw==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284821cf.65.1767358181996;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT1txQdBszLd7m8UMVD5gJdJoPAWm8VqLTOz4fR95P96AkN4L2pVtSv48GMc2uikngxpnUBg==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284561cf.65.1767358181601;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
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
Subject: [PATCH 2/7] mtd: rawnand: denali: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:29 +0100
Message-ID: <20260102124927.64703-9-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sBSnKcyMGQZIqcjce3lbMUghOycYQyfzC3HJXcyHbGY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77YCiAV7tcHXkpkf4bqBHwky6Qoz/np3HIyx
 MfEw1pn1cGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2AAKCRDBN2bmhouD
 1wLHD/wKh5j1mcOQ0K6bfHRhqc1Y7UiVom1LjviO8AE6GDqHLuoea4sq82dEPvdB+iw7SIEIXbQ
 /xFNf+KfiDchxyuxQ+T4lGaZ8x6WAAx0X4vteAWTqG4l01FoqMBj8pVs8qBvXtJfczUuSKKWGty
 lHel4Tazw/t21yRSf+Y82KLxdE7EkZ1dZ9b09IJGrmxFmKcEVFlmzgW/Ld1sl9E+XavBpplsQNq
 LctU5OBW4R4qvqD4kJrYscewoMoQJTlPu7InLOkeqyCRUCpl1Fym987mlu28GZBYQuRSajHDOXT
 f9HPbuEodD8mLWu+8iOURU8OZ98wCj00bgs9p9AEVpoe8tnYnWUVggb/u4Ip7XbvZ0vnGg21b8Z
 G56JQoVCjK/KyduNGUkZVvJFEzQ4v+P8o6tMqlRKP/5sloqZwug29GVuBXi18Ul9gKVDV0EbgdG
 hcSii0FvyI6jaIIl7NF5ellj+qXUqQN8FKeIMSBZ+60IAfUzpoXB0fNsg774Lvkz+GBI6M+tKvn
 jWAL8vTI9b0K4sQD2rMh7u5l57MqBjUcDkjePNbPtJAHosyqtON/Jtq/BOmd/ZGkQZc9G2L8V6T
 n5/m44JVJ43AkOX905OuLvpKD/yO8gd+PLKiSENBUMdvNiyqTKLIkQURI2ozDwZ6l8uaIy/61OK 7HM+k/p6elpt54w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zvfSIy5XALmyutznv_d93ZO1TuIZEhTI
X-Proofpoint-GUID: zvfSIy5XALmyutznv_d93ZO1TuIZEhTI
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957bee6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nYNvWqTqVqtrO4BW6YQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfXx20j0lR+kDZV
 flZ/rsRAETK6MaWw1994pndZIzwW0Lif6fPFozOu4i6oWG99v0aRXNRnlksV3qzxKmO3i5OJ2xg
 dChSReAQQr8wqXPpLZiyvwBXw8i2MNL8qjslZ9k51MxaRLVdeftlfrMZ9xstXMok1tWPVXgfNjp
 y2uFlwKLUQ9+TcqqtOztellK4dj9jQIoeibDHqnaKsqfBsGJk0iJtKENwm+yIGbQWyVh/eRArQE
 4xvxlD3QXkNiDPW0O3cynDI8nyCa974c2Q/gfLopsmjTbN1KfL0j/MwwnUjMLBmcPR1ZrMOLZJK
 GwdP/oYgCMQffdOZAIubuxoGLsD5ye15/Cn2LbmqDq0FDvvON58g81wDlO0gprU6++YMcQwpXhu
 FAakONTCbg9DCwSpPOuzeFlhQv+h5Se8xHYJYc9olkQZzmVJfD3SqjaD9Qyed5x/QS8Si81YXU0
 RQnvMtlq1wt0BuFZvGA==
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
 drivers/mtd/nand/raw/denali_dt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index e0dd59bba4bd..8c822eae72e7 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -115,7 +115,6 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_dt *dt;
 	const struct denali_dt_data *data;
 	struct denali_controller *denali;
-	struct device_node *np;
 	int ret;
 
 	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
@@ -192,12 +191,10 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_assert_rst;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		ret = denali_dt_chip_init(denali, np);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto out_remove_denali;
-		}
 	}
 
 	platform_set_drvdata(pdev, dt);
-- 
2.51.0


