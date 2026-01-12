Return-Path: <linux-mips+bounces-12857-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F75AD11C81
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 11:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DEC8305428B
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 10:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8992C08DB;
	Mon, 12 Jan 2026 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J82g/RNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guQf9+2i"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1FA329E67
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213000; cv=none; b=doh1mDVe2G4hL3NQaJwh7d6Xg1nII0KLF6YocyuY61431Ys31Su6lTte8YUKPNfMCsRNBmCDVLPBMWamJzcK0S2mm7XJSUXa6h/q0OwpChlOGdEOMn4rl4ygBtuUezjwOpCVw8XX0h7qKIyTfRc5vm0M/MMKvrrnInC0IXXqq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213000; c=relaxed/simple;
	bh=ZoLyGwuv9GWzXlGA7nvL0ZuKn9B0vjgDXVyxRMxcrDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EC0tUFvy9ZANRcyIzngOF/HIWeC3y0Wq2kubydWfzRrfUx06VlJvSyfNUkJRjlCch9/M3uLjVq6XHy4YjEjFNvg3Kn6EtgseS8mZDYdfrEBK3g0fM+bMas3Ji3uh/R759b3GIdcVmhcHgq4PJSChhpGDTS4xzgdiQeKAPytAOPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J82g/RNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guQf9+2i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CAEeSZ1315903
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=; b=J82g/RNVm849cx9V
	dFFyzABcKBNY+CiRsaA33Ps0scP/CMuZcqyfPxphl8zZh4KXw1EheKUhOLCLSELn
	fr73shiZALVUODPnid3Oxwt20bVRnDipcOwY3xUOqSkvUNu3g2BnarfxP3A3wi3v
	1USjRt/sjkTVynSi0LajUP0Pi7KgNpgUfpZPsiu8IVr8izPHvhL4yqL30yYC/FPb
	kPD1zWQEkIndjwmO7W76Q5fk1wRfeMnGHPSim1uq8gOZfDxkSlt1LJpFzSRiuLyx
	0wxtvVRJ1w7IiFKQ8hnC4kB1R1fWLCa44+kcs3unZN8H3p2vRbyYNeoxSltMV34Z
	3rUmBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmy1hg086-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bb3a245d0cso1592445185a.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 02:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212996; x=1768817796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=guQf9+2i7KTqYieynBBaDH8DGdMpJKMp+E5WIoyiMgaK1NP69vyLoV1xYrl0napQAx
         55cLTcFj9rPehAzHDAO5Nj+x+P+6XzZgIqCJhiLnrFRfxi9C5td84obKuhaSVLczWNd6
         Wm1rQk+lyjUpicXOaTtKK0oApZFmcvsJpGrDNoDByyacgpDT3A1M6MEnEtNsZOMSPsR+
         tTBEBXi+bcwg51+PbcOf4MdtDT3Zf9Es7DCz2dFVf9d2DYLRo36MpX9lI/oJDn38haFg
         /FurNJ4qW2oJ/IUPK58d1AyGyYPKHHPMMTBDmCkEGFNksh3SFo+NE4hkxFZA9Y3GrAEF
         2OEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212996; x=1768817796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mODp1PyMkvfkftyQeHDkUUzUFlJxBLADJcEEezWUjCo=;
        b=UVMdM2bHOfAV77OSJ/4AuKj/lRmAD2+dTVTpecFtu939NY4PhpX95zuaUDSTRGwFrD
         vxbCGi2TbL9w1ZLOGtf9YULL8fEJawjHmTj7U0L+sxoMapYwZV4Ki3CP88uQyPULsQn+
         1bIOeZZCuNjRPkhMmg9dFnOGyp6veSZA8bEcR8FkQBZ7fOFrCJDPMb7EAFCu4vHIjIHL
         Op7HPuASGOpx7Xts0AJca6qAORVQ62JPdinFr+YhV/Jk0wweH2BVBbIiUO3v0YwjxU8V
         QHnmne7vjEC8EoUAUzP6A2g7YVgQ+pIHs00ug2du3PO3wR9o+WMhwn7xRbFTh+l/lzWB
         wDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqFxK8trTPBSPDqLw34xD8k1+E1dW43S6UjO97Jmlk239XYIuo9PMDUqIjUeL67iVS8ADwM+kJA2LQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDSFT8R6FEH41C8w/7T6RGL9Rp9u3i7fKkNtY4JeB2l6+nP36
	m52ujGPU95BWqK/GcPUjTKcenkNfeaHyvexHDUmxywrTTT9Kav5He3ESTXBGY4WD1nsdx3XkDNR
	DJV6bZGUH1CmCktdN9yyAKtjDRksHCnQO0vMml1Jt/Mj0jqLEdW54lHVtPy82om6d
X-Gm-Gg: AY/fxX4j+vGvLgqn/gIOCdwH2IoHsc32AXXVgZZsHnvN2jiiz9WSwsoe3SjS0aepZqG
	+tr4S5c4BfqHO/Ufi6aUYu3/Mx75tJXdEaFzqm9V0js9nmvk4caNGik30ib9cCO7newY/pWHPN3
	d5/co5pcjsHerk6iAdwF0h0ZRElSpspT3lFgTV8k/gHVHniEBo9nAptQCFjRemF7QV9oMWHyLlq
	ZFlbcA0fjx++Loqj0X+AW9bqqvOrkFUTfufqjg5lRcaeoddIEUMLLtVk1S2mC50vSET2xBfSSSz
	vDOdZjKE+H6Be+V/jLJFXhLAneWGW6XSatwvfqFOf+0NQR3BGD85MZeBRcAbO2hX9p3+81jp3bv
	Tco7cCf9JAbsR9f8U6LkaIhawdY/oMGt3w/RKc5Ts
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171263485a.71.1768212995578;
        Mon, 12 Jan 2026 02:16:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYulo3AW2dpzYmOgTmnb00p8XDyYkP6yaVRp/tr3YHxen6aKzZ4A66moQru8K3ffeDVCDlWg==
