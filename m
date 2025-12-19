Return-Path: <linux-mips+bounces-12519-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21ECCFA1F
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 12:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2411307DA77
	for <lists+linux-mips@lfdr.de>; Fri, 19 Dec 2025 11:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24BB31AF17;
	Fri, 19 Dec 2025 11:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blB/QC3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOvAfenB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A668931AAA8
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144573; cv=none; b=T2yWmtXEqxNmyODECqPDZXeXNBSwbkJmubaC/amdy8FDnOuncENOq/s8f1xpprmkmw6Un6dFhcHNC4O/KHPcnV98L2GWXGllzQO8lqgDD6LbERTyF6m/ckEwfKsrS9+xsDvnUZaAZz/IAOfbhpzmTDTHEK/a0VEhCFNoxP8OFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144573; c=relaxed/simple;
	bh=mcKM/+UN2ZXQa8vV/KoLRKPM7IKu+1m3+VB7QZb+mic=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZJN+yvgQz0+rzxGTuozG79crTxk5GUx4Fy+irYg79xy3mTC2qU0ozLFD3gjWVfph35zzQrUzrtwf8u42m2URW7B0V3OuZ7NQlh6qfCq2EMLj8YMDakxCjJmaJtqYyda/1nhAjpgGE0PMi1V8qb0bcAZ/9tCY2ms4qX1MZZX5bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blB/QC3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOvAfenB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c7uH091626
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aipJtTWgmM5aX4sCaPbz/lojlbmxmhmGwFlgXGxgJXk=; b=blB/QC3kGcwNojVD
	q6Ya8fIVs9oOE48rgLoWnaVwqFXfxZz/+BOru78Ksx8iTC1nsFOqVXK3+nJPyMva
	lppbbeMLTAc8jBeKdr7EeCj1WJGhL/1uxMokoaaHhwMaXBWIVg6qH0r4mumV4nUL
	1alZA1MJoo6yrFiFpg5w6JX36aRuxUr992PsP6JTSY/eEt7obmHOHLckLBsWdGxh
	BWOQnfeKtou9bIWonRu5ruWKBAKuoTL/+VeHguejKMSmmqisPw7Jhg16lh5jWO9v
	cj06E5pojimeLdnPVA6spZChYedpNgmX8c4Q0HoKSJCRIAtqD6JjuhzFVC5C+/r7
	jCtzbg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2eagh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 11:42:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0c1d1b36so54955171cf.0
        for <linux-mips@vger.kernel.org>; Fri, 19 Dec 2025 03:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144568; x=1766749368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aipJtTWgmM5aX4sCaPbz/lojlbmxmhmGwFlgXGxgJXk=;
        b=MOvAfenBWUu95xnFJQhTpKKnrIhxvprLQFE8faNo1kwKVoiWyDAerKZB8bO2kuve/C
         Pq8VYlOL9YCs2jAGw1nipBnhT2i1Sr+NvRbe3uDhUktaDoHF8KRF0nQmZqltJWgxD3OL
         Z5MoM92gWFfau6fRSQXNQlUL2q+WPR53GOXh9PTLGN3m2wrrNtZtegATjlFWxUIdmgxa
         RVE/VwaeHND5IVomkbhMYT4xFnziWaDV3Eb1+yUqH36qqMsRUQswLpmmBWQ0MejaG9tg
         Bq/eTTDutLWqXVaH8+58J3IQJixo4R53kfoOLXu6+mswojd6/MsD5eLJ2w5DuGJBGWw/
         4Wtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144568; x=1766749368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aipJtTWgmM5aX4sCaPbz/lojlbmxmhmGwFlgXGxgJXk=;
        b=QH6ysR1YTPICd+ZfLxeFJAaQx+eWVoQ5MEnfwyGqX6aBr4p/MSCIYaNQsQQZeiVbRH
         r347bMWMr4M/3kCdza5KjewTY0EFYTg19fwPgnxmvgxqG1+WhSHtZSra9s1yeFu8tVql
         KeXKDfrUwzDRG5H81hd1su0mwY3GyiyzJA7nVEMsKKjekY1tz2PSzYcGEVnAOWW01o3w
         xy1cg0NXBibskeeDu3SReGj53AjaPANzkKmKcRR2IFnsmsAXl/46OPUdkCpH1fTi4s/3
         kcy/YwYk6PJMKwW8ea524PkOTGV8GDBwQEg1btL9XESMxVH6+MNi2PBfPKoDDfCQGSoj
         ZEVg==
