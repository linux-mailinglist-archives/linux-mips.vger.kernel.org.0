Return-Path: <linux-mips+bounces-15808-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n+M5L2nqVGpthAAAu9opvQ
	(envelope-from <linux-mips+bounces-15808-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:38:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2686A74BB4B
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:38:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="EsujTW/5";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eSrnnbr7;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15808-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15808-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72AEE308CB09
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CA2429827;
	Mon, 13 Jul 2026 13:21:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52471426692
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948876; cv=none; b=bfXXaGRqIXRpSTBrDz9tQEyGFBj8KyG5487s/3XC3w0ouqZaKmCtZOpNVYcSqCD98kmcIMe94Gz4u757VzDtOp34om01/l3WnYQF06yPg7h5iHyuqj9Uf71jpL3cP47LyUvk81AzsMajMxw4LgGutfd1eFy/M3rFTTD16h7hHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948876; c=relaxed/simple;
	bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/0adp22h/e2lX0+DzTY6u4PhQwDk6llP8lcdedsbHAmLQ9MQYL6rTTkFAkKNjWnl0bYHJN/14gsYoP/WEzS2K/rG55rCYuHIq+00htX2CjO2kumapELPm+mQeLxTu2dVshDB86Ods+rZakbXtlI8PmNx0eBMuy6uyMZ5twEicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsujTW/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSrnnbr7; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3Fw1561359
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=; b=EsujTW/5s6ffD24l
	1eoxY/es2Q4PYXqBPREh5gFAIQIh+AyKnTTwi0B03NRumuzZ8IsCdWOplAmbd1WB
	n0rWQg4U069GZ20+4HgUCReJ/2eZIaGLTtyuI4vc9xb3ul7axklIfkgrCqhCYjwL
	mX/tC7VfT/Q3ezydS4BNBpBFzArKK6isUkbVOaCI8xHN+DfenK5EOemjuFMhQCe1
	p2Ve+Z6JVU82plo0OIOn8s7pgrs0LDPv7knwBanBLyJFaG/X/MvM41tzBn1e070H
	RKxJXUd1KCTTxaJP9hxvH3IimYpL/8JKo0nZG1zbjt70aRU5sD6ay0xYNCDQb+i9
	q0gc0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3apbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1a9764f0so53859171cf.1
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948872; x=1784553672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=eSrnnbr7ifHt29xjMpuT7318lFhKCk5J2/Xomruc5DF2wnUX5Ec6DNCuO2p/E2k0cg
         vg8ObEJ2AVMMa/25Q52awLYVwlS+RpGqSwPQwWRnupohNT47E/oXVJMItWtALeHSrclw
         hISpgbKu00CALlsjj+az2XkgTQrymCsjfs8XAgTCBld4soO3l1zDHVDcSvNB/VpuLPC9
         +kTyjRvjWXE4m5VrA6E7ju550dtaxb0WxIWWqxbmQ060y9shbCOR4bhcYEcbWuS07Ig0
         0ZjFDOc0Bx/5Pt4RMh2AdBDQpvh71jz/zGmABRAFzOXsM/OryvxRJQeygiEJspG1l1/q
         JERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948872; x=1784553672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EswjIYLr1e96wvciUd6ySjqcZdj8RdoKtvkdKwUdjN0=;
        b=lKUe8aNmxN2cUOh/mz9ej4m0vUQPxJNjTWUMDMYJB50C9uzFXHTXFCEA5wQp5EsTFN
         pVdZox5OX8g3KIlqDGcbzHbujN0EKcpyp00iAYmOk2U4Vom5sqyf2X3tN/fOHHr1ew3O
         2VrlotZuGIrrHdZ14NAFnhcUniB/G4qMcBNtouiNUOyffckNpBJzYkhhBizQFUILdx7H
         jfLLyzgKmM+0IfGiHJZiKxGW5+VCWqbXIlxDX4rvgApW3YL8q5/Jondtg0IBzR1FaosQ
         /Z/Gvwn0LIXgzh/149zdet2+Dvg5UEO9Sajhy15pp1/4eSu6RE4AeDWY6l2tbRNy2gAu
         uyvA==
X-Forwarded-Encrypted: i=1; AHgh+RpKCexMzSAzPcMyTaWb6dFDERBfaxoDUbnsE1XEEt7q0u2ytd2HXE82AEYAWMoeFKtqN/bCq9UNKtwr@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMh0WalASTJ+OUbaV5SkrTGWMBYXh0X28HejoUasXztN4RLeL
	0l5ZhCu9xpsNy9fo5nLgNZzf7vTiKac6l0DFZXRxWM+XzzbQHzUezbWFzJlDRsrhISFwnFhc+by
	7xxDvGMFuzZP6TI/pLudZVWH71wbu2V1xxVVyO9vroya+xwcxugaLgoQH5+63IOLp
X-Gm-Gg: AfdE7cm3lo5h9XUI4Yy5oFEWWcn5rmMefK937FikQvZJok3PaRFa+8cw7lnpY3F5dwe
	Caaiv673Q0UEckHZpcl0aJ4OZActmBHsmy+gyD2Tnzh03HZXtCDZMAaHOmZSEj1DcC86sjBoyb1
	W53mQf3Z7lBfZNQCWFGhrKXT7YkywqyAaPUM5kXGB4aTPd5MdlgTeLH1/VheKZ37H9XNAdvoQUS
	LeZBmQMPY2LmHC1VCwxK6KODxrHtsyHSJd2Kh+qpOab/s6uFuLE1hIkXe0fBc3PtpJ8iLEoSpz0
	FRBjloK2p2xAlQoB2aPwNTJS1vhUr04ewnaMvJUfo+CdzKSFcVIHxiMHKEBznpwcE01RQvW1yiM
	ngexEdCbX2OYgppgY/Bp4+aqFglBrJ1Y71dN9GTEO
X-Received: by 2002:ac8:5787:0:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-51cbf31702fmr95588791cf.45.1783948872051;
        Mon, 13 Jul 2026 06:21:12 -0700 (PDT)
X-Received: by 2002:ac8:5787:0:b0:51c:2cd3:ae7e with SMTP id d75a77b69052e-51cbf31702fmr95588121cf.45.1783948871582;
        Mon, 13 Jul 2026 06:21:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:31 +0200
Subject: [PATCH net-next v13 02/10] dt-bindings: phy: document the serdes
 PHY on sa8255p
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-2-119f8699ef8e@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BfrbL1Fwh6l+Z6nIdrB6wR8juwiurOHR3kGeK2lY/yQ=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGpU5jSgupfQ73V66CmjTRYphxtOflEwg11wtoOBUjQcLl7/W
 4kCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqVOY0AAoJEAWdLsv/NoTDpj0P/2pX
 O7c/RStPXEP6H+bYPdkp+JKPZsBfBDQechWWEdF9PaW8TIv9MlI3HIhWDhE8JzJiC7X3mUt6VaK
 dim6yfe4fNXqBfv1lZPKniq6DJG6AMmY0Ca5XkfbIHIUlxXFnhuIKyhUb2TYYYidXugrvV9QDeL
 wGkZG5kUj5SnYp42cVr2U08enrxUE3a4ej3c5nkc+IKY70iFoZaWSDY17iRsEFNOrCIMo5mMdsc
 XxQHM7+vHu02zCIHTKnX2We+LgxwhprMy+pvP9LADv1T4qNiGragMfDK20QhG4YORuygBn3PWYq
 ZFX2jUhtOY4/QsYxIujXT/8mM7KTenYEd+9HXqP3W8NZTL/unLcwz1ll3ocRw1j56tg9cFK05ku
 +V087fNBNe2xi07hTBeqjzfo94+CuGbSLYWGgIW1P39NJuv4VvwevNFW9jWlqjQPkVyI5xbk5vB
 3++GRxPJiKuLCKlFBCjsJk0Udyv0Cp7+9zVsC2ypoyMKpMvr6kVM7hhOp86eSrvQcTujRIANIeW
 3AIaIYWr+XIs17ovVnBqPd49JrvJrrQPXaTV2urBfkyBtBvgOeJ7wxmEFZlBbJQ6mAZN44FcZRU
 cPNwJKPwxL7ROUWKUvaFoJrqIEFe2gIiLW29czOE8cObK3yTkyxBar+2T5tx8q8CK23GPTqmC/a
 kdRil
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX55jZckuqUJsa
 XZo89u4/HWCFsD8znfW15rAND96aXz2LZHOs9HFNfqscjrEeuiEOV3v3O2qcRuA2MfsZt/9KvXg
 S8kcry76iH8LFbRWGPjxqWWPSIV+jxGl5ga0Z/qW4m+Mw5nl9ySL4m0VJsGsyRIW2K5OxriW3/O
 YO+7k5VmZ+OOezjDsZvCHXB93oMSw19/JbCRWpwN3yVZjRrj8rhlL4jdsNTsmJSfc7d8Ta3Lrt7
 iqoZVktjWrdizrVrB8157Nd4pXHH67H4mjvljnzcsLQaWchwmfxhtE25gkrWa/4X/kUAIZoLn8W
 WDlXL3N7RVhvT3mWRJKx0bYIB4ydE/AvddWqz1OALh9pRASOU9J9WKknL3/1INZSgJe+Ob/RWMc
 R3jx4bbPVxLESTbst9iv586Gtv3i/1IkRi1Q6PCAVsen3whHnS2LYYHmw8wFP9u7gM0ATb+M/fO
 SM03IureeG5+p8uKLIg==
X-Proofpoint-ORIG-GUID: IHkxMaSDLDahPhQj5ECctu1pCRQs9mMH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX6FswU7ANEZWo
 E6l7mG7nSsP6hZVmO+k06bNAK3/OUXdGc+i2xHDEGrENZcgEFTm57Nmz1S5pIZJfPhqW166poyw
 nRz2S5l45irKiMLG7ayQOORVDIuHn9I=
X-Proofpoint-GUID: IHkxMaSDLDahPhQj5ECctu1pCRQs9mMH
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e649 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15808-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2686A74BB4B

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


