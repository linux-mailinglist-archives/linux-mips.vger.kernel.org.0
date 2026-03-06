Return-Path: <linux-mips+bounces-13393-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNlsB774qmlxZAEAu9opvQ
	(envelope-from <linux-mips+bounces-13393-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 16:54:38 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2402244F4
	for <lists+linux-mips@lfdr.de>; Fri, 06 Mar 2026 16:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D2D63185366
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2026 15:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1273ED5BC;
	Fri,  6 Mar 2026 15:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EH9xO1OC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHBu1E4i"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5143ED11C
	for <linux-mips@vger.kernel.org>; Fri,  6 Mar 2026 15:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812044; cv=none; b=SU1orY/xFj2Y1DUm7j8RNsbV9A+kLQT0PWZ36E7Bo0V2N5n54MTe6er8kLuSJJm1LbBxTKdcbmlKosiMn31gx7QXgzemgN2u9L0v6wa/OAFICElEwPp4H7MFyVTZiVwtG0B9/PXbA9rQ5Ir8thm5/beHQ1OyKGS3glC/rwUKuF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812044; c=relaxed/simple;
	bh=Esc+hVA1988/zRbYdoXvQozou3w6fDBDaNQ/dCWfR0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkGbz6avEiCtl4BX93F1KcpkYISkY4BmY3m0Ek6Txa6zqZ3ylrHHrnqrJltc/L2xFhbopgiNqjaNe22+o6WZEWYCS5VcCBwWv3P87QvUug2BTjLv1FuCMcdqXScU3c7PS+NpYIyDjBMtaKBySr6VWd+CZgq8mUaiJrKzgdPrtnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EH9xO1OC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cHBu1E4i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT6Sq2522583
	for <linux-mips@vger.kernel.org>; Fri, 6 Mar 2026 15:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=; b=EH9xO1OCIOWc1zvv
	3lyhYOt9wRBCHpHK8iwerd8cDL8VQIy0CKm5JF8+kO923+ECbVlYud+O1KloukJg
	VzuLR3ba2QFdzSmavfpZtG6OOlJBvQdq99sFVmzs75lQlQ7CfUcZypQdU8hl/cLU
	5EcdC04U0MOU5Qs7WF5y50SzqLqViByyMB75tJgervQVraNyoJRwwlYHtblae7rN
	/bhSkpkZOjQMrDkrZpngKpHqWkpqADPTHrYy+ENP12YnNPYKFxBG468tKwU41JA1
	LnglT1vxOTNZVbQ5qNHNquLSV7LA8gW/BrDtUWTyRanF58ePpavR/m48yiLk8vJC
	mNT4Qg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqfg6brkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 06 Mar 2026 15:47:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb413d0002so5905239085a.1
        for <linux-mips@vger.kernel.org>; Fri, 06 Mar 2026 07:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812041; x=1773416841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=;
        b=cHBu1E4ijvf6auU2CU04TV5pT2ixQTjGjgMj9gk6v6Xlyy3ztK7gyHSUshNVM9ten8
         +KCCMyXLRjOq7UlbFL+/cWGjy4hDoksPdyvBBDnvmnAoAqi2CvuHG06UNtISpu4givCW
         YDUKdLFFhSfmk+I0WZcUMC9Z3HTqSYlZwppYeYGYZ47QKM8hPIBsyZDcpC57UCqwl1nc
         FCUSkIt4ux7USYGGVLtTlOW/qS/kaxi0fDjTMOnT0rDt8Rq/BBXlvKx6UfXd8GHsnFhD
         zA6yubzXUdu/4bTN+dI86VCUuAKM5Zyv+VwxPrXtadJMNI1gC5ZhNrKY8JtpmIzztjuM
         cQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812041; x=1773416841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7FZ00ncedK+mL4WvdIiqnQo5Amq5I++OhTfC5QvXt2Q=;
        b=vMwiBw3swSD54oGXv/yOXuLar8spr08YU2yZMyDzx0Seofo+Fbvf0l1ODqt6qH9bqr
         TQM+9ztWmEB1gje2FErjshab0BlAcCR5LJXwmHJ+GHeCY86iTevFevcRyX/DhyqSVmq+
         jYvwSmf9jnly3c+T/dAvWj11Heh3ySvEpzh8ugZnB6KTbMJKswXXLUoUhKCrMciFUikw
         ziZFFsMUdXTqEm4ZsxnRC7XGwJNO/rpwviZu1Nr9aFxur/VoFJ2h2XGnn2SqquLxA5hC
         Mq3xBYyej04XxROcHjjDzd2l4fbeiDP4+0Prp9/mvXMwlDkQ91beywX/cklsMqZzin9F
         YNQg==
X-Forwarded-Encrypted: i=1; AJvYcCVb7a3JNTleB1w/UsJcTnJf+e2iAFR+m5tBtIGCJmw+XcrIrdkN4lKqUMW0gkjvBLlBWaNE3UbEw8jG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/dWxIzm8xYrPikeC4J3MJWDh1CGW2uZQdwDQZepbRs5YtLvGc
	geBZQi3eIde1UY7gf6P39qmnE5qjzDdNhqwOHm9KhV+LWF4pSUq+Z3t4OQiAhepZu5N7dzraBYS
	Qj+U46DUUtBR0cQzsN4QJDT0OQ1518lB+O3SD0LGWdotLIHnxtZ9lyAS+zWO35HOc
X-Gm-Gg: ATEYQzwqyZ/zua+n7zEU0ZCVHhnMqjzVPoNAG2lwptMbmYVSHKxkN6/fJZ4XDiIMdrO
	7BqXey2B3Vr7e8pM2Q+VvuprFkX38q3VgPfTmyCDAmjLYAoliHb/cUTdv99Qj2U8S0DpfbdyVrK
	yjUvTNgBwrn57Ku6J80nD8EVJFuXqQdpm0gZtffsZJUN77VhiIq0tNIsyuOyQwjetSPAwv5x3W1
	/A5K9DSSGN3t+F7++WN6lpGzoyWecQIV4TwRkBHi/hTN4vr6l5qlGtuGF/jHz6ow2w4n6HEZF6+
	dJS8PpoY750DmQ6tPDZ82aXK0If2WgxgxoovwOne+S5mq8Q8PLM0UPCuKXzFVLr9rrQvsUi6x1s
	LAqhjr9vvvD7QQ6MULqZ898UlKsqXuCzCv3x4rYzLevWW+76B7lc9
X-Received: by 2002:a05:620a:460a:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8cd63409440mr729252985a.5.1772812041025;
        Fri, 06 Mar 2026 07:47:21 -0800 (PST)
X-Received: by 2002:a05:620a:460a:b0:89d:b1e7:29e5 with SMTP id af79cd13be357-8cd63409440mr729242985a.5.1772812040433;
        Fri, 06 Mar 2026 07:47:20 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:42 +0100
Subject: [PATCH net-next v7 4/7] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-qcom-sa8255p-emac-v7-4-d6a3013094b7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3515;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4xdEZ3Xz7FPuhh4TIgOPGYV5mznSWY2Gmb1v1cWPOGU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbtqrbJrglPgvGD4e8XKoLPxkAHqr1h3Nepe
 9UbIf0JqnGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar27QAKCRAFnS7L/zaE
 w6aDEAC26/DLAc01J88zpFwROfoamNnM/xgAfAQbvQbU5luOZnh34NX/RcNJ0+nNFwz08EN5X4j
 5/JUw32zLJjd9HwDV1/fuqQezyNR0MnfpDgymbvYx3t2EmMNQa/hIxYER1tZfPvEPNBJ2Wu/y3I
 R57CjTB0NYLVSXoz90wG+F6uMQndZApxjZtk6xPJ3bZYlWkM8LXJydoVqVP86fOs2N4bDpOAiZy
 ud/NsEg7x+jpCSCFPGQbBW4j/VnYBFQnIP972sAfSiQQLA6bISpkzbTj9BYlBAjAf0/g5DUZddC
 GHdOAClK66MCmWlqKdWIQyIxa4CLf5H7ZFXWbfNCXXp7tCeKTJ7KcO8vRVrt0rz49p12/OrPnUE
 +xSwFwp4c3CWOBIe+LQEJVgZvOZNhiT/rFkYHDPqFcXgAU3h/4amGyjTx4GQcV41ouVzJz/d3ZL
 udtbd89DsaMLHJden6imqwwy7J0Cyym9sol9uX6NCus+M/ksJAiGq5ciFaeNqnaXxdx8C9JJOWs
 PC4a+tikzXDLlAaWMKTDDBSaAegMx2hwv/uzGEKhuik1rSI0l37Ot342QCdiijQB67EuWiBmDZ6
 3sfVGr3yhS5XncXXCLDr6Wb5Lnn8jxgliJwhTAthF+9Nrej9nFuX81hPoPs3qVeEXkOv5czbUB5
 fqP35uwnzraR8XA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: xswOOLIFTpP4jLZeLipGMr7fMJziBqGS
X-Proofpoint-ORIG-GUID: xswOOLIFTpP4jLZeLipGMr7fMJziBqGS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX+OpNRjmaJ2C9
 /ditSzs2qsj5pYJXvmcG3iAnQz6uXsWE8/o/kcVA2gGy+0Se9QamEMQ2gXLQm+KlZWTi6JqvnQE
 aOJliFe9M0PAyT7FJedCFnk9t2AWdxg17vRuFelpY1Z6liAwY8Ixz0NnwSRJR5Lih1T8sAxgEY9
 aW2BLqbsSWulUmwKqb7SIeXm220GIflKHQVfcfATtDkvdcTo+TadH+GFd1pl5C0uixvMcqvbdAB
 RB90jVuq23or1s0wsj84hxhxhzmd1zyEQfXmBMnFx377Wm9evVYyg251/WRkZuzZuWTkmhnWcCk
 t35EhPSRIpoaJbWI1IIAluWH+y0qRp/ScKI/XAFQVb+yyaVZWJV+Pxbv8uK2ycTDlL54E9JF9RI
 PMPonU84SG7V9Trcprmel7IjH0oh82w8zDJ7nwQgMrur8IjTPZklspNLEhF7sCAU7ClUU0EsAUo
 /YQzoDlWhsSvVVLqj6Q==
X-Authority-Analysis: v=2.4 cv=XKg9iAhE c=1 sm=1 tr=0 ts=69aaf70a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fthQcs0maGYz3WdgJrEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Rspamd-Queue-Id: 5C2402244F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13393-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[76];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.964];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ae7e088b122753fefa24fd2ca715151fd56e6376..f9a3741b692665b5acce34487f7fc2aaf557f0cb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -91,14 +91,18 @@ struct ethqos_emac_driver_data {
 	unsigned int num_por;
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
-	const char *link_clk_name;
 	u32 dma_addr_width;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -302,7 +306,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -323,8 +326,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -751,11 +759,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -801,6 +811,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ?
+				pm_data->link_clk_name : "rgmii";
 
 	ethqos->por = drv_data->por;
 	ethqos->num_por = drv_data->num_por;
@@ -808,7 +821,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3


