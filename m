Return-Path: <linux-mips+bounces-15807-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +FwvGljqVGpmhAAAu9opvQ
	(envelope-from <linux-mips+bounces-15807-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:38:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A243374BB3A
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:38:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HRMgAGLm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cWMbJ23n;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15807-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15807-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06A3B35B3940
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69F9427A04;
	Mon, 13 Jul 2026 13:21:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D59426EA2
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948872; cv=none; b=Cpejg8Dh9LJg8DUVSBM+D4UlDOjzqfToTFldctJT1GEOuUzAIjkQZWVlMbcAWBfArERIjh1W53E6G8pqgmopsg1RRcBE1LkhFQDbp2OU8Lvz4ofZLtmMChloMzglEpwXMQguvKdBYl0bLNquLyJzxbolubjkJ//yklfGM0pfd+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948872; c=relaxed/simple;
	bh=jjMtp5SqAas4zIIzp6l5IEc/YbwGv5zChtMnC787rmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kz8sA7knFqhnRfatXw09z6qpy4b2jbM5zk2ek8lYp4e75o3KyleIRESXpsCu8k2aSr4VaXnWdluxv9Kg6nhmeavPl7B4dd7UyX3W0uyYZT+cEkevRnKld6g7du1t0t84l4C65LNsR+o6nyTPYnhTYYPWe8T0tIz06I9XIHfbTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HRMgAGLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cWMbJ23n; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEAiU1304580
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=; b=HRMgAGLmTEjLL7NM
	fyUok4F7YQcqnppTYtirZjwB8UYNicMU6F1+I7N5ozfZx2/JtO+LcXq4XYQxgWGW
	ThUPjmF70f942+VTtukuLP+HPSK/avuY6favBLTLI19Qv6JfHRrCru8sMnGHeIiG
	voP3rzkT0P0xj7F7snSJX25ArsOqtqZeVvU8nSdc1t3AC3VJCMDLwYwVbIlta/oZ
	5bKurWfOHT2SvIt2fHQQtW13/NkuuRvNSyeIAPx4eR7j7U2g+I5SecH0oNslpZ12
	hFwzxIYh+Pa1/g5okCPXjEuXOQTJJdsLzxBwkiSFOhnXSoqCH/+UTcElkIB90IK9
	c2+k/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9rsu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso53785081cf.0
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948868; x=1784553668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=cWMbJ23n6T+A9TZ1SvmquahQVMtoGfxrXkC31WaMGLmy4zz80UANbsCtHKwaYXzpp6
         EnH3qot4wKJLLH8JJiOGIA16uXjMkudnrhQaPFI4leN4GxXxfNted3QFyAN7/lmt9jIz
         y9zzz7W+DQPGj06I7kfU6d3ZU4ug+pe5bJWjagTqq7mTJDV6lBr1aZi9RPZ7B6jiq6G0
         Y/rmrcsD18qdFEjP+aOgQevXYd9V1nH7lQgZHr8byIJkQtQVg0bN7iP3GqHW0+YNGMW6
         QeDKNY7Z43FKgS3DHbXQKzkp7bBI0YD3aYI0UMHbgAkA6JLbLzw7HQSSUe0/3lZNhbhf
         oOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948868; x=1784553668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1B1oa6NldI29ome8JkAuhcCrVCMdRvD2y8volZucecU=;
        b=lBCifXKKyBphsIe5yZMd/1PLTaSnkfUAq8GDHEDfyf9x03E5ZIRCK31uLnji9CNktk
         9ULrL4LXjnoqA/CQku0iLp0lsyReqWQsuyWwqW+IQaVC/9EwBrDD0pphWQ2c49bKJ53h
         /v+YHMcplDVM7NeQwRpUNADvhOU/x0kNlFjZ3k59VzO9x/59RcfDI9cwm0fRxCYl2E2G
         MPPrxIlZHIV/nig65FHm1ZI0kVKsYmnB2hFPaNDTlPzFk+xrxZap+VpnZZdI4SGx3Y+b
         nYdeTVI9lb6GotqjFLzb6tHuVE5fEh8xXrRc7DO6T/k0W09dH7xFgEbWJTCUFmi76N5m
         uj9w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8oeBSrJQWyciwFncaIJnLU6X/otjqfs17Q2twu3PpmTDgwb60vC/NXwdXkSgHsNXp5779JpCZVljj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9EEMZ2CAFVZuygXpfBuClsSHzS6bTT4bLOgRbEXeZ7RNMFLQR
	ZDPKuvOMMQyw35kxeBUKkV70yi2I/PY09wwgjYMjcA6s1AVhqzHDQp6QcoULtV12mokPI3hUfU3
	aAiRFUOHbC9Y3KSYoq8gELHosgCgsekMTutEXDrAw2UcCePv1aJ0DdQ4iMiMNNi8V
X-Gm-Gg: AfdE7cmjIUJ6pi9vN4AoiUMNyKUz9ssUHKPX2QYYXeT9hp5jz2nbF63FF8irM1cWEF7
	6jsAm0eeFIUnQAdQkgNRMQM/wa+V4zhjJt4tnjYuCkSAj2TKnDoqIm0jOI6Gz8u5KAkU4rR24rg
	OjDzRgjrvP0p8xNv8YByx5xOkJqJQ4qRGYJM4tumBW0YtdPyfSckexdq/gxmaP3VYFWZ1Zi23JN
	Z/7jjaHzkgICYkmqf0vIY4fyKNkwy+pGfEJmDapmhEKCjc3x1txN0oajmxuuMtZW/rDA7+l71sz
	wJ/HGOuAXpHuxP6BSbFX9Sis8OP5ukLbrNp8kGgBrXrF+s6vhlxq2bg5SFx3HFiUdvT3oHOVavx
	R2HiWdkBn5IRAFjG29LD+qgTqTp9zPCUmkviyC4Kc
X-Received: by 2002:ac8:6f0f:0:b0:51a:8c86:bd40 with SMTP id d75a77b69052e-51cbf2bb069mr93022171cf.61.1783948868262;
        Mon, 13 Jul 2026 06:21:08 -0700 (PDT)
X-Received: by 2002:ac8:6f0f:0:b0:51a:8c86:bd40 with SMTP id d75a77b69052e-51cbf2bb069mr93021511cf.61.1783948867610;
        Mon, 13 Jul 2026 06:21:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:30 +0200
Subject: [PATCH net-next v13 01/10] net: phy: aquantia: fix system
 interface type not updated in forced mode
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-1-119f8699ef8e@oss.qualcomm.com>
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=jjMtp5SqAas4zIIzp6l5IEc/YbwGv5zChtMnC787rmU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOYzzfnrx183EvrDrG4Ij0t7Dbry5xhQDBN63
 sTHPBPheJ+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmMwAKCRAFnS7L/zaE
 w1LgD/9qtqvWaJNIcmSJbF08/P2HiqqtPEBd1s+tyKeMo7yTuSVEomvSt9PQeumZk4luZvppMze
 BCjhLWx+6fOyjhWVSz8HBY65tAA1zD7DNVIs9qguS8J8Eq90NiKvfR7ZDr9usRfnKcKWxsWOHgG
 ojLZ9JC26nL2b+gxoo/vjBbVki55aAeUgxQGZz0qSU//7QXZA+OpLnwhW+P1mMQrYnuPu/MARCm
 bnmW2Z8D+kbpF4vgOOG6KYY6Xx4vv59wa4mGzYwTy5RnJK9fzo2so8pYw/lpa1A9XCm9gbZDWHE
 6NZYLNQLxkY857AQzQnAMtuD1DqADDCt5IKRK8bDQdz1syR8/VCpUd/NCsYwjbqP/4rtmoVYY4+
 nXsBxk4iuXvVwttd2OTIvw+ikxHFh5MNRIEdCJXtbA+nfzjLzy9U816KqDSzeyaAe22+gQoPAwb
 HnblJwwISfQH0LqYA+1jM4JEUC5SH3i4/XD//3GCfNpIZOrN8w4L3W1eopUVXLmIHDDP0Lt9nab
 xvVkp7PypSMfsI0At+9gRMCcikJJwfP+C2oM7ElLMHgQtDj2KemfCVk/c+WGO+bFkvXVAtBcGOR
 /emT2S12yGD/Gctx1pVyNrxdoAYZVAZD+2Zf4YHnVKyivlzdCOl9aa11AjnmAMRcxS2b4nQyJeb
 akLHRgl131BvtYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXx6gPO1AmG0n5
 C8RUiqZ41lNIFLCcgtljwnHYS6xbMh+DQmKdzPjebbiW1lNkbSgKYj2T154vB1zNTErNDNfhGPM
 bF8OX5//KMw6hv+mEWgZPLXyc/vyc1xNS50Reff/tmlFUoaCzYIQK8IHnb/HbcjGfSibBldKUbe
 NyGI0sBUsay5lNuolbCqv68dj3U/wB/TNG0ke2CyKzLEsagYn+5DPOTxxXMvs/HcnlTwt51XBib
 wuQOKO7wOIpwjP8dF1T8QBA3SUPPYNPpWvzevEw7p47GFF5HLRgG83BPJtXHcGuAF+rnTv5ELUl
 pEYjcuTO3Za+p6qWYW9SobI8ULcQcm4QqiPz6yrIqmW14yU/2VXhlJfYqPQB8uXhLSUCGtcsi0u
 Gzl7RMrrhEKUiLxJWTHgMtTBdUsUi66yOICdXnFoRpVltqFKHdFEcsZahLOJtb1iVziFn6Ra/WN
 yuknuQcOZaJs4MMXCTQ==
X-Proofpoint-ORIG-GUID: UvDBu9rnjgXwq3nHQdP1ZUYHmjWaysun
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54e645 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=mooR1oPkU_hlknJbmfEA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: UvDBu9rnjgXwq3nHQdP1ZUYHmjWaysun
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXzB3oTEFuYKf7
 9v5dA+NzqnQlF1jiKYt3rop1XQMQzvyjELt19XF17Umm1mPWAUpL3bYfsP7fD9IjOl7i6M1A1HC
 8/EVRckISd8BXPuG/PnHrqh7k7/c9po=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15807-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A243374BB3A

aqr_gen1_read_status() decodes the MDIO_PHYXS_VEND_IF_STATUS register
to determine which SerDes interface the PHY is currently using on its
system side and stores the result in phydev->interface. phylink relies
on this value to configure the MAC.

The autoneg == AUTONEG_DISABLE check is not correct:
MDIO_PHYXS_VEND_IF_STATUS is set by the PHY firmware based on the
negotiated link speed, not based on whether autoneg was used to reach
it. When the link comes up at 1G in forced mode, the register correctly
reads SGMII, but the early return prevents phydev->interface from being
updated. It stays at whatever value it held before (typically 2500BASE-X
from the initial autoneg run), so phylink configures the MAC for the
wrong interface and the link cannot come up.

Remove the autoneg guard so that the system interface type is always
decoded when the link is up.

Cc: stable@vger.kernel.org
Fixes: 110a2432c520 ("net: phy: aquantia: add downshift support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/phy/aquantia/aquantia_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/aquantia/aquantia_main.c b/drivers/net/phy/aquantia/aquantia_main.c
index e95d391a6dc233879ae1fb2a97758b3df9600ce5..b720e4e9028cc20823297e8bbd239121aeafa09f 100644
--- a/drivers/net/phy/aquantia/aquantia_main.c
+++ b/drivers/net/phy/aquantia/aquantia_main.c
@@ -544,7 +544,7 @@ static int aqr_gen1_read_status(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
+	if (!phydev->link)
 		return 0;
 
 	/* The status register is not immediately correct on line side link up.

-- 
2.47.3