X-Forwarded-Encrypted: i=1; AJvYcCVV5TQ3+xF1w5YZUVwBq2KQma1n2pZEsGkvcmZLAWoHP4Yke2x/dajZEN631QDSTMdlrBs+lDUxLojA@vger.kernel.org
X-Gm-Message-State: AOJu0YzC1y2Gvu38PrWgfxOzFUgf/kkxZBG+oYa8LcS0na5JPWZvdUWY
	gpnY6i9oV7LkSoe6y05E2h5/nTCbVSsKbHvF2yACwfm4Rywli7J9Tg6gDBzwOmBwQ4ND4wJlno9
	wts5eygzAS6Xl5Gszq/k19PXv+f9fu53UPZhRuWJ42YVSdRVSK2UeRVKrGm/H4r4j
X-Gm-Gg: AY/fxX4hcWf4CQB6Vz0uqL0W5Q0HTkw5VOghjNJJwaK4oHp6jpy5j4QcKiwYnJ9X7CK
	GZtQmimGa79dqQ7Fy/u54RSRFfNCLHsC8SB+Zgn2F+hF5AvtTPGOG1A01FnikJtvZ6kG2lHARc4
	5kbJsFe/CqQ7xnJTsXs9JMUAxWrAUgKD9BVMyaCxdvFGuFU0SwLkiR0IJpw+IDjbogWbJJTSZHs
	J3ii2z6Pl9wmNUZgsjZu9Kno5A8wYVxPXYXMqA9B1KbHwfy64avsn4RKeXySPlALrw2DE2j7Q1X
	PVsgkqzHnPAlX4yPfw76UZw9po7vTKOWGM08NjrnRKEXUmxuJlygefZNkOBDmkJ+pGxXP4/vvDF
	jd64aOLYYvOEbCtMsuESu29dbGqndPaN0ZNmuaoU=
X-Received: by 2002:ac8:5f8c:0:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-4f35f46d1ddmr86930411cf.35.1766144567566;
        Fri, 19 Dec 2025 03:42:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyqsi75PBXtxTwNl3+XTub7M63qOzY0WN4L0vWzzv+hfAikNnFTcJCFujHdcvnhE9bkvxrYw==
X-Received: by 2002:ac8:5f8c:0:b0:4ee:bac:e3aa with SMTP id d75a77b69052e-4f35f46d1ddmr86929401cf.35.1766144566868;
        Fri, 19 Dec 2025 03:42:46 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:42:16 +0100
Subject: [PATCH v6 1/7] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-sa8255p-emac-v6-1-487f1082461e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16519;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MfoeJbRZUV/e+3203ZsPIlZWjnxZPrWQhnPB+lEjQPI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTopvN9FRNS9FNjSd+TjQMbvGsm6d1pD7RYmQ
 Ao9NUiGZsqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6KQAKCRAFnS7L/zaE
 w44JD/9ggCHAbU6iJrfMlKkMFD0UXVJTw5t2vM2dDITAqn/7Gc/sKV4w9oy815FvRP1lVhvwcO6
 Fh1/E6482oaoqnA9CNfH1QzmfM8NH+OfsHnsDBrHrYcRjcaeAg0ICJ5lCYSU/PCYupzl/fa61Qn
 0vF6k6EWhU4gUcVLujrQlZn8QdNe0fe57jjvtsXfZ++8PxTM3jcBxKsAx9S50Skky4xPHppMf3a
 EWVqYXmSZhA6ypJ1rTA6N2sNHYFPnudn60HTn3eAElUnCYwh1R5Kh/B5OxPA7a+3YoL54k6bumX
 0igO5GDDQns5VS+5H31jDCZDD5+rmyAn4zJEvIJsGndskwZpDo8IkbHEAUFbVntD7MZR+2DUAec
 j97p0etUEb1AZMLuW7V7tC2rnxdNmLTPw9cNH4urydDHPjQ8+0AB2/dxmx9Q1rOBIBJrNihoRnL
 hJVVMAZobO796c8XNuDJm9olBbn2u7Tmt6p0ZmXE3FxRbtKpLKJQWCg2ZPc7sM1XYVu4O+vt6gX
 Wor/5tT6lGEesbTzeDOJ/Sq4q24I8IB6P62lxD1OZiU8iCh2ATiFgRyE8YMg6K3bw//mAwxA4cU
 eDb09ZCIdXLJktNS3Ir9OspZRRtXQstJaW2/nycqxfnNznFkd4QK6iX5mVz15xCdPvB48mJBQbj
 pSMXmBco/zSJNLg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfXxP98uJeFu9Np
 ojg3KzWx2woJ7yaesuEfqutDICndQ/hBU0EiZVW5D1Ed4TzcLDgEW6ym34yXNKXxg8pwnBn1n4W
 ShFtfPel7c1MCSN06PrhQfqXP8HMPb1JLx3B25nPvRGt9I6nJupbSbXzfbjWqwXkhW6k4hJ88gH
 oZGwkgHQnfO7nZtqvrKEaribiFVhHaO7daQXbuDDArg80RHcA/yteDrCz4fsfJ0p5GbcVxk6fTx
 oX9I6Je/4wHweRUWPt8exhwAHP4jvDruTsJYpCDo6/yrGd7kAtGUqpip6fqgZh7NESMi48ofknM
 ogeMnZfIRyBAneRT0VS47P3S79OO5JdGqIAI6ZppLQo1j+SAlKO2qP9gGtuS+zWV8W9GbWO1PMO
 51Gy6p3e1umeYHgmLwrofg5y1zRsSr/OCWMrFmk13wNC+MqxXV3dWUkfA8UA1W4IgjNyqZsqDXF
 blNk1uwQsS2wDFIxzfg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69453a39 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=gEfo2CItAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=XdlRlktmfSYkeOfF_xMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 52_gdxfCSi1hs2fUua_xnYOEg8cvzOox
