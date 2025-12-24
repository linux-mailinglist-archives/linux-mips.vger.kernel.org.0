Return-Path: <linux-mips+bounces-12590-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD361CDC459
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 13:49:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9F8C30C066B
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 12:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E663370E3;
	Wed, 24 Dec 2025 12:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OYv/QbS9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iitDmp3F"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4532C337699
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580286; cv=none; b=ftqImdZEonasOYYOe8i+QGhcQpMLCvliYzSP6mn7y2zFaOVF2WJjmpEC6OSB5+g4kyZxKHgrNTf4zDuyT76XiUYVsM5SeLLBQrUPw5ZU2zRbvI3RiedsDYF9S7YubMU+afPVUPtBfVkn0Gw1fsMAUWAP0x1bF83Q/hZjqxUWZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580286; c=relaxed/simple;
	bh=FSxaYZxRQw8NtKxY6K+zMOwodj+OLUAUfn5MDuEJjsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjACDWcGTfRH3AU6OviOSZnGmdeZjUE1InE3tZq93YmT39vPxSI8dur3cIar5F1F4XGQ4iCKtwzxFEv+Bm79x17kzen5duVXyDNyDUyXRNzvH+sZNaMLToP8abnsntQXiMzGIXXVbLQcnT3b9jeJOTvGYRUb1KA8bThzanZgtAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OYv/QbS9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iitDmp3F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9N5Pi1850684
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KNilgW2hQVL
	A4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=; b=OYv/QbS9aElI5G5BGNnWjL6XO02
	WgVgefJa+aL3ab57iZqGYNa3drsUElqFpIzmnFd8kVZHqgJQZbsP8tFFCPHP1X0e
	xPLgoLq7gr93/JC7zzSQmeEK8RL8Ojw4do9qDtvsRhjnRa4fgNsZRg1CnxEWsGDs
	g1yOJJhJBVNG1a4NKOsul4cxqODezrmnKnk7D5AVtor0aQ9S9fvJv//VPn/hvhNi
	p2dGmPx51k37IrtpaAr+w6b4p12ieo6pihlO1I58l27jrTkuScbpyGuTeM4mpPJ/
	FyMwcoelU2AA8SGCP1GShqSOL/KWgA9yT7vYMRfG1ILIAPWgx6h/VNVV+nA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cuhrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 12:44:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed74e6c468so83492221cf.3
        for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 04:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580282; x=1767185082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=;
        b=iitDmp3FB9JFuAhrH2tVbJ/DxAL02oE4yG0vUOhBG5kZv+gVFtSuF2zUi8XcPyxstB
         t/OliW1I8w0h5myzhIyjhjiOpBeLQqdB1ESpGAd9SXA94bENvwMVQCZLTYiKBrmBVK5G
         hphoaE30s+n4BSw88Y5oe73JYGYGKT2jjasjVEgmJ9S7srOn+BV6NsZayeh7PQakwGhr
         vcXKucheCX+OQ8/ONjnOU4vkTlmP0hWeJN8FJNFcEIFGBM38GC37iNsJYE4fwUjBVpKI
         QqHpumlTrLANmx7oQltt5DErSjdSqRQDwcUbXETEucEWp/NNQ4ha4QTHuk3YrLl+ymfv
         CPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580282; x=1767185082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNilgW2hQVLA4gLgVez5G1ooyvmxPr2+tpwPGpuLFvo=;
        b=MJFM0hPX5tBNLkY2JsMCmovuKlXzEY4deSysYPazwsHoKXHdwo2KU4kUiO6e2xLOqf
         sTxVO+7e2CC/MVFO15HVv187ovOtTa63W86sRw0D4aGD1lu1j9ccmqNcOrcb6UYP1VzI
         uIQhJwTHmSpgyHk2hl3o020WMFiZUDjOMkG+DoRjLz6OdxxlKjciRHzHievTAllhozXZ
         gs/Wr/r4rjZCReuw4m3YzsjQTsdY9ra7V10kqLBCsfO+x7zSuY0syMjZ9UE05aOtSiYq
         FjUucrDU7NLi9wEZZLajU+tTdjI73WqDkMKLs9jCC83EKmCaiP/076RqTi/fcpvVjU1S
         5QgA==
