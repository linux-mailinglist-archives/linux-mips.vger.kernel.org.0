Return-Path: <linux-mips+bounces-14689-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOlwJgvIDmoACQYAu9opvQ
	(envelope-from <linux-mips+bounces-14689-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 10:53:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B925A186F
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 10:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD25B319E438
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4F63D524B;
	Thu, 21 May 2026 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWGFOeBT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyqTELfq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F13C7DE8
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352691; cv=none; b=eiCpC/2/77h4FdV6FyY/zwmHLHyUOP8XEff+1U4UoBuVygejUmZyGWjM90PQ81+pnamnl64QsNSP/YInMt8dO0Q416iVt1w7+RdVCUrsqreOUhr+qvEQuILBI9Ud5SPYad6Hxi9zUE8UZOytXD9OkmbjD1y+0V9N0xXlNIz0H2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352691; c=relaxed/simple;
	bh=+Q36/R3+axSk26qNg0RKgcggtmrfBcF0QjetixEKu48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrs3/t/feuD0+PKSeM/YmNyQCQR4pWP7mYMkIYQ93jFAcN6tqRFYp6ofCdLRFrO77TsNcRaLK6E4YmWAqfjUI134t7WD8gbqN2QI/RV7j7iXfNR7KYjmOR3wG82R1kEqrshFtdsPo90dhOGgydRA09c77qKJVxYAmJ66mAtYjXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWGFOeBT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyqTELfq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8JliI748564
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=; b=SWGFOeBToZLVCsfU
	AclGf01G3MMPajCTFPa2NbUKgtwHkcfo05wNMqK4mTngoJ19FiVJSJIsdmlsLRnF
	UTS5hflujNJKf+GLZUpXTmOIOODszeTUyzkDYH5lRyVCjrv8biyMBvDqKnyA6cUR
	B1MwZVtqtJ6ZQ5C8cKyWqtOFfriRbCIjY8sk/YdMjRplzi0eIV02XDAf9o+Mk7wt
	ypK1ptckarndPVVFRuQSzrpXfrh5JQ33mIO7EOBPTfQ409d6ZU+TxnRun3zbhUrI
	SbkBDVuhVva/nx4/w3KeLBtmaXLN1johEvs4uv4afYTH0Umf4ApQvWJmlzn0q0gL
	Clt9eQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kjd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e136aff17so23553521cf.3
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352678; x=1779957478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
        b=PyqTELfqkrAJRm9epzE2vKNYjdbsjg1+CfEM/HHQSqD4QkjL1vr0tXM+12a+pg3UuE
         7lT76ds6fIvByMCPd6fi4E9iPgiOmMhFVSUrqPtm2bky/d7cP7xyLfyaUQ6XdPNzZTZY
         SO/wLhJIqJLgW6nn5IOKsauBAte9CYFCDQd/6f6WI6sHQb0F104ax/JH74nSWIKIyVCE
         /JxRdro0RWT3+/mr9Wv4XjQVJ+xmcLEkS2dZ7Ppe2GvdBANFOQ7wkYVqf0Kgn5Mux/4z
         UbVGL7nEbXNV/NfgVmqXpWh5Z0gCUQdjSqhU3Ft328J7BtWEu/CCg1nYL0FIeoZxGv9t
         Hf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352678; x=1779957478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EbIXrTuuG3XY7IQyzDipBNefbhJbG5vwiEUXw5AorV0=;
        b=l3JC9wfOa1u/DyPcABqrW1xmjaGp87dBnlBRNdB4agRXlMk7Te81PSuFFFyY+bRfeR
         DIlp5BV/Yuy/RkXpTn70UMPPJAIvqaZFBNep/UqbFkIUdiQn/zmKpNtmLn7BQE0sdLk6
         iaawWzg/BWmtXX1Ob6dq+MPf93o7AihwuYYJ6WJYTNwjHg3l1oCIM4s69A0oxARtmap8
         Dvu3aATcPiIXHqNkItlKyLgJ37NYCQuOCeeQ++Hv9lwUKeqF5adJf5eC2tER/32PyTwg
         0d+m8EjMtdBEULdp4GUOT1OTfCJM9SP9IF8DfKewv7ybBqLIYCOcqJMzIQ/pAI+/mBHZ
         pMnA==
X-Forwarded-Encrypted: i=1; AFNElJ9xMLlXpr5e9sDRmUq99D2Yzi60C0djaDBNpgKPLAB74Z8vz767rXKcZKFsP4DdNgbaIHC7lWUj1Ze9@vger.kernel.org
X-Gm-Message-State: AOJu0YzRJ8EcHHU/FDjXILs9NR2vhk6Y9/ZuBjFPtdbX5CyxuzdNQJDb
	NFSxYcaNzS5icLJq6C0iY0vd2YF5/uTR7s4BSDpyF6x7B0xJ0B1u9taMgI9Y47A44t12rp8U2ar
	Dh8vm3HmRNovDgFgAN5n/IUw4pYo2d+06xCKS8LRXnSrc4sbewguaBY2zb8SXC3d9
X-Gm-Gg: Acq92OG5F+X5e6zXE3DY/lbWNLLKs6xfyJYDPBFfyoTGYUwCnlnt96M83nqLImiQvov
	Rp4XEOBQxmarXTnHtcf9yPPYY+qJJ/UgG8lIDo5BicDeVtuIbonqXzPvJ1MY+6mRRz1PZTKBCpB
	GQIiHsoR46Ty9s8gIdrbXCiR/uARPcv0/H241u5PnsEvEhJ1asiCgSg0vSIvFORYs0xKQCFDMhF
	fMTQS1EtvJh5SP/FnufWZByFbt5RhC4ueRVfsSGs6W6LNqvYh3g6bc1HUViYlKplZSLfA7e1DjV
	d17UF/FhU1QSos1/oGDd81iCt5b1QJv+cr6/yaVGW6qy0MMscMbuAcVxxd00Mu4zatVyUTUXuZa
	QB7xP5NrL/IdOGfGv0802NFQ0x09ThssQL9N5NjzcGcuwu4Kv64k=
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id d75a77b69052e-516c545476dmr26297451cf.22.1779352677945;
        Thu, 21 May 2026 01:37:57 -0700 (PDT)
X-Received: by 2002:a05:622a:95:b0:513:103d:3808 with SMTP id d75a77b69052e-516c545476dmr26296871cf.22.1779352677380;
        Thu, 21 May 2026 01:37:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:40 +0200
Subject: [PATCH 17/23] net: mv643xx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-17-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Q36/R3+axSk26qNg0RKgcggtmrfBcF0QjetixEKu48=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQr7v0D29hL0tmocOaZkm4AyCQrEw14ql7mO
 8tYfriVLeyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKwAKCRAFnS7L/zaE
 w366D/4v5c+pUzv6avtkL6q+xKqdBL9umLghKhBQ5kt5mjMgzYly3eyiiCgjeCEwSWWdfTYN6t8
 MDk5oxdf4dZTDqe/p0EFtWy4qVPnsfckF5Mgtv2EfrFY/JmTxCrEMhvKl6MDM4OJriNxylX3tbW
 pqSlkS5Mjcx2c79ZfHLJ4QNgy63fKtrYEP8jXkM/bO+zd0VvWHV6OJgGTp1uNfEKKD7Zv6W9jXs
 I7NhKYZRcZud8P5CCUTX8ofTjAVM6BslN8K1m+1TLzAyAQoFdnTaP33aW6oTG8rsJsFtPqJ3QUy
 wl7xZWHSGDbNFObyxHawwwedXKh8ziJ5AlEss80+ejJ7Cuj4qI5W8oSo8Wwb4/vbNVIzFAn+uyH
 zmH7uZ29ujLcnvmBxqZIGFKjQiaMTKwjmXQIqwL9bFwKLahbDsLpo0+FNGfYHYmkqwz6KIUrLh/
 4dRzbuYGCsoGuw0Oql6O23EQLf/YjisobOJzrHLLyRC6qvueCdjZm4rjiIfBL/l3WA9rNztpXgA
 591GvrhcF2BWHdz40g9Fm376D5h1+nFi/hxT753Yk4qZ5tHoInYYJt67skgbVjixR21R4P3G1VO
 BNHf9MuUxDhXR8xWiil5e2yLVNEpIh/547GqRXAJOq2vGoV9XerYZFXgnsgia4YoruDBFHM9Hcc
 iFPMjG1LS8Y1p9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec467 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=deS-VIKRvcGxR6069T0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: p0yg4r5cB9k_4Qz_VqxHugbFmqdap_me
X-Proofpoint-GUID: p0yg4r5cB9k_4Qz_VqxHugbFmqdap_me
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX2o2f2lMPe4WA
 rQOmyPoZ/bTaFxf+6WH73vbv9NQOvKSe/iWRLNa/mIYDjwyYpUqt+d95vWMfXS7jXsRQRZv2crw
 ho//BrLWXJCbZnOM/FrEUTycJE/XDQYwj4io/AyWRm676busYuiGD9FIYUaRpTauEDmGIers2Dd
 3hbCnl8yzWaY/kIQQbB0U9yrfV3sU/gDIH+BKNAbLVX7h6oydOC0cBzbSvedzAP4O14Hsod/46i
 ZsBf9vs7lDW8TAWwS+FX0Q1T330+w3UcV2xRP6JrQP6izD3JYArBnspPH19t3MgFPd4pShamByf
 AkiiuQ3dRFZpGtTBmL+lPXJ24jXBSgbSEWroSJG8d0WkdrSAsQdZlrRxo3ulu574bVzizz3ovJG
 OjGeiWwMJo3SZQrXVVfWpnrgEIDPOHzEIQj4P/1oTLVQbXgHTCxeufYrLxRNToEeyeX+2fKJjph
 PuD9jK9prjnYXAo6VBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14689-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 05B925A186F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 1881583be5ce2e972fceb14c2b8348280c49ad1d..9caa1e47c174c9d7a161b7f2e2ee12a829b813d4 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = of_node_get(pnp);
+	platform_device_set_of_node(ppdev, pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3


