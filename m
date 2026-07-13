Return-Path: <linux-mips+bounces-15814-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id duC0LSrqVGpXhAAAu9opvQ
	(envelope-from <linux-mips+bounces-15814-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:37:46 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A174BB0E
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:37:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LPTTBmz2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ih5EQIvg;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15814-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15814-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2869C30255BB
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:23:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0D14302EE;
	Mon, 13 Jul 2026 13:21:40 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422064343F4
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948900; cv=none; b=nbM+lqfXse2PSxD4GAJWodZsS4YaAFmzfgKJugDVkeUyyuRuV+gUBs7I9BMBkIGIUKJIDjDEC7ZWeFTrDwuClhhLACR8VelZozgAlpeQm2eblh0Kazjy/orGoh8O7tvx97gS2srH2y86DvSTzdpjBNIa3iz9TVw+f/oUcRKlfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948900; c=relaxed/simple;
	bh=6sLA5MwnRnvx5ahGg42dP42VZ5Uj0hEZ80jvCL+QkJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Saw8tqgD8TBn3N6kmdQ7JN4L8Dp5PfsOxFNkAkExefLv7WpoJ+0yS27b/YSA8aVlNCMFaD1jRwNWnbdA3P8j26BP1gFHiNV5WmPlynLlk6fBrLYpFJYKdqdOV0a8hoTTGwoWmrdbBxsJ1ZlQG0wf22aOPFfTTqtANllZ0InBXeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPTTBmz2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ih5EQIvg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCERiZ1333742
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=; b=LPTTBmz2tWUvklQZ
	4w8qumFJeCIts8FsDBLzgtgmLmYfaPEXCkAMXr83lS9TifnOO8dfBqTqGLVJZjjE
	EaYmGmv7+ktoqoxELlKoy+2i4vzxFyXaFHbMUCPLts/v1wrGxluhlEHQQHy70nfn
	lGjL46Z2iuMJtbKcWgy6+snBXl62qpzQVPaP1DwTfXtRjPn6iQ6+VxRRWGVZVkTH
	+RthcJQasZ9G+nPUGjZd/L5djbL/UIpdWO8Lhc0X4c+lQfWucvS0tF0f3hDgr7N8
	hohiDIsCwQz4sN7faey4JNeqBMmC4eIfNiQSc6gCGD5z7CznLNbiX6ZihcnaPbYM
	7yGoPA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fctc8hpkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8eac2620cb0so55626666d6.3
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 06:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948896; x=1784553696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=;
        b=ih5EQIvgExc262fz2d9oSLEtNsLQhooFnKLH+e1XcQ6LoyylqHr9YJgkEGSu2mG6YR
         Ki3V/r8uQXScbqrobdSVHb1p1VGMj1zbmTLsBs7Vpa8fHxKy8orvy6BCD3GW1XOq+WUo
         YmLMyeHqDcXQGnxNtoZGf20RimgEygdoOuoRBethad92OndBdqmVnBz0uyp2tW82cnhb
         StdrDfsUuJYtp4PTmMbu7v1JduQ5/ycPX4LH71xsjTIrDcMyORMiSPQ7zs2QcjK5C+Wc
         0i1F/vHFQm8geuKpSZrRXm28tTUU5Fv4zULhtAv5WQY+YjlmYiNtSPJYq3Hh6Mitjscc
         CfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948896; x=1784553696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZVfYVIvZDWgS16VLGdHQkMZZirnrupFmTaCF7qGBc8=;
        b=nOeWTWkSbJK+2s+vu3nTZilUl94Ld5io9oyar4BDSo+cJbmw/z2v5Z8zyGOUabbYLp
         /qxd5MFxLcNsnk2btw9q9JOK2yXtlez9uAt8pEPya7ux/d+iu1IjdBoLkO4hxpVkEHX0
         AKqKoh4geluI9//HtY27/G6A0htnCHTwlG8PcnIQMQALmpM9mZ9ET6GIsC5+rSBTbVqp
         bXYpkKqP8UHW+2nYBxLkDsXRXxPi+KjA3gN1TT5emOmbsre2o3DpB/hXcR2yTAHdxH72
         GN/QPF83bmqmkmBUnAgIiqWfAhwFPNSx39s9p372H4/1E0pmk3MODw4SObdnu2bGk11C
         a6cg==
X-Forwarded-Encrypted: i=1; AHgh+RpzTOdFdBMgVvh0yJjNoMvEjm27mu7yoNkADY3olfTiWgsgF5MxMAbMQUFG7yBQ67fnqQhuICweia5F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/f2qjWJHBKALa+2lVgWJwIkoAx0hb900F0bRXFAuQ2NwzaxFM
	UsqOpbv3ZpcuttgI17g4TO5zzMVv9lWP8MJvEeGO1uF/obgmaBden8Q+7bWzRZEKcEXSd6AfPCp
	jRkaG9wNmZOSqGM/AbFbaHxtUE0qUus8oNpen0V//SA4kFBXkPoYz0vRt4eazhwIF
X-Gm-Gg: AfdE7cnUkO7WQ8Nw8d8AWMhynsogXcF5MjIV/epfJoeMHmU4rK72z86MPmKnYN5IkTH
	nusjxN6+F5kVPOgGio1qXsktfZRnOxy/HlOKz8I6TiB4S9U2k/Nkg7YIBGz86NUhmvbc2xacNJW
	jNVi5Npppzpe8v7Yz5lLDjTfa77tdhYFAkBeN3Xtllud036qPHuQeqYUHuy4KMchfF0ESPAKErH
	55pMRaF8EpSrL7+cEhnsDNFRRsJjvkguhfDw1r27jNierdP1+TSYcuHCJWVXUiwdCXKLe7wy+gI
	Czbps0BHwlsPHzbi1b/txjqDFp6D+CBfPorCsKCJNRV8lDQPwEksGf2MlRkrXenoV3ssVViTDa4
	zCRUzo2eK69urjkeMNjCAWfdJGCgTIg+RSW7ME2tk
X-Received: by 2002:ac8:5cd4:0:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51cbf363dc8mr93366291cf.61.1783948896311;
        Mon, 13 Jul 2026 06:21:36 -0700 (PDT)
X-Received: by 2002:ac8:5cd4:0:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-51cbf363dc8mr93365531cf.61.1783948895804;
        Mon, 13 Jul 2026 06:21:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:37 +0200
Subject: [PATCH net-next v13 08/10] net: stmmac: qcom-ethqos: reuse the
 address of ethqos_emac_driver_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-8-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5580;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6sLA5MwnRnvx5ahGg42dP42VZ5Uj0hEZ80jvCL+QkJs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY7WoNWK1fKVT3AeUhvoZN7mOQTGCailFb2O
 0U8Uq1MWjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOwAKCRAFnS7L/zaE
 w1bJD/9rL0/b5pecDupw06V5+gDcMleg47Bp4Mj7c0bklOTgY38+9tAIEY1SLjLB7HwKOq1nqO1
 dq4hv8Fzi1RD++rxkUrQold1tLfhGWfOD7AWhFokRPSl3ebXb4UJJqBLEUpybGawZXGb83TjRQp
 TqQuY/OFOse9hQpLrXmnjRa7HhD3bpWH03G/U0OrEuJgSkZTKivy9x9EBTukzmONTUI4CDKI5B7
 06IMnO8pk62ZFboVjxTYIkcE33flA06idPLRtgn+TLMo0HUbjS9ev9F66IQUB0Wf2oI6cj2F9HQ
 bT0Vo879IpyBDA3UI8/bUeT5ZpHpMnag47OsAvtCie56SMBsYzQlpx252so7ZAYKsYZAAKndTCt
 02Gsy7+tuMhxZLaWxu25gb+eQVAcPjjeGVKfXRDRQ2llgESiKBZ1suHws8QKRO7a/ou3vEcbSvY
 TkjQzAmNmDN/31aYfD9yGiPkwzuCc3iN4Cm2svIMRR59VtUGdi+das4vQZ4AbF28v3ka7RtPJQ3
 tutb3bPvbrnMITPys1sJm0UN1M6xGLJFAky2b/TtJFqs8IYm7ABoVAMDEi73Z4+qePbfSVhsJO7
 b94O6zEbexT8kdm6o+6NRK4c6kovWN6IfUrXXTeK57CoDiEsf4wzC81a33bYQvAkDNk6St8CbHB
 bp1Zor92Ha8l7uw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: CB890LUoJMXYMzIvJ6tLNF1MG0YBJR4w
X-Proofpoint-ORIG-GUID: CB890LUoJMXYMzIvJ6tLNF1MG0YBJR4w
X-Authority-Analysis: v=2.4 cv=UtRT8ewB c=1 sm=1 tr=0 ts=6a54e661 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=fhsz3KazkzAS9s_vSxIA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX3usf9R+bU0xw
 KuK4hm2dWMid6bOPbqwse7oStzuClbKmXLZGHFWkw6A+RXDnEJ2fqkYwWxTAWARe8mdas0sGRiI
 eRv2DpVPLH5bqgdKPi5RY3d+lj4ISGA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX6yui8coto3Qf
 FVGiPsdQiNNbTA0eCZZ7OdfCR55UtEXTiiaxmZrruBBSDrdNMCoW3z9kQuu5N+zrVUYQf9k0rGn
 KvFXlsOyXxpeEJAZQ0YRhIf8s26tPn598gPYsFJu/4aPh2dyDODERD4rELJoUkOXXiINfrVePD/
 nHXj/XSX7yXngZqiFjL8VejHlb/MCSgTQp9rHgegu82/YmtpHUdzMt7WQO8M8VXM2xUbLcFLTkW
 DdzjtRUHa4GPkTgcragUuSk54gKsuTMwrPx/Mb6xFbflc+LtC5VMdqRwnPydT6w0zFrwWYp2Ca9
 ip8rK30YZQzJDhDRBznhZ1iNenLp740lncHmy/eV5lmzKw74galCHaqNGI1YMgwfQmWJpw8H7el
 bljAN5q8av71k2ljOurjJ+VGCcvXTYwBmQKHJrJdQ0Toir4KK8ch5KIluRmvPWxv0NY7TVFQouc
 bebwh+X4e03uQWCHmzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15814-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: AE3A174BB0E

Instead of needlessly copying the fields of ethqos_emac_driver_data into
struct qcom_ethqos, just use the address of the former as a reference.
It's .rodata after all. This is done in order to avoid having either two
calls to of_device_get_match_data() or having to extend the latter with
another field when adding support for SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 37 ++++++++--------------
 1 file changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e083d7d55782ec8310e9375e466be00213667457..43384960278b87a95f14f23c45442d2bbf75d882 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,12 +103,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
-
-	const struct ethqos_emac_por *rgmii_por;
-	unsigned int num_rgmii_por;
-	bool rgmii_config_loopback_en;
-	bool has_emac_ge_3;
-	bool needs_sgmii_loopback;
+	const struct ethqos_emac_driver_data *data;
 };
 
 static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
