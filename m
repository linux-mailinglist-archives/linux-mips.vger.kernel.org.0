Return-Path: <linux-mips+bounces-15806-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m69mFD3oVGrGgwAAu9opvQ
	(envelope-from <linux-mips+bounces-15806-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:29:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB774B97A
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:29:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="fvEbp/wF";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=czsbZ76O;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15806-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15806-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C2690308C00B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C16425CF9;
	Mon, 13 Jul 2026 13:21:11 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A2426418
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948871; cv=none; b=G4spD1Rk4Kx4aTLAI7P2WIxBmmQwelNaUOk/g5S/F6Cor2PkUFuJA2+jsiSp91wa7qIq5POzi8jEm2+dJwS561p1fPMC/G5i9ALWgisBEzCh2aB6KyhpaOSEpoBcx/JSIXlG7Pt3TMDH19mE6C/ko6hOY4Oz6TukoHfXtIa/YCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948871; c=relaxed/simple;
	bh=wJ6u7rSru9bjD27GOXDKK+K1168IHGuH2iyze1Q5fus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=USUyq46eybaSg8ms7B3zVy3o3qyMywfvpW2XU2RAs0/TNMYXLCMSP3w1mqexHIwXh+IFasYnSRPqxJhv0r1WYrnTwiO/KMxz1u5I/sB3k7UIGwhf02tRG9LCk21N86QySxWdqS0/Czm31+Cyf1RG0gUV9+HJU1+cgwJ0sKbUFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvEbp/wF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czsbZ76O; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDjdV1453340
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hfRURqDpHH7Ph5J3GGOO6Z
	nOABreVJWYGYBhKkxgrec=; b=fvEbp/wFsNzg11M7LQNQ51gD1kGwNTk8PQdlXO
	NuGzAUEVzNdgkTPCZdFNTRVC0PTMkAKktJlMtJnuSl3PSTr5KgIglPJ/FDcfQe7f
	ILMI6k6k5W0ygEWv7N0O/oj3SQ5euwj0fXouOkUXQ4kLjaImb2kORNkbkvKxUCBt
	yx4Al06T+SRX2E5xrtzGPmYMaO3acyjTr+DXutlA9ADXQBWNuf89OSAg5w9hYT2Z
	2zu4bTFmFl9z3LUmpT0vihmMWd+R37kSqnzph8pBkazGkSdedXv2pa150+sYOsyT
	CVNHoIK/8T/EkKMjzaJJflFFcVL1MLWiBfLHLTN2nyKmZveA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01cu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso52836701cf.0
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948865; x=1784553665; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hfRURqDpHH7Ph5J3GGOO6ZnOABreVJWYGYBhKkxgrec=;
        b=czsbZ76OJxr95rEI8RQMzGwPNlVsORgtxvp80i2iZ+cxsmwiFEiNzTEz6dLe5RV68r
         VOlsZRtmuVFo0Lo8RSeBLmwkqS4l+rA5g1KOrQAqhArmo5FaGd19Q/t8GrLq36rJvOP0
         ZurkdJt0uhb2ZiLtnkbQFL+wlrKsgx2I5LlVjWT8p4P1SNAL8FP6dYFp0VjtKXQs4Jhf
         g6t7oe/31gILoNftCQg9IdhBrnoI/XKOOXnrHn5Adz5ALHFgU/mtxvU2+lerRZHbf0H6
         Cn/qr4/XA2AasPwTsCwEFk6MRtrjiosM7DVKpRdKMODY5Ze2uKdVP68n1swWFaEZsNgg
         RfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948865; x=1784553665;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hfRURqDpHH7Ph5J3GGOO6ZnOABreVJWYGYBhKkxgrec=;
        b=cIqxsZE+LxOqtff+5q3hU3muQPiGyAgp9hTrchWufqsUFTouMvGcKCqSIhvQVbRqSZ
         Vxrjok5tF8iPKvuusn6Gq56hunz33sS2295lGP7m34b0rbaN/3YN0zALsEi2cnm5//WJ
         cCKvpGeSvtRE26R1SJK3KsBlSvgT566WjBzEZlDtDHAfa0kd/ke1nyOCS0XD2qeQ/S4C
         vURFw3Mp+QhOB6GbjylKj9yXeIbBtgpOAxRtGYQ4fjIg2GWDCEW4oPhraWOdN27b7mai
         w5byGVittoK0Zpv/tr+uB3fP2EQHl/QoJVZduO2j08yB0mJJyoUnP9Th8cRGwqSWh0Z0
         qY7A==
X-Forwarded-Encrypted: i=1; AHgh+Rrt2HKkSMTWIG9cWzQmcmOUAcKOiyNO6Gi2CNmn9eebj5ulZCPcXWQsqvNjrtlAhtfGq8+ov5PwGHzV@vger.kernel.org
X-Gm-Message-State: AOJu0YzKIaUbgyUHu8NGwrEtn/cRWIZDZnZOO5vUyvAmlKzpnBGQ5K+q
	S2If7SyFUJ+0bJ1YcqBSt3qf2A2QaHWyAAZO4rST+JIg5RXgMzNWknjcJrPPyg7vfXMVmgH9mJx
	EJHgGUmL3Yxhx4ksRmOijSys3hWw1RIN/oVgavckEyYnCyDyb8g2vcNZlIHq2/juX
X-Gm-Gg: AfdE7cmCh/1I/iZ9MV+PEcjYXXGOFIS1gjlrj1aqXdhc6tmE4DRLtERSHqv33JwFoPb
	pXBcW6RbjFWFnY8zgKTCaDF88vzaV1Xg0XdCXocclvaU+vXliYrh7PVUsA2/FGqHTWiXEZ3sQ3v
	8HjZcL1OTvz7psMqFaY9VMZh7cMJrYKgO9dgslGHbaaMBWlihdBHgJF6XFzgnHKK7LAqje819ZH
	fP/LCH3/4WUf0RB7x3qMS4aXU7SwK9uYiR5skM/a/GTR2pm2yryFKebXtSCrpFUFB6EdLT4Ug+1
	wT+LnEWMHM+3Paf8dHhY/9h5KCpSb4HqC27RqmW92MUyUJiaEpctyN+qhTWhwbY5TIc+pKKfxmi
	7QNTYXORG9AZ6tgDTrpv0ky1zRMDVADZv+gpUv27g
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr137236491cf.0.1783948865267;
        Mon, 13 Jul 2026 06:21:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1813:b0:51a:8691:4427 with SMTP id d75a77b69052e-51ca9eb3ad7mr137235791cf.0.1783948864698;
        Mon, 13 Jul 2026 06:21:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v13 00/10] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
