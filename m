Return-Path: <linux-mips+bounces-12855-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67CD11CF0
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 11:20:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1BDF30B0DAD
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 10:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BF02C21E8;
	Mon, 12 Jan 2026 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N4gKoyI6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htGqqUbv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081A52C21F0
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212995; cv=none; b=eFibN5tZiPT+kzJatUfpr15BCBrwtaOlL317zOo0NEsugstkZAinGY+eYiBG08YdoPPv9G9YtWgxDnixBET6A44k6TyaWiec3gu+3V4j6LG828tlUd3HdLRfn9sWw1qBvDY/z62GXDPdei0R71RTG9DsreKVx5c+CrFgWEGH+Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212995; c=relaxed/simple;
	bh=RWiEXdo0bHCgbkauGBMCm1jmC0a1ajUqBTojWsKh1gc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uau2sOAUmBkLXia64WjH4grmbjuQfxe9YZscWkR/ActKDiqb+N7v/nILGT1Py+WQKNiqZ2ZDu/qaDI3M4vFZ737jovwXCIsQnmI1o+TSHe1FY5a0QsQo2G1CaASPjwKi+wKCWMYTmWV6ecnXVM500+/a5hMwOEjDi4XcvwqAsjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N4gKoyI6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htGqqUbv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8sLqr113776
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q+Z6aIVkrhhREMp41SA/JdGCM+9SvWLbacrpqL7MVlU=; b=N4gKoyI65i9dDHJk
	Y9vPOXxQ44naxTz7AJdgU4cno65B9RAWMj9qvyAOFqW/nz2JMcunfyD07+cwh4bC
	EGn1HDB3rryhUBvugqxNwZAmfLZdEr2CIWNNP5YhpCeZcaL5QqTCAeI0HEuQWYte
	EDkVu7hcMC1xpV8uIcQ1qG2jLClRmkYJkgQUJ3r4wqCvsPY/NGfQP/e5MmOGOT+k
	5jrOowKETiVdzWdMpwGdORWpGE6EDnTIboo1M1NKHx297vbJavRDkz6XwfPE/9dG
	oLBzHvN/YgcZAi5nXWyEwbI1UkAZbieaoeIPbCQ4E7J6KFBFNfk+ykS19HtP+o3M
	Bib2yA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhbcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1806473485a.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 02:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212988; x=1768817788; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+Z6aIVkrhhREMp41SA/JdGCM+9SvWLbacrpqL7MVlU=;
        b=htGqqUbv1siG51fxci5+jGNDBp1UDekf2pSF2uirRslLPR1XWgqVZL1DtoNz/u+biB
         lPPmi6oX3qJX9e1EELi6zgdVervMM9ZM6pBNzKxGBoMhihgAAfnLcFa5GDWm3KOZjLK2
         2rAe7zzOxdbWeh+rWT+AwIBIhWPqmHt72zsND8+y/37Ly+wtEBrLyzEsXof+cmP8I1sR
         cDDBJIUFvru9vqMWGzrgYTv0pPsMwgggwA+mBX6bM58O1Le7jzrNLifCr9hX9Youta7u
         XOkLYb8d7iTH+P1tgwJ6sTGEijD91TErNrHta9RhvWNLT82keiYh/w+lHrX0Wz0BtB5N
         bV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212988; x=1768817788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+Z6aIVkrhhREMp41SA/JdGCM+9SvWLbacrpqL7MVlU=;
        b=pMNMXieVODMIHL32ASOxmNRLTcYBTVErep9l4IBvBp0O//gwI9/NprMpYJ5onThcsi
         KFHGhIWbQMWKr2noL1pweFUCMaTUWW7hCG0ztyTpBdNLcwqsvOxePeiQaYkAuSxy1PiI
         vfSaSvAOhSp75/IS0Hs2zx1WfOoOaXfArNNtfZETmECfeqnw14hzjO9HV9tWTmGfqnUb
         PEVGROV8cWGrfaL5j4JZe2Rd8IZG9kudRPlrLURKNXet6Z5TCVqvVU+K4DZ3pZrgWvH/
         n4W62J1iDwhxbiIfA5CcvzBsPZs/LFI8gow57if7cbiR+NDyjjYAJSJbWYJUqAmLfgLm
         xHwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU+64mIzehae70CAOfPoIadXB3C+M2KPWRXItvgSlU4DZktQ8THo6585CMyecucdLi5ZOcM3iG2paw@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLAbDoABZei+ajy/ZxllL31dKBhhS1koMgovl/9e2Uhr/O84V
	uivjvvhPbsWF5PCrHxuJYXKMgd0waZi2MydRN/fSrUdKcPIr713j9/rQ1KUfIiWRE/s2Fgrqiw6
	m2YUC8oOCuBnMG2PPduqHkiB1rCCOYkqPkM8OZBPzUixJPGkDfQQqY0b/9avzEfiv