X-Proofpoint-GUID: 52_gdxfCSi1hs2fUua_xnYOEg8cvzOox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Describe the firmware-managed variant of the QCom DesignWare MAC. As the
properties here differ a lot from the HLOS-managed variant, lets put it
in a separate file. Since we need to update the maximum number of power
domains, let's update existing bindings referencing the top-level
snps,dwmac.yaml and limit their maxItems for power-domains to 1.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |  3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |  3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |  3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |  3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |  3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |  3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |  3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |  3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |  3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |  3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |  3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 98 ++++++++++++++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |  3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |  3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |  3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |  5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |  3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |  3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |  3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |  3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |  3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |  3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |  3 +
 MAINTAINERS                                        |  1 +
 24 files changed, 166 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
index 23e92be33ac8..b12632545673 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun7i-a20-gmac.yaml
@@ -40,6 +40,9 @@ properties:
     description:
       PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index fc445ad5a1f1..448e617cddc4 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -140,6 +140,9 @@ properties:
           - description: offset of the control register
           - description: shift within the control register
 
+  power-domains:
+    maxItems: 1
+
 patternProperties:
   "^mdio[0-9]$":
     type: object
diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..9c9cc3ef384d 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -158,6 +158,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
index 91e8cd1db67b..c1b67cfa76d0 100644
--- a/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
+++ b/Documentation/devicetree/bindings/net/eswin,eic7700-eth.yaml
@@ -83,6 +83,9 @@ properties:
                          register
           - description: Offset of register controlling TX/RX clock delay
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
index 62c1da36a2b5..e41851931b94 100644
--- a/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
+++ b/Documentation/devicetree/bindings/net/intel,dwmac-plat.yaml
@@ -47,6 +47,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
index c4f3224bad38..c9a131b8d830 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1b-gmac.yaml
@@ -66,6 +66,9 @@ properties:
       - mii
       - rgmii-id
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
index 99001b940b83..49db18423dd8 100644
--- a/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
+++ b/Documentation/devicetree/bindings/net/loongson,ls1c-emac.yaml
@@ -65,6 +65,9 @@ properties:
       - mii
       - rmii
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
index e5db346beca9..b240c76e7dd5 100644
--- a/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,dwmac-imx.yaml
@@ -83,6 +83,9 @@ properties:
     description:
       To select RMII reference clock from external.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
index 05acd9bc7616..f61188ab0dbe 100644
--- a/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,lpc1850-dwmac.yaml
@@ -51,6 +51,9 @@ properties:
     items:
       - const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
