Return-Path: <linux-mips+bounces-12524-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22028CCFA79
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 12:48:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9983130DBB56
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 11:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFB2321456;
	Fri, 19 Dec 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B3F+9YN+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V43qshir"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5092320CCB
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144587; cv=none; b=WaM6cqiG97E/LBWBq7VkkJB3CDeJm0xsxZnihITrSQ9AZpeh4Dd+2JbxJjjf//l7xdT72bXQqvSnKUOAwlLuYW5vTUB3R/MHYe/Q8QZzZPHiScHNtCrpC3/MF7gEVYV4VGtwzLdRn97P/ByziHUIWeP6JfLVQ738YvBy6gdYgiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144587; c=relaxed/simple;
	bh=0xsYNaey6JAOZlOGT4ZeTLf/86/izfxYeYtsk5mB/FY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDGXacA7ap6JMhcKDCAePscmejV0wefIgpgkXAYlusP/8plxrsJakXm9uw6w3vIycl1zHb+r3CbLS0ps/ACiupYTg/YaQPUo1xr4chkFa7eEvFwC4j8pe7OzhI64FZ+Z4eQRbkpH9ycZ63/usP5pGbOEs42oIQeso3rpxmbq40E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B3F+9YN+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V43qshir; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c6qi4154397
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toP+4hHDSoxB8780ojreFhm/a4J1ZHDTB+HRCD79Zhc=; b=B3F+9YN+jWefr77j
	h+kL+X0o5z72id6q20kST95IstYJSgUswHV+udx4ZeilOqbX5rZpNWghQJK0DNei
	Nl/qpIX9KMz2CG5ue4C8W/Vk/bks1+lK56bNIp3kgcwXu8K88gXDorG80Eu38B/8
	OHlhdAV5Fqauq1nm1Y4y81nxFim9rsnXpIKJifkwe3Nj/RWYV6OXuDmGNPCDwx/Y
	5WLejG9/EF8di+1ix+rl2VsdwXH1EBeGMqzuOdrmmYpQ4cp+DUkkfpNgDMKg01XG
	leRxEKGtZpaKvvrX3ZfqELd5bX84kSsIsEv/991WlY0HXMWnapOMPSSTX/P0Kyf7
	sUU8GQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cthut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:43:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f35dcb9d4fso54058231cf.3
        for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 03:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144581; x=1766749381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toP+4hHDSoxB8780ojreFhm/a4J1ZHDTB+HRCD79Zhc=;
        b=V43qshirdHnITyDXBWkUIDt91OvOSYwJjtGplSn345HEcIV3SU32N6mbQUmYY7gRUK
         n12OjwCrert70Z93uSDQTd/KcOV7PBSdzQ+VLcVRU9LuQdzDhX+O7nSZI05rOz9jFjQW
         tG+GGA24ONqXNDZPhbd0Iz+c01SK/UqH5LtsFpPYCerQtiXy8qL9lLUhxNbHupWhkQfW
         Xn8akPytmbX6r93H1OZXqSPT7MdqlpD0hCPjakPoAQdohHWyK6fyd/Xbzl6imlUE2Iz0
         WScdJG8L64pwJ3R6eC41xpfJPa0usqJ5GYiez9iPrCI1puKbdmw7679F3hKeemgiRibb
         LzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144581; x=1766749381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=toP+4hHDSoxB8780ojreFhm/a4J1ZHDTB+HRCD79Zhc=;
        b=kWQHRrzsZpcd9YQWWi+dXFLlwMrZ3j+aqLHEpGXQV7mP2Da+E3do8CovX7vgOdWQ9k
         hch3ncjWU4Bvr1ZbI3Elsmi49B+j5vrQPV33/+4zLTaHnbTZRUwAApwYkMsrkXG92Fs9
         XhcwCGT9NAjRiRnOxpAqG68aAJZb2P2p67ufqbNmxGjiD2xvfHa04miQMaLgrxyNaw9h
         UoEqM60rbHmcb8J6k8MNgHL8DtolxVuo8E8fteuaCovkMF/ZYcWtFgTxlEIObBi0ws3+
         Haux2e523HNO3wrgWZXwgcehlY/kRW7YtiABQ9Dp/B8f2rT7uAn1+1Uj7ODg9ku53sRR
         eQcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYWN9IGFVZzhcnbsI3DSeIMGtJ0AL+Vluhhrvhf2VylNam91DDYl+18ONTnFuQTh//R/kv3G8NIPgW@vger.kernel.org
