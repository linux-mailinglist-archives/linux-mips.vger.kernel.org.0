Return-Path: <linux-mips+bounces-12705-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DC5CEE9CD
	for <lists+linux-mips@lfdr.de>; Fri, 02 Jan 2026 14:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 468D03041240
	for <lists+linux-mips@lfdr.de>; Fri,  2 Jan 2026 12:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A725315D53;
	Fri,  2 Jan 2026 12:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0acStaR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/cItmlU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3EC314B75
	for <linux-mips@vger.kernel.org>; Fri,  2 Jan 2026 12:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358197; cv=none; b=JDXzJd9CFKAY5yWVI0cYdnWLa/d0b6p8+b41VLCF0iL355z7yPOfQPNKDzlkNCdxRryQkIGelUoUJxca/8ZxSx32LCOBlE0usg6I9XwVA/BWxnWqgLUQ7cYsVkF7GeX6CZEAxEuPh7UieNgFv8IE698rTPOORH9nPcD8NQBEk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358197; c=relaxed/simple;
	bh=kjdJYWdNUl5KclFKxYTWNNG5kkOEBU1fS578yV9TsrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZXWAOUOIN5Cza41DI5PbR1eUMWJfbLqNsmXcM6FJIlgtnHRFNHlw3D5ZFwVuof643U+K+aVF9OJ5u2Uygqoa3Mt69u5FiaiW6x30SHNj2oCp6+woOfREaJ9CcNX5CxdIfSxIN/y9Ny6IogNszgwWcxM6V44C08JkipsWCZ3eIoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0acStaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/cItmlU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Wcjg824913
	for <linux-mips@vger.kernel.org>; Fri, 2 Jan 2026 12:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WIoOrmukDmi
	KVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=; b=P0acStaRJ7offTKMW4swuRsqa5v
	ZmnITIUjAPuumQTpMPvIN7pVKaCRRkeJ0Jx8vRNJeaHzH7IRqNR8l1GmJwDaJC7Y
	xhrS5qCR9v/KiqVWPQWBveQ4EDPp7ahCh/qP0K6qO973AHHqTaaLIywV0Ha81nuT
	2pIes9rZkTFB4M6ptyplDwnt4I0AWkowQWDSbyRs81uduMQWUnrXXxA/2uEDJnRJ
	HAp9fznuw4m6LlYJpYbVD0wzj3fEJg86yuJSU9XZ18v2rHwZX/StJMa9xBGYsKdH
	/05eBNuxDWnO3h4FhQRUO74RrfPq0JLve6iyZyjLyjdmvrtuLAT22f24cRA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd8533byy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 12:49:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so368216981cf.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Jan 2026 04:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358191; x=1767962991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=d/cItmlUdIheeyO3sRzkCG1YQoLkxrjEDJziDrQz5dnYpSnjSTQLH231kh+zZS1sUz
         TUqOuzT9Dx5SUGOLaVdtyB7AAZwsPCaPUYk9hNjCLK/FXYzOl04UsX3yQlkB//nBeKHY
         jioqPuu+xIoyIFYeJXTGK9Ajow959Hf0RYD6N0xrR3iA4gTfInG7AlXOpeQj8OEvJ6sh
         aawtKKhRRdwrl2fZt/GaoB5rdlgRBbM5qHmLR0OFWxKbmd29N5ATZyrATE25hUdnyZrO
         Qb44uMnsRO5L9zRgDTEI8kUt6Dsckf3Zy2VEcqfW5L2Jr6Nw9u2wRhYAR1J3R1D/olNs
         mmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358191; x=1767962991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIoOrmukDmiKVA+SLtYYAQlXdF3Ad90O6gPmYeW1uDs=;
        b=QNI83hBfgOMNVNNIks8HPz63eBWIqYDx7+gkRoM7AftccaGsbxf7nrdztp8Mwi8T1y
         UrG5eMsJxkgF+5TMNPiPGAfqTexgvYOvwN5+yPpyu5TtjssHyHG2Wu2mJ4zukTjl4ZmA
         qfQMNEMr6/Jtx4NMZvY3HwAgdXzJnR2iES3NT3PCzXEmnJyd2gBL+PpoeH0rC0fHA5wh
         o2DHqH1Z7oggqhx0uODRU6PQaRIqXYZd7JPTuOFEzmwUtOksYE5ibWV8nxATKMnhbDp8
         ysCleIIiKwZQyvEMUpOKlLnrlAFZ6J7dawF58++K4e2dW8JhyHo4wYz1BXjdTZpSMFny
         b3IA==
X-Forwarded-Encrypted: i=1; AJvYcCWC2n0AhHCwU6gEl3xlf5aiMICmYqhHvHGul+FPdWUnJGohHx+taRJr1T0xMhmqucFb0gUv6wUmUyVa@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dxVvH8lk/oxy0E+zDVaQODG0vbpUhWWFU1WgD8jAHyWfiM5R
	GMqZrEHmk0Wso7Bfaqz6GgYdZ4ft1aOimBP90EV7x5lKmC4nLfqN7+yIx766mU/8tPPyaROKF+D
	YansBWRbGysXP7U6Vq4NihmqGaF9z1LWyv3+SGgWav+nUSfAfFH/T/48vHR/pyGeP
