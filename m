Return-Path: <linux-mips+bounces-12589-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7738CDC44A
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 13:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF53230B1BC4
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 12:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9AE1334C36;
	Wed, 24 Dec 2025 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fldrpCj+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RYytVdn1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A8A3176F2
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580282; cv=none; b=cWtzTnWlzH3meYq3xGg0BVEEy8ljKr47EBWHmYuyPV+N7b04sp1Z5+9fmSIQfQ6p8/yZPrI1XCwvFMKujx1DaQ6b2bwVOl5p/SCyJazS/nuR6tLxkgsS1+uo4EGoGqem9AMhlFlCk25kPVxR6jwich/tIeKwwpKMUTcLZxIqRqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580282; c=relaxed/simple;
	bh=yM7PsCJOfo1O8B7Z+MHBYKtQYFgSA+XM28CKwgjSXg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OAH+5OCjoXtsdKeyY9KNqX2AtuM+Z0VhbYZA4e7KJLEQ/2QLyrsiB44G2K0b231j2obs6MpFuiP4rUvEN2hWMzIRI1karNTecmVLuzOeWwBMCfh/v8IGwQ+81Wk4wiSe7GmzrIibROqYxuRn9qmCusKZKtd67/Ud26/N+0XeHyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fldrpCj+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RYytVdn1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9HEua700565
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB
	51X9ls6I=; b=fldrpCj+zA9Q7h/0byn4xtx/X+g2HVNthktaN8KT3CGaPx18Eeu
	ZhgJsqk+U2LEM5K848P1u9lcbDdFs/Khx/O6Svo+Whi74m1Mpo2HVFq1ZyRbaFm7
	FR+LI/bJ210Qj95lb2XVxhhV4IiAM/dhKI29cjmc5z9G0QcpqRsMDKqMEnnk9vdW
	USDUGebEx5Bm3wxnkkWgHGHUJTWuTq1VVLSx/i9AvMFY5ir8V7JBPvubHtnWW3Hr
	QcBZauX+sDL4uoJQt4t2tHim/XbTLT8JdR4dZ/GjRpYAwhDkmTQ3+B/IBpt2U0Xb
	kcDr/k7K10BXVAahHytAxbDKQ+4kgg96tnQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7juqh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb6a94873so114771001cf.0
        for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580279; x=1767185079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=;
        b=RYytVdn126kypVtTg1GkdJiohXNRe7DwkSKAEviZzpGs2F2q95lrOvmZOoppK0JUER
         g5GFUCNc9GfskpCjO6XOgwpNsO38IWrQau6hoRdhfCwGTWIGoFBlW7eyZuLQoLc3OZzG
         6Q2Ad58+d++Fc5GEkaNvyewMmqNYLyuSiz/t2UDzWaA48D8LmQgf+U/d+CVGiSj2NMCZ
         wiOsmEd6BHGqeSOoqpn5t0IYUqZMnBLceAtf/lBL5dEbiFisuqhITcenq3Gahd7RtZUT
         sB9A54Sgb/1xAy0ZoOh85eHJBo5ooCBD81JiL5TAsRADVPiFy+YiYSt++kCpQaYPZyQn
         jN4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580279; x=1767185079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9r1P67fE5RYVgK7sJ1zYioAmxa+nW61YwB51X9ls6I=;
        b=RQGO5mKA9y50/hjh7kU0XlsVV0lIX0n67C76GfLBe2I8733e8xbJpT+p0ifmBu38fz
         9vym8nvFTGEIOzw9ycw7lFD7G3DvdzZn/ix/gRKCW87GSshkf+i4Qa7iboFxDvOkaCPQ
         SRhS9GNzVEy+aLrVXU7hm6yGwSOmjEIwe3GkViEDhge54H/VpdM75TcO+vN0HI3MNp0a
         JzROLD6M4tzDyd7W+4qPfP0hsCCnfydhzaaZn3UNYsBguQEj0G+Sk4moEPoKKQkIlqJA
         KPnJRE05fjXe/6zA5jjGu1Ok9oL9KXoQNS6bTWTgPEN4NqAu4U8HHCnN3CgrUfxFm9Ac
         Espw==
