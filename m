Return-Path: <linux-mips+bounces-13654-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PRnBVXzt2mfXQEAu9opvQ
	(envelope-from <linux-mips+bounces-13654-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:11:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A722B299398
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A28D93099EB6
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 12:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DB2395254;
	Mon, 16 Mar 2026 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4wv/95r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MKLztWqs"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7958394786
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662744; cv=none; b=cOxxDdCqtucEVhEW51HeZWXjNiTM53WxK/x+F/99XIa/5usIf7ySbTu6O/DD6DWEzo38khcEja3dzvC84YiG27g+sgKHI1dAmvO8UyhVaDd6oVACIjky6JnePQ0h8EVNJQRi/MNxoUKqFAXQsrZvrhLAfpSj/PHxG/54VQDFD9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662744; c=relaxed/simple;
	bh=fytWPLtdtjzkuEYgxEMp+BkUR1djTquvDROUJYOj9Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4zL4ccZRObfwEF2+DQt/8D+o/shiK4LZtD4swTxHjRi2qAhYrvlwzV+HNTRw/LhEDiMcQsC/F86FGwl1s04+nWMhb233OTwp4YA7izsTDZNZQdDSCnVlbPaTqHembscer05q+3jJjlbQ+SM0xJgc6CwAfC/04tl2bUeNZQ3xrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4wv/95r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MKLztWqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GA46WU3124536
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=; b=H4wv/95rrUsxz06z
	XjZDabTjstrwrld8qqGBx7o9FhrFh9lLj64r9yIhp7SulFg0ah0OVK2lNdJo5BJb
	3VNvJyiwQrdfrrcduR3enqHHG5yyMJJ8UiBZQc/k+NoPVFQqkRlazRQgWfG4bhkI
	OrremG8TeJvjQdPx0MSGJerW1cljot/cuo8C9jKfG4IKtkHPNv+yLIgjvKlKD3+x
	K1ekrm1WWPsob2i8QxZn2cv4dbLG1kb/dn0PNgwqgymSuwp70bJimSH81kuMNCqd
	x3liWepGHSUprMSU4EFkhdow/DIh1HN2h8miO/oB9c+pztNVBKDEvrhRkTGv7rxH
	x3leDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxfsmgdjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c56a7e610so44957186d6.0
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662741; x=1774267541; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=;
        b=MKLztWqsReXalf5a3hOS6cfAWUrNJjUuja+4j43R3jSAWyk9/NvpV2FhyxFa0m5Yny
         HvN+7DsaTDXn/pXH/O19ui9bqjIsCBylkbwSaBirxvt7cMhS0aV5Fqes8f7izFcfEDNF
         EF+KrHHOTQOSplRE7UBNweT2uyPSCXd0QXtRoP1/pzdSEWmw9+HJNnIvkWNI72INotjU
         FDZzsvR6zyn+BTvlrzoVEamRUdHYyrUL8+q1dIU6/YovsV7Fr9j+oK+MH0dZX0+K3C1b
         mZnZJQe1uCmX8Ml19CTHshMRr6SNtl15hoHwY+TdgXlcYJbt4WOEgq9uHP5M+Oc9pmiu
         5RLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662741; x=1774267541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MQeKaS1EcNd0vqbL+A1AzKnmVR3EcoRi15Y0S03BedU=;
        b=BaQRp7GTdYF9hCwiON367uStHGH7/DnLfV2s7cmP1OjjMLRwFjLy24au66H9GgSHSi
         R7hyApdnY8omrYFbguVAc+b+QLKjL1/hwblQEIn6Sdj+eBAqDCtp+ec0icwYcrOwuegj
         j+Dn1pv1VjlkrhW3U8gxwgsAtcCRLRABeq8qVxjGQQq5YGzOvJb4gsHUNzwnMdFN9RRl
         AiSelKlfXNfH5k0qvxx1AUifFnO8oy/o7Pw9tyDKhe3JtKdNvu+YMoFVvcXt3Ypnva8n
         o7oP4pI3ttlzhQsA6Xw3/3SIQb3C8YHH6qiEYFb/Lof6S5tj2O9Y/NPYd70G5bxYZkOz
         zTLA==
X-Forwarded-Encrypted: i=1; AJvYcCU+iocy9unvgektakRgPX0XBPIxpwmOMhtkAL+TS43avttLeJLqUl/Y/u0c7r1aI6/OHm/1L/hKdHmX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdc9LzNEwHUk6S+/AybPx4qpASuup5oI4ojPDcNK2OMdDWdmFI
	t870UPKlc38o99Frl8fZw4CnXe4FeogG/pgKistaH4HoTQMFzKgjAmTAC2PyaPSHfCw2ktvFbor
	cedN+EU65CYHDrzyy2A+iuTy2mX+jCDWwHpeQ2OhRaJMPrE6pR5AKdBVPBEkbIzhT
X-Gm-Gg: ATEYQzxng1bV8xqY3/L/CQbbtDOu09odiE7w0re0RHmVQXTMJxOa0BT9jNdDV6fTF7C
	72dXKQxpq2LxJz3sVZsS1JmMEuPy2C7/lPOPcUrRL0RJESB36rem44o59qJyTE1SxRUktpU1OHp
	NJrhcXGm7b6BdfqwUUWo8P67sXH29376IbdfzOQihTx9cyv0WRdOMOi8W6PTmpEMDMxFwHG8ywi
	/QDwk2hpXiNLDsw3+BnF7zMw5ItzrmFq/4YMwrKkESvjdsPBZtySVIGC7h590te5ifl0IW94OGE
	TkSdpx4zlfnLSI2usM8KAwzFKbkkUUveiFHqvDfM5Ozda6vJAKLJipjswPY8ZyPyV6KZeVH8qwX
	UhqGcR9IisqNZtodYe4zShfXmDwqDosu7KQTYVfcIWvcnxuYw13M=
X-Received: by 2002:a05:622a:2d3:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50957e4fc81mr163338881cf.51.1773662740812;
        Mon, 16 Mar 2026 05:05:40 -0700 (PDT)
X-Received: by 2002:a05:622a:2d3:b0:509:1dc8:e9e7 with SMTP id d75a77b69052e-50957e4fc81mr163338181cf.51.1773662740311;
        Mon, 16 Mar 2026 05:05:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:07 +0100
Subject: [PATCH net-next v9 2/6] net: stmmac: qcom-ethqos: use generic
 device properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-sa8255p-emac-v9-2-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5Z1ERLj9DtpkY3L9fjZNwikcGQ6rrwgdETD/VN6J+aQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IFzbQYI6vHh10CWsGJxMAjU0/ZVzCDhmnBV
 hivu5A91MCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBQAKCRAFnS7L/zaE
 w+vkD/9pL4X60sTfNeueDAukikraft0MIkL45kt3+a5pxve09qNywhg0oeLh4dAFFxzl/3y3ygo
 OV5VLkaq4s+pu2o3D5FlAa5wo7IoNsIeq4G3e/Y+q6EtUxNr2S9cW4q07a6CIHrtsGfZ49CwCHb
 nWRa3QH26koOR6cJF79Pv03TAaFkwJ2WErO6PewlTlOms5WE0JribiYsa4Df+SiNuiYk+MkSEmg
 3PlwJimIrLg+aH1c/QXxgJTyLQaFQaXrS4FTN/whate7IH1V3xgu89R4cBJlZEe+jy/UrWTzRLI
 2S/VS+3k775MJSVm7J+ZK++RN2RrRNM16Hfx960Ad7TH4oWAb4jgN6AwddKq+Dv0DULyxNww0Av
 deZ+XLCsbuRPo35wWbWQXrXqcXTfKf+fVyfrxazAWSzDItD+koyKBbV8GDisw6CLh3mblz0CtMC
 tzljCNXp88Z47y4Dn2EqKYDi3vEN7paUWrQwgjasVdBQ+GGt+6LgK9vNgTTQfdQI0tMY1bB9++Y
 Ts/PtMbAzkoD33fmhFu2YWOqYwr2hUje2ZMka7iD12jnWDnw0etKgiudbhCmD9Ja9Z3ZLbQ0RXq
 BV2qJjOUElCAYNYsZdEk5pWDtDVr2bp0fEZJolbUok4gFTto+dlAK4iV5NI6GepT7xqDLZNQl0/
 oGeX7UmdRX824bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX5e9en2S7vm1F
 CFxEXyoEfD7ajrnAAQTZ+gt3OhpR6pRe50GcLSr1lqfisspRk62oxcBzRelnPcsPvN/1Qth0sYl
 pyVXGzj6K7GGbqDUp6Hf65htCsyK5GwqYdLBWB4U1LN4i9hxV4t1bS2d9us3n/rs1Rf8MTcrEEu
 FG+WNpfj0/6m+cXwSi1F6ihnzASGOnNf3iIdmfaudttNLjLRB4iROJhxvQhIa+UlKkklY9C8hU3
 YIS79E+3BVtKF3Gbu3pq6HyfCCubjrZmwMu7+nsG+AZAITnY47NzXyu4t6jeQkXSpAoyFxVfusb
 EFU/4qI1SYNHTxnn3iGt1tYwNQgahQEhoQl5CBAbbk5IiqrgG9xT9GPdTzbSSCpLPRQmcBs/+XA
 SpbOA2EWn5k+S+mxTPHfu+gAc0Bl9aqhRnNXEg2NHrFOMyKl006iuYrAEBfMDDroUUo7C0e9mwg
 /fWVTqQNhXd+WYxw5Zw==
X-Proofpoint-GUID: UOg3qImt0lXsZVjlrbmM77P_OFnI1Zss
X-Authority-Analysis: v=2.4 cv=V/hwEOni c=1 sm=1 tr=0 ts=69b7f215 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: UOg3qImt0lXsZVjlrbmM77P_OFnI1Zss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13654-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A722B299398
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 3ccf20fdf52a8ec4649b43ade8ee7b85d613e1c5..66fd2ed2c2c8428694c07d89220d0e1608546791 100644
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
@@ -728,7 +728,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -778,7 +777,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->rgmii_por = data->rgmii_por;
 	ethqos->num_rgmii_por = data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -818,9 +817,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
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


