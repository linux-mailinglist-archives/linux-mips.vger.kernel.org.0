Return-Path: <linux-mips+bounces-15809-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z3eZAhToVGqygwAAu9opvQ
	(envelope-from <linux-mips+bounces-15809-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:28:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 990D374B946
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:28:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BlGTZ+QJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ExbnV47W;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15809-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15809-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63BCB3131CFE
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC04C425CEF;
	Mon, 13 Jul 2026 13:21:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF4142CAFF
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948880; cv=none; b=jDDunLao+HeYhYuaosfph8ElCRkplEBDunDASbzmkDnOOh8DXkwGdyr1zL7dHtpXGxz7dcMd7oVOKIDWTidpHOgZhZDtiRS5XM19HIMLHjRLj66Ps+2hrizCXz88oCu2PX/HiukTP5OpMdRTyy+yEWlPnUsOHfIAL7w3WengnlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948880; c=relaxed/simple;
	bh=6McQp9b/ZuzsH4b6xE2Bu+mOLPKZAWdsYn2bXrph17c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LbgdGUHA6wf4wNMOWepnit/nTdxNeCNxcv0yKrqLBFX+PO/9Np+3NIMJoqaWlajAgc6XoNriMGHh8bXBr2lBvnCh+Ac6sGf1HHcBCuFIXPCXRz/+LpOtec2xT/K+tgD9ZE/tH2AdGzlL/UVlyi+LKbvEKhlE8YuB+FoSqq819w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlGTZ+QJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExbnV47W; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3Qk1561381
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRz6RMAtUsr4ElixoQTyiHRXUjuFyumK233EdmGoYlE=; b=BlGTZ+QJishjjSr3
	1JYkYZzkAxS5OQNHK6UN9ZZ4e+nOUozqG9XIGLXGsQtDhiKz3M+znG39hU1SACaP
	vRKfpITzZT2nb7c2w+JB2iDC/BF7nxkHXrwj3oGcZO6GZbgpjMFyvVWQLU/9QvVd
	6+s7ysGCcCl+AxGpCDKM+9KWpAjCnhrZ0GHZ0eVfoScolYT1aqd+G/HLM/P98dsx
	FH0ucpCvIWa4JAqUeCf28JRiNO2u+ffQH85z7ojWcY+ZDHZMAdbKJh1AhWWsqtRt
	ucbg36oW+Ozl2Ji6wS14M69dO7swdRd4NJ0ShEhkdm/wqsxsrZSkyFhLrGp/GT6a
	JfLJTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3apbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so37724271cf.1
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 06:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948877; x=1784553677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRz6RMAtUsr4ElixoQTyiHRXUjuFyumK233EdmGoYlE=;
        b=ExbnV47W9BsCQhFDdnIPCh9n6hR6DklilXfsXZdtWmF0udGu/t0KJU+MKHyYXxegfA
         dvTZZ/pUUMkjBtZBR7SAYI8wb1JIBqKT8BaORTPbFFmN0i/tY0dFmonF8yIfwrh12x7X
         ZEmPEQ6uCxM4t+PSkzHsCZ+gqP8TjZJhv710Ml3VC5Gpo0f8CMGQGalbVvtcpHwkKLUr
         6LpwRVOqTfEcJQxMHL0MVkAPDoMkpWZ8ztx369H1u5d5ui6PhWE/bJp0SI5toWU/HSIo
         T/0ArZm2MD6buVUmdIzSk7Q4Lk+TX6keEdwQALx9+f+/7YOawKv5iI7nPiAYno5hCOeK
         3PKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948877; x=1784553677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRz6RMAtUsr4ElixoQTyiHRXUjuFyumK233EdmGoYlE=;
        b=T3h31SsgUKEPJ+IbNOjAyzWsToBwdECYiRf5dkmZsUNWdkoAz/0yoxcqIIfOiHmfEw
         BQiYnuj37rfiXqDhQxVJmUZ6CR+hnokWPXs8AwM8UqqqmQXfJlSz5bXovR+57JczgvFu
         guQ7eGWHih+Zxlx3lZRW1gKBJitCKkzaxbm/Wb1VsdmOTL7LSfhGAoGZsrIaDZi2n2aA
         L4F5eFAtbKzkCJJG1BWB8IHyw1Fw1SBjpwBbbaIZywdTEng7lIBEuBttSUjL/BzaaC0o
         /i+Vc0IhHWar+ULIuxpvjNf7k1u949m6OINJTpuVFpOJ20IY5lGkaOQB4MQl/MwmFZOs
         Nl7A==
X-Forwarded-Encrypted: i=1; AHgh+Ro8a9y/w0HRCrrXbJyxb3tfqPPc8n4eSXN8AUbGZ0X3C+Nw9iICH15VoJavKAavhzQUDZ47zzrnWQxI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5q3zomhzsBYczTpDU1nZ/z+Wu/fZ6dd0O9g/ikx0CK1hDmZEz
	NyuyaN1XDj/V6r0pQUP7vhpiqTeEM+RfHKCKlpqJEphLEY3B4iGOy6hj8jF5zkxdrsZANF107to
	FWCg/6/VqmsnqSWTftNwQhVL5400y6UBtxg5hOWkAn66kae3letc/Z4KTacOPVtrA
X-Gm-Gg: AfdE7cn5bIOFTOnKTF/J1Bmz9/mI6f+Z6GfYofUPIAUK/BHYriq8kFaVaQcAo+1ygoj
	81YTJkDR9v81GFE+NlUvSLi77FIrjxq6EbNPkeld8p942Oadj+60bIsQI05ssuCrZC7GMaKK0EF
	hLYLgGiy+AtIGT38ucrH/Ro5dNm/28kSmnYEnF8z5MPAhXU8iBbyswvPWgROTyKX14m+RUqp0+c
	BEYGRxKBQ2rfLjrSuGxeqjLOULgZsDpdluqmtSrU9LgpcshMrmeOV5WlzHzjNG7NIfjIQkwLMWr
	W4KFXRMWHKQNNjcYBJWVsGnFVBLUKUjujqj4bAW77lvBqqwEy0dVJjUppGgljivJ/5TFk7YZQQn
	JKWFqO5QS/Jc5P1nbuuNoNak9VhiTh43S1TlKe/dI
X-Received: by 2002:a05:622a:5805:b0:51b:fc67:c738 with SMTP id d75a77b69052e-51cbf0e0847mr89640801cf.29.1783948875932;
        Mon, 13 Jul 2026 06:21:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5805:b0:51b:fc67:c738 with SMTP id d75a77b69052e-51cbf0e0847mr89640201cf.29.1783948875416;
        Mon, 13 Jul 2026 06:21:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:32 +0200
Subject: [PATCH net-next v13 03/10] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-3-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6867;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6McQp9b/ZuzsH4b6xE2Bu+mOLPKZAWdsYn2bXrph17c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY2GgSE2+BJ9Hi0c9UpIYFQzAew4cab1THFX
 9E8f1kez0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmNgAKCRAFnS7L/zaE
 wxVsD/9fGr/P9g1CAqHPauMkw7O+VrRVDHUAJ/8hbsfFYCxXDcl9OEx61EFONLLAksNax977pI5
 Z/yl0bXTTHTgg2dcewTRXTWakDKOqmc9PufOJBeFJZM3j7vQ76T4BSB9m9l/tVhaQ+5QKxXxZEG
 qJvgeCbLAS04yp26coDMQaSNA8LDbfCKlLy9K4rZshOppJh6apggkq1uPtLULiZ+qtnc+Y2mYUL
 eYSoXQC9Tt0wqMu6pFwCZuGRPBEvzzxVo8C1WH3pyXL7Zg1e4wCodd+X5+DUitbUmkQo2UdDOtx
 74PGGgIhnlhFgqrt6oZlWkvMO9CH0RJbaC5g+n3SXkgGyLCpsX55UKGyoGEMJ72tO7fkEDnvx5h
 cCI20qJcrGcKIgy8SGBERFlqHuAEmKBqT5W51Yb/EFsZwt+d+NyKVVmdI5uwN/rt3k6DzTpqvnR
 J4YLetemAUcAejeindnRo5Inwn3REqxyNsDiQ0ROY/9oc+6q22clnx7d6QzAvB/Ey4jGmWkebRJ
 MJ8MwUl0mvWHcneN1xXAh8mj7rMjQAeUW7S/HuPdtYQjgpJtVSuKo+vVrpjhTsOCb1oQ4dFkDjE
 8CsRaDapvydtIxz+KOxCQ+vVrwjUWhCSfZn5DBtSMPET5HHCuuLxe8NVZ84xmLm0CuZ9KHOzCzx
 +AeQyBC0+fVj36A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXwWBA8/uHZISl
 NSEhusSzSy66u9dvG9KhEEtYReeF6/4wfttwvWGoT2aWstCW6iNFCquCzdngXgY65ez5UPplvtP
 sn0xUis9nH0n3I8C+L1kFOVsTAm+UeDyd66kfmwwgORefDiVGCegA1FutmFh/dhr54XH0n+nZsl
 zGK98SjhWiehoJJ9iLeofxaLPbknjQWWkwk9QH47t6MLKeGqG1wvGYlITGS58LmEjPih96Yyxbe
 2YHvCQ9zzhCDMFEsegGSfF5ai+njCTOlUk1d7P+fBl/nFKUTvKpbjmxsvkV8nU2JuVXH+4MN/Oq
 YojWi9DdOFkqXmfOhPTT7kxzp76mSYJ0OuuPiYZt4/Trlnj6FNtsEeSe/U5dUKcB0AE7i0OeQ3e
 qoa/VajpmQ7ja3Z/A0uGzUcbEhTwYYIRL/bIaY4IFuoj0d4awcB+4MHPd7qNQSEJ6PAHsHL/lqH
 xnnZPeIe/RXb4UgIeIg==
X-Proofpoint-ORIG-GUID: vKQNwg2Mk-GAJh-upYz2FJTfcFxF9-W2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX3fvrqBSRxyzX
 BOBQ4qwec08JA5RpodCXNhznPqwt9QwAOz99C0NZpknS7YkPx8tv6OqVmxlLXjxxkXIZ0kSF3kf
 2r5eGwIKWa+BdFqkRjkhwkBQ2T1/lTw=
X-Proofpoint-GUID: vKQNwg2Mk-GAJh-upYz2FJTfcFxF9-W2
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e64e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ZvYg6ySBQLmwDIutsxAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15809-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 990D374B946

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 ++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 165 +++++++++++++++++++++++++
 3 files changed, 177 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9f08749e1bc686e15cc5eb341c28..a7cf348f6a7aa18e8b3f39f109b02ea672ae4177 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -232,3 +232,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f1489b1d07664ecd728f1db145986..032e582f2e1af96687484ce28aaba0c2ef73e754 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..aa7ce9393b2853ee1bb248f4a5738974d41556ef
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/delay.h>
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+struct qcom_dwmac_sgmii_phy_scmi {
+	unsigned int perf_state;
+};
+
+static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+	if (ret) {
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
+{
+	struct device *dev = phy->dev.parent;
+
+	dev_pm_genpd_set_performance_state(dev, 0);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	priv->perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+			   SPEED_2500 : SPEED_1000;
+
+	if (phy->power_count == 0)
+		return 0;
+
+	return dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.power_on	= qcom_dwmac_sgmii_phy_scmi_power_on,
+	.power_off	= qcom_dwmac_sgmii_phy_scmi_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_disable(dev);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->perf_state = SPEED_1000;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


