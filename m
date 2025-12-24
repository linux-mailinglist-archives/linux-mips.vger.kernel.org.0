Return-Path: <linux-mips+bounces-12591-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589CCDC45C
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 13:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8FDC30C8D4B
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 12:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E6B3370F7;
	Wed, 24 Dec 2025 12:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EyG039ql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNkA9cGb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0506B3385B6
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580287; cv=none; b=qfwzGCIRuZUhVmBbyNXc7G42Qjm7ZYP95SrRpNdmX7BgoEy2y/ntRTBWEcf1EpYDTb8XMzl2GS+gJW7sr0Ls5xk8y4xA0Er5MQVGuEXeBdlIQ+vhu406+B/n7kufjzOkeDiTxCq5csBK73m/6plcoj9kx4JQE7qkO1Ge/XZIEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580287; c=relaxed/simple;
	bh=2mcyqiagsyS6KbHVm6G4XsCoUJ2/y8VeNfievVmr+/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D7tGrOY+T5EOabop8fDuND2PueA+DC3wIm+61VBdNoJtWTZrGRm4GJtz/VWpbpPcQeiG4dcEXI/C29llBdfgX20peE8Tale0HpwPwWCOfv6Zx6vHvzQ7tyL6lFq17TNNs0h0xtubQ4F5mJUnnrI8Oz/D+SovHJe1+i3koRf67AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EyG039ql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNkA9cGb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOBnhBW461728
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q42Wt6YQQMy
	V5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=; b=EyG039qluJLQrwOHYmf1TPfuYqJ
	EUv7Si2+J+Yn4uUZQAHmtkD2Rg90l0SeNMEz7XgDKh4ZAvhfjTvU6b40xhh9vqya
	QYhhgscCfAFpUCr9EdDFV1TbT9Oy9DALM839ltVE0aOmedJGJxfCfuESXwvCIf/v
	IX2Q2vjQlSkiFafQ+8THJPo6azKMMB1TBtzM22/I1bP1r9J4btfzErn2cuRYDcqo
	tejMeOlQkNLjqgOTx1J6AGwl8GpWyoiKnhdoYtSj/NpOWP/DCffI+IcrS6e0pYfu
	CZkTeai7dCau3/EpMmdrrzO9YvxPQ8mQ+ThyMmbeK5CJqbGYLttAosUY+Yw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu6fs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d26abbd8so160832161cf.1
        for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 04:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580284; x=1767185084; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=;
        b=VNkA9cGbbEf/QuA8wXc5+Q3q+cf36EWvzNIooxaR+ErKSKmZJwY1pQIR4bOTQiWLm1
         GShbEEz/4USuyHDKKOmlzRJWiHfBDMqRhsxmF0ZtOUCbNuOsL3j5z4R5Mb80lfiXVJIZ
         +Gh5ZPc0e+HyDBjboInPKoIpftkBjCMwbPanAy7r9eKGSqnyOypDSCzbjYXPE46q9FEG
         +B8xA6zJ54eLEy5XOc4XqEJ9cEqtB6v31sE8Y7qEJZxnKPCKF4VhSIAt1wrKAozZU3ZM
         TDS+nIuvsf13PzZF+sbW/6q27MsxxCKCOLn7hSBB7AxhxZvbo55YJNeBOglMlP/gOao/
         9zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580284; x=1767185084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q42Wt6YQQMyV5WzJ6PsXaJWt4ok5u3HGH6HCtPPT8tI=;
        b=KkcYKDmngoYhyS/YBngwoU7reOwCUoRzZBN0VdQc2ApQej4bvQskLOFX0DUzhixXlE
         HjbtvzVtLW5yYSkdM3loHb331mC6ZDE0FLPWWlJIAZRw5omkKdi5dDRGstRuJ0TE7oKw
         1Fn31q68S0A4YGTfufdzGWNnFseIaa30kBUNJCp8FQkYvmewAtJY6+sluZtiUAPX0rOG
         4jH6hBNs9vd933hRZh3KK6yjCb1SkB9fR0yc3dElo7WemDmvPgt3rQlgBlle/rqLSfFs
         QYvSKzh4NmfnaDVYTA9K0UtNKQyFQWCnHTL/TFZJuc8UIZi5O8TzOAffTM+jcjXONAvK
         xWWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyb3z90wBLFB6jxQdgz1HtdE8/rmDhRO2j5Ll0pjPmCS7GfooHgjv0PPhtAIh4QGL8APj12jkohbi6@vger.kernel.org
X-Gm-Message-State: AOJu0YyMztMMJLHpX8aDPa2pgGBIkNd2KD9tBWCaAsV7FsZfC9TA0Qmr
	38AAIuKewdPPeWPE2edDrO0dlJknn+KM1MhyjAwvX6h4hF6fZQPCi8Y+zUYpbWmHEDdBAgz7+vE
	p6AtWPbBBC/GVtG1vhwjZsKK9CuKnrymbwmeDkoVrXs63jUjQTmH3DSPEWEjcmr4M
X-Gm-Gg: AY/fxX4BQNfiY7D95gWDmPofAeAk+uJuQzli3mp+4HtWZ2YuYb28xEW71ufQzleE/Kb
	vbopoyyonbodZGBjVV5tzjJ1Rjnnlu7Lm/wPRTwP5MJhIiu1PiFcyEfWhipVqb8McNO9D/YSAWy
	g6Nhg/ioQyXssYhcj/7Tly6niaktNIDbFeA6/kEERqRYO0oBHCY3vXd5in8jy+f6gCBmBBDwea/
	bSZX8Jvwg6GnkTZOlzv8JxqUo6rPJwHox0+gu3oIlhND1guShVyzYlboGYuujNnU/DwEuO/ndQv
	2W2hUn9A4LeLkEoNvqfLXejTxdicrUYNIgUXDFJoMHw6+nQJCrvJ2iPcEz7iROd+c/5l1krcpbX
	BUdRPMwTSh9mDZyAlzR9piOjq9hQL9WLDCKGyh8bzHldXTU1jdRXv+h4y+hQUHRyx00vOrQ==
