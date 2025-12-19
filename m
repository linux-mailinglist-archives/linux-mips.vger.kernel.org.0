Return-Path: <linux-mips+bounces-12521-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B2CCFA40
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 12:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 473553096AB5
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 11:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E8C31E107;
	Fri, 19 Dec 2025 11:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UISXXh/O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bm7mH3aZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C3B31AF37
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144577; cv=none; b=hiUOqrdUZIGOlLDM5dtd4y0qHrj7BbTGF2Zo2Xba0FMZxrSKX2diXvBPIjnEIhPGPzSLuD47qPHW2nqOpES4EEMDL69p4pcw/gyhk0vASijNt1J9MKb3Um3w4gamPny1SEC4HR8opD9YtkrOe9fvPAxdMom7ujyxFqb/A4ERElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144577; c=relaxed/simple;
	bh=wU0YXO6e9VhAPdZsyPSEdqzdI7EZ/QyQDaaW7bQWQ50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVEKhX2p8guzfRlvIIMGjqRdBaxN07zNgdOW8o5hbhh1uyf6fSSOgPZD4lvBgQygCHtH6LyTv8JUmRAlt1MJGfTVR66eqLrjDIY79TrWXJDGSKAyYBtrX8UDpCHcP4CZJbATsZZuGv9c8O709jsG3PRKNLczhrZg9rmJCSwyX0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UISXXh/O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bm7mH3aZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB7wCL1772205
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWjVFhIdqKEWC0uChCGJuzL3PTnVRIjjzmlfxk935jQ=; b=UISXXh/OkXYHidxu
	huWJFSdJ6rGOM8ZvQt2k+wTATtdD57tIASaFW0r0pxViqWkX3k3ZRdx5kItakZPU
	o1mhzoIO3rz/6+44zJPWELAM2Av0pVDVM/WDxT8/YlcjYqrYBLeWvt9aZIR7vfjo
	UMZ0E2lbrVOy8sJ+kCpCYEJhbm+wUfJMglPOScT1Fyc4q86ixbeWhCk0vu87hBqJ
	Wboq2mb7vy4a4cX86t24zH7V43Aoom1EpSLakAOjDlNe4Wtt+SwH8Sot8lWDYXdc
	ilxnRdqiXYIcblRKRgrreTwwX21KTD9bptpRZwHLuQ1YKxvWih+BAWFvR3h9imND
	+RHYgw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjh0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:53 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed6ff3de05so43150541cf.3
        for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 03:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144573; x=1766749373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWjVFhIdqKEWC0uChCGJuzL3PTnVRIjjzmlfxk935jQ=;
        b=Bm7mH3aZeFEXGheZCTi/SjR41MPSOU1mHJbQEwAb0I5nXWQKXatLS2nBywaSnoEZiZ
         r7GeLKXFqkxaAlmz9tcrHUbRnvhg+YejnGl2mczFgRdwf+OKUDckw7HH64qG1KsQRhq6
         1YKdf/Vu9IrgWh2WbLl25F7gBNUvgUTkz0dsE6bmcE7C49qgNODMTIvDOY99wnwvmeZ/
         bHOSDApYEWB3oO4dOFvcjkDWCfeODS+tVcTTS5xx9W36ffCRCEbSVHcU9/vmUmxNWApm
         FIykMrCOwxlaog992Nk0Me/gQqU6oCGr1wvQmOSzF+1YdlDppG4Bb3JB+rA/w4RiRZsT
         ggTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144573; x=1766749373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWjVFhIdqKEWC0uChCGJuzL3PTnVRIjjzmlfxk935jQ=;
        b=E6DIhNgjIFawxgHIZ8HPhHk4mr6NMH0i9c+ZkNVQ3GCoT7ObrF7E46pbcvxRjxCxaL
         SEZNsQbO03KO3vFN2CH1WQciPoZISJWEKhq0yPohYTM3gWtbj2Z/R5ogGLnSzyDtvH1R
         u83AE2TYwH/rrovABeJpmSVky+5letm9Ts02QcSKYkxvd8ftuyXki6jX9YXqbG8UxnBH
         HjWlCIUJ7LOtzqPZuAzK3vUzssS16Sjuvxey5mMQO+wlw7hVNKabEP7ZcjkpJKL+bgEu
         RlSxFqChzvz6aOI/9G7EY02AaXRUoZOg4wqHUhMcr0618QwOGCWxGXsssp/AxnVbeTPe
         XX7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBLt1+p7Rw3jRrhYatV3qoE3oNmR637FVxEkNtdk2D2aV3Bkga3iaBdYeAVD+KpEuqx2EiGlOQcQI3@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPaTlZ+tKhSWsU/EVuLbxE4Z1D+XqNyBQaU73a1yPvi3w5ouq
	J//lAfl5F+sekpG5eQ5BS8oMlYa8dsu+PEGeobD/CmfAtyQfXVvSjh09dgILBxme6bAfY0z2/av
	J/SCajrmbaLfBviOsD8GhP1dXwkDp1Uo8/HVwWmEaOQmkPJGwZOwcMc+jx04QhhNT
