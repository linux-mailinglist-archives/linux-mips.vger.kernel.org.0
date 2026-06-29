Return-Path: <linux-mips+bounces-15272-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DVx+BPNXQmqA5AkAu9opvQ
	(envelope-from <linux-mips+bounces-15272-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:33:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FF66D9788
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:33:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="O2a8aA/h";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Uruk1hT2;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15272-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15272-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 834C8302778D
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4A8402442;
	Mon, 29 Jun 2026 11:29:39 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559B7401A3C
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732579; cv=none; b=CQ+FgOWLDSOKm2iHgJL7dGHwH5iSUOIcLCYkTCWH1mmhSl69G4A0mPyP6Pycb6X54PLZk5OIDKhpPAXLmMGWY5fvw8AEbE9rcKie3v7cS5ers4V1uX6v5LOLahNFplJiujYDrqPV58++3l0Npz5KmW//pZIXDVAeYWezooOoX6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732579; c=relaxed/simple;
	bh=o5XoyX1coHzwS5MK4Nao0YTpRLZfe0Qwh6ArwM+K5eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qv800uAOv5oMLC+9D5K+eN/Yn6bPyV1I23b3sNgfim0zMXBJ0+sb9CthyuD9rZFuKNs/5ALYCFXhJ+aakO4YigvtJAjcbBCjHKOJOtCCUYhqE3kEPqSiw/du77A76oBzEllk2NeP6+X7LwwUbsdZLIcjmTWTedujH8jk/GEGg1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2a8aA/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uruk1hT2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATK6N2656156
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=; b=O2a8aA/h4nhMHkFW
	vsknL2Ick1SFdK2BsJ6bMWbfm11nyrFBnRzojmxlHak4ZBdI7UKqsi4RoySF4e9H
	SqkURymOu0zI9tSec1PWxPZxeUu2GJZ3faf+hdI31bwIUMgaUVv6eM1s6ObX4haa
	jzgJTnmXNoJ+o/PN8XBkTwytIxJxKM/1s5cq4jwMMG1nQjra1HyJpjMXRogC5Q/i
	6DHyPs5S/30q9qTRdY1D2j+y2Xt7TUsRPipZFyUcDV1rJkBU9Z8eSIYgBGKOzDxv
	yJjWCJ8/rz31w+5Y6MHKfIaE9TT4cV5AzNKRvLwMfb3JWqC/wqYneARhCw4ICY4h
	bbED0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3np7gj37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 11:29:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92af3d5e85aso685446785a.0
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732574; x=1783337374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=;
        b=Uruk1hT2eVWTAMi03xHHY3mf1OhQqiPe99y3iW7yjGkPg6wBwGrrBpPS+aGB44mgd/
         j6ASM+pZK4XZcTB2iYMDqjOWCpPeZIhT8GitEfPgRvPxYTj8JwNNSMalrDJqcljrVodX
         KjpqLMqqtnua6wRWFrbJ0q8qZMVVaf2DUjwGwomupDyqccVeOD/legtRu+NCRBOJHRTX
         nhDSl3ZXBCkqOvmRRIdAY2kHSOAIBG+yP5er/3C+h6LmVq9LUG6K/g1Z4o7ZR3f+qW9B
         Mz7Atk9S1VEI0014HBu93KKWflw2TCPasxRpJ6dYi0FW4N+Hm4ky1SG5PzwSPPXL7YpY
         t26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732574; x=1783337374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cyAtb4Z5AA87tJM4aAbz48OZuPpDfL6rZEVyCzADtro=;
        b=oKn/+Y9hCp20qeqwGommNRbDq3pXDoXrHS49EpwMDBUtU/w42QtNQkuSQm6NW64pAU
         CPZdkGCv2ogbLDvX3/dqIrkzwnkOQgA/qdJp9K9i279VFLhnW/CO+wE/nHnNQyEuftRD
         pBer2nvboy1r7AI7mjyE4WaBk8oVucGGITUEhmlT3th/yQQ2wQQBwjYLyxJvkp2BAn3H
         8SNMxPJPwmu6XJAsP9Qj3odff4Wt7hVALOzOBbMRIWtdbUwOKubaxN4VH9lYpG1gezHl
         YpeSWJ15OTqXyWkyg5MkwgAlasBNHWU8qcYtQCiKOi/m0as2rzFmLrfrVNGQzTNQAaW3
         vjxQ==
X-Forwarded-Encrypted: i=1; AFNElJ/HRRax2qLRwrr4DXbyj8fGDbCnr1drHj3RThja7VN0FGg2a7mUpZZTJtUOQ6Bm5Ehya4s4T/lLg1z/@vger.kernel.org
X-Gm-Message-State: AOJu0YwOwSzRmejmYcv2Mi+LOl1+D+WhTflJnSNq6e/0kCk2kwg10HzG
	q+vBTXoMaiyUtDiwJrZpi13nj6lJt5WB4eiYfJbf0YX9075OgL9kMhCfKV8H2aT4e4QuIEpmF+1
	OSYoaxcFmCp4rkM8QZJUnEsZ6YqXLPfU8cPW0EqX/nDQxND8A6gvdb7cVzPBMAENq
X-Gm-Gg: AfdE7cmci3lRu3olWWErN2FRqyQPaJfCeGbYVwTRt4Fjt8bqXeNaJATG0A1f6hTdszO
	+/8NQxhKNfmVsCqyr5nY/cNR001je9APJ8qfdDLVPHMjnPFP3NM3axZKD8UirHvvnXfx5ufs0ZE
	uX/cKICMBCp74UnpGUed+2voLfxfrKnKPsHJfVZUm2CqraCZJCRnteVkBWmt50p6+rdA9yIfnev
	irtTW/ktwVBMiisvBvWSGzN6uQNZDW092UqQxJ0bMpYqpbfTnwnCbUQog3lQ5HPJz8VjUJLHjz4
	gVwgiBF+Is4rTI3UO6kuYEAbbQiB+NhUfJ9ASRsfuR+NjQNlx1iO2tEzkInxpK5MO9eNo8R/T+l
	aQ0w0BkPGqZ5u8QTwiy8Y5OzetWVC+JJEFfBty2/0
X-Received: by 2002:a05:620a:45aa:b0:92e:4e45:dea6 with SMTP id af79cd13be357-92e4e45e5c3mr483927285a.52.1782732572222;
        Mon, 29 Jun 2026 04:29:32 -0700 (PDT)
X-Received: by 2002:a05:620a:45aa:b0:92e:4e45:dea6 with SMTP id af79cd13be357-92e4e45e5c3mr483911785a.52.1782732570816;
        Mon, 29 Jun 2026 04:29:30 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:52 +0200
Subject: [PATCH net-next v11 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-6-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=o5XoyX1coHzwS5MK4Nao0YTpRLZfe0Qwh6ArwM+K5eE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlcDTAon0X83/cuVf2FonlyDJldJI+jtgKRNr
 qw94YCFiE+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJXAwAKCRAFnS7L/zaE
 w/hYD/4l+Si6QWsD7+ZZxmaH96VzTsVjckV/wXRff5CAaOIfjpJvFKCtXTaM3YdcF42IaaYN1Hx
 2HNWSLGg1VdwPzcYScIC3MEokznjNOhfTT4g49+bvYwDDlBCtNLiMDc7s3VDTKgVOCHHFu283rb
 ON/ZxL8rsLPQLMe1Zovv0J6E+Ha0QbrbOXCWEIPZMx8Xzef+f5NZWiloH5IDGoztVm2s4V1FDp+
 jXYSCwHCYXpMig7U0ZbGkNwW2VtIZfNOEUQswnoFnP7cxQltjaCJfKxJZwZ3KCzbm5lxjV+KLfr
 /dzqZZl7Ng9OAZSzksTPGeIZTtNkUxIi3UOwtYF8PRk5x+k4ElPxQy/0uVUsmB6Gtpko6JAIL2A
 PtOTpmcE6CbyKI/0xOfhl8+lW4lZRcSGYLpQCbzX/8Z37/3i6S/irGyzB45DjYpLPICGaaBGYU6
 Jsb8gWfgQkeD8rfrBYi4d1eElYfYUFdRemSeg2vS/u4NMaEhOtG2NmwMuLd9vlyr790vRPN/hso
 VwTMBS+A81ha8yuYxdFxURpA4kaZ0pfJrQmpCHbm2xBYkQIZlaM6dH9umSmVRftI83uTfFZ2x27
 L6qtp7zKI00038b7/0ZEgI7Z95MYowxHtqkMs30AHeR47uZq9EOncyUC2xbyr6s4mqqPTwLsyWT
 MpjfoP9Wuse2kYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX77Pqp6i1DNzJ
 tRmqMkRqybUd0qrHXREq1nzcZzAenHQoW69J+Q3nXaA23wyKNc3vKzyHpWTSj89AY/nHmiCR4pj
 u1uElNYeYubqwuoJigvNDn837f55OcC34ary7BlrLX15HEhXUpe2P/r32FGNmRHK85MTx374hax
 /2sNAXyBu1qXd7kUwQVCyVo4MXpzIHMMHYo3lGBPi7iQdzDEHhlmk9kJZHJYO0QVJu8b0JzAeOH
 I+bythx7xII7KpJNl+I39DW3qAM4iYE9RD+bIN6Va2+TnllhNbskyr0w2AaP7lzBMi5gQPf/R4o
 E+kvjkLxv6IrcMQTMhJrZSqChz0TVt9BDUq771ZoGCc2s06eQZZ7yXRpVIGprgUhlR/qjnCwVZe
 xvhoh+9MhGHWxjKksnxLseJDCa9K3PJJzJBdJhWkEHgQ19COnQTrSPz1/fSwIJ+SljITzZFfVZr
 LJJFiCF3eF5FxD6XaQw==
X-Proofpoint-GUID: gAcgMUWDtRKxTJJQ3WCFIkGYKT71byM-
X-Proofpoint-ORIG-GUID: gAcgMUWDtRKxTJJQ3WCFIkGYKT71byM-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX2ckQmJCPdO1j
 fsFIhJ9T19+O7KQcHTZtaRBOPMxrVIzQIyKmpZ/Me1YLUwA9eVid81FftZ/rvqVATEFoIwdGvGI
 VhWtna28DeQc35lfPBacPMzrLzmAQp0=
X-Authority-Analysis: v=2.4 cv=OcWoyBTY c=1 sm=1 tr=0 ts=6a42571e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=dj4JEN0qHmgdNMwDfcEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094
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
	TAGGED_FROM(0.00)[bounces-15272-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
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
X-Rspamd-Queue-Id: 99FF66D9788

Ahead of adding support for firmware-controlled EMAC variants, extend
the ethqos_emac_driver_data structure with a setup() callback, implement
it for the existing models and move all operations not required in SCMI
mode into it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 99 +++++++++++++++-------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index fa3447b90315672d706d5ce7d710bdec6214e4e6..f379570f80680e96f027873cda6a6bca398e22dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -5,6 +5,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -81,6 +82,8 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+struct qcom_ethqos;
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -95,6 +98,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	int (*setup)(struct qcom_ethqos *ethqos,
+		     struct plat_stmmacenet_data *plat_dat);
 };
 
 struct qcom_ethqos {
@@ -199,6 +204,9 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
+
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -213,6 +221,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -229,6 +238,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -261,6 +271,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -296,6 +307,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -685,6 +697,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
+
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	ethqos_set_func_clk_en(ethqos);
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+	plat_dat->dump_debug_regs = rgmii_dump;
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -706,23 +770,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -732,24 +793,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->pdev = pdev;
-	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base))
-		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
-				     "Failed to map rgmii resource\n");
-
 	data = of_device_get_match_data(dev);
 	ethqos->data = data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
-				     "Failed to get link_clk\n");
-
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+	if (WARN_ON(!data->setup))
+		return -EINVAL;
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	ret = data->setup(ethqos, plat_dat);
 	if (ret)
 		return ret;
 
@@ -758,21 +808,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
-
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	ethqos_set_func_clk_en(ethqos);
-
-	/* The clocks are controlled by firmware, so we don't know for certain
-	 * what clock rate is being used. Hardware documentation mentions that
-	 * the AHB slave clock will be in the range of 50 to 100MHz, which
-	 * equates to a MDC between 1.19 and 2.38MHz.
-	 */
 	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (data->has_emac_ge_3)

-- 
2.47.3