X-Gm-Message-State: AOJu0YzBL4Qw7/o/0hvMIhJJJDZ9BiKPHegl8iTeC3OIgutrS1+TOnHG
	mh0NY99Qt+XR7i5iveVZzbIT5YBdgid5xPjpvTnfewIZXYGXL9RD0KTCvT2yKhMbSFVW+pFfyS0
	lrwS88A75S1fMAU2BgQXDfYUEpRKkDWwC/3fRNiT17lklKVm6+eTdxtXdFwBsevkv
X-Gm-Gg: AY/fxX5N+a+17QlS8RbHlpZbssxHiWdi6gBhwJ6YSbx0UCO28mYDJopvv6Go58N6S+8
	61aK3GfHWdjGKgiY/iFlQi2aeUKgF6If7czz0JAJ8sJmlYtKuGLgVrzPJY/anqRWcwBVt37tdih
	gRA/KpRvKBmvKP89nx26ech8VzqNyIpoIwuAeOBe6ySH+dsR0OYNb6/jdgBMfTlvm04Nj+Npt6L
	cxX7rGS2hVdYN7pXOe8++EI/vzHvZa59uwqswSVXNIzYhsm17CnJONbpBrgyAefCbz7CE2El7ta
	BV9wYaMTOCvCxQqZiFbWwshkYwHhSYH3ZPgKM8cNEc2J0YjC6gBLlIE3ooaImo91rnJBzSsSafj
	ScuF5nT+jbkverng4Hx86FHQ54ly9Lua/ugbjFRA=
X-Received: by 2002:a05:622a:2cb:b0:4ec:f31a:1496 with SMTP id d75a77b69052e-4f4abd8e7f8mr33968911cf.56.1766144581137;
        Fri, 19 Dec 2025 03:43:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5jbLqM0SggQoZoqxYXl/yWMOKAuP4NS3/zbdcovR8zaHbvZkAv+xrhVScVhbR/IDMWeLfLA==
X-Received: by 2002:a05:622a:2cb:b0:4ec:f31a:1496 with SMTP id d75a77b69052e-4f4abd8e7f8mr33968661cf.56.1766144580591;
        Fri, 19 Dec 2025 03:43:00 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:43:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:21 +0100
