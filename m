Return-Path: <linux-mips+bounces-14680-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCFDEDvLDmovCQYAu9opvQ
	(envelope-from <linux-mips+bounces-14680-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 11:07:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDA75A1DF3
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 11:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D85F73021EA5
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2783B100A;
	Thu, 21 May 2026 08:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUc+CFFy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVTZVerw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7413B1EEE
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352657; cv=none; b=UdzgsjaPT/yA/P4Z6RtkMqGz5iRjL3b3nCGT2tWvnl9RTA0NJpLyck3KRLE8iasWDIvI7h64WAnglltTpe2tHvR/qsNHujsEMIMAbNeZzVpVmqVBmrw5sd0mMKNfJ2C57q8BNfDPhLlkxZxwiE1wMpeXiodhw+ZXgbt/LZqvG5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352657; c=relaxed/simple;
	bh=rRd9j74OjQyNdk+VtFlh4dylTyLU2CAyFlLnnDIdtUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CDreaiMHWcByIJE4ciiZbJzhCSfTpOge5WCPjcPhXYWIFxz6SpLRm+2BAidbyoMmwiF1lSYFWEh+mHftbG6RbybTlSkK7fhbd51ZMq0D55uWVJ47yJS/3bar86DzHvTmwXnYbuBY9heKnSO8scMoufRvw/fcGzCi622nOdVmTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bUc+CFFy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bVTZVerw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2Td8s3817793
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7EUKjmOXS5ZOlGKfB9pplYhxFGreNM66ecTz9UnZfAw=; b=bUc+CFFyd4NwxGHF
	Qi5NpLvFwnhpE432xJ/qoye39MdlOPIeXr0d/NdMc3KixWDczUm8hlATjkig2sQH
	IhSjxFtRx3DcL1KhWUfKPa9vUkz8ZdBHKawUbUdO2rGmfZ52aigtGOvAWJyVCISY
	sEQ+MxYmGqtCrX+c8O96WtZJIEkd5EBQKauCcGQGKbnooaUZswFac965DgQNfpgo
	QxgB3qfNRvh88702c8zZflqZ8/TAjVMKNh/+g1VQNg5txKJdTqUewSdwZnJPG0S/
	NgcxmluTwdErf07ihJfojQZqBQmtB1wMmK7mtHkf5SXdfz4fyUoB2ibGkSYPiXNw
	0KZxIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5165d10e036so83050061cf.3
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 01:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352649; x=1779957449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EUKjmOXS5ZOlGKfB9pplYhxFGreNM66ecTz9UnZfAw=;
        b=bVTZVerwP6bRP4YVeYlN20OmGIfbr9e18PN8DG/B1tgrwKV/WobhAtx0wWQsZ0+hHQ
         PPEp+FMu3tesk2MkfYZ6WdawI8vScM/hRxvZZy3E53+xsCB4mYftgisW2Zjn1QBWOmMP
         ymvb9c8SyPNWu0/sf0wJ5JRLgmok0wJXQokQ2yccIN5bGYhiuku3nnM4TI69oTr8d4Se
         DKVd05bh+96ASLjavVv7rIcwHoumjASskv2JUUJ8bQwCNCKx/UJLxjL7YNL+27Osn9rD
         O0HtMZcqN65htHCpXw5ZmtbANwwBr6P5ct4uxe9vcVhzJDJdDfQLpxh5uipaAzz5ga30
         Gs7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352649; x=1779957449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7EUKjmOXS5ZOlGKfB9pplYhxFGreNM66ecTz9UnZfAw=;
        b=SBZ20h2aJHDp8VprEmX9Mji417rYy7ioA7AFqa+R25rWACC+utzq6ufYAnHwNyodL7
         67br1g1olUI9AwWMgIrhEM9QafjXhgdHfvVYMUSZlBGXkIe9/gFW86nRiHPwgBQJUecU
         5Yn3m7oJxLoiz6UFdgY1r0Sz5147RQFdVwlkXEngSyfnrPZJApkIB2j39YCt8vftWUzf
         wKojnuSH5DjoqEyDYkzE2ZTsh3K2UpfEVm6vT83Lq51/2eS1B91khaXQ76aZQ00iufKM
         dK5z620EZfxY9AbAuYFYzWowVhhABYNTmvl/gdzJqr79v29WWqdecTSaZJ1So98DBy0X
         racg==
X-Forwarded-Encrypted: i=1; AFNElJ/VhDj2Tq/y1N8/b7Fvu1EKc9H0xlEvo/6FAwFufMJosLt1SgYdbw5MhW26/N0/qiDUJN5grixhskIY@vger.kernel.org
X-Gm-Message-State: AOJu0Yycucf8hHiAm8lPEcKE1wdxQrYuOvmsJSgbaeeNkNUPJjUOdtkF
	jREuY7mUYyFWqqdThvc9TS46DLSwaGj9AJPsdEp51nea1tCuNtA6J6/kK5HvkM1m3tpKujt9Q+7
	CghWE0IvAR/XlWrw+GWKuzBUZnE50QgJWuTlabhi61SOB5Y+V58SSi941hbR4H5MR
X-Gm-Gg: Acq92OGN4b+lAKmCzuFbp4X9UPGmJGHvI61vixaEgqdr9cD26DTEiyqTK3OCF+FiXeb
	c1l9TJ4x6dONmq2QnHDB2vqbexJoe+X00pQo+RaLTZzRPmexrVeDuygLDX3YSVtjj25ffPUwEZk
	GWddE0HRiSE5QMcqOJLqkK4bCyNX43/5LyQY2dgIfjDde7IpLCvw2ISvQlhQNqkvvXMKEUcGWp3
	GZwt/TCrRbwAj9UDMmuh40+gFYVGinRTxngQJlR0xMMm+cxJpjr69QHrnHiBuPaoYPEzTRlWPxl
	7+r2PicpQKRAD0nRvX4+4xK4hmgy2awKefK7W0IsZbdobezmx24ui7cBp6ou3GYZoY2C73BjqKV
	+VLVAM9E1vR/6zWVNjlSUD4/25F7ZTYZejaZ0tm8460nGgiA3mvc=
X-Received: by 2002:a05:622a:6116:b0:50d:8b23:4948 with SMTP id d75a77b69052e-516c55f9205mr23939421cf.46.1779352648926;
        Thu, 21 May 2026 01:37:28 -0700 (PDT)
X-Received: by 2002:a05:622a:6116:b0:50d:8b23:4948 with SMTP id d75a77b69052e-516c55f9205mr23939251cf.46.1779352648468;
        Thu, 21 May 2026 01:37:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:30 +0200
Subject: [PATCH 07/23] driver core: platform: provide
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-7-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2745;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rRd9j74OjQyNdk+VtFlh4dylTyLU2CAyFlLnnDIdtUA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQkkNWy1u0nJDfBnABQIB58pgj8eKnciB/gZ
 7KCSi6M5MyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EJAAKCRAFnS7L/zaE
 w458D/9fxBKMlVNMNuWz+dazeEqvaZtdDlcsmiOnFPfj6M7Og4sIQku1pIhqWg7R5feeB1t5KVF
 RWCKwpG7q39Vd2yli4ed1/N5s8xsernpMD4OztOcwq0tqXB5zaXhDam7ARfrsNIAdl3RCZQAH0a
 UXY73ce/1dp9+wn7bNqRNMILkBqt8lBrdmG9zFStxK3XKwwVgsXk5+a3S0FIeFa8liFp58I9vPO
 hWFJ4iJTQtAQbh2a0zCFBvlIaE3SsK4PJ9IT8ZDijnKqj7IrJIbOLzaJ67Y2+H+aXIDP0eSpxID
 BSutxdu0Asj7BY61FqDuRTZu0vWpxf/AAKk741QLKJ9YnDaLfPB0DN5yvUsigFSl3+pMCaCnVJt
 XcW+lNCQbwsuqvGUNL+BeSoe3Hx3iZOriNNbF1jFZKRgfW9dHLlSKg/UjO0PV9uPYt5hvqYPLP/
 47kDVDCqqil/ygTtOe8ewtH7I8SAyDdmzvPZfzY8gofGB3ZTCYg0UxaX6wPQUEHjhOai29xZYPc
 U0iw7mIdVm2FgWvXoklBlTliln1aFrDUbajr/ngh99C9qU530PBGuuA/QgKe9UflaOdMelDhUwd
 GvWyZXhDl6Nla/IdzMolpNgu0mSi5GihflL4zLe14h2czjXmLhHVNliOTu11GDnkSl//3aS5cpx
 im4np9+GZQRjxzA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX2Y4uSKiTsP5v
 4zP7hYLSUz10Pa5z1PZr6+H6khR6t3lHMLheufxyArpis5wBld+Cs9tvRAx+ylbevmcf19h8xks
 eTpBkttE1DZY5SRIggTAJ5jhuA6a3Iov8vZJtYp2u5NAmF1F1i0uJc3Y3iyIVMr0ZCahEu1CeS+
 thXxYsA26cxCg4OXaRsAiJO0sW3yWmnN8e5g2LDlXc5lMps/7AujSKoThUoVGmA9dLu2jUQP9EG
 WJO8C70y2iw4Y4fNM9S4LOX/QWrRAbpNMZjjsqtr+gpDll876dGbwRWGY2tWJCeE3M13a9VVy8B
 MhVEsZQKYiquoIf/kqYOW6RAvQA7rYOX1fNmZmUGMhObz2gCaMtYYGjDdxzvTXtMDxpnfN7gZ+3
 N1hHOfozjywtLt88mocY9k938ClBu71aH6HLE9+c+Yo4ZGAcuKuih8Oi3wOF2//No37KW3MAXa3
 gnKuLGvDvtHSn80/3ew==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec449 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=7s1i5lxVbzGmBzMXG7QA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: WwnJlrOI57U5qMdm_WDgFV6gYPaMHXGr
X-Proofpoint-GUID: WwnJlrOI57U5qMdm_WDgFV6gYPaMHXGr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14680-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[66];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DDDA75A1DF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide a helper function encapsulating the logic of assigning firmware
nodes to platform devices created with platform_device_alloc(). Make the
kerneldoc state that this is the proper interface for assigning firmware
nodes to dynamically allocated platform devices. This will allow us to
switch to counting the references of the device's firmware nodes in the
future, not only the OF nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c         | 19 +++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 22 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index ec53383fa17ac29ea3b15b61f97ae65ae8ca22ac..449914e657c9c58cbf030208e60583dde728d6c0 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -711,6 +711,25 @@ void platform_device_set_of_node(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
+/**
+ * platform_device_set_fwnode - assign a firmware node to device
+ * @pdev: platform device to set the node for
+ * @fwnode: new firmware node
+ *
+ * Assign a firmware node to this platform device. Internally keep track of the
+ * reference count. Devices created with platform_device_alloc() must use this
+ * function instead of assigning the node manually.
+ */
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode)
+{
+	if (is_of_node(fwnode))
+		platform_device_set_of_node(pdev, to_of_node(fwnode));
+	else
+		pdev->dev.fwnode = fwnode;
+}
+EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
+
 /**
  * platform_device_add - add a platform device to device hierarchy
  * @pdev: platform device we're adding
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 21f7d8a7f4b5c9a47d56d80a69802b3f84457ef7..a915a6f2da71284b60a6595dfeb013ca0dba542e 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -20,6 +20,7 @@ struct mfd_cell;
 struct property_entry;
 struct platform_device_id;
 struct device_node;
+struct fwnode_handle;
 
 struct platform_device {
 	const char	*name;
@@ -265,6 +266,8 @@ extern int platform_device_add_data(struct platform_device *pdev,
 				    const void *data, size_t size);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np);
+void platform_device_set_fwnode(struct platform_device *pdev,
+				struct fwnode_handle *fwnode);
 extern int platform_device_add(struct platform_device *pdev);
 extern void platform_device_del(struct platform_device *pdev);
 extern void platform_device_put(struct platform_device *pdev);

-- 
2.47.3