X-Forwarded-Encrypted: i=1; AJvYcCVJALnqH5dEHfa5+Hb0dE2SoY6I3j3vRZwf9q1AxDxJf9BaheQ4qz0Hb6wt/SFUUYYO7RNaBx4pPowE@vger.kernel.org
X-Gm-Message-State: AOJu0YwufShmbB62/WL0t6g00eD2IfLcDiZ6mjBkzKrgc7JIt/vlMU8I
	izo6Zu/rGHUXNQTEiL2WXtuHJdxtn2FGY7KgXIYlXCgbV1krFJyLw7YWSV5DjbXJSurSY5pLV4k
	gIR3I2KYbmgytNbQw1VcnKkBfnIe65rv7nowpsPEodM3HVJJIfy3u+1yTZZgrem7G
X-Gm-Gg: AY/fxX75lKl5/LaR/eHGZ1efqEYaoWdNBgZMQTZHdpFMJZNx18cwHsYr5IHqRdJCwAF
	UG/rda89MzmRw6sKIlx3Kew5YgPSWg8C4QanBYduEeWhGWB8qXUX5xTuJ4jBs2dBPWISa1TeGZ+
	5sHlylR1BEv6904nQuyyFGkYwP19+SY42tJ6Z4fx3jQO/n8EDX3ZMuVuIAd9vraCBKXvkTGXRQ1
	uap6eSQF09kQCG7Huhzg5t9QMbYSLrljD0hcGB8Ki4SDFBDXhDOMrNxcJRSiGGDc6ErV6Ykd0f6
	erO6O1GibFoiFMYiHZe0CUE40a8dCNCIzx/hYCmj8qEztDfF5oSBfyNk3sUheMdmr9IzCTFd7F+
	7aV/vV5X8knvsqhy9f0eekyitLUAONW10++Tnt16AeKSq9UocWHCBPPwX8gDrybzxwQvAIQ==
X-Received: by 2002:a05:622a:1c0b:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4f4abd2b668mr288449011cf.37.1766580279326;
        Wed, 24 Dec 2025 04:44:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+NA1y+53V5FjdDZScyPo8qs3w+gs5u6C1SMipwvVq0kLIBUeyMoHc8CouFvb8Es/3VC8oWA==
X-Received: by 2002:a05:622a:1c0b:b0:4e7:2dac:95b7 with SMTP id d75a77b69052e-4f4abd2b668mr288448641cf.37.1766580278931;
        Wed, 24 Dec 2025 04:44:38 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Aubin Constans <aubin.constans@microchip.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Robert Richter <rric@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Adrian Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/4] mmc: atmel-mci: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:32 +0100