Subject: [PATCH v6 6/7] net: stmmac: qcom-ethqos: define a callback for
 setting the serdes speed
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-sa8255p-emac-v6-6-487f1082461e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1933;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/9AVH+OLPVBYkTZnu8Dy/MAFFgxoNMd7J+eOs2UC7Uk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTovz4KhkkaA0q1/bxvZ0VVJsd0md/pcMO4QP
 6kalt0ntniJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6LwAKCRAFnS7L/zaE
 w3Y7EACiTaf/AxXHvCBwgf5ZWLPoK5VqY6uMwyZrsrZsZ0H/zZOzbpz39hwncnMmgUTNBortv61
 rMYaV+GDCW0TLkw9TQxq4PUztMvCVNSWom3cT0srO/GBBaVIPCSS4IhTXusjmAh/XWoGs3h726Z
 2zqrpzLp+onwSvqpm175NpEcjzNBAbCIsb6YzwYRBF8AbY4y4uxhUIjTL4TpAURdV23fpTsCYzY
 TZ6jYK4S8BsJZc+1LhTqVWxyzkjz36VFUMzRhx9Qpu7DQaniKas6+NmVKgLY+ayc58FKnlyuOJr
 uGLNis71NNRkltPgJdx3HZm+yq9V3w4DdgAZurF9+498tKvBKGDmgoo26mqtdZStrHJJ0WnXJz+
 wmrcYMRFFBrIh9UNWqH2atCmsJpTmHzskAWR1hBdO/0jgw6fiIMsYX8kvbXSBzkKVIXOk8WoFtg
 UldB9/qaWJ7Nwkn3zPy8DTaFuMCNwb+WQA8IgGRVxO6Mh6YLnR4tP2H0hktD1UpcGYOYDyYFUJX
 40LfNVv5YUh7zMhcXlX/1k7r3PuC4KYTfLDDviob4nKo3xWfl87Rlv8U39PGwEr7qxFXv74g4jH
 x6XsiMfIoF/Vux1BLfET/tuwxNXCrTHEOnlJGQSb5vqEcNm8iMHrpwMi4kGouyL8U738LKYcOHY
 2L9+//6O4WaTsFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: kJwxLozoX8-Wcwv0iRTpsXL9s_PLds0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfXyAhqw2CGET9S
 J8r7FlLR2Dv9qwX4mkh4ZFVEXSbWX9ak1hEyKTroVQzqmOYZTtFZUdtu5xsfBZlVjCk3P6I4Fyl
 Js9qFaPoXhnPGnsh7cmxzYJ2ZyRk6ASYEBIAp9KB0xLWNH+huM07PHk2fP2ohus2gfpjf0yTeRW
 O4wvRAC+hUkojslL17c+8kDIaMxrItPoCYdDR6SODTFKxhZw9ammMxzgR0wklOET4b6w3aIAiv3
 IkxtE7TOcnEZpReAKZqVgFQ9DDj5l2SrJNKlPQU0IS8PDMkDa3AfMK2EYcgwRhiP2RAyZsdsJdW
 TgwQONLHUS/Wb5QdYZT23T+QlxV6fxARWoXPNax49EBZzQpFJSh3hdOVjz+v3c2FdT2fzYKPs/I
 cxDVH65RcDxA5le6fVFGN5RRkhUbFW+1xI0Z2/fWFBK9QIZmp4dKf51i+ylWePMGovLioC3NR9+
 j6P29xXyis9fEpxt+ug==
X-Proofpoint-ORIG-GUID: kJwxLozoX8-Wcwv0iRTpsXL9s_PLds0d
X-Authority-Analysis: v=2.4 cv=Lp2fC3dc c=1 sm=1 tr=0 ts=69453a46 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=0aI5G4bYpHrJQa0XwroA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190096

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of adding support for firmware driven power management, let's
allow different ways of setting the PHY speed. To that end create a
callback with a single implementation for now, that will be extended
later.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 856fa2c7c896..8ba57bba3f2e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -120,6 +120,7 @@ struct qcom_ethqos {
 	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 	int serdes_speed;
+	int (*set_serdes_speed)(struct qcom_ethqos *ethqos);
 
 	const struct ethqos_emac_por *por;
 	unsigned int num_por;
@@ -617,11 +618,16 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
+static int ethqos_set_serdes_speed_phy(struct qcom_ethqos *ethqos)
+{
+	return phy_set_speed(ethqos->pm.serdes_phy, ethqos->serdes_speed);
+}
+
 static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
 {
 	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->pm.serdes_phy, speed);
 		ethqos->serdes_speed = speed;
+		ethqos->set_serdes_speed(ethqos);
 	}
 }
 
@@ -838,6 +844,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
+	ethqos->set_serdes_speed = ethqos_set_serdes_speed_phy;
 	ethqos->serdes_speed = SPEED_1000;
 	ethqos_update_link_clk(ethqos, SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);

-- 
2.47.3


