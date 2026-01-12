Return-Path: <linux-mips+bounces-12854-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B39D11CC6
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 11:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7854930EA260
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 10:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761E02C11D9;
	Mon, 12 Jan 2026 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGZ+YJUI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h05g5tWq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDF42C08A1
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212989; cv=none; b=qHwKhFkOew9XdpWFKq1nHrrOWwbUpsMB40TsEmWw7pEym2PHFAEHLI0cSk8t1NeJMgYFveNrSNQzg+BljBOnwiiiv+CMLgNYQe5jOUfidsEDsbjd8VxtA0uWZrnZ+7GNwYbgP0uaNdt1iClYiAQgO+9xS2G0KjXdefNCwgPv25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212989; c=relaxed/simple;
	bh=ZfN4GLyjp0mjiV3ESbukBe5w2o299Tx+Wp9XN5V/wEY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+L+zCT14hA9SVTD7JtEwOj2+VZAP/VnH3ceK3Dqi0UWeWvT24JHplw90yXgPsC4elMQYt4oBlIIQCGnZzeVjb/SJBBJDQyjmJydOKDR1I51uAzMbqH/NN5RZPU1XkE9GsLcEZIVVc08Mu1PVvJMmyufCzDrSbJ0WeoAGFLjakY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGZ+YJUI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h05g5tWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C8qvcv113539
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=; b=kGZ+YJUIz+BF53tj
	DvtCbErSPxhCkQJ3S51//Fu5hVdEClGBAjycxAtQBf8JqCDNBvVXObaLS+L9BOGt
	D9v5c2zALBZ6oyBaJTLEMPZgpBHueOnWBMSVJ20KzhoAFbs70PCftqnfOf3OOpMR
	+g3e9wVNLQKkcDO0WbV6iW1ZH0Rj3iacgMDRE+UG6D2FF27xPbmlJGz9MpmO7IrO
	qIJaV8AW0VGJx0Rmxf+gkS+EB5yEsAGaa5s9j8kYxQ5gFFf/I9r+dGJY++BpdVin
	4S0cC+By/0CkSHaUnEaQ8zmrReBGWH4uYA/SCizCGK2krA/eC3wqXNS7uEVX6kLW
	+dT8AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmr4uhbcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 10:16:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c2a3a614b5so1430151885a.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768212984; x=1768817784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
        b=h05g5tWqS6a1k8ULs6bnIy1bYMX1IotmBHmmZKBwsbB9I8tNlFj+TXickPhMMVfpIl
         ja6UYSMh+jJAZ2hPegJhFGJN/76MsaKK9ntEFZjXXnpBdkZ6zY57BCeMM5Mnxe7xGbIu
         jLPWTUz74zcqFxUWSCMtJbtcsPP+Z4KZ07fLMfJvBqg2ffEnC5SaGseLmRx0GLNrV3yp
         k6sFvVwdmNIrhQVeRDZU6vSA3HKAkvGyzT/DtZzNP2t9XHggjsFc5cMVGuMJsbKIWkCJ
         ZTyb7RBa2my3zIUmfq+n9Zf8bJ6MOzWUEZAXV9S/pJ245JxckBMCBUjRwuD+rPUNLWTL
         nHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768212984; x=1768817784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u3CANCoZnA5JFEckMdXBmY1C/JzkS+TKyANzWnvW0ps=;
        b=Piokoy8xeaJ5pm43tA0YrqZwpH88tZcm1QSKHOTnudMfHl5a4WUSkwyvnv3h4uqehA
         qZYb9i/xJC1aa6CcURIq1f5CaSPv9LZdd09RcWRcKcWwz/Czd7wq6PnNkZSYRd+GvK4W
         Jp8jdqEEGT12fqmulPpVDGZhI5I2xHoxKMndNiQGF09u4bTfemMJOjsTnrl528BNx1Eg
         prYLe5fav4epUiJuOB4cnRUAmmbP/EpjPKzUvmhuJGxpicn02CScpjuWP7icQ3YRwuXa
         4VM3NPwAAsDFkTiwn7rITveRQ02iGa1FoNGB0chOHrC9/QxlR86S8GkkGHR+/gSEAYff
         WQhQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0fDZemXCZ2ndlFaddW+9cBU7d//d8kHdMy+l30T/FddNbBQJMmTjEzgbZtlyRC0gqhz58tKMwEkcz@vger.kernel.org
X-Gm-Message-State: AOJu0YzjEizEG4lEjXilUyxgfSaKGr5lpKfTsXPYo4nwz+5JhDCyjUpI
	vDaYH6FrjDe6Z0nYuX9JKnjYuYD+Nsv9KprRuYUmCePLJPm38ZWNtILWot3aiOJ21nNrlKVVX/H
	GiYrLrnPFKffyVFFQnsYTsH0RkxSCU8z8TO/+ykOkNgzc+IoRzWOHq675Wp6lJ6z8