X-Gm-Gg: AY/fxX430Z+eZLvGUr/WmPpXK9IOcEIGyHYgWQPpdQ6cDpWxQH++ffdW8skdJ6hPX6t
	3mMBZL7opMOsHS7uY1KQ6JiDAiE41rwPSRerpXGdCvFIhy9fY5Lmg6w2NghEp7ZlCgKP5qUvL3d
	MqMGweVstpm2xQ/sWwwY9HbdQ2lcAwBnT3lfwnq6iHG5qqikXsH476ZYq2TakVdtGCAO93N1CDJ
	L+EyS5r1t2/WRZx+Io0IIavyJw4+tEQd37o67K8Mw8nvZT7kAOSeo/U5JbZsIW7CU8FmIxR9nIq
	uKPs0Adr5l7SypV6oyWna1pTDnRhNClzdMn0kWeFAT6UMEBZJBbxAUvYfVCMfliwnib4YdNHfb3
	H9QIVWFBQqtyxDV9cEgSuxYL29ekjVZdFhB31X8II
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id af79cd13be357-8c38936be22mr2495994785a.8.1768212988102;
        Mon, 12 Jan 2026 02:16:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFDcFp13cELDqg5yb5c2F8mogs77zvA10+uG/S30hV3BqtYmfe0ZqkG8u1DcAICWOnVi+8xw==
X-Received: by 2002:a05:620a:4802:b0:8c3:7e09:7305 with SMTP id af79cd13be357-8c38936be22mr2495991485a.8.1768212987621;
        Mon, 12 Jan 2026 02:16:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:42 +0100
Subject: [PATCH RESEND net-next v6 3/7] net: stmmac: qcom-ethqos: wrap emac
 driver data in additional structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-qcom-sa8255p-emac-v6-3-86a3d4b2ad83@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5782;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+98MGhNEMTse5rrzUsNGNnR0YKmhUi7WzCmUr+BPXL0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnoliueKXick+xAzQraAN3ULEXA7idrAkBy1
 J9TMOwkINiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ6AAKCRAFnS7L/zaE
 w+9jD/0Y5/ZiDp9I1wx8sDKr9gzh2IhVqIDuVPk1jNE9b8uNWjJCxrJA68RJohfUkeOMBW4A6W3
 /4c18p9KiRuGcKp/fw0+OQ5lLiGPMe2nsOCZzUXxxBX3tgtHk+fIPkKh3wxl3JMafbuxsuoOQqJ
 oVYHWrbxwMxIbTzLwVwD+FxNYxi7+ISo3fqhFz1D1Pkvd32mgiGqeMvV9tZDOIiB9TV9K2I/5IT
 LxXjmfFxYBVLuR+5INNiiHleBrhekDuild2FCXkSjXwdhWyEYZmDcCOi61z4v6XtxN84OqKtcWy
 b7iph6sGKcvUmZwIWMMIWk1mozl/Sna1wwX0PdmifEPV9mr+pl/v83h3mmoKij5QWofCvMfJkAp
 jtoMcAt7P1/J1Jfn39OpvwZEAE8+6Dfy5sRV89ktbJH8J/6BAHlsUXuRed5m/RitDDnE0qfmZs6
 pFccfzaOcVGXexqzPAtb1IWBDIKCWM137KKJm0di89Nnhn22v3DmEjRpG3vu3Dq9DA77Ei292gr
 z3S2OkUV+o0yMOBRhHGHvhl/KCPHg5qkwsKM02fIyqDLn79VEoflziIkEW7+ZH5arc3DwnxfXQe
 4Y8wrx/Q7W/SjEGf00ABgVj/mTcKipD2ujP8qOVCGO31mIuMhIuQowFziIyx5WXSCnubuaKhlwr
 oP6YF6+Aui8XK3A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX/2mXM2+RK3iy
 u6HqLS/CnTaXJnKrXj4IzAZcCDRFb3KYyyUTFPHUQpFl5BQos8OzDheW+3j2MaI0JaDRUNkXcaj
 W1STtLX1Kf76QbXceyF8ykmraiZCZAOFakrWQ51JkXd+xk8HSK387hqVdnzCyLI9C3ywIORN93Q
 tfwrnCO32PfqmjnhtVFXWxXGX4vvKrA3M+QsazyduH0sGJAWyJvyLLo6q+Q3O0XR3AZrPMirAzG
 tpVYodR318Xqk2AM0C9NojFTge4mfwDTDQkwgHSb95iePQtRHHpUGOdZ5oyiZ0d3zs+Y2nmW6uz
 KNJcTjj0gItVG7qZoA9HmAUTG5eNtmA7KLJNuCp80feb8wfkR9daA2EgVcgE3oXRG7cih7R2TMX
 Ou0ZC4J81XdsObMjmzHNjw8znfyxHe0R/7EA1GG/XKV36AhLQhd3MiLGfknb1T//yI11yXLDz+2
 EdsMVcW3bogv+k3KNwQ==
X-Proofpoint-ORIG-GUID: ZXOAsUX7GxGV0uBFosrdFEFrox97XNG8
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964c9fd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZXOAsUX7GxGV0uBFosrdFEFrox97XNG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081

From: Bartosz Golaszewski <brgl@kernel.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 51 ++++++++++++++++------
 1 file changed, 37 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 457748e5781231680b64382fa73e195cf7473924..e0f0eca943420e24dad4e506e12bbb1eb731b8f5 100644
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