X-Forwarded-Encrypted: i=1; AJvYcCV9dKu1AdMSsAzS0dIMoBTHJpjGUP17eI8onIME32TGiYBYvQQ1nNhCqzgK/V78yiJTG1HGakm3/tAW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj+CoZQCdRFVBeyaFhatX+8m4WKTF8+nsLsCboGOiW4M9PB/6i
	PJI2mjWkXPsMixa8rFB1Bt5vQ3uCJ3BaL3wYvA419NOpL9vRz8/FJ8MJmnsigDStW4jvlcKv/U0
	115aEx23tb8p7Fh4iwksDjWg2AN+ZmRqkRSCUlU+iGFhvjX1Tg7TAf2HAYeJJeJN3
X-Gm-Gg: AY/fxX7JpQqoIfuUkzjdB0X8YKF3zpnUnXs1sKKsSoNnI0vjxIsQgO9QcPkz8VRtesT
	wtwXsyb9eirESvoPZxbDB+Cb3NMxz80fpdWpVyOWGCDqZdUFyHqIKC31hkIUtTaw8a/3hDCcULF
	8XLPno9KQ5Cs5oHcsPQfOlszluzybqiZHhEm/e3zXZcSqBfHrIzigrIvQS8w5qiN/SpJ/69lsie
	Bgf0PPL2pXOp0LWhO2MReabj6eJCMF4Z6AtTl8xnjWfksBXWR/mmPr71pwK3Q9FTVcmLBbw71Js
	0iSM9qjGTxJmFPdns2blIB5XRjmwYUg+Uv/TAuvZSMnaaUGG2SllYxZGuLgjEhkiVVhE1tQQuwT
	9arPL+T08SemfXNfALHugxJ1xtLkiAJ94uoC/zvBwrl7VeR6r8Tj/FWRxsDbf0hzJgDTJ5w==
X-Received: by 2002:a05:622a:2488:b0:4f1:ccfa:377c with SMTP id d75a77b69052e-4f4abd61335mr226687451cf.45.1766580282427;
        Wed, 24 Dec 2025 04:44:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjvpN7s+TXKm4SLsrLkne4UHksiC+p6orY9KBQYhq92eh57vEMHcnwzJgX6up3Vu2ofSSjDQ==
