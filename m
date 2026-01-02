Return-Path: <linux-mips+bounces-12703-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C40CCEE9DC
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 14:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66EEE302920F
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 12:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360E2315786;
	Fri,  2 Jan 2026 12:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdVIkrRp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXZJ4lrb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79C30CDB0
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 12:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358195; cv=none; b=iOrDcWuHyBSwHqwOvdMjHY42BA13EJ0D2tSZvewkg4MUFar2auBer/oqQ4avD44gjO99gc4Q11QEhjxMuxKVsefyTNX+5GuUtAgP4JboWgbGqQ+xs7utx5L8IcUCE9TZafF62PioVr9xCgHwtO4nZ9pUwY+2X2ccPiJ3DqEPs/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358195; c=relaxed/simple;
	bh=nDvM2tNc7bhnswWwCc3vXNDXP4C1H2W2zKaXu5ozTQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZB4xADY5HxrHtmPMJ9tK6O3av9YS7eyZyQX6+QcOMbLYSL2/D9XvPeDVs4VWycus4AhUWZZ/5KEkNDwOxZ2MP0/D7tQE3Lsj5QxWzELVr7vl1qr48QXE+9H0vlBYS/ii8+fO2pT+f5VBstN2z78dIJJiCLUoeK+MOLcLl3u4FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdVIkrRp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXZJ4lrb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vw6h2310153
	for <linux-mips@vger.kernel.org>; Fri, 2 Jan 2026 12:49:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I1PTZZIAa0t
	EuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=; b=NdVIkrRpWMfGZwnJAKnLYdnS5Ub
	PEbC6QWTYdCXT7UCQ430AU3n/u1+42O6c95zJeyXmph7rWOIbX4bLcbo5+x60HuJ
	b0UMaCGmTNu505s6Lg1jtpRy0iFgEBBRG2Du0gpI7CN9vjHimUAZQgXqAoO8R8gW
	OLZwmf2LPg58YpQgyLplTpLvjaSrLw/OivD6brb9tXhwMbTaU6tr1dmJsdOMkbnu
	a/7uRKgLv7A/VFz0RURgoL/MLl0Jxrv85OTHeFHOlQ/HMo9ho52ArSN4RIbHNSsO
	hl5bw9QRz62S1egdgIRvqANiOL5wQYJm+o8lVzZzQyPm3MVDxOo2Bf048Bw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9t1rk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 12:49:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d7ac8339so462043611cf.2
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 04:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358187; x=1767962987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=TXZJ4lrb+JNHA/p10x4kMjX/eHHouwf8YBA5lmaIuGgEXQqETGKYF/nliRVfZRMRFJ
         J+e+OjQuKKCzHEELGtImGVkQgVRZYrxm13NZ/Fg3lg1K6qbxVgkNypFhq6LRkVC/iXK1
         eMzlhWZrWaEtYpOpZ9rW90UxlHvXLNf/rk1CNlRF4eZYC77apATv7WGRERK9X6kJw/Qj
         8IpeB/iu+wKH7rLm8Zbhp4yHFSOmdDpkJ3ygCM29p0/5WzyjBdSEidNGsBidghuXaHR7
         JplvVgBS3oK/shK3GgIVjm+y1wIbFVneJ+jhcP8P4Ml7d2torKuipAoY0CBJ3L4B3XMI
         iWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358187; x=1767962987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I1PTZZIAa0tEuYR+p5xJVPIyMtUwfOVI7eaAwzoH1zQ=;
        b=wNzVdVcGPqg7Qc/jS2vQr2U3xmIbwfoAtNu/yPm+Wfq79A8HWBKKYRsVV1M+sOsojT
         PlldTrtV8kgLzKi6RR0P68DBsU9sR6KW+bgYuwPm5trgbz8zL9clPMLVJ01oFmtHVF8n
         oMVY+tp6nVnPLr7QY4WJNz/JdaK5QZD2G7wBdtuigo+zyTz/0bZOlPywYPiz/5KlNaeF
         0W3UThTuDxbqZM8HKLmcnK92RQDZyt/bbGcEV3FGFBw+esi4gDZ40noGrhsgOCfAvq2g
         29KRkChOAkGZ6saqt2qPoLzms6pp2XFTzDki4OQv/klDqzmLCQgJI1yKjGO2komhnYCu
         mQ1A==
X-Forwarded-Encrypted: i=1; AJvYcCXgMI4YWmd2/dnDmmFYdkiTqO3Qz0C0a61Ezr879xrtUPJHujAn2cpUoZgl+SED3hOGxjMTRsfTLC1Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwRlCJzhvujSLozINUhQ5sDGegw+BqjXtUvFYF4/qbB/KhOQHbA
	9kLxkeLocnaC/BPE74perjnyW7fFg/RsF6XRssRO7cZuHzAZNgd0HyY7pLaVRQRtO6bnEOozoeV
	HyiB3wxfGUjCoGv4BeEOGSxZur7dZ8NWwm6qeL73A2fHsW0ZMdMi6homSvy3P5YDT