X-Received: by 2002:a05:620a:191b:b0:8b5:5a03:36b4 with SMTP id af79cd13be357-8c38942611amr2171257585a.71.1768212994897;
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:44 +0100
Subject: [PATCH RESEND net-next v6 5/7] net: stmmac: qcom-ethqos: split
 power management context into a separate struct
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-qcom-sa8255p-emac-v6-5-86a3d4b2ad83@oss.qualcomm.com>
References: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
In-Reply-To: <20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5018;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ai4l3jd1/eF4m0deghb1F0cSTBLoK0XWRQHcHMJ+W4w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnq1poFeCZEhGAbmOEx862guge+htaF08CAU
 WRid/G2CfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6gAKCRAFnS7L/zaE
 wxWZD/sEntiOzbImdwRltcgIShIGvZC8ukrcaFjCojiYxd1Oqi2LNK2fbi6NwZ+LBIG2uTaHk+2
 QOuSh+pM9mO0GJdCbAR7vqrseDjB0+3EGZS9euka4b2fv3kXZKn5o5BIz5sZ/WbRN7HIHNh3qOE
 PVeScp8uwCfAECOHVWZElnAW3RjMQ1uK+FRRIZ2afYqUI52Iv50UV5tIiaK6sY9MWFVbin0HTZZ
 hqiD5ZNwZ02jnplOZIKlMbFAFQ54bBjNwYZphy7CJZAkzLMYSnPHLAKVS3VpPFLDo5XxE2qbSUc
 ZjDZnPK1pT/Sv33lf5NOSCHOxnV+GUYj2LGWrcshhqNAjW+K0K8Ygfx2tQjWSK2EbfSg8sUrZXG
 qAAH8nyRkDVFQXrOjnJTW9Ecw8BlKjqsEQeMd+7C8u0cc9jszvdkNCNevRfCBJejdjFdEftST01
 jqUBVr04XNwxNNZkI8Cty2A42/DA8aDLr20cKzUo+aWrnCOY+WFZoKDOfy6T1WkzMqNrPUBEzpZ
 PJ4HJHtWgOVVmHf1/K7B6skUMKINuR6aDPl1t5cOI9Eai8MF2SnrmZ8iUmhuXKP7dE1A+dVy6fM
 y3EtIhGtRmd3ecY/vKJ7eHH69ZrXeiV4qiOdAYbaLuMRGglazNI7nuxNC7nuUa9bhF4JAVyC6Pz
 xBXljylIoPiCmPw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fgUtzF-VoLu_rrZ6ohI0XOaUZiMPjUfT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MCBTYWx0ZWRfX1r1LAW7S//xH
 qTXTunPLeN+qPsnYgBv+okW2kknVBj3G/tMZ9hlg2Q8RYwYJE2fVd9szK1Pe4zL+C4TvUxp7FFu
 9iVOgB0UofJMBxGAO19q/vL5X1Mv9CM2tH2KG0XZCccN0l4JD1+u6v5FlBxRbE7X7T6fRX1HIaN
 51OvhWxfR22h4HTezRy/wCx4izeu2OQgAWo80RBNTJurvbBrdxAot3KsvpiqfuPJnyNmLIMbQqj
 6vEJAECWl/u1Xpr1K3XGzEOImBFvlEnfwI9iteGfB1C06cglojz4XJOF/gtuJCW1W4wiUDLWqRg
 Lk4MZh0RhL1+VK/9Y3VdB2siRy8U8+z2JAwSLxLR5Ku1z6tuUt9BxPmosJEWTRYqjRgxs25K247
 Z4YtMOQVCnupG+tf/kE8JoJg+PAKHkhbDeoKlmLWkLLO0TTbaR3e7l8LBW+Cf1bR/7qALcKXwz5
 R5m9AQ9x6Zh1+3X7GsQ==
X-Proofpoint-ORIG-GUID: fgUtzF-VoLu_rrZ6ohI0XOaUZiMPjUfT
X-Authority-Analysis: v=2.4 cv=EovfbCcA c=1 sm=1 tr=0 ts=6964ca04 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=X-TyB6MtGS_gwYDveGAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120080

From: Bartosz Golaszewski <brgl@kernel.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 54458ff5c9108a6255b38677f4de973511b5176d..856fa2c7c896ea3068ac38d9ee71b4173edce80b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	unsigned int link_clk_rate;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
-	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
+	int serdes_speed;
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -193,9 +197,9 @@ ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
+		ethqos->pm.link_clk_rate = rate * 2;
 
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+	clk_set_rate(ethqos->pm.link_clk, ethqos->pm.link_clk_rate);
 }
 
 static void
@@ -616,7 +620,7 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
+		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
 	}
 }
@@ -683,23 +687,23 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
 }
 
 static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_clks_config(void *priv, bool enabled)
@@ -708,7 +712,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -721,7 +725,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		 */
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -816,9 +820,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -829,9 +833,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
@@ -853,7 +857,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3