Date: Mon, 13 Jul 2026 15:20:29 +0200
Message-Id: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB3mVGoC/3XSS07DMBAA0KtUWeNqPv6y4h6IhZ3YEIkmkJQIV
 PXuTCNBK9XZWLLHfh575tTMeerz3DzuTs2Ul37ux0EmyA+7pn2Lw2tWfScLDQEZcKDVZzse1Bw
 9GfOh8iG2ymsLxCa2BqmRcx9TLv33ij43Qz6qIX8fmxeJvPXzcZx+1tsWXOOrGxAq7oIKFFN0o
 S2YrfVP7/0Qp3E/Tq8rt/A/gUCuRrAQzjjrUiCGmO4IfSWw+rpFC1GctRbAuzbHO8LcEtUsjBC
 AHWeOsbC/f4i9EoShRlghtHcFwZO2mJ/Ged5/fsV32XrYy3D5eQEsINIW4G3kTieKned7YM3E/
 WVigcHWICdQJxAgQ9DJbUD+BkKsQV4g44lckvoC+g0o3ELVjIJArfGBdXa2FNqAEG4k4mrHwaV
 fAgMlYh/RblF4pSxVC4aX7sXkSgomGSxhi6Ir5eo/LgUFJb2TMLeFAmCFOp/Pvw+7wMPNAwAA
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6708;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wJ6u7rSru9bjD27GOXDKK+K1168IHGuH2iyze1Q5fus=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOYqJIcmkwYp17F35Q8kTvJsBiw9zAmhhOLsT
 WAjXrTwRLWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmKgAKCRAFnS7L/zaE
 w8BuEACjZOlaT8zacQ9IgDEs76j1M/6OJ8WclWLisbLOgrWOP/NVwscsmn5ESI6WkpzjxALZeQ6
 CqqVYllMXRXVzZFj8lPYpunpB9M9Z+dQhw7PGQI7UFy+a5Wf843v+5Rfcd9yS+DQ92/A/S4ZzhJ
 8+kacB5ZG1k2Qb1F5QtFwKyXcaJ59BvPr/fslxexKJ428xGtiEJxTVrBzqpbcc33SgCg9lBtt8D
 6g+a1JgehAS1FBiFzEj2LSlsACsXhoG7DE7O4/7FC4ILtLI/UzwpSSgNaPWtJi3YVrQubehLOQk
 Z9PyWnTYx8x6oUCTIMGwiirM21JPKolWw0EbB1kLMl1c3ZhDOLd4h8m9dwTcm4yxhvsISB/KTrj
 R9Wlp+ZqVbsqeS7hUjVYwnlNC2q0rgcjj37+XKFagiAG62HoyocG2MbBp8CwfAtROBl6rUpoMM1
 Ky0d3wAgz17Lr5jWGO9Hr9hRJTuwQBUO8UkIeQBsHSeuvZnqVX4MqXwBFrjVmfPF6tl+wjBzqbM
 xRuhIpSG93GflXf8zr6Ep3DxiCkwnuVRguVEVvaYfSXoliUJFy3lw1DbrDbCPfnIZHjwNBssv43
 vrSMLo0QfT4WxWsZOKBVCD9PsN+LvEMPmwYbVmDTCYpErCaLXhhN9urrKN8LheKxQF40X65SEhe
 U5jyS2uJ8IXPU6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX6qbMNaB3hlit
 PWd+Ef6rqF91brbEtZS52gNfZz8RTx+cEkKW8Q2lvMF5aX/UxCktsJAfBlLwPrgHkJEhrwKyifz
 Cw9E7mlE2BG9eRSEVRm2tVtuhldbCLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX5PTSBI9nUs5h
 uNUNESxUp3PN3+Kp92HS90qsltCRNv+RUFziK4kth9qUjQQBuJucFIRGKjXBqgSWX0GgAyK9lD/
 UDcRkn0eRKicmRCO1c1o9jpdoqFPDjxmwL8JMUlIY17vZRdgH15Xoqf6inJroVoOWcELQOp7cNM
 u/mjplfN6ByUpDLdYBZAJn8DFv029LuLrhCab+YqxPr/jwGq4ChfzEqiryu4MC4CMGHUtmWTff0
 JDZQyb+TN3Py390AJzZv2RiH6TOzEZhkH+7CSF5JQCz9qCtNICqDiw6Owk3afeX/BOIPkr5XkLO
 3vxkywIybw3i3FaYQzTXtKEtOU85SUyzNyRRsHSrr5Ckoi3af6EhmkjfloUXFhC4T9qeXwETxD1
 y13P4VZkaDe36CrgoKjlt4zBMyUcdMSNoEevyf1wBHanXtt1wktb8loEsFWqeh1VikQAGnarefL
 E5EyrNMbDzTAyyH9NpQ==