X-Received: by 2002:a05:622a:5c91:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f4abd8cb47mr285724491cf.40.1766580284066;
        Wed, 24 Dec 2025 04:44:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6SEHMYDYA8cOoMdGU+wI1nJZyyHIVwBwMN0zDb8qXgGwcSCAA2ns9/RvpbF4+vcO82fQYuQ==
X-Received: by 2002:a05:622a:5c91:b0:4ed:dcf0:6c42 with SMTP id d75a77b69052e-4f4abd8cb47mr285724031cf.40.1766580283705;
        Wed, 24 Dec 2025 04:44:43 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:43 -0800 (PST)
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
Subject: [PATCH 3/4] mmc: jz4740: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 24 Dec 2025 13:44:34 +0100
Message-ID: <20251224124431.208434-7-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=951; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=2mcyqiagsyS6KbHVm6G4XsCoUJ2/y8VeNfievVmr+/E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AwLY++OPJe0PmtQ519o76/sm2PjQUF16HOk
 5iqYI9gB/eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMAAKCRDBN2bmhouD
 18i4D/4yKnoNGj9XpY+uqY/3QBwS5rDae2aCSD3dEpBSWOOULCNZiFsS1J55iA/S2FXDgqAr9F3
 ckKd+btf1+IFsLDViCAYXw7uLQeSeOmvLWK+ra9wtVw2Zp43jK6FRIZwfGtO581/yi4ugP9snz8
 pahyOm9mxmpCnrc6Io+WxpDN4w2Fiy45MrdkXDXaex95uwShbSPrGHyO6y3yOHPi/wyk5kD5B/m
 uW9j/KUatAOWoi6nXS1k0d9uKc7URL89nuGuuh84WLnfzBcgFdGp58RIffvya28RIdhu37sObjJ
 Ec2BSI8YxhhuaceTY9AbfQxMvMQx0lrZNdSSVcwSsiAa+UO0oC28mimD0wMs3FcQkyzWDA7X9Pe
 5ErZ4zczTBfA6iU6r68IIbYDBpEcB2bUZvcRBOgUh41ZYEGcoRDzCO1WPLXE7FHuvxocAqQoW4u
 f4hywtji9qeLHRe6+KCIshDCJjRsD8OinSUPQrb1wJgWlllBXd5HZE1oFknBrzKTq3nlE/ycH9q
 UWat9qr2fi5qeXsRKA3ofMyxButI9zWvOlY8Qa2U3WRnHewg84VcGpJVDjQf8i5kVHnruSHANVY
 wtpCrR+aH0q64B5p1JLWwY+ErdIISyVeUe76i7y2aNq7e2xGc1amo3YgbMBT7QCe8aO4SoHKjoo taDYynggtM6k2dw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EitTW4pkXfskcFjdecFdUW5g09NbvCxn
X-Proofpoint-ORIG-GUID: EitTW4pkXfskcFjdecFdUW5g09NbvCxn
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694be03d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hUqV6_F3YIy6dExb4dYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX5cUiNMqIe0AQ
 6nLQVnrOE6RpS6+jvNRa8Jhn9C1kh9yDnMryP4i/LH1zIsOzByqFbhszAJUjiXoIPVCtgFR+tBJ
 BIECQos8Xr22KLRw1DtL1xpTwmcmdkC/fKs+8GKFMVJCClLW17jmJ4YxT44X/SomGp/8rFCu3hN
 2OSqDWGKKNLHKTNG5IShKv+wUVenLZoOiFWyYKFxZ1lLgyUoLT4IuAbdx82xcA8aFyRWaL52vyR
 AujX6ukZS+XwVqHHTkc6m0mG5jCxACjMPV7KFsORl4OejtjGN0aQOS3NtjG4NGckjOxavWScSBd
 e0WUDk0uTI13f7pRP9RcRVTpucaUGWAsT3a7L2CRqRo3HA2kULniNELn/UBQDipekC1r0u4bi4O
 PfZuGkNLvfmXP4xk55K9a08FIAfDIv6xtrn+cW47EWHyTUCnoRrd4lPlZglvDQAitXe0PvH9H6X
 hUqBQSn/qGBmj2ZHpZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110

"jz4740" is an enum, thus cast of pointer on 64-bit compile test with
clang W=1 causes:

  jz4740_mmc.c:1055:18: error: cast to smaller integer type 'enum jz4740_mmc_version' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/jz4740_mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/jz4740_mmc.c b/drivers/mmc/host/jz4740_mmc.c
index 6a0d0250d47b..6a3c26b7c82d 100644
--- a/drivers/mmc/host/jz4740_mmc.c
+++ b/drivers/mmc/host/jz4740_mmc.c
@@ -1052,7 +1052,7 @@ static int jz4740_mmc_probe(struct platform_device* pdev)
 	host = mmc_priv(mmc);
 
 	/* Default if no match is JZ4740 */
-	host->version = (enum jz4740_mmc_version)device_get_match_data(&pdev->dev);
+	host->version = (unsigned long)device_get_match_data(&pdev->dev);
 
 	ret = mmc_of_parse(mmc);
 	if (ret)
-- 
2.51.0


