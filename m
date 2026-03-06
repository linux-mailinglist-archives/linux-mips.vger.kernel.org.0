Return-Path: <linux-mips+bounces-13391-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA5ZEfb3qmlxZAEAu9opvQ
	(envelope-from <linux-mips+bounces-13391-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 16:51:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 476312243DA
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 16:51:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9B273039A4B
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2026 15:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6E93EB810;
	Fri,  6 Mar 2026 15:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blZWVVFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ew5p+whn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE13ECBE3
	for <linux-mips@vger.kernel.org>; Fri,  6 Mar 2026 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812041; cv=none; b=IC0jaUCVQaXFjM0fzon7dyzM4cdFx9Qrpjo8019dJPq9q9IhHJv4AqYUJiXBN8yiyXnFOkrO4tB7G6fsj+y8xF2no4o0am4zRe2h3jXUEsl3kZOsk4buAiifsJRmT9rPzTsrUd+bJ+5uld5xDFWb9Vtnxl7hkw4JuvEmt8MI8zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812041; c=relaxed/simple;
	bh=bEabACDPIWR1GkBjG8FezvRhDRIaJO/5uKLvE5tByvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q7b+nenbmoWiAncMTgWGkSxFbVXALCGdEZvnwo4iWzvQ4XucYqop3B4aJe3vTEO+IMjCRkpaasrMFVdiSfmdnrP4lJysYwT8/5znFz28Dq8898cx3+//TM0zpSbnUddpCra5W3QTS69mvF0b/N2HViHgDICX8MFR56h6ahuTyu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blZWVVFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ew5p+whn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FVpEb537240
	for <linux-mips@vger.kernel.org>; Fri, 6 Mar 2026 15:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=; b=blZWVVFdJm5pq2s4
	PO1IoTK0oZUWN8RBadFnYGbAlc3m2nYxCCAZJoeyN8dZ2GzS0bjFpB/+/WRbRyOp
	cZpzJbPQfn7+onkLGvTUQeviugYAqHOq/E6UEdZyavJbNRK4yvXe+mYUOU7QPYb7
	d0JbnJ8/vwP1drmZ8bqjvxRL3p2PFud7Af9xu0yJEOdXGhYQ882xIq3BJHerJ0ya
	OQ6T2xzkQsIWvvryi6uV2qq00vNQNaUvC9TLAdVdndnGw3EonILWJcNmO7I7ippn
	jt1rdjFiMLsOW7gxeD34OZKDaDvhyZit9ACXtl7PpgHj6PU82Ath2n/2lmPJW0Xg
	hjUYFQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdtc0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 06 Mar 2026 15:47:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso5335367285a.2
        for <linux-mips@vger.kernel.org>; Fri, 06 Mar 2026 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812033; x=1773416833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
        b=Ew5p+whnKmoNxTfxEt+nN1qK5Bpa2bpirquPo//qWkQAAPVIBRNN2aX+9CWL4ggFna
         FyN2GDzgryA92jWeqRyh/jDTgD1xSddKJPDUawxkoc/zWQcy+oxFPPXRiMweoXvmTUfU
         H2H0IVlf+iYNuSuDDn+Heh1zmsDp/RgjCMDc56sWq5eEMr7rtMJsfb+0r+N6S/PlNOTG
         d0EGwishQMpn+5i2+WO/du4vywCqd3AUbFFi+PDOBl5Z6yYttgbi5mydejDaT0UiDQhh
         4vh2FWk8wMkDkxPT4z2GBQExp4GObl007v8BsVkXZ1sABovzJTIKZmLHyUy7Ce5ahnD9
         RfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812033; x=1773416833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
        b=llYKKyAZ8ibEbqWyfX1oBUkbk2azYsnDz+FUQiDnNMlvPNXBX0q2IsXvtTPuqMklT9
         OS5v41/jyOCu75P30c8+WdqmDU1Ga3oMAzMIxeVpJ80H4Sbfka9/TcsyUrr1/Mfsa2JC
         nXJx3xcvq4+uJwOJrj7O41eQ4JPHKjQiiXExChlBhCY2Ow7V8plpgluUz/wwORfWgwys
         aDiymDeHME5v1WddyuFqEb5CMphT80iQe1q7MfK7C5loexxonxSlVGnmkeAdjoarR7qq
         9mWUIkAMJV5k4aR4c9JkJ0fJY5lLfQd5s/EAkmrsIJ+rDIeWLf9IXWG6kmMRu2Sbq0kh
         3GNw==
X-Forwarded-Encrypted: i=1; AJvYcCU+xG1iTCu66iscGgXcJLF/SCJ/A0WNDML/OVJGo0qUR6VW4NkjIxLL6rURyujEuTmPEApgtqagSsss@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+XI+/hmMXIXIKtwFNEzGMusoaBJcY5kw+YwWknhaOvbrJq2W3
	5BgGwsADfrFI4LLX3HFqBTmnCHSWG3iq3tjho5ppC6r5aJzCIpjI+hX3JMoC3JnnwJMqMyT9ON3
	kuKPzvT3mDEt7znfjfvzRRs/RbbJfoQuWvIZ/iAzetJBfGp+yqGZwSiF8oHXzib6t
X-Gm-Gg: ATEYQzwJzIIDURb4pk4jLvHaKxUZErn27A6V25PvAHvHcEnnc1zmKZo+bFvDsCOKQcD
	IQTApWfKtrD9BCMCwIBLqDa1ZfbRUK5HgDJHUhXddBg2tGXykRoDEDJ1LpqFyUrLCIlBseEFGCQ
	UHbMhVlEG432dSLqfJuadEaRtYnQosr6zWkNr1he3dYcFE8rqJcSKHZyToEd9kCGDy6biZRDHTd
	tkTA9Jhm4nhD7k6hjRqAnhIgS3e5TlM9djY4NOGY/OlK3+taSJKbLb0GYcqq2iretc3SjK4OCWI
	RlCTG65fkA/S62rbbMmeXRhj4CYgHbRA3FAJEeOuqw+FlCmkXToUvx3ryc+cVdS6OxSFFQ4UR9E
	4l8v5T2M5di8J4mMkd2YkPc+wgapymQ4qnzt2UOlX7T0GlbQEN0Mq
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cd6d52ca78mr307267285a.64.1772812032546;
        Fri, 06 Mar 2026 07:47:12 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cd6d52ca78mr307261085a.64.1772812031898;
        Fri, 06 Mar 2026 07:47:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:40 +0100
Subject: [PATCH net-next v7 2/7] net: stmmac: qcom-ethqos: use generic
 device properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-qcom-sa8255p-emac-v7-2-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8u/iXjZq36K7RYc1MNw8bxCkqJ95fEzxfvBCtp9cjI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbryaTIb50mRpj4hrxdrase97KkN9iHxwUJp
 BlJuvI37VWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar26wAKCRAFnS7L/zaE
 wzclD/0ZZh4K959JYxRQjHxVfznc7OkBZWgPBrYs8wAo/K3hokNK0WiKMHJZLzn2SMWtqWzVB0C
 lG0CmntJphIJ1AWgN+rXR93gl3L/sk5A6pAGK7SSpHgcKQlf8M1jF5SOdkc3uDgiPPbHCwxhOPV
 jfsOa3iwvidAeWEMmqummdnOf24q3RxuNLVYxiwqK9KQtEssdTXJFhs3HX4WSDrjs/zBKmKvWfn
 JfxMeHdfG7t91xJMf/P5Wp3DVHk5JKSvM5Lw9DE7CpH8hsz4OoZX1BZ9pxQwOeWcTQiPXheDP4H
 2uoOJ4gBkGRVCondWFER/PJsd0MdsXH5KOFfGoxuqaGdgK1Y3qqZ8vVFIxGTJSNkT4w0iZf3V+q
 w534YqTJUi3ZcbICEFTeWEJ0szhN2f2NEjKDqoPq8mJ8/FfC3bW+4fJQEhhxdpdhQWFeAW3sIC1
 Qc4NbVsTYrLkgRdSzSscY2UwVbUcqY2gpTkANq+PSasQaATRxTxNvKS0sINBmqyjUJmZB9tPw0D
 fB7ST1Lzwr8JkoDBdXDhAT3DM0FM3lJs+m8ywJMoOhaQf0+AsZ5IDwxI61znd6YAwLIw8bOQAQg
 Auc4hPSxQt6V6qfOaIm93wh6MAaEr6z5BfcPqlyr68NN61ugGkB2/8dMWzloVwETVtM1dMCmmwV
 DKcCepzLPjDweIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 5Jh2fXABkWG4donuDwOW6eSM5Pde0D0f
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69aaf701 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX5SDNY+VLif2r
 bJLhQf1bAsn+fzebZHiYhAgBjiJC9mEGpnRj9ax+T98uffEQc1xRytRiRLL//cSdn2m3umjJo8P
 mptaxxJeC6ewh+3kl2F2BEmW9ALL9PqQu49gr4E+FzOEAovO4M0MaXYdTifHfAlV2h3Efv0nVO/
 e7qeD/udrZvZtT3BlDw94Wr0o6JmUvC+0Do+JpXM84VWWyeY7k7Qw68sLcClaWAmbCEdkgAUdPa
 anyVCEiWz0k4Vf0Mt9swQzySyzsVj4+uwWUD1FQJhMtnfKByR0zN22fkgpmwW+YI0HRZfDVSWVu
 imhhXqh5SHba/QWXiFle23bT1Rat15SrlDadLjZkttD86pNsdsBd4SLoFAK9fND15toDrRtcwZ6
 MQ5n+u6LbgPw7wk+rfPZnI/WGazkwpDAQj0/6bkRR357kf9XzL9jsRXfrCQKagWAwvXPHaPcvyf
 X1dgWdTK8EGWnl4GVLQ==
X-Proofpoint-GUID: 5Jh2fXABkWG4donuDwOW6eSM5Pde0D0f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Rspamd-Queue-Id: 476312243DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13391-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[76];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

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
index 07088d03dbab5bd1abf66e9460613b839c1d565e..e2af4fdd654340d618477ed87d3889dbb9aab456 100644
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
index af8204c0e188ca8eaa9f31abeddda607f273b4a3..219ea36fe01e6d41299649defe569de034859288 100644
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
@@ -730,7 +730,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -779,7 +778,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -816,9 +815,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
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