X-Gm-Gg: AY/fxX7cQz7w89b12E3ANyEXRy6ipDVRyo6bm3sBk0dZ7MtV1+j9td3Q520lzUZ0JNN
	QRIfbROpBi0TUMJqn8liKsZoilEu4Yrqf2Iknna3Na/y1+AQiYBqHWSCtjfTB2EdNYiWaKKJSDv
	ptblZplXidD5ELbhrW1Gxlgo0SFR2Q8DuNVbFB1W0XbGD+swvZH9DA2VeuDQJDUD1ARmRLSwZpd
	qrD0566Jx7MxgzfryWVX9i9WcZ+JsICPoauBI4wIpNZFPQew5d8u/L+8SmxkkERnwULJroXPSbE
	NNOjbMYS8H9lMs+MgK1JWFB7WTC44kNekxkTVTh3JYI6ytX3cksgxZVBUMtFUMYDQCUuQH4aU92
	MNguWkFQh14jxPhwbHsLFq7W3M6d2ob5m+1k7gcM=
X-Received: by 2002:a05:622a:4013:b0:4ee:4a8b:d9ed with SMTP id d75a77b69052e-4f4abda9f56mr30831291cf.58.1766144572836;
        Fri, 19 Dec 2025 03:42:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/gZhrt/s31ibwRK6xTIIokKNSRMUgX/Hr82Dvm+mDFDpST+qP41EzlpjWP5RQApsYnkoJ2w==
X-Received: by 2002:a05:622a:4013:b0:4ee:4a8b:d9ed with SMTP id d75a77b69052e-4f4abda9f56mr30830751cf.58.1766144572341;
        Fri, 19 Dec 2025 03:42:52 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:18 +0100
Subject: [PATCH v6 3/7] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-sa8255p-emac-v6-3-487f1082461e@oss.qualcomm.com>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5665;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zyHKc5Uwxrnyx2Od/5ESibCbjMcK0NP7aYAa6dnWJKg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTor2wio5G9YUe9z3+LZo4j6e2KSz8od0ZAvc
 r7yfv2gDb2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6KwAKCRAFnS7L/zaE
 w1j2D/95cusgoEMyBr/JbLG9N/xcm3Jl52LctkBejHtCOZB0vBEEoIHz8rgMPQ0sVtk2BBBp/o7
 EQGQkg9MkRbLrU+vjqUiioFrC9SQWZ/9XNuQZSOyxofgDm7K1HR4B/kYRn7D4rxDHXYjSjVxcGB
 yJ+JRJ6GZf2ue69Yuhl9vEEdVJIj8gQ+7QDEMpIOBBRnCPtVwSu7KuOrZg7PxrYJuW8wb5ktx86
 HZgWFj70DG4DjIBmBYF7vwMmYHo2IiFrxLew7j6r2OcslEsrvBHdBMmE2ID2quCrjriAFu+mo1B
 i0Ds8/j/0IyE4cyKzKRY1C7XSQ3A3UMy35nCpQfEzg2/QNGIyRQL3OgwaWP86yABwWdQ9pW8yxJ
 iDIbGonP91Bi7sbTZup7nB4eSxEy3SBvrMkEUO2AL8G+rm9sdYvXPiwxH889poV7dnv7VOyJGde
 W2mFX/ePDa3CdfkNR6cJO7GoTuSxitE0QI28UwJSqQgbBP2mJ/Wqt80Ni9H7q0KSlo79OWAiw16
 aQlmvyxWcESySkxm/EE+6L6Op7vSCMKQL6YhCoa5ulFPxEUMaTe2M2e7Em+MtAUvrJfvcrgkZNh
 IiHnmPW4BTlpwPsmEWpMG6VuUhgL/WrsMQcGhvQK2JuIc1OBpAfgo7Wm+uXwG92C2FXhPYCLCN+
 m7WyWbB0lHuRPPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4EL9gqskMpMMrdUv-Eh_u_04kyqTuTmh
X-Proofpoint-ORIG-GUID: 4EL9gqskMpMMrdUv-Eh_u_04kyqTuTmh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX4tph7Ew/rfeM
 KTWWElaIw2q1XOTGzIFFMvNNJoxKPSKzWm2GE330JjkTNnml+J9mFL2k5wFhUk4O4FAN6GdtIkg
 XiIqKG2XY2YYqbdz7h8epWTnLE/vlH8sExyx/Deoc5hXaXyB6EOriKDHIMlMCteLIRmUh1LJcox
 GlO+VIrd7lyAVbgczpVX+nuhMkcQefcuOFWcVAppax9T4/03+Z7DQPXlZyZMOoptfLzj1ravzrF
 q6wRhJ5bR7IyX7NsfgehNDPywRFWsa7+iyhOQt3He6bOLVhG03is1If33YI7DSb/a2Fdx5I6jL2
 +1hhVcj8B9mXTelGl4oCIuALAiYEm/7AcTcxZCVufpBzYnS+9ArMa3apxuQIJ9+7b8DUepd0lOP
 yx5KtvzuAgdobG7irH501xsbQPhHQp4atCc01jZ2ud72cLspJfzgFgfGOHBYT3yc1myMKKkoW3p
 E9jDmlpW3M0AEHuP9pg==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69453a3e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 457748e57812..e0f0eca94342 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -225,6 +229,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -241,6 +249,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -273,6 +285,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -308,6 +324,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -723,7 +743,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -774,13 +795,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->mac_base = stmmac_res.addr;
 
 	data = device_get_match_data(dev);
-	ethqos->por = data->por;
-	ethqos->num_por = data->num_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	drv_data = data->drv_data;
+
+	ethqos->por = drv_data->por;
+	ethqos->num_por = drv_data->num_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -808,14 +831,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = 1;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -830,10 +853,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3