X-Gm-Gg: AY/fxX7b4P3ugYmw+MzdxrinYx+Vq6veDnwSKVIjS4dXPZ7a9xYWmHdR5GJN2HAgeZb
	6gwZSelvnYYuv5rdHASc7jC+TgIZs5qqixHeOvxvRI/pjRig3HqN1yyuPAYsnabwQooyT316Lqw
	0a3AGEY/aLH2wsOfHTAI8qHo4zSJZcL+Tf+nR2oQEQO/zxh1F8KyMPWTEl5tcUYbWWUt9Y+amIJ
	rhvYetT9J1+uIYGFWmNPZ/UxRXWHogPfjEwZ8ASSj6+lLtqViFBJ7tmMpfxSNy1qQMq05UDmf1U
	LdYf4aTQHy+eE9XJa0IW7X3nXmb55vKLApeEUrgctCpnkNi7dBnsd77CFCioVvWE8Wahx4sgGub
	VhUpevOFAtuur6Ps4+GvMOt/IMudswPJubBXhRQ8Z
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c37f4e8521mr2840671685a.19.1768212984065;
        Mon, 12 Jan 2026 02:16:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGm1+BMB3wcHY+CfBZCzxk3TfmnwQG4rssPyIYg62GrFRai7K9ghgpyZ0S5lhQa3cL4tO8HBw==
X-Received: by 2002:a05:620a:172b:b0:8b2:eefb:c8ab with SMTP id af79cd13be357-8c37f4e8521mr2840664685a.19.1768212983551;
        Mon, 12 Jan 2026 02:16:23 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:eb74:bf66:83a8:4e98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f0cf2sm126530355e9.3.2026.01.12.02.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:16:23 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:15:41 +0100
Subject: [PATCH RESEND net-next v6 2/7] net: stmmac: qcom-ethqos: use
 generic device properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-qcom-sa8255p-emac-v6-2-86a3d4b2ad83@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2971;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5JRKlaK1PvzHkhM84UuOQHNNYPMck5ucBln5/d8C5Fk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpZMnnyYKxObLe0zkriAGSkbmbpZaPApgDozlsZ
 /q4OAMJQFyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaWTJ5wAKCRAFnS7L/zaE
 w/uoEACZYn8RkTNsWZELfKwfkZp2Zq87dICjgpuLqzd9iuW4pgU0Uco9G/gXWcMiMEAcOB93IfP
 6V6Z5rJ0chtzBov4JYuo8JJf7JFIuASYaXj5HN0bKm1ncR7tuEtrvuFjXEGgfGtU4VxHtczlaVg
 Yd9wtvKN7QtkeHeYfHwrSYaX2RASMRODw0XRPw5jqr4t4NwmF8LjPGZqYAOpR2iE7A9JdR+oUBQ
 XeeqXJudbQYzEw0Rc0ZA4T/4Z5MtaNhkycar+yuNFZ8nfP76eSal+tElLfjkxWthTnc43t2wLb3
 YbXXmYCIx8cprn++YEi/rkFhSd7i2ajfjZ7xqxKpX0ILeXTP8b4AxBTq0X9mcDVGR8ri599HLgx
 4Faj2vxNxK0xNVqrXxxSYPpmwPxSsYxGzX319xD3sxiGYkEug1OxLwXD62Dv/qGRDJ/9oxjz2VR
 snYj02FtZsOxxvPU6Pt+mZ6hEaeuGwEKWJR0M1YbDmzISLNJFlOp4jg44YK4BDomeZSTIvqLfmz
 gnDcmQKsZT2ffA754kGnRcuWxGLuIYu5VJyNLAh1a/FnCXD0CEi/GSR1G59c6Sh2LN/RoHNaQpQ
 xG1SuFuOtUkbYoJbQN5t/ciZeY6UYYguue3YrDyDthkeWzMdGh417zeMDAHcNLgmE+blaUeUfcS
 NfyrI/chIE1Z1ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4MSBTYWx0ZWRfX3U+56SHngqSI
 UfeaOQD98EklRsLtMjt7LB2GTcYqfBo6CLXjUTg4eVixHJtwPfRK715Jk/0ZY4t4RzUkG+GhojS
 lIiZar6+n57g2fXnC6w2hsUnEjD6Rti25UHhIFaVUd0uL1sxNk8EXd0idMqIkE6fJ1v4dlvgYoM
 2J/EBQq8kOzsMLtK1LQWD3WGuNABzERYHPzo+Mj/GeB8tzU3ty1Y3LifTUCvtYPG+Zfe7UMiNwR
 BacXPLjQHYHdtfn8IlJCug7Jo8s9k1zrx7x6nqShCp6MzBBmcf/IRgXGATtBCbRA5DWC9Pz2S5l
 6ef/C+rMmFyLFAXSZZA9oIJt/wx3HS2sW4L8ZcRG/fF/00FYd1mlLnUC3IdfhpCx3QHQZn4QxlC
 mcKcIkCluj45FRebMYVBjVYodoVmSnWFQ2vNwJdjU4vs7LtBwIemCaBzWvinmMJm9PyP4uyp8O+
 z1sxMPyMtLATfQValTQ==
X-Proofpoint-ORIG-GUID: v7XIHqeED_6QL7U0OBN8FTi2DW71Vfhe
X-Authority-Analysis: v=2.4 cv=YocChoYX c=1 sm=1 tr=0 ts=6964c9f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aGGWjMbO5e2og8PNdkwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: v7XIHqeED_6QL7U0OBN8FTi2DW71Vfhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120081

From: Bartosz Golaszewski <brgl@kernel.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 907fe2e927f015542b6a7228eae9a6c6945be3ac..1310312e3e099841da89d2f19b138b4459ecb504 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0826a7bd32ff55bef62f8fda4e3eaef64facdb5d..457748e5781231680b64382fa73e195cf7473924 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -723,7 +723,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -774,7 +773,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	ethqos->mac_base = stmmac_res.addr;
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -811,9 +810,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3