index 2b8b74c5feec..716407a75079 100644
--- a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
@@ -52,6 +52,9 @@ properties:
       - const: rx
       - const: ptp_ref
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 423959cb928d..ef520f810577 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -86,6 +86,9 @@ properties:
   phy-names:
     const: serdes
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
new file mode 100644
index 000000000000..72bb764c0ca0
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,sa8255p-ethqos.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ethernet ETHQOS device (firmware managed)
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  dwmmac based Qualcomm ethernet devices which support Gigabit
+  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
+  managed by firmware
+
+allOf:
+  - $ref: snps,dwmac.yaml#
+
+properties:
+  compatible:
+    const: qcom,sa8255p-ethqos
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: stmmaceth
+      - const: rgmii
+
+  interrupts:
+    items:
+      - description: Combined signal for various interrupt events
+      - description: The interrupt that occurs when HW safety error triggered
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: sfty
+
+  power-domains:
+    minItems: 3
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: core
+      - const: mdio
+      - const: serdes
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg-names
+  - power-domains
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet: ethernet@7a80000 {
+        compatible = "qcom,sa8255p-ethqos";
+        reg = <0x23040000 0x10000>,
+              <0x23056000 0x100>;
+        reg-names = "stmmaceth", "rgmii";
+
+        iommus = <&apps_smmu 0x120 0x7>;
+
+        interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "macirq", "sfty";
+
+        dma-coherent;
+
+        snps,tso;
+        snps,pbl = <32>;
+        rx-fifo-depth = <16384>;
+        tx-fifo-depth = <16384>;
+
+        phy-handle = <&ethernet_phy>;
+        phy-mode = "2500base-x";
+
+        snps,mtl-rx-config = <&mtl_rx_setup1>;
+        snps,mtl-tx-config = <&mtl_tx_setup1>;
+
+        power-domains = <&scmi8_pd 0>, <&scmi8_pd 1>, <&scmi8_dvfs 0>;
+        power-domain-names = "core", "mdio", "serdes";
+    };
diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
index 16dd7a2631ab..ed0d10a19ca4 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
@@ -44,6 +44,9 @@ properties:
       phandle pointing to a PCS sub-node compatible with
       renesas,rzn1-miic.yaml#
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
 
diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index bd53ab300f50..bc5054b05f6d 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -123,6 +123,9 @@ properties:
       Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml#
       (Refer RZ/T2H portion in the DT-binding file)
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index d17112527dab..ef82ff2a2884 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -121,6 +121,9 @@ properties:
   phy-supply:
     description: PHY regulator
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index dd3c72e8363e..312d1bbc2ad1 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -71,6 +71,7 @@ properties:
         - loongson,ls7a-dwmac
         - nxp,s32g2-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8255p-ethqos
         - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
@@ -180,7 +181,8 @@ properties:
           - const: ahb
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   mac-mode:
     $ref: ethernet-controller.yaml#/properties/phy-connection-type
@@ -643,6 +645,7 @@ allOf:
                 - ingenic,x1830-mac
                 - ingenic,x2000-mac
                 - qcom,qcs404-ethqos
+                - qcom,sa8255p-ethqos
                 - qcom,sa8775p-ethqos
                 - qcom,sc8280xp-ethqos
                 - qcom,sm8150-ethqos
diff --git a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
index b89456f0ef83..e78cbf594c69 100644
--- a/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,cv1800b-dwmac.yaml
@@ -49,6 +49,9 @@ properties:
   reset-names:
     const: stmmaceth
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index e8d3814db0e9..845e2c67d200 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,9 @@ properties:
   interrupt-names:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
index 313a15331661..8a68c6d7b5c6 100644
--- a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
@@ -71,6 +71,9 @@ properties:
       The argument one is the offset of phy mode selection, the
       argument two is the shift of phy mode selection.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
index 987254900d0d..29b878079ff0 100644
--- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
@@ -121,6 +121,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
index dd7481bb16e5..ad635529d676 100644
--- a/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/tesla,fsd-ethqos.yaml
@@ -67,6 +67,9 @@ properties:
       - rgmii-rxid
       - rgmii-txid
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
index b3492a9aa4ef..c859f8bb5d58 100644
--- a/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/thead,th1520-gmac.yaml
@@ -78,6 +78,9 @@ properties:
     items:
       - const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - clocks
   - clock-names
diff --git a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
index f0f32e18fc85..efa39eab0256 100644
--- a/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/toshiba,visconti-dwmac.yaml
@@ -48,6 +48,9 @@ properties:
   interrupt-names:
     const: macirq
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fc8a25414417 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21429,6 +21429,7 @@ L:	netdev@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+F:	Documentation/devicetree/bindings/net/qcom,sa8255p-ethqos.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
 
 QUALCOMM FASTRPC DRIVER

-- 
2.47.3


