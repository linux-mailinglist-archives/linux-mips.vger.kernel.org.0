Return-Path: <linux-mips+bounces-14682-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFWcFe3GDmqzCAYAu9opvQ
	(envelope-from <linux-mips+bounces-14682-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 10:48:45 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CF18A5A16AB
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 10:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 893C7317A734
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5720A3B5E19;
	Thu, 21 May 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wx0mkrfh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S541eTz1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333D93A4278
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352669; cv=none; b=uNVTbslJ6usmz0FJEOmNFGeGSotIOs7jjjhJcG2XfvBNtNviPJalFC7FriMdM6W4Th62L5dRvAtDdROFvzblOPncrzcrMyN9jB9H6HQf23ItFA5vw6Z1r9lpZGhCWYQIpiE7zf1NlTqJl1iw5WOWaPHFZ1vPuBz/sce1Ufp3Xs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352669; c=relaxed/simple;
	bh=62Oz1SbeAMwV4fv895oAqyFh69nhboZTNIz+xPLsUyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBWKC6t6S+ZFKlIbD8vAaHsUjOWKeJc8LqwLKc74AVgHOYHT8ghD5P0rFt2m4mQ3f7ULQCfraKE6hyAPlh8akt+Be4QIlWHHx4/zrU4PEfbdijV2PGf9VRX42np+wgWzSK9sRUprsQUBVGhO0Pw+DNCWEIF79O/eNJPDgawHopk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wx0mkrfh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S541eTz1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6EwW11798618
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5cAewiO2Q2GR7KlmQQdZOQuEhoEBjBTz5dtw0Vf2kkM=; b=Wx0mkrfhTR25R2CR
	P19rj34FWn9V7nFvEfRskX2RWdvrWsW1njjrnxOrV/EhPy3AZr/lBeiimxCLDs+u
	IvefMDwBXsucLiZrWeC3atAcK7tXPEKVXMmJ4Nu/9snsAU+7uZdGmON+ofOmgpK0
	WO1RCTJ11flpN+fzXzevrwr/Z3XDSRoOkYyINb6plIMdZqx3juYxIFE/7fD6O4KK
	r+8sRezB6kVXkXTd2sh7wG3GEfPxaiqpsX2h9VwexfrfY1lrJ2CU6NL6wHOIZbRd
	3u8kPyV7Qyk2R2UHNkvKTnwsaZCdUtQLADvT9TPpntLC8xoYJj9rguVoTpLjy3Ff
	Aza/Ug==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu41yu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514ae0e3ad6so147005781cf.0
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352655; x=1779957455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cAewiO2Q2GR7KlmQQdZOQuEhoEBjBTz5dtw0Vf2kkM=;
        b=S541eTz1z5f11REOnKuCdHBWcAHxjoxLbUAHqDvnMnpKy3wbK8AzB3+gwHKpYODDon
         NSnpMZFiWR6hD2AZwVpikjb5TPMEM7Sq42bbZltAiHCe7CzyOP9R/7zLotMYSYJx/qOC
         STuOI28d/bm7YcQt/KLONESGOldVw1t+yioN5CsCl65FJIMQxYLHE07W2Tw53xrbdvOH
         9PTveTl2MhrVcjEyhNh+HhTnatLDXdUptUTwm7evW/xFWEiI1ePtrfHprHp546Zsk5PJ
         mIhwDK6GF0NCa1OnKD8ByRPqkqZ3MailbI312nPWh50isM0YUHKbjaqTDV7TnqbuU27R
         LFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352655; x=1779957455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5cAewiO2Q2GR7KlmQQdZOQuEhoEBjBTz5dtw0Vf2kkM=;
        b=tMhRRGK9YyQq44o8oI30bKxG5wDxCzej2yDxAsWfG1/OLYXpNNt3Vvaa9F/WtTGsDZ
         8sOURHPUlrX0xmYec8cz30Q2wgfnmI6Qe9zeJ1XU6IYBIJgPXIO+MAPUn+FgzlljanEl
         r+Xb8xFCgx09qQha7Wlfn5eLDBhh30SuKDjHRRQpd10NXxOH/aIhhXx/SctYh57ewIrp
         Hb8HO8DXPL/iGi5YYq0OJriRceuUMUT5CZiWF9TXyvYgiyej5HDDUkJu0CgNE1i7uo1b
         9Qe93ZwUlteabCuL1d25PYloo1lVccVdQONihAKNINyd1hXsxAOQ9Np8YNSypaH4e6mf
         emiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kfjIRmiyRB1A7OkgMC12/nusuqdlgNMzG/lgIM0HqpPh17M4be3R4ec/fq4V0J0ZVi2zTMwh/fp3H@vger.kernel.org
X-Gm-Message-State: AOJu0YxYHDHQR/rkVGdhV6awykzdxWwOzJJcH1Mc5XrcENLZENetTifN
	nKHIu8MHtboV08FqtFHfFxfb5MMYSRvxn/5QrB9HPFlbmCNIaDKmXRV9L9EMNr36UPZyk8i9b4T
	+ja8DKD1UJwhm/V0c+cj/ZcF7QWB/ybHabr6UYiTWj1MMfNkBowoivi3I0LfIhimc
X-Gm-Gg: Acq92OGHM49Q6AsRyR1P45ffFFaiLejdkxoHFo5soENmVi/+TND7hX0JQ8wPGMGzpGl
	scAZfy7Pky+f9MT+QOpxQOOwJV50WOoKGEKE3eQm/h+trN+CWFFI0UScW5EVOHVcfBd3h/5lRsU
	sM7Wi3RkjlQ1Dwpvn4UIjmCYWT2SkQIuX38LFdc3Y+dMTHZwCVvnbr8FP3Mvj8w51ltsSTve4h1
	PZ3Q2dH8I9CVhfMsJk4OdceQXZeptDqQQH0/ONc2LIbJydaJMl4XLjiyqx/rlPaHR+QAlrSslel
	FN+wLX5bjFdGPH6z07m78KPgj6FJvbHcv2Lc+9bfEOtBhFuaHhLblfOvGQ323PtQyyTpsNVhgtC
	GroGzFNggyLQffkUxcqvnsm97hu+MvBkhW6oFAwX+DmUXZQgGZO0=
X-Received: by 2002:a05:622a:558f:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-516cd8dcb16mr1393521cf.39.1779352654922;
        Thu, 21 May 2026 01:37:34 -0700 (PDT)
X-Received: by 2002:a05:622a:558f:b0:516:cd8d:c7fa with SMTP id d75a77b69052e-516cd8dcb16mr1392831cf.39.1779352654276;
        Thu, 21 May 2026 01:37:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:32 +0200
Subject: [PATCH 09/23] of: platform: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-9-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=877;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=62Oz1SbeAMwV4fv895oAqyFh69nhboZTNIz+xPLsUyA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQmchZFDFTztRU29nkcmIf2nW/nwlzDTpQz8
 +2keRMrA/6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EJgAKCRAFnS7L/zaE
 wxw/EACn8eHQOwjd+Dgeolnl1EcseWe/xGk5I4KpBP1p2m+G11f9vLsOUXBOPZGZSyzUPO47NAC
 iyozeeVO+OH2RpEvb/3X3MbeIb+N7xCFhIXoBy9dHt8TFTc2eZb0zdOcQaQ7HwDPqPAsbDyDPAa
 tScifI1XmoBcqV9V1S5KHZLhhWr1TPVqyUBvQJBVFTDr9Dgc4IxSYyYTSp4oxZAseFDlwBM3oMv
 trGKhh+xWYBpqycF8F3nEAvyJKUpMT1WskDUb1hehpfJpEVsb7kEOzTj7zGh9PP3osTLQB1dDAu
 k93V0oRYboHvSnoLrZOA0OfqTfGPC94giWuIlDQxQBJ1QYipOf/9/bJ8EwDeKu9NiKwsunEwdwv
 ZDsejl4PufjMEpJ7PptHLqO1X/ktVBTcRplnmlTo53Vs9em3L/5kSW//1XptpJg5MHQKstiGNhT
 JwXkhQKxsEWHTU8bBlJ/KnCl5YeVz4bAiwE5K3LMZGTXxaPrKNPQE2a7OgCcqKI7GJZN+MbaSR5
 iRRE4GsITdqUI+V0a9GmZFcR/ACxIhFigTivLDROyYp52uEEBqs41OjLaek/Tn/8+GAbu/+LBlq
 9u9KFLbmZmj68Q+6ZlZNIN+DZ4GjJ1qCQlnSFJk++NQiAZCIzxiS7FBUV7Sc4R1rjga7Eoru04k
 30fJtzl/FkuS5GA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX+8JoHE8VIuIe
 0VdTXREAyo86BOlBFyddSGmM/bce32mZIfIxv4kUWHXAfY3CAzBwC8WzsqA5+GBoF/VQleb7w4V
 n6786YJw0MWM0GMx5dtZXxQ5Ad95gL8J59Sy2VT50EFDpTEFb0NTfrXKCWjACOhPP7XlE/PXrdu
 VScV0cYc5WobLRaQZN8BRhTLoq1Gz80JsSqREyYdoeKtrMUNC3eRkDrG3vNv/vx59F3aT/Bj5Hd
 YTp5Fsy/Ue/nUd7nVaOMGDYLII+tRinZDuIHcQVeK1tlMUcBlYdkb2Z8OZe/bZ9cnGmwDN6WtZ3
 VTWppsz2OSg1OSIV3kXDlHnQRyufrHnmjMTbieKk3nuZfJM+eaTDSzRMIHr0egvMF44TFiYYGRn
 txITCrrPQpPLNb1agwegIov9NsGEgKwmzee3XyaSiLN83gsnl/8kjj84wGfWjJuwtKXJv/Pk3JH
 2CrgVKfCYyxG7jAKZCA==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec44f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: DGJQaWGKHDC4pvHa1FVrGcb5jxq1iDMo
X-Proofpoint-ORIG-GUID: DGJQaWGKHDC4pvHa1FVrGcb5jxq1iDMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14682-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF18A5A16AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index a42224f9d1a888a6e6cad7534cd2c5f110e995da..db45d1e99bf9b027548aac3a15bf754b3c023161 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -126,7 +126,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	}
 
 	/* setup generic device info */
-	device_set_node(&dev->dev, of_fwnode_handle(of_node_get(np)));
+	platform_device_set_of_node(dev, np);
 	dev->dev.parent = parent ? : &platform_bus;
 
 	if (bus_id)

-- 
2.47.3


