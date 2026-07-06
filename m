Return-Path: <linux-mips+bounces-15544-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NkrKARWtS2pzYQEAu9opvQ
	(envelope-from <linux-mips+bounces-15544-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 15:26:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAEF7113EB
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 15:26:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Of8SDNd8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=F9zz2kBZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15544-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15544-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B4343044C19
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 13:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DA441F7E2;
	Mon,  6 Jul 2026 13:20:53 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A586141610F
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 13:20:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344052; cv=none; b=knBWYrQNJi7XLrM49j7zP6j8Se9AJFeQiZ4vHDMU16FA45jdTFCBU3lpGA0dE2em5vfNd3NYV4aELFwrQwQ3BAspI0ncAcZSIcWidXFZUopGvhyR0pEnm+0eFlVD6kmD1ElPeF0PP/HxeVS0giIMxde1SozAoXhR53qjgXFfm6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344052; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfRTOcNOLs0yiLOtA53Hb4w+QR7qI/VENZVQJ2DCgzeUWmDBfksO6NNdKJ9A0L6kSGUrQpTucXo/yEAyjftnWqC7r0ZhZcsVbvM05rn/2YDNFeoKIY0MTcQu6DhrxRlpjYzfaWMZ9J2hYYTmm15mev2efpV4f2qgGZXwiIXUjZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Of8SDNd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9zz2kBZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTLe367424
	for <linux-mips@vger.kernel.org>; Mon, 6 Jul 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=Of8SDNd8nSgjJ/b5
	fAMXAah/f8yVIsJxTIQZN4IS2TX1ZZhDbCRfkHtS8STKVwFNOX8hJ6rtZjjNUEWk
	ra1QRqhWhwEJuEuVJmIkKEjCyGnYRMyRouN4tOaQAL7WKGtLf6pMWd3jpTt3Y2mH
	yIB97QBgecowYhAqufxukVzcuFZFwM+XGvXOXPI7akvWbXSao/JQePT7AfyhqsKl
	TBlSuuWv5ZI5egv8hAhp+bNRuAmFql5cHMa4v59zda0oprUQ6QKaXhc46VcuwXqD
	ZXNRNv/BvaRTphCiqzmfQNUHvh356ktFDDX9m+0cmqfA2hO64P63QMAfeXoDLHrX
	zbhaew==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891us2ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 13:20:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so391983585a.1
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 06:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344041; x=1783948841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=F9zz2kBZffh+Q3ORvY/h1MsKO8LZxsyKFW6hDYybkWn4Dr6TnChihPehLUSpukd2h1
         F/Fol0AxYHHXOFwwvHwmEgQ3sqS45mgZRD5yUUdJQQuRAmLmmQtc2TC6WYIFTAnwmKEk
         B21yvxCAGJuz8PRhLyTNVSY+mmcQ4yCNO8UIMWQ5y6UZVcMaSb+M4Q+PlGYwk6wy8eik
         PbP+y6gKt4DFF845jtQSVAMAxA5eKwNjhLrpPBigw4eexO3axmN0Kue6Rvp4HhCUDCKi
         y21Mi7j67GeVNvwn/JcYteIPitOCUPrlzl9u4+EfEe3aypaMIhgmKQCaYsZPzA3G9VA5
         RKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344041; x=1783948841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=sK9XYDiTmaEz2yj4e4zuuCE5vGLmYVOWOPGdjF8r3wx/TV8vw/i7B+XwDWM4JF7pcl
         RbfCo0A03zaHNE9Ga0DFCyIa50cjdnjaD9zCiElgPQgICoOVRlzy/c1dLqb5KJUx7jRm
         z8bGGtocXNX8PqW4IJe9tMmZfm/hDXZfYM1C767cOaVoyA0CShIWjyHuDB1uLEIXTO9M
         MjYTouqsJG8G0bBCCfxfbmGznPupKv06FUlyLfM4RtzEWgahsGAzTVpZPi98EfAnTeON
         Vzp3XV9DcWAwj3oDAb6phAZ4NV3JeqLn20o+F+wzqQc3rKT48lXACz1uNGx0XILuXSwf
         KJRw==
X-Forwarded-Encrypted: i=1; AHgh+RrVOXy0lw7XvLzK6AARILEG4Zx/HBY1RR+teEBF+WDv0QgA5NHfvNyd8FHebBhlS+c1WhrdHUBk5Kcc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6C1qC/JyHr/JQXbYntuXXXseYLhP3ksI5RNYsPs2AuT+D78Nf
	nM1rCy6YQOzy2pE+bSNzsnIAMa/Xq7mfEj0fH7B7RORNvJsm4lUFITcBzeFJWygBFZe1s6evsY8
	CxAISDbIhDGXNVnpaQ2RzuHxbQY94Ptdp+CCloCGeZfdw3qt287gkrzkIvpVJvvaW
X-Gm-Gg: AfdE7cnfQ12PA0HxhlHdRjyI7dQd6u7KVXy8R8ocqqo4cRwvGHDPIVYNkB8c9QOIeG5
	wuaMge4/HthUd7niCIXTaRREVXWMA6llyrLId4flou+VmmVi0U5YbwmMzTbwu+5DIqc2N8E7l3/
	APC3wqT+Sqp8kVyicy78Q2rx6iuL1unYp5qoA5ve/85DTXFBYAu+WMk7lQZPesdgGNwGaZUrnTZ
	6/TQhIH2WBR0x/6zP8UhoDfCLq9lMdRa6fiNyI6aPtd8SIqiVhPkOGhMHd2hG80Q2BMNuwRN8DJ
	39oDBVIlDPerK8c9urGh0oky4CuOKCXFzj+rfqeRxFH1hAVUl/6WRypeuTGi/Pn9Bb7aJl+bQ8d
	3EmBQcpnvlvO1VUGt0C9C8doIwZE+xQp/7Ul2gJxE
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id af79cd13be357-92e8b4bd907mr1698930785a.19.1783344040788;
        Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
X-Received: by 2002:a05:620a:688f:b0:92e:5f7e:3089 with SMTP id af79cd13be357-92e8b4bd907mr1698924685a.19.1783344040264;
        Mon, 06 Jul 2026 06:20:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:16 +0200
Subject: [PATCH net-next v12 1/7] dt-bindings: phy: document the serdes PHY
 on sa8255p
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-1-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6ubiXdhUge3ye8k09h+7C2wjU8OFOs2+lRmu
 FCvxgxqyhyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurmwAKCRAFnS7L/zaE
 w9S3D/0WsPuArRuolQJdGz26v9pT9Wt0u35Mgl6MOyqF8MpFHp1lFyjsAjDjk4AncmfnUl8tvC6
 PVNRwP4pwlRWfAsOg7ipKdd01pTeZ4FZss0kgxwsyhwvDYpCC9olobyevp+eDaonoGUFpbCe+mI
 IeoyE856odq0d7waceNBYKbUKPNM1Wn0rJwKYyNrOmp4srgyyo0ZZ64s7uIKF1dZFtpCRsd36FU
 +WK3Nc2BfpdGf0aJnTEx6WQ5dWwLf/g5nbOgU7Wz3lcHRKSkIBwUfBx7faOER/Cm99qiDp3+9Tr
 dMQWNkO7DDcZ5/2d6vJOQcnRiAUuJN6iKoYwaqaqYKIlSO1aoW//LHz/m+mD0zYciPYhazP0xKy
 eEp5FcB5PhL1n/Xb0XFnuYxJSfh1bWvVuPK+o0gS6NHanHquydjKhJ5QkIi7OsuJ5b63LU3wWmG
 Cu/MfIMUnEpiHZw9KbEV077HhSipqMXzxdG07s4sOJAOW2TwwH7igsRy+0EywCQ+LP7TSxBvaLG
 INjs00fu3a9KB1BL2O2kfmpZRawHyXgdKtMqMTRW/pPkp72D0F4KGm0iDReGqocgixQAGKSr9eX
 vKMbfamjR9j820ac19f2q34B0tVxvUosuSTcPQ+vHIwvd9S/uXcsDT0tRs2FwWTxH4xjIEFgPmv
 iYb2sLD5F8kSxfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: GnLxt9Y7XY1yEPJOcZfY97TcCanKcApy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfXyRanrj4USF1y
 yZ+uw1T1lYJ325xM1sUywGRQ4tdsDKGoHxG+gJ0oImzxfm9pYt7xp1p6//M3oE628OsCIwQO5Vc
 43mQxWIGLvOM2GfRH3mUBoW7jq+PZgY=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4baba9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX8jLa3dvAat1D
 1tR3HJo4tpTuHsp/GcJCF4molJ56TUcIvEPnuW59xBOSu4SRjG/pwvIp/xSPaE/MmFUeaFtc29P
 G8BZi1IYaGfbHIW1n/HSqVtAt8aVuDhQuLBJOvM9Q1rKvTHRuOatpFh+pMKWW/1DRcXjPFk46P6
 XIV8Bo2bO720KvNgihwYquA3gHnWyGsZRHu4oFuxiDHB4lz1dfvXPHkw3wTdXA60vnjgwAl2fd+
 gt0OReqx7N7G5kTQteLeIbUYGaiTXpdOQlEKPekYUGzln8fsN8BpKItDke+VmG3GhCA0ixpXx0U
 OflFvw/9NxEZ24eWah9XLUAtI/1pROLDhZL46bNXSEL7GugiYv8hKwucGice3QqKT8mzfBjEU5s
 eQaE8BXimNkMnSccAgQF5Jgt9hPAyvfs+2uY3xmqcXa1qqiYA+f01Ch70ieyyHZKU08Z3/VNJ7G
 IIAdgHvP52kG83kJBBg==
X-Proofpoint-ORIG-GUID: GnLxt9Y7XY1yEPJOcZfY97TcCanKcApy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15544-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,devicetree.org:url,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCAEF7113EB

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9e846e381555514bb32177f884abf0cf2c942948
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3