X-Gm-Gg: AY/fxX54Op5ZlAnaDbL2oJr/kqhr11uV9HnT7MXmNtAHMrSw8L2Pxfrn+w/pw3wi4cz
	30UtjGUn+llWjQapo/t1RcUNTa2rxCHZ/L/6+6Ylqp6cpTu5gZNZ6WGjkBrV7coADezs8ZZaaCF
	SX3O181wVsvRIiwWEr2ObYj7L6dsy1dmPQCMbiXzi1GXyx2Cfa7KW4+dnkuNYlK/g+/M0fhemrj
	rzoXHS9S3vT0XNjhUcNPu79CXovjX3n98yHiSjcy30auaI7nifeiljsT4YSijP8TY0TImmlBOuX
	kzoucBgN/1yNaCbdCQHwlUkAtDSHep82LP7kCcKmXL5g+9Pfl+roqpQCV3Oj3eLa5Yl8Sjlow/F
	6btUp/eWSq6rHSJ+2y8YQcBEfxQ==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014391cf.32.1767358191451;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVMf9IMN/4MmVFAXCQSAmHxzLFU2UpefBanTHFfjDtIyZNkbF7ek0j2v2fBFEvKipCrfTGQw==
X-Received: by 2002:a05:622a:1f13:b0:4ed:6b27:1d1a with SMTP id d75a77b69052e-4f4abd0ffa3mr640014111cf.32.1767358191071;
        Fri, 02 Jan 2026 04:49:51 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:50 -0800 (PST)
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
Subject: [PATCH 7/7] mtd: spi-nor: hisi-sfc: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:34 +0100
Message-ID: <20260102124927.64703-14-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1136; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kjdJYWdNUl5KclFKxYTWNNG5kkOEBU1fS578yV9TsrM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77dQjeohSg8lei73Gg0uadUyLqljkiLtt1C0
 wYhfaAnr8+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3QAKCRDBN2bmhouD
 1+DxEACTimO5Ql5LgejdoctH2lN8H00RIE66UE7YbHeS+LzxHc6Z16LUMwkdIJvE1wl+KRN3MqA
 QbTQYe8zyNyngNQSDxJvEx18VJNC4/a0Eu//latTs9k4tRA6HUFDr0J8fVOsA4UU4Ew6DKrIqxc
 QGKvtjOYT9lt4HQRuDXLJGnssl4HaFztnL8lta8xck2HQSIYWIHCZPud2H8XIopBinkAIC+YcMa
 2rp0lZTJH3bKmhtqizT+9+uIEF3CinYr56X9CmHTvLpAmz3tavz/QkB9CKwI5o4w0t9XsejOI52
 e59ATwz+4/DXiwrjXELzY0gbRfiIX41/cgTMzovDyT6OIls3IP6KcTKzioTeb1/f8GF3X5eZ2hP
 JzdeA3qQ4Wyivz/1UhUF2uRU2/dPoQiK+y5wJZNMcZ6UbpGQ/AJAVk36Fw6jWRYMzmEFlTDiIzg
 01D5L2ZAtnYOuIQ0wKhG/4Q5xAiPsOaUx6yHa/hlzkiwg7SSP5wv4l9L1PTEjNEDYaQUhLUK0Uv
 0lhn25rNmyZ8UapGaeRBQ8fGVXdvnDUbTtWBMbKbVlXxwLOlXu11MwIVoDygzNqtFZMGSv94Zcz
 BK+BonJcbetJNo8WckCosCezUHyStP+weL7Cdn5Pk43XRt7OmeNcO+cU0gogn+Ye+46YTLN/8Zt 0tVDSYxqgm6x2Ew==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NwrX25FD6xVlvDqJkXCE0NXljPzao50W
X-Authority-Analysis: v=2.4 cv=fL80HJae c=1 sm=1 tr=0 ts=6957bef0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vTKw0S6QdLxGGRXgtZgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: NwrX25FD6xVlvDqJkXCE0NXljPzao50W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX+p5L9W83/Ik6
 Ar9fwA1MLxzpPgKnnMJRs4OYif067D+9j/lv97k85sTtBPwl6aLzskG5AKTqFfA0A1rvU5pQHHN
 rl26Zb+A2d4J0VGN+3psBsOXIP1QHg4CFwsSK5YyJ8gJggSCjByA1ylWBCMihk+8jV3OLlTTER+
 7e4wTB/VDJcapQbs1jPq9N+G98mnD0Neevt8jNYb6U7d7ARexT+MID/EaMQlwO2cIh616dMTy9A
 hcYosXhd4/W27WpQikEepgA9EfZuoeiLEkpQ3zqBEN9QsB1s01jYMLTRNN89u3xamM/JwU528ec
 NPWeCmN8BhRCNlD0xljrtQeMD1Zi18VMwi0MZ9FBSHkuZAUKsygar5a3pasA4Jn5ZBmV4PnlSZb
 HHP8+j3Tqm7I1uu8vzk1oysKJm6xRtQzmGvU5h8LypECuOrDN0XYVXw1vssd31pvGBs0y1dphvj
 ZML/FDxOPWe5AYkAHVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/spi-nor/controllers/hisi-sfc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
index db948da2c4c5..54c49a8423a2 100644
--- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
+++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
@@ -394,15 +394,12 @@ static void hisi_spi_nor_unregister_all(struct hifmc_host *host)
 static int hisi_spi_nor_register_all(struct hifmc_host *host)
 {
 	struct device *dev = host->dev;
-	struct device_node *np;
 	int ret;
 
-	for_each_available_child_of_node(dev->of_node, np) {
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
 		ret = hisi_spi_nor_register(np, host);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto fail;
-		}
 
 		if (host->num_chip == HIFMC_MAX_CHIP_NUM) {
 			dev_warn(dev, "Flash device number exceeds the maximum chipselect number\n");
-- 
2.51.0