X-Received: by 2002:a05:622a:2488:b0:4f1:ccfa:377c with SMTP id d75a77b69052e-4f4abd61335mr226687071cf.45.1766580282043;
        Wed, 24 Dec 2025 04:44:42 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6d0sm16832679a12.28.2025.12.24.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:41 -0800 (PST)
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
Subject: [PATCH 2/4] mmc: cavium-octeon: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:33 +0100
Message-ID: <20251224124431.208434-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FSxaYZxRQw8NtKxY6K+zMOwodj+OLUAUfn5MDuEJjsw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AwQ5nt6vw2D5baL22d3lRE3rCSSx3sNXoft
 Vv4+URvpJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgMAAKCRDBN2bmhouD
 17PtD/9fPRxk2QKcs6uPuvMXpzzcrsQbQfN62ZHe0qNSRHZVjUZYRSclOZTFYSAbcTufyVWU6XQ
 +BeXZ/vHxvBypyatbdEQ/LlDjI3iPFTROp1xfZXNwjSVhfKs2YgngMDhBjdYLnj+PO1gfBKveQ/
 WwFiSASnRWqMBH/MQ5yzsuoZS5/HBB0S5yeY3HNKZAASCVsXKPmGsyQlDKc+aobVqSXIIit1Cnq
 phLUeHtgWO8BxwNRAPJCvAIeevCY2cUwoeaZC0sgO6BvTtHF3XAAVthEob/V7TANCFkQpFkIa9k
 ugZ7raeZuoEN251R028d1ihz5HO6XpvwTDDqgi7urpjhDixnoPAVWDrKpOcENAJg2jl4xIKfxFj
 6iepzuyHXalf/4fbXWTmTmQUjW1G0ohdRcb+AMvl60nnz7If3RHoNIxEM43ZJLlAK5BT/NMpEcw
 +AT7kZGOsqZ0y85GzBe5wzqqcrrsDxtBdCHnqh4v84nD0/D+pm/T4HKjfymo+Ld5Vs5Rb3kKEAB
 GUuyNEvbawqC/3EtNgnNYrHAEEqJ9BQyeDrJcIkrco854b3FknW5scT3l1XW2hQa8nLSTjrl/Zy
 Y5reUj7YPS6HmfNfkhtjmZQ6CAXdK58bZ0BcUGWK+XIFbmovY+QRNWftxWEVKJMWqhELo95L0rv +AeqG72kM21k/yQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0lPLiAB4huunNvlyEK9pQiiyceanJM-L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfXy2fMk8Q3yKXl
 mUomepCHc7URK+rml67bVGFiGNw2pOiUZGgV5b4V6LBlUFA/4KnPsLuPAmQCiGONZC3CvPN9YJr
 LWCGodmSLskbdODchnnqkLgV7Vw9xWhQMJYahHUtZJh7cseSaXd1LtK1yeNXusp4cSR9po0m7IW
 I60g0Q2voi0vVZkR66bJJ2msrAXdeA6pxXTKpCbBqufD8c5zylhbWh9UE6d1gF4qBOJS7RRG+vp
 wA8WbEKqaBZMbfPnkcIjUSvNWkTgCl9F7u/OxvvkkWFdxum0X5JAHFllIyNjSUbqqerhm+W8oOd
 1cQPB0ZGD+pkK3L3oYU3DPrtxvzPfKbIjZ+8bFl1B3LEEFL+fB6WonAQYM1llG0QV1V/7bu9vsq
 HPs6/j4kuT1tpoKYdEHoD9dO+nFYGYkYOmlzKkpxwk/qE7pQYC2kPc+MoLTrMtXp1zmdsUfP3sk
 UCDZAHr6mLOJfxd7+Ww==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694be03b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 0lPLiAB4huunNvlyEK9pQiiyceanJM-L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1011 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240110

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mmc/host/cavium-octeon.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/cavium-octeon.c b/drivers/mmc/host/cavium-octeon.c
index 0592f356b1e5..8a0daddd9200 100644
--- a/drivers/mmc/host/cavium-octeon.c
+++ b/drivers/mmc/host/cavium-octeon.c
@@ -148,7 +148,7 @@ static void octeon_mmc_dmar_fixup_done(struct cvm_mmc_host *host)
 
 static int octeon_mmc_probe(struct platform_device *pdev)
 {
-	struct device_node *cn, *node = pdev->dev.of_node;
+	struct device_node *node = pdev->dev.of_node;
 	struct cvm_mmc_host *host;
 	void __iomem *base;
 	int mmc_irq[9];
@@ -268,7 +268,7 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, host);
 
 	i = 0;
-	for_each_child_of_node(node, cn) {
+	for_each_child_of_node_scoped(node, cn) {
 		host->slot_pdev[i] =
 			of_platform_device_create(cn, NULL, &pdev->dev);
 		if (!host->slot_pdev[i]) {
@@ -279,7 +279,6 @@ static int octeon_mmc_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev, "Error populating slots\n");
 			octeon_mmc_set_shared_power(host, 0);
-			of_node_put(cn);
 			goto error;
 		}
 		i++;
-- 
2.51.0


