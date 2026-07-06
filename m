Return-Path: <linux-mips+bounces-15545-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n8ruBnq1S2rmYwEAu9opvQ
	(envelope-from <linux-mips+bounces-15545-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 16:02:34 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D23711AB2
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 16:02:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fOxq+7SI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cYnBmTQJ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15545-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15545-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EAC03141081
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 13:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A5041A78B;
	Mon,  6 Jul 2026 13:21:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EB44252A9
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 13:20:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344062; cv=none; b=LKvonzO7NFl3Qa6aE9BbeJa6lozILHOY2FtBlDWSgblXolHUlEjTcLnAuDATUPsCMTqGvHhbiMoAMDENe47Aie6C8SdR1tPegKXa47s8EfVnrFiq3/BNUXgC0IvhvOzxlYYm0gG+e01HVUYfWvraRBQDIPJOVxOKGuT53X3S46k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344062; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vEF0QYn4bVUlpHSm6pfRK1U6BCf492GOLJ2A/WvgwThXMbyYbDjZC4fdkHgckiZXue8lZtntDmp6tCtV67WwD4MUpgaVcuGeeecuZ4WtilupbzLtROo2wVxdAYNHIGYLAVBq1Vzss4seLY49MkT2xse/99Kl+H+007xIcGDSsdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOxq+7SI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYnBmTQJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxAxc245618
	for <linux-mips@vger.kernel.org>; Mon, 6 Jul 2026 13:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=fOxq+7SIXv5TAgp+
	3LhNERn5LTVoVpsJSWbou+OhJo7ZPhM68du15CUsbeYhDP1hDtmE5fsEssdy7A4A
	LQdOp9g7rc1wqNg6bAwqx6XeV1bISNfWRVcPN+cn0G7KI4hh+iln1RcWr74AOYBX
	vpTWpBfMRXMYiG/OmstFA4Iiu5+3JA8SF32Mzad2tcatFqPmB+ySf+Lvc06tWzUh
	9Eu/+yeFDSBSpQDc/c4MyGQVcoRu+aFF9mAZiSeT4LSd8AjA9VdnJ0BR8RZQcKyp
	+a842pp2cuRnyHbSrT+RfzGrotV/cUhyXVsRgnTVIlzDHeZTUsqTi8CKa+Wh9NxP
	ZTiSrg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gqm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 13:20:51 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1054971e0c.3
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344051; x=1783948851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=cYnBmTQJqP3xWEeQKTEK6BW5LfCunkCEkAyBh3JRVOlwHelcC6ZVWrIriLTYqa6x0r
         eb2lniqfXr8V63pG5svA4RjGPJ2Z8bRQV4EI0QISgXXmkxH5mCj7Rh8+8WT/KJKFuMkR
         D6P8fHMxwIRS5Orch3eiyUlbzeNrrFj59kvg/YMxpcPXXLsHhSA3SMkgIrOqxIg80p2y
         +ZxKosi2cKS3EwUGDDaBIsHACb13bAWdXvjfQK1MxomZnyxQiKXisjy78bQHCEk/X90d
         I5HYr2Ka8/84zIfIuBmXwpTiRmPR+G5J/5gLkgth1RGJG3PK0s7Wba9zF2YEVEzA+e5M
         VfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344051; x=1783948851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=Gq830plQSQAqX/JJPyqd5pH55cnkufWIPilJ/0T0hZm2mTDFeh5yaAUs6plMfvdhzY
         Pf68BhBg+oQif7TlUYa9zTbLmIXrfDR7Mg3MI4c8Vm1edqUPLaEW+VoIptqDS6UNGJ/D
         tFRgrUiuJ5nNJSWrUI9/mdBjfY8iOS7pCH6wlWIe5J/Hj/VxyK2An4HM5DOBGtIFmheH
         aUMMFFzxQA2L/Sgy7HZi7bsuNHMOe/3Y4G22JpRXOgKTqVgpvb6ewekO6ZowRIGJqpQe
         Q3zEuyUi7X/fT2IkkmBxs8WuWAm4SOeQv9bddImWtC0/Bt32qwEebNLNgIXrliXBxI94
         miNQ==
X-Forwarded-Encrypted: i=1; AHgh+Roy2H/jGm290ogkyzK6OiQtwI29YKHK/3DggBw0Hlc8Sipc2J3kIiJrINEifEn+aM2TDc+6s/VzRF7F@vger.kernel.org
X-Gm-Message-State: AOJu0YwtE4mFCkugbhCgcImj4UAiaACr36qpNAvN6GI8mI2lbFNtek4j
	Ma09xpzWW0Y2KQoEB0m6FYPeA4GQ7XJZhtl0dmqPpV+D8kGYwNONaG1sKF+1txZbehIXzLPV9bC
	BVGmU+RWuSt3wPTkvtp3XAEkPfoOveAIaSjbnsEDniJFpt1i15ESr7kutNVVLhUIp
X-Gm-Gg: AfdE7cn7C2G1Pcr4cACT7jGoZqbDxmkE+5QHGzWS+xt4o4WnPZovGvEFzOpJS43YGGD
	BeGck732SxHFYD7uj+zJq9c280rGRDmfaFb3YbuwjV5iRz+ATIODgAhnxR8Ryy58c9a4CbAeerN
	9BjLFHO/XnXthq7WMJLBywFQBaDq9XYmrDErixModiO3yugbYLT3yVxUdL5ANzJrmQ18j8AT0E7
	ZaHDWzRRjsH3Sp57YVSMHc/QUFPfwZFY8tUVtSnOcM7vSYUq2Mkrp1WqRK96IXQ52Nax4+91g5N
	v1+YhxZY9wJfHBqy5j9MbLhOUFUdaBRvrOyCEz8O7gWb4KDZhNtxyZ2ATGfnNVtKevO0z7Mcrus
	U30URKgPLSKJCvXykiCEbV3BjXQs1kwVVQ8AFnxM5
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr258026e0c.8.1783344050570;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
X-Received: by 2002:a05:6122:46aa:b0:5bd:b0de:a736 with SMTP id 71dfb90a1353d-5be907a7dd5mr257980e0c.8.1783344050114;
        Mon, 06 Jul 2026 06:20:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:19 +0200
Subject: [PATCH net-next v12 4/7] net: stmmac: qcom-ethqos: set serdes mode
 before powerup
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-4-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uetN8tQ35/MLf6WrNwnnyMDIulOdtwR7ChU
 fVGHHk3r0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurngAKCRAFnS7L/zaE
 w8OHEACRZI6ADieQbUC6leO3XRgj+gxRGg9lhMPexr8/DmUnblo/bE9rhFIw9azo7F31pSedXgU
 S2ZoMQph7d2IdVgsEFK68vmpeM7kbfHOmOspoTr9OTFAFVAYFLbvrdnvg31npbXMuipX44t9wMC
 z0+KpQSH7EuJRWn/0SdKx0hpl2F0NLAZBBYm/mOkxDC6oQ98L9KSVeAiZMTA2QN2e7RN3b8i5Y8
 +Tb/X2ZVbZ8KzjhAlymhR0hTk9QVAqHuFn+v0A4lMylebluozCzeMmS0lnaJoUAtkKBVoSGEZWp
 f7eVuChzu8R/i7CFuQ1d1uEjd4nCrXvk9N59kEJBCfVqIMUpcEzqt5Ud3i+1EvxEdD/9I6kTWIP
 Y1lgCr4T+O1AWH+b73x4EX8ls/BOq9lu0fO7MKzfbtfBIooYGgt9QUdToMMAQo4UTIIi/ceTYVu
 v72RM+zndt/2RWOsztsZXIsL3al5/9bCuw6E5b/HCWspMa0wbY00BI4wjanae9j4xJOKn5rLcx6
 kIEAGq+V0wVSxA//bEl3l+PDVS4jmieG559Qag5yL91dx6yD2+rHPj2gZCqzne+G1SYGWadfHDF
 676mCUJMBbrWaoAvNa6yFRi/PFlYGtxv+3Y/FSRc92uis4NqvNkI1J7u6XwuXAnF0UEbshJlPNV
 Cr51n3bq9Qj1y7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4babb3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXzAuD6Wn0MYU7
 scOlKXVzC4aYDQOVqi/smKJtMswiNTixLfljrvO0tLr1EhDYdnXhlOiYvo+66ERkZJoLOpYX8Ae
 croMkJsQghZtE7HV2exKo3V6coIt8+ivvsbeg1CLt5kGEPY1I1fXJTRhDE6dFN0mxeIc4tTWcLu
 KWBV7FC71NKjSEaBx3zzU0zLofUmyrkwGS0bhiejGUZ2FSvn3PxLJ6iXa2C3BXahQ8ajK5PYV/k
 X3pcPycF5bkZ5OSJ4q4Wb9FUE00gXLak43dy47VVZmAZrE17nDYB71iGLbgtsGmZNn0WbjCeXyt
 bs/pEvK1hDcIflDNGvUPWa99ChXYndjb8KHS1bqqWjhOc6Zix4PjJpjTh9zU77P/p6VfdjVjfl2
 9UeF+p1HArZmPE+bh1By4zhtAaDsOdXcVBlxTpwWrNfsJeIRMwXgcq55at8fXmGo3+SPqjykupE
 aH/1igNJb7LkYNTjh0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX+ZvHBtjKlwnt
 G5ElxZOVYUU3uMYlBbHLPzuTfOmKL9BERKEE+T/dMtp8xXKDOC9/qJzoO/bMDhHIzfjyXpliBh3
 CuRoEYAGBGDG4y/ZGxoKe06jkIoG5TU=
X-Proofpoint-GUID: LKE3R4ZG4kxY8kH_nqTy78QDc4RLLNKn
X-Proofpoint-ORIG-GUID: LKE3R4ZG4kxY8kH_nqTy78QDc4RLLNKn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15545-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81D23711AB2

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3