X-Gm-Gg: AY/fxX4Xov+Dk8O7IUtCoz7qm7mzNfmdxoJOORokRjVZu/30LgpuvBapL6H+7PD1rvX
	wmV1zlLCVqmcM+4vuKfPaXRRv4cMPOZVxIipgOyHKzFb8k5PvveZ50rn53QcJrbT5RwZMR21VqI
	9ROum99+VIu07QSMDP9WZL5u+08FSF4oD7qtynLEj4QxQxljmf0VfgGGKl35zPdL67N9Wkxf+YA
	L5vH1sRp3eDEl/cP4KYAteqPovr2yj61x6iSe4RgD605DvM6vac7rOOdj+yEoUgLT8F1ijhdfTz
	oFZUY4TsdJmSyRwI4ajtQ6MpvlgwyFQKkB0zu3XSpeQMInRVM+a88dGyolfv2dR//ESQ5u7AC5V
	iVrQzVRKwj9Xl5I+k6spZ0/lPxQ==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187621cf.79.1767358187629;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPjxg3lErIClyj1q/c2QA920cSvN+jNUa0YCVQZucLeQ6j109UB9otuPfKDt7/rt2bIeq6Gg==
X-Received: by 2002:ac8:7fc3:0:b0:4f3:4bbb:d5c9 with SMTP id d75a77b69052e-4f4abdca1a1mr687187471cf.79.1767358187278;
        Fri, 02 Jan 2026 04:49:47 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:46 -0800 (PST)
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
Subject: [PATCH 5/7] mtd: rawnand: vf610: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:49:32 +0100
Message-ID: <20260102124927.64703-12-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=nDvM2tNc7bhnswWwCc3vXNDXP4C1H2W2zKaXu5ozTQc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77bC0qTYrHh193XJS6xkRC3AcCNBpx+8voar
 IeQOheWfXOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2wAKCRDBN2bmhouD
 1+VED/9nCajKvFH2HUNRtSa685vy12JdBeXoLcJ7SzfTs0WnxG+r+r9cbvpL7vPW9ikOIcnnOCt
 DTBfkWRJmmggpB6RAkJOCxKswAStjMOQU+0gxkD+DrNfQ/L1CaG1SgR5BbNzIr1kP1HZey9J+5z
 faZbFmaf2NGpVGI0rM9cfbCadHzLjqf9I/a0Yt+WyEj8g8wRONlRkwVXb6WlXnb4hExlwbLaQXd
 EZNZamSXX2zZtNMH0xpCyPtf6d5sTpOlXq7gUghE4D1mj5+yYwQxZ0k6RUsfmpJ1GD99xdIvLO5
 z2u167lPzwz3jjRayeQpjgpI39gjdEQrp+PL3gXC7aAcYETamK5al/9Vm2fZ0ugmiAcn7DNlksn
 MGrA/CBI57LzaF2P6KAR7AZII5GtMU6tMHyrowRSadM8rk86RTov5Vhonfz337MMgIJ20kBsKTu
 pkWzftQMFkxpE/JHEAPjgG0swDDcrsoJcee3zYNEFZGBaegmqT2iuKP2FbnVH03WHSj0+LT6N4k
 vkcq2tAG3cC//wWZ3tZI0USZN7rGMkRa51i7IFLGriycgsmXMJF9dsxlNmUDBLIYl2QH5ST4fFb
 mFiHTog0RvCAwkOmy21hC0aFulT77OqoCwLkLnGapgscBfKaNTgS3g2q/aByvutYdczfoninGWA P8HQjOl0aUFIeMg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 16Rgclp6hxGkt1SKUG8vQv-bKvSXg4jD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX+TVxkTGkFBUK
 7S0wPTX9L6yIdX2swd1Zt5FhPidWLYMi43+aRQvmvEzXc95o4WZRQF/x1qJ1CMm2aKWwRtWcJog
 +NKFETvc/mwxdkmsME5KBmPONjIubuAjc5n9JIBtOLNpLmXdcpzkFNTkDrgBOPqQmArjTcWdDQB
 4Gbp4I4NPVNx1U/W1ZiqPOgMPPUeMTLpbX2YgEredBimIvxv5nmV9+Rvz01Sz8BD6mIN48lXv+k
 But0GTgE5KDjPhClVnvjzDbKtIOtAQMvTrcpyUtlMqPcOHKxl6vpqHOq6mu759qnxPEOUvDgsKX
 pS2JB1d4FNgVvczCVtB2YoX2PIM61ZwHl7Vy5/YCrQiS2EHxgbrZUQgTMFWtC4GIjydhp/nU0v4
 38rHnWM0x2QxNQxnlEY+PpMVOiIMnlDw3EbtPXtB3vDlu5MFcefckohhS0pVlJkntFoYlbrlNzX
 WxCZyuqXuM58DiAYXqw==
X-Proofpoint-GUID: 16Rgclp6hxGkt1SKUG8vQv-bKvSXg4jD
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=6957beec cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=TpWAFCZ4qp-4Y20zCj4A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

"nfc->variant" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  vf610_nfc.c:843:17: error: cast to smaller integer type 'enum vf610_nfc_variant' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 4b5ba3187853..1955dc50b40a 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -840,7 +840,7 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 		return PTR_ERR(nfc->clk);
 	}
 
-	nfc->variant = (enum vf610_nfc_variant)device_get_match_data(&pdev->dev);
+	nfc->variant = (unsigned long)device_get_match_data(&pdev->dev);
 	if (!nfc->variant)
 		return -ENODEV;
 
-- 
2.51.0


