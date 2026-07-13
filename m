Return-Path: <linux-mips+bounces-15816-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZM8VBDjrVGq4hAAAu9opvQ
	(envelope-from <linux-mips+bounces-15816-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:42:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB5E74BC26
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 15:42:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dAqZS2MR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JEkVfRhZ;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15816-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15816-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99FAD30B56C6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jul 2026 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A812436358;
	Mon, 13 Jul 2026 13:21:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6EE435EE7
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948906; cv=none; b=J05cJrJc9qOn91i6pKIbBW29OsJdzbG4YMvL+ME/CGuWjDPDotbDgPmhbjLNBUbvTwaDjLmjyTwPemLLt8JvavAT/SbsCNLDGoJiSgdwIqQNdZw0o+KG26qktOb1p3Br3n8ZwoyZX8MnZrKTNkViK44aloh1vas5B2dlxQXtG28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948906; c=relaxed/simple;
	bh=TqGGHsUwyhTsco06VxVuKgwFcBldf6bN3oZwc4gBkFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZQJLaEL6oAi45do0WXVhGGfDOksJdKYrH2kR+4YCHU/76pdvMF1unfPuoYEHotEh61zAG/CV6WEfMZ0OmZhKVLJ2YvyPt0M1tFXy9lS1xI3QNZBWHLJ8p6AGDS6ADBaRIj4gS8T9cPN4WCh+6VRGEhz9aNfCvwAWFJSBfFDZQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAqZS2MR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JEkVfRhZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDrvq1453608
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=; b=dAqZS2MRgD9bQjzE
	7fkd7SLmmebZa0KqKh/N419BADvAkALOln4bbxCm4KlpyE9E9QtRJuK2DFjSEgFx
	MoZMUJYgGg6PkkW++3WtZDUzBFlTu4Yb7p4YxQEi5BKwEc0bbr9JA1X1EOGn7Mke
	GUgse6seFhGYIZzv8v9tIYd5hAAcQYFFnmPQU5LeLJI0VddrDbrsJdIczg12onFv
	MDUVprMl7mGSFdYXpRHBd08sYrxfj915Gq4mQ/gAT7wONX5mraB/CJI3DFwc1CZe
	9dUGXitF9erhRkx7HJGDb+P5ajq/3RUmi4bI/q/TsigdZTg9ZOWAAtsykPEGy+m7
	12vQow==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj01cx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 13:21:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so34831241cf.0
        for <linux-mips@vger.kernel.org>; Mon, 13 Jul 2026 06:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948902; x=1784553702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=;
        b=JEkVfRhZlaETSGxputoY08eYOV7ytpCWnXbP7bvL16Ahj4Y0dlBS8zUqgrmEUKWCYS
         zjPyJeLxBvQX90JHR5lFuhWIn0cVaTVvXa/AUPZRiWlrOiHbRK4z1C/QWfO3hKE/4kRd
         jn/sAziWpkdUQIDvn6TaIQCRWBi1Hm537SOSnEtCiXSOEtEaJg5ZKtzEGVPaY6jHbjcw
         8U0TSjOzvea7C1Rd4iLVkpspaKmsmAT8GxW7Z2V9i7r8MiN40dT3kuh7pkO6GmSPvEFu
         J1O7nNYGUjUC+zeTMJ2c/cdKsRR1pTJN6WkdEr/0qTWbCjipgPO+YbR0kSNKX/Go5xUx
         5pGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948902; x=1784553702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2ZprCy+bUYfEEV2sLvW6R099FI4HZnlU8Ix92wRw7k=;
        b=cxArvXNiNtowA0Ani4rEfk9UYVJuDkHZAm6SOS7rfRKPAcgc43tZrcOzsitVMPdci8
         zlvpjrhIkiRu1TJE4ta1rqdXY6FrJTgZrfxpWoYBKG16uC5m9FwazCJvcHob/HntSF3e
         eQ0ppmZovFr8uMvlr7Qo+m651gb3Kht5tvpzKzihTpqtR6ctP/VgoTfxarDjxZKEsjF9
         S2w/j349b8rSAvtSpbBgrNT8Ok3XZ6ntr4FF+t4sEe/fL1+Wa7BCGrfzaZL2OpU3Zq75
         OyLYkulEEDketWsCE6gbPs6aK0P+kuJ1ZxIdKVgCAsJfdofOZ2g8mAx6eNMGPSgBX1ag
         wLYw==
X-Forwarded-Encrypted: i=1; AHgh+Rp5/pMD7SBHeiIy2g5czL72sSK8m9GKV1buD2O5pkceaDFh1bA6DR13m8t8gi0+49MlrDDcddqbywc7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu1pwF+taDhrXF5My9lUnOjxsi/OmDUrMQTpTHOT3VEDeujdmP
	rdjagmJavA9FDPcSckvgwsjt42gWxfVWo5ZfftZ0u0TKs4tgBqC/GhifbRu61WLrUzT2wqfWWuh
	YRfoekri2a/MDq/pNHPkSDMM3sM79M/UNQg7T/Qx1B8OHASIEtZoIv86XxuMmM4xp
X-Gm-Gg: AfdE7cl3uIC8bIfyJ4Wckagkl5tlDWkXXwCw8D83oHunPg3T9wTfRRBvfJc/EqH0JCH
	eChOiJnUU4bbbxA7j7vtKR8owsfqVvqCgiCyZfM4ZFbD8xOzSIrPPLULt7Mu29mKUohnHom+VMS
	5coR1/ST+LCnk8811FfrQqfl6CTCE+bb6A13SdCfmH+0+KGc8p1vWvW6JK8Lwx9NBx4b2/cWCbr
	qTJBiUH8LoxxT20GEGpDyxJBGrLB4gcIlJAf3nRV2x9nAbcPki0aWQW4or6xVgFBmo98zdDRSt0
	SMTJMix8RTrS0dAFZO08XvD9T0E6JLQW5+OOnImDRK+UAdT/IQ56E5dPGcsNbrzSNnq/x+JpW7i
	WBLqzKXtiSQ/Xy5GKQW730rG8b4TWt3qh4WaO9mxn
X-Received: by 2002:ac8:7fcd:0:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51cbf27e714mr91207781cf.61.1783948902467;
        Mon, 13 Jul 2026 06:21:42 -0700 (PDT)
X-Received: by 2002:ac8:7fcd:0:b0:51c:1b78:b044 with SMTP id d75a77b69052e-51cbf27e714mr91207081cf.61.1783948901957;
        Mon, 13 Jul 2026 06:21:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:39 +0200
Subject: [PATCH net-next v13 10/10] net: stmmac: qcom-ethqos: add support
 for sa8255p
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-10-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5660;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TqGGHsUwyhTsco06VxVuKgwFcBldf6bN3oZwc4gBkFI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY9WSl89yzJ2CqMhlNNU32SUrhE3oOrdIQ8i
 NwsReN/KxyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmPQAKCRAFnS7L/zaE
 w3nCEAC1q3NEe6qIb2fTolQ4Z9crn1CgZI+xbic7vhmRZAUVv2Y+TlD1w+G8QI+LY1Q2jCtPvHE
 APl58knmDufMR0I2L7Kjq+b0xL6+z/8+9cW1te2Nv9Mub5tO7TOQ4bS0siuIDg9h75hoYRhmTYT
 VG2pDnADdTWmYlJadmBqZQesz3LU/8wgeP/MCx7WMuUoxL7dr/vdGjhke74AypqVAmWBQqyE7zb
 9LhGB8JQuhU2axn4XHHVaUB/XvWBDoRWRF6QwJ66eoUBPPOgGvhp/0OdDigx1Nv3aMf6mfloKsg
 U8iOqKIb2FPUGDTv0vE5myMB84jwjXFg3ux3UkSejFAe0xik3eT9GYgUHPm1DUgkBPqm9aUBGsx
 zLMVZu7dEVweNIBa2BXOOb9v586Mk6rSYrH+t//kxMyl5dv6n2mnScucHHH6fAw+RxoE1NTawCU
 QrOT1N6vB1LUWwolnHaVH7lXf496fbGZnfkb49q0UW0GzEgSzSs9t/gl0oFMQx2yhgXX1u+Q8Af
 82h70nfjk9yU0b+AqzlPEyHcp7YK8Tj4dCs5YgHPDAFdlTumFOnbQxweaxv1hOBXVOhp0CC/rbk
 YrqsYusTK0WT9c/Ecb7BzFoI95ZNE7eaddEsJBBtJmPJAC7mO+h6atdhgwE5FnPbFDoNb24il+N
 9Y4jV9pjO+YFPVw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX2vU+oUgFDOEJ
 w+tXTDTtzjwzSUqmuGGieKi445Vl4BtpJiS4psTXqy1R1M9503b43GStpaBzFstzUchIoslRFTf
 U0XjH2RhjvGE52H4eByFG4iiqZVI68o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX37OGxlJ5w70e
 aAPpAabOlT/ZCFDpjmv0Zlltf4brTXxGEhnDZkxo0y1UDLOrSavmSHKZRr2k1ZxPm7TvP4e2pvE
 +EYsiaYTq3VciprcRB++Eg/9jLZyN1zS/X/sF1ymczIdlkFaisBMfWw5lwEF6PbwI4ax9zI93/u
 dHEfr7EuMhU22vdakRIfj9XP3eu4usz1ePhC8gtiXY6ayp8KtIVDXYM+sgNifxots8otfBZoGXU
 kyELRKDQercpNsSI3S3jqOcl7t5PFaHO+kzZFAL1YLAy3oYHjphgHlB8Nre72jGwncEn7xk+CLQ
 rP0Pw5QKuGrJsDr5RC4JLnxL8p3Hw9qPcgVcOuQI3IWEo4t0TMLIpzCG6MmKy2ycZbSbkg3LMsC
 poGQZOBytkj55bTdDWTMsAV64ui9JENzUkH6h1jYGyVSXx53UlslwJiI+aSVjruSfDenoYvUHh2
 JMmMVz2jYS8XldQGT8Q==
X-Proofpoint-ORIG-GUID: RpvtEm8P63S8_ItUFZ7Ue7NTubQQ1dsY
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54e667 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=2F0B3szvjGg3gJiy4BkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: RpvtEm8P63S8_ItUFZ7Ue7NTubQQ1dsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15816-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 2DB5E74BC26

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 90 ++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3af1608fc21cc7cf6b0ad31952b9f59d6f00a2b1..d34f20f868138c4e81ce85364cc97d47c445238f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -98,6 +98,11 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	/* Fixed PTP reference clock rate, used on SCMI platforms where
+	 * firmware does not implement the clock protocol allowing linux to
+	 * query it.
+	 */
+	unsigned long ptp_clk_rate;
 	int (*setup)(struct qcom_ethqos *ethqos,
 		     struct plat_stmmacenet_data *plat_dat);
 };
@@ -108,6 +113,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -207,6 +213,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -311,6 +319,30 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.ptp_clk_rate = 230400000,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -756,6 +788,63 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+	plat_dat->clk_ptp_rate = ethqos->data->ptp_clk_rate;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -843,6 +932,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3


