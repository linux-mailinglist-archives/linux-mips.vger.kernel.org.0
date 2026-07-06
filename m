Return-Path: <linux-mips+bounces-15542-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QIZ5A1itS2qGYQEAu9opvQ
	(envelope-from <linux-mips+bounces-15542-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 15:27:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D0C71142F
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 15:27:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JGdIn+mS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=acG+fKQm;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15542-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15542-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4ED10303D54D
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 13:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2DD41A77C;
	Mon,  6 Jul 2026 13:20:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954B6416133
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 13:20:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344048; cv=none; b=G2uLuYCwgEyYNM4zZar+j0a6pUReDvxHEybR4OBhPcGqlmhuuTRsjZLfPz1lclLXA6PZ6JYXPUiLInYdYbXXJuFBXIB1fBvTIEJzfrKUXdGs8NcoTFpiCq9H49dOVrG9tYZD1WiLF966/jD7ZVuYoqxyYDjMPygGKh374CP5zLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344048; c=relaxed/simple;
	bh=r4nzs6Q+Vb/dz3RA3Qk8xYysKrUAYteRCb53IwmKpR0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RXjKGe7x6dtTvdqErlBWlQ5tSR64yOYI+7iLIUc0aK+StMrTgVteMm4TBUCD+8PPC+OUCTSQq9MDdMOduQEoH6yCo0RuI5RK6/zobdC9rUpPC1cY/euZGQyaGtRnE7cQW+jTbtRqQU6hjsTlQkGA9pqXfaFgUyyaQ4NH/LIO2LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGdIn+mS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=acG+fKQm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxR5s402161
	for <linux-mips@vger.kernel.org>; Mon, 6 Jul 2026 13:20:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=S+/dKj/4QSkaC6Y1b0yb4O
	abzlICyIBStrbgJ+vgezg=; b=JGdIn+mSzwbuvFvd3FIrakLHr6yq9g3AK3u3t4
	dt5ddD9yRCYCF9fvCcetIJpc0+BbCncAkFqjHqJedvaabYzHnHWzhnafFUOPEYZJ
	l9JOi6zOiwdjZklD1fWP9n3QVrpSaVWOtq/DWZwGEmcDKM3fRriQAsRM66axz2Gg
	TqdD72zv7R+ApRwvcix0LJKjCQF3pNXNWYQ9o1XXJJVDTOYb74r5Gvp55l9HJxI8
	fSCRmc6iRWhM3f+halyEgjR6bTMRjs3tfZYyDtaGOaZdgo4bnqSLil3Omx+iVMeO
	YuMkcCqUC7+2DGmCoaMHWDfps1AMhD/Zhk3iprmmJr6+Sy8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grs6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 13:20:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so544363585a.0
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344039; x=1783948839; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
        b=acG+fKQmVPMSAQqc8VWae0EOLW7SjTUHwrqiwkE4LCel0adtN2GR7nCYIPba7T+KQa
         04hUjWeEhvIjquaI8sHB7VT+Px7HtYm1XZ+p6DbiaMFLCikPtWezvLXl1qgEAUsvmdFV
         QD8qAdXCmCyUG6jXoTh5ofMaRrt5wZZ90k28T/Mj9CspbXjz7l2v8ruFGraIxvXurryS
         opp9H/Nvazdzwphz2mS+ZyX1QC5ln+rd8olhiCfBkutSgJtIomy4XXwcRufnfnA3/qO2
         eAeAqvOb+PQ+kJ0Vg9Unp6w8dV+O0z4GtN1VmXJl/IFbwOs6qAPz26dPdXBSlukw5BZJ
         Zr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344039; x=1783948839;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+/dKj/4QSkaC6Y1b0yb4OabzlICyIBStrbgJ+vgezg=;
        b=bvRPjrsyqtBqJcId8crMgbcqQYC2RGBfCPCV/Bm2m5QDkW86LGvcHcyRAi56YreFZT
         5VeTZb/QFY2mX4mAlgM3ytdhvVXVWvTgWrnM+O4ywS/Em1lbteP8RozQBHtTCErnIIaS
         QMOsKbJtLZCr0r/z73gGysFEBGIkmd4Vs6WiI53I+tGet+xXd2b90udwfyT5D0NuMY6P
         yr/xatiiZ+lhNSLAuK3KiWSFddZCAwPAmyLxRLrCXrVQbHgDeq8QLY/SsChc30M8u6fg
         XGISZxF/ypEUcJXKB3PpL84DBPylW5NLZauLPgWNoYqwQ21sy9Vg/2Ve59ECUtaHURqH
         3wMA==
X-Forwarded-Encrypted: i=1; AHgh+Rqg/eUm+tT1rHkZ8uPqqgk3dgZbqRKWcs4zKx01umqI+Dx6bpy+/dloxgVC/FhfDNRTS30QNhsu2N3n@vger.kernel.org
X-Gm-Message-State: AOJu0YwQPYYF84MOBYt+cz/1OkJIzRd6NYIN8hwxChns+Z82+MBJNCdJ
	fm6jeJS5GD+z8wbw+nYcR4GZFj1dJ3Oe4+gkHjSfi6d0QsH39bcV3j2RdgCavV5ed4uB+NINn/d
	82TP+vXiiR4cwjPZGOp8EFANMhmMspjpTPionrGUsiYDH79tX0Uyr6mBXphxSuRZm
X-Gm-Gg: AfdE7cl2hbsqmPs7IgefuZfdzhFmRVlGvQjc3OrwZhP99fhwHGOok5k0OTeuD8ErpLq
	sTz9/TTHE4aOqP5zS5jWhYEfS+M5T0WWfots/o06ZCDyT13sgi2rC4mJgSIGESPYCIHsJlAUldk
	c/N0VQzElepxdjRDKANlYY/hW64cRQs5X7UwtCnd9AbLY5asOvVoU0G1NPDGyCVs7A1BeZuF5PJ
	UGHR4ufSEYeHJxpGxI83IC0oc02lRzpcHiE6VElsD3CQB9Tz52m999IqlSpVjT+GAwxnfHysNbv
	snl56K16VS0PbnYINfp55PAbBXtXMj0EhE4qUFb4HfTDIUcS8pPBv7wbB1VIhPZ2JBan3MJYQTf
	/i9VO8/Tyu24kR4t1v8ScObdSKhzLCR7k52BSzkzb
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id af79cd13be357-92ebb55e04amr64069585a.34.1783344038159;
        Mon, 06 Jul 2026 06:20:38 -0700 (PDT)
X-Received: by 2002:a05:620a:84c2:b0:92e:51ee:7944 with SMTP id af79cd13be357-92ebb55e04amr64060785a.34.1783344037495;
        Mon, 06 Jul 2026 06:20:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v12 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 06 Jul 2026 15:20:15 +0200
Message-Id: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJCrS2oC/3XSwW7DIAwA0F+pOC+VbcDATv2PaQdIoI20Jm3SR
 Z2q/vtopK2RSi5IYHjY4JsY49DGUbxvbmKIUzu2fZcnSG8bUR98t49V2+QFQUAaDKjqXPfHavS
 WtD5V8ejryioGktrXGknkc6chpvY6ox+ii5eqi9eL+MyRQzte+uFnvm3COT67DqHgTlhBJckbV
 yeMzHb31XZ+6Lf9sJ+5Sf4TCGRKhMyE0YZNcCTBhxdCPQksVjepTCTDzADW1NG/EHpJFLPQmQB
 sZJTeJ2lfC+EnQehKBGdCWZMQLCnGuOvHcXv+9l9563Gbh8fLZ4ABkdYAy142KpBvrHwF5kzMX
 yYMErgEmQw1GQKU4FQwK5BdQIglyGZIWyIT8v8C2hXILaFiRi5DtbZOqmg4JVqBEBYSyWLHwaN
 fnAQKJK1HXqPwSTEVPwwf3YvBpOB00Jhcgbrf778j1CUzggMAAA==
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r4nzs6Q+Vb/dz3RA3Qk8xYysKrUAYteRCb53IwmKpR0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uWhtNuvAg/7TbC2mCPqok9Ose0SbrE4DJGN
 YmzDZncOMmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurlgAKCRAFnS7L/zaE
 w4uZD/492fkF9KRUF+LhghAa5/B6yl9bIZPy2zmr+NuB1+uJHaG8Hm7kMRTPkhlNyJSB/uNjOyJ
 3rx9WO2dctD2xiQZk2pvLGnQin3nhR8o8cdlI6jzfZU5Nty5YuxTWH+WSqDy8q4YHPLJkW5WrJ/
 cEg8EZ8ZXm91TLT5VPIbq6iUtnTH8sySH/S6i/SB7TOlIeHUkUd7ksKug0gi8UQkmTFR+dNjdUS
 hlMEDyDza6mI51NADNs779EiBIhvvCDTHiOufvj/I3R+f+aswn7ia8ZmBCt6fu8VNVS8VpiMc8O
 qtLik7F9rCndGqr15FPOyH52xLeub9y0ctVr0AA8S4jaKxSIQA3F7tp1jcoLdRLAOck6IOnLm6u
 nOGOFVyHF8GIacisPRWGV4C/tRFDWrkD3EjexAq7l9PfRjz55yyQ1R6w+h5v/syxebW4+llB1ET
 c2IzGDiX1vjnqUp772AHLsVpKfAlm7xlZQMfsCyDi0qwXa0Zs94ts7Mvrpz39Zns98kZSC2b6jm
 Alitu/+XYQnjlosxKtc7ZVaV89r0cMYnPF9lHDa+QOIF4s7cSiSQXFjbz10LFMsDgJWQUO1FSsw
 D/AHRgWBdv6SFHNx1NhhkX6Btid9yv9yzDw3OQraxBv4lnjW+ta7AYdKNXZKGbmmaC734+7tNNO
 xGyF3acpcNwjnag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0wZKsKJTKhJTC5Zlq673BKGcKSfa7Clt
X-Proofpoint-ORIG-GUID: 0wZKsKJTKhJTC5Zlq673BKGcKSfa7Clt
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4baba7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h8s98YD0dNPsP74th3cA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXyR8kX0WK6tBL
 HIzpB2mX6tWZcbvQ77w+2VW5f5FrrC1fCuh+fWJRlb1z82j0C0xigy54fuMOt11NdARmoT1herF
 jgqOw9svkQ62awLFAp1lEcNo92nMcasI3j2+SZVv4i22hfGlhIwZzdggVbvWoVwFPpyK+qTnlq0
 YG/HQLKeOU5mk6lmqJ3RLPRC48rsKDiP7CIUW/Tbd2KTAR23G+K5qBdvAGvO84PdbAvPZ8kOcTZ
 TH1+C3YDZJpMhdODBa+WprqcRQE9G9EIw5OxYARuMjiHxRO3NtIEkDXOkZMiZ53mPSmL3WpqDcH
 QXSRebqJiRM2i01OshaOO4H0qiqsIQC8w9Z35pcPFB9iWuM47hQ3MeF79t0XdWgCs0xWvx71Vyp
 gAa1SADNBJMbUwU34BOIoY2MUzv8QBR/BohbNuAqt6A4bOho6dxnMEIfsYoyDJt0r+hdfN8kCP0
 b2PfaRmuf7hxo7Qz6UA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX6IPQGbjRjC3L
 06KgIer/2tLw3zFJW2ymQJBnDZX/Fz8WgMqKvf3kN69YTXFflze1JsRS/AODcJll6QwAayjiRLk
 pvi//qn1FNAkYk6QSBdex5ox6WKeYXI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,kernel.org,linaro.org,oss.qualcomm.com,googlemail.com,bp.renesas.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15542-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:martin.blumenstingl@googlemail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77D0C71142F

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v12:
- Drop the power-domain-names from the SGMII PHY DT bindings
- Add missing Kconfig dependency on PM for the new SGMII PHY driver
- Link to v11: https://patch.msgid.link/20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com

Changes in v11:
- Take a new approach: add a dedicated driver for the firmware-managed
  SGMII PHY and simplify changes made to the MAC driver
- Link to v10: https://patch.msgid.link/20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com

Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: phy: document the serdes PHY on sa8255p
      phy: qcom: add the SGMII SerDes PHY driver for SCMI systems
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: set serdes mode before powerup
      net: stmmac: qcom-ethqos: reuse the address of ethqos_emac_driver_data
      net: stmmac: qcom-ethqos: factor out linux-level setup into a separate function
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          | 107 ++++++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml |  50 +++++
 MAINTAINERS                                        |   1 +
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 230 ++++++++++++++++-----
 drivers/phy/qualcomm/Kconfig                       |  11 +
 drivers/phy/qualcomm/Makefile                      |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c     | 161 +++++++++++++++
 29 files changed, 573 insertions(+), 56 deletions(-)
---
base-commit: ca70e9a43a66435fda3a9d37f90c9c3b7bf211f6
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


