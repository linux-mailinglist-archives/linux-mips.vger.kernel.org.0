Return-Path: <linux-mips+bounces-15811-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OaXcCHHoVGrVgwAAu9opvQ
	(envelope-from <linux-mips+bounces-15811-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:30:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F0474B99E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:30:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qf8msRCz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G1kduBC4;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15811-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15811-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 553BA309B1EC
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E0943078D;
	Mon, 13 Jul 2026 13:21:30 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD52430787
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948890; cv=none; b=tdAQWwJl2snymI0GRGY9qZEVis2yH3MqgrlrAcZgoiBtTAhX5EgwHCVLd4Fur5XhiVCc/0ONl+FtDp2YidlRmYHT62BjRvGK18rdAhHSdM47e6na+9fVmL472+GTfnuvE3KX44LibcPwF/CgTTk+VTrKRq3yDCQtGFkUg5iq/Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948890; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AHqpfHzAQqCGG6MtcJuCBycQBoxmpcGqdHo7R/RedC5083qT8Vt5FN9RcK39YMusqAOuVVJbuV1ToY3OVXSs0QDGu9ytv4NbVDt+XAKf0zO90gHnt1+kZT+A8+LLKF/0kqx73ywJqVcHjtVgPCF0y4t/FenGqwkCQ4EThhCjfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qf8msRCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G1kduBC4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCFIQu1506631
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=Qf8msRCzFf3+tHNz
	SOrsHJEPxq0uRMP6T3kvWKfsmoQjWYm+Nj5IdZSgZkPNmsX+HEzLlh2JJ07ihf5N
	mko0DY98giBkts0M6oLnXVXDK86/6BcvurPiwX+0Oz4NdrJ0vvdVbea0tDnESH2l
	vnGrYeCsYkqpzINV+eybonxT8jHlzPGK/rI8qIfPFQ9/TN6FauU7+JfgvqwggXrZ
	HNoKHVWu1a+AZ4PauUxMwhZd2XCe/FTJ0guFq7zymqxbR8SKtOflyczwlMckFF7v
	6WOgxKJStJY3SWa/67PFYX2EcOi3J+BwVj2X6XiGuYy6jwpFyePLlGxSs+19WNFQ
	Erw5uQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda0ut9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:27 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e97889ac8aso41677106d6.3
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948887; x=1784553687; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=G1kduBC46OGxOFuAcuQMVe88xcbQx1FVmVLKoJvnxRCNSqxhhAEj3XW5TxU0IiGIMf
         zKX2gFqbcgAyvNR1Y2O0HHCeMVH9tlD/u6fnl6yVoENEph44nsEvqK80UpV03Xz8XqCT
         FlNZllBxuEA1OwNCOM8fAv2Q5tdooJ2qSQcD3RTg490pFJxBBcEccOTSqq3tL3QEsAbi
         ioEDw8pp5RX4MQr943vXL9tuoyLi5+qEJnYUGuYlft2h1pYqIZOSg5fgvfViLo/RLGgX
         s6qMllZdYo5DEIWTCfHbFi50nFkhpZRSiIXYhShWRAqq0SrQuLxCfSkeTi7H+MaGB9tp
         Lhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948887; x=1784553687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=RVG7zikF1fwPr00KumTR7m+DutTt91xiZcGyY1GRyz7nJlnBtAQanhhIF1aYFrybmh
         U0+mdNx7O+oS1LITXnKUYSPFfOUg55iI83faMUYDrDR35m8PJYU/0IxOzpdYrOCT8omq
         L6h01gC7uHtfxB8C68bKBhsgvuNDkP8Gy/ls1myQskwjRhPaIrd9V8uhSJZK2pqzJrLR
         +qGyRI94i5FIjTLLfC+zPCH68i9hba56ZlAZs11U91RyM+BkbUMnjrz0z0xFQL7q4uhQ
         NjDvEv4+yZrOilxd8Qv/0jjAFE9o0D7CJE99j7+xCMfDIwCT+xl1FkY2D6o7aVpjRVqp
         DdjA==
X-Forwarded-Encrypted: i=1; AHgh+Rqshjhs461aJkbv0Uy3vB8kC3t+pX4m+8tuaHRSXee8Oi9GCcQRMqWkece7KlONVGuw4RNhNTFqLRF0@vger.kernel.org
X-Gm-Message-State: AOJu0YzlxNhkswYNgVYGCd3/YCnZYxFJbd0KTrTEFaSXP9eyRYkVj295
	3MNSigJtMJIv36a2XSQ0FY8K0c0hdMZOgVSAymwyBnoI//CQ8Y1SEjKgvcW4DkBI4UsrCpImWaI
	11TJM1OLlR5zGKJYZV7uFAgPuo0g8+l3NgN4Z+F6wg5Z94aIwiicxJOVD98hY5hwI
X-Gm-Gg: AfdE7cmTSqYeBYd/iJWto/d6trYGQN7snjPmmXp3lpkSm1931/ALU+ZgvD5isqAckr3
	VC0a5TbPN4ujFJNoh87feF1ZFSCP67o6JqeJSDUyuWpITrFDNG0wujj1vZLDwKbDVpFnMDSLp5L
	iT+1s+V2djuAulSEk0JX26+GOlr18gtfhuMYajtBiyT5EUklfhkY/cNp8A6cFFk5geNZTvnd1oj
	0Yk2XqtTTpxDrDBNLdLlImZc6MF3XWOR5SYvEylp3GclLke1VKvzANtVNVMz5dQwyllsEzhoHIC
	oBaNKQfnZED2xCEVFqZkPdcLAsEL1q8NGIdfl76RKPoxVx/GXnsl86sZqabHo0jxS7QqC1Vp6In
	gUREAIV2YDPHCdEBQeyMmaDzkBhxgo8oIU8tEA1zr
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033891cf.33.1783948886546;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033231cf.33.1783948886012;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:34 +0200
Subject: [PATCH net-next v13 05/10] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-5-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY4z91onaKk8EZSNQidgZf3zEywv9nc+nEcm
 240LzBDxc6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOAAKCRAFnS7L/zaE
 w1ucD/4m4/PTLJO0XMbU6rkRzGWtB4Ml5ByIwYm518Uxusod+xBCfBe/O98uwt/UkUh3XGQ8ANN
 PIwNDFrrG8qsxCqfjFpvQxoZeidLrlPt6STp6j4p+gOVWdTto250bumWcxT/+P/vbSwzWLb8K2o
 6cFSLyIHA/KVYLxYYaUK4wesPOclMG6Ze7JPku0PdKxtQ/aYWPttEUv8xvzheabI+0AqsX3jARN
 dF82kntlPB75YooEAqaQSswWn8lhbTd9mV9gGsna95JJgpwYnG7IZABNDJykWuEYtHBgOI6m5ia
 VFokjS4/XDjphp4oPxdgqxO6UTVh4bdilWU7MaWdLs0AiC3oAUSSmoSZm7e8IrXx68LVIF6IqRX
 geK39OIcIChi4YwyEGny8GngvKdPtAEmsZwrJAuM4eecviRJIT/Qc4U+tn50CpYV8yQ7xjUwfK/
 D1QN1WSBE47QmmlUlzo08joi2AujLXtNCV0gXTaIHdx7njErkwIowCqaFIAMLsXwRWW8bl9hxC3
 CVsGSMrvXAGfbtG+MrMpEGMYwLuL9Hq/VuTaJn14J04bNn2FmNLIteRt7HIblRGQoZhRQSOEyB4
 F2MOTDosGkq0ICXPck1d/CoYelm5ME+EOJZSGFax3uvDX5Lqfafyjs5YHpzElofYwX0n6WI9Ojs
 uyMFYwSxO43PFPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX2pesR8qGEKBp
 GJo+VGLdfwObMQErkIlDzTYVSi41qk00x7lyncYe5OOzD0dpdo1SPjhz6+wEcTCFh6BjI1XcMKu
 rjtDPpT7BFjjd4IUX1blBca1k6rlV7I=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a54e657 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: nXl6McqH3LySa1B9BuPd9N6mBEmubejc
X-Proofpoint-ORIG-GUID: nXl6McqH3LySa1B9BuPd9N6mBEmubejc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX2VGrroIUDmVv
 QC1NsbynnltxKZRAo0/WljkZtgthnPisjeuNcNNVcz8VHU2psTYOaU1O5PxevZPYP79PePk0twX
 5qsKeyu+3Q86dk01eJ+5kSDtYmX4qSbQFjWkNpb8Yq7CnRPpfbt0FkagiLO8yog/bK2Z7ZWWyro
 CZrh5YkFp+09xN2LLACXfc2ILywcPQv8Er1Z6/3IctrpEji0dm84J4/UfXtY0MsI5mBl+N0o+il
 8pTE8Aj+j/EJW66DAGzdWy75zqOvNUNgHKSVo24JuVuoMz2BquRpnOnn6nsMns9xGlIz4h04Pxt
 TITYkSvK7DKmXRGKGqrsYn9ZEnRP2gTL+rBcGaL541iOyKvq74tZf9WXvhxFfxBSPdV7k882lDw
 /GNMlqDHvBcR43v6lWqVm0gQgu9Zja1IAT9uO3MHkyVuGYiXMBBZ19FxFJn6xZMe7SLKzIuH1Mo
 vBBRM3k4CySheUFEsIQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15811-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: A7F0474B99E

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