@@ -189,7 +184,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 static void
 qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 {
-	if (!ethqos->needs_sgmii_loopback ||
+	if (!ethqos->data->needs_sgmii_loopback ||
 	    (ethqos->phy_mode != PHY_INTERFACE_MODE_2500BASEX &&
 	     ethqos->phy_mode != PHY_INTERFACE_MODE_SGMII))
 		return;
@@ -323,7 +318,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	/* Set DLL_EN */
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
@@ -353,7 +348,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
 		      SDCC_HC_REG_DLL_CONFIG2);
 
-	if (!ethqos->has_emac_ge_3) {
+	if (!ethqos->data->has_emac_ge_3) {
 		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
 			      SDCC_HC_REG_DLL_CONFIG2);
 
@@ -433,7 +428,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
 		      RGMII_IO_MACRO_CONFIG2);
 
-	if (speed == SPEED_1000 || ethqos->has_emac_ge_3)
+	if (speed == SPEED_1000 || ethqos->data->has_emac_ge_3)
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 	else
@@ -457,7 +452,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
 		 *  (2 * RX delay ns)
 		 */
-		if (ethqos->has_emac_ge_3) {
+		if (ethqos->data->has_emac_ge_3) {
 			/* 0.9 ns */
 			prg_rclk_dly = 115;
 		} else {
@@ -473,7 +468,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			      SDCC_HC_REG_DDR_CONFIG);
 	}
 
-	if (ethqos->rgmii_config_loopback_en)
+	if (ethqos->data->rgmii_config_loopback_en)
 		loopback = RGMII_CONFIG_LOOPBACK_EN;
 	else
 		loopback = 0;
@@ -496,9 +491,9 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	dev = &ethqos->pdev->dev;
 
 	/* Reset to POR values and enable clk */
-	for (i = 0; i < ethqos->num_rgmii_por; i++)
-		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
-			     ethqos->rgmii_por[i].offset);
+	for (i = 0; i < ethqos->data->num_rgmii_por; i++)
+		rgmii_writel(ethqos, ethqos->data->rgmii_por[i].value,
+			     ethqos->data->rgmii_por[i].offset);
 
 	ethqos_set_func_clk_en(ethqos);
 
@@ -512,7 +507,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
 		      SDCC_HC_REG_DLL_CONFIG);
 
-	if (ethqos->has_emac_ge_3) {
+	if (ethqos->data->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
 			rgmii_writel(ethqos, 0x1800000, SDCC_TEST_CTL);
 			rgmii_writel(ethqos, 0x2C010800, SDCC_USR_CTL);
@@ -539,7 +534,7 @@ static void ethqos_fix_mac_speed_rgmii(void *bsp_priv,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
-		if (!ethqos->has_emac_ge_3)
+		if (!ethqos->data->has_emac_ge_3)
 			rgmii_updatel(ethqos, GENMASK(26, 24), BIT(26),
 				      SDCC_USR_CTL);
 
@@ -750,11 +745,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = of_device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
+	ethqos->data = data;
 
 	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
@@ -791,7 +782,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
-	if (ethqos->has_emac_ge_3)
+	if (data->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (of_property_read_bool(np, "snps,tso"))

-- 
2.47.3