Message-ID: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yM7PsCJOfo1O8B7Z+MHBYKtQYFgSA+XM28CKwgjSXg0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AvGomzzRiYXzxCRUVc56q7ljsbdKRtMaPH+
 BmIj4M47laJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgLwAKCRDBN2bmhouD
 1wBbD/91aQO1mFxSqslLTeFr4Dl5APuLTTk/ILf/WeP5bXwicwB+MKjkIBB/JMvW4h/70qH6Z0x
 l09ct2wktyCrkWbBXtou6V1Y7rQsfK5mBLfeoxl2z/dp0pdlPJ+qsTGLXvYBdllFC+pDR+g2a0z
 CfRUHflxj7UxVculnSnhluQuS2OrR3hG3fGC4hSE0ZHz3Cz91jZDiaif43yekqT14EMViCjISYR
 H6kMCEtvfb0MIxvAWqKiV5Q1h8khWIqVX12yPrf4VBGyBBXHt7B3QZfYeHKZCJsaDfOsJkUV6AM
 AVVwK/wByZHE6ifGhM6wfijBfJ14+RW5pP0GKmymxenVLVK5UfT5BzLb4k3GG33U50rZduZkfnw
 eb4Bs1IFB38KkbXmaqGOKFwpSesJzlAy+im5tpxruX59GaZgLflrwRxkG/bi3jqwRV0yBpjGzuF
 e+/PdMNsicVjYO+w6R3MtfXc57BiM4CTKFuJNIf370wI4+L+0KQiLwvsmMV2BaSLDHHNL0JKSsj
 vjYF2o3X8hNSkyG45ET2MNOjWnEdUMSgjSbImKE/Z7lsX1lkdTiF0tjBDqlqNie+zMUsjPkQVH9
 qVzme2ry1K2D/fe6OqB4TZTznqd3WBI5cl4kmaZ5rzs+cDgLAacpGV20A9n3wfVZMEiM9MBVLDA KYGhqVe3L36+D5Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXwcfecQS5zOg/
 LTF6oNg1UI8eGtGvWVcqornm2kUNjOrm+AbckSdcyuOw6FNWwh88N3Q75TETojJi+kzzM5QuN3w
 MRFqyPJsOxDX19REsWtw2S2Wt1DJvj7WPwSet0TuJF+COb1Hfwn1eDAHAdMrquJHxu5SaeE5wcE
 zzxNy728DyzcBKfxCPsNcxSxOdxtckj7BkzMnrAxMXw+EcBulGw7yOlbQIOaEa/X/Ne9pifXQ5R
 1V6MgUZsGYh4T2B6uCiCRWM777UNvxEW3w9O86Cvw+ygKek4NxZS6RWRbNTsVQiDj30Fmuh+oWK
 p9JbUls5VHJdkaGW7HYs8kF6oyTrDohvWWO25qyekykfIIWZI4Q2vkUraZ8wMlJoPoKKwU0Tfrq
 Cw8XoGRXSAft8+da2+NT2RwNCEyzyM0w1vG9Qoyg6eVuTNKIvr2/NYa4Z/FYsSuFwsBXe3RcGo7
 f2p3aV0hoU4c4rKWdww==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694be037 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8ZTf1ciMPyF_Hyv9z0sA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: iXTN02z307iu_5SLT2ekNAT0Trjwa8nj
X-Proofpoint-ORIG-GUID: iXTN02z307iu_5SLT2ekNAT0Trjwa8nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/atmel-mci.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
index fdf6926ea468..3b4928f5b9b2 100644
--- a/drivers/mmc/host/atmel-mci.c
+++ b/drivers/mmc/host/atmel-mci.c
@@ -629,14 +629,13 @@ static int atmci_of_init(struct atmel_mci *host)
 {
 	struct device *dev = host->dev;
 	struct device_node *np = dev->of_node;
-	struct device_node *cnp;
 	u32 slot_id;
 	int err;
 
 	if (!np)
 		return dev_err_probe(dev, -EINVAL, "device node not found\n");
 
-	for_each_child_of_node(np, cnp) {
+	for_each_child_of_node_scoped(np, cnp) {
 		if (of_property_read_u32(cnp, "reg", &slot_id)) {
 			dev_warn(dev, "reg property is missing for %pOF\n", cnp);
 			continue;
@@ -645,7 +644,6 @@ static int atmci_of_init(struct atmel_mci *host)
 		if (slot_id >= ATMCI_MAX_NR_SLOTS) {
 			dev_warn(dev, "can't have more than %d slots\n",
 			         ATMCI_MAX_NR_SLOTS);
-			of_node_put(cnp);
 			break;
 		}
 
@@ -658,10 +656,8 @@ static int atmci_of_init(struct atmel_mci *host)
 					      "cd", GPIOD_IN, "cd-gpios");
 		err = PTR_ERR_OR_ZERO(host->pdata[slot_id].detect_pin);
 		if (err) {
-			if (err != -ENOENT) {
-				of_node_put(cnp);
+			if (err != -ENOENT)
 				return err;
-			}
 			host->pdata[slot_id].detect_pin = NULL;
 		}
 
@@ -673,10 +669,8 @@ static int atmci_of_init(struct atmel_mci *host)
 					      "wp", GPIOD_IN, "wp-gpios");
 		err = PTR_ERR_OR_ZERO(host->pdata[slot_id].wp_pin);
 		if (err) {
-			if (err != -ENOENT) {
-				of_node_put(cnp);
+			if (err != -ENOENT)
 				return err;
-			}
 			host->pdata[slot_id].wp_pin = NULL;
 		}
 	}
-- 
2.51.0