X-Proofpoint-ORIG-GUID: k9cDMRJzvp-xr4EOIqkgqO1wSMaDwROs
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54e642 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=ExEFSxjP5R7i3UFV54oA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: k9cDMRJzvp-xr4EOIqkgqO1wSMaDwROs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,kernel.org,linaro.org,oss.qualcomm.com,googlemail.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15806-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,armlinux.org.uk:email];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:martin.blumenstingl@googlemail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[53];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8DB774B97A

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v13:
- Reapply OPP on speed change in the PHY driver
- Use linux/device-id/of.h instead of mod_devicetable.h
- Fix the "invalid PTP clock rate" warning on sa8255p
- Add commits necessary to allow correct link speed change with SCMI
- Link to v12: https://patch.msgid.link/20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com

Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (10):
      net: phy: aquantia: fix system interface type not updated in forced mode
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: update phy_mode to the resolved interface in mac_finish()
      net: stmmac: qcom-ethqos: fix SGMII loopback not set on resume after speed change
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 +++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 246 ++++++++++++++++-----
 drivers/net/phy/aquantia/aquantia_main.c           |   2 +-
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 165 ++++++++++++++
 30 files changed, 593 insertions(+), 58 deletions(-)
---
base-commit: 141ee96ad5c69b9d33b2b50ddd49315671023726
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


