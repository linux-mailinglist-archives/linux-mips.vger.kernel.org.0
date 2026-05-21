Return-Path: <linux-mips+bounces-14675-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOn3LrvKDmpSCQYAu9opvQ
	(envelope-from <linux-mips+bounces-14675-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 11:04:59 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 646F45A1D18
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 11:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9040300D870
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE73C3A48E8;
	Thu, 21 May 2026 08:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D6wMyh9G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/1J1mnM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CF33A48F5
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352637; cv=none; b=BgY+S2WeuNryXvbyPH17WkExYA3/XcI6U+ZZ/X/Q2wR68jPPYmYXHrAamfAUZiOMnYOS/TCNP1tC3yuUmRG+aDaVcOBKBG7m6051+tmQnLJh/6x8LvCcQEKnET087JYKOBuWrnWARKNaxLQuoXs9ECa54r8dCqbYnNw3dcGxWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352637; c=relaxed/simple;
	bh=Vq0LogXtRhRUgP5LIHiwXCljDYw8Y78nK8IIxKqwPs0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pg61FS+E4Z+iUv6GKejRnwtJO/BLnbiwHYKK+OX7O6pv6BLz0eYuPAkmJhvzaMhQ/4tMvNCVYimDismkMJJN28eeg7+F29zZ63xzo+z/YEIyE+GrqLQrGf8ts2iVfOqUBAcgSHiP0KoF2kN35y5OqJKRDIg2N1FaBLvfNUGkJ8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D6wMyh9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/1J1mnM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L81gE3748668
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=; b=D6wMyh9GV2fJQ0Zx
	f4KBiA4rm8ahVwft1szX4Pu9Nvj+9vf727ddYumyeLD0bzMfrAE0KZ6oHgtfqiSc
	R/Z06LkiMRARLiTkVZikUVyqsKOmr9dYD61LxYNfvUzMQJF4/TSfkh+8Anc6UMkV
	HLqDvBgreugoJt7iZIgoc+bYNdvsOfM7F0O7wQra+ECBQo6ps2B/n9dILSJaBJqW
	p9EhZ5DCZ3JyhQ3ALihI8Wq49SQxDUpWP43KWy0dtQQSSDgN6tWae6KgXXih3U31
	TgBtZjBrQOT4elKE4UaqnfddJYpqylEtpJQzRFXRHCI4S6eoz2u+MlPmc7GZCH+M
	ehUt7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kj4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d5d1c2289so172745121cf.2
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352633; x=1779957433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=;
        b=O/1J1mnMmvTk2Mx1H9Uogr4rgM21EiM54w1AToZXKNQaV+8SlFIoqiRBtN7vxJWe+A
         ZMCOhiT+OB/Rco9kS1Er6nlyD+eLpWvTxq8pEk91u0woybwSoTZMIHoRhjLfCnILbKUz
         2JJhK/t8kBdQTNRNjnXmM29gt/d6gXXjCtLuX6lhqVWj/I3huc+jR6j49K7dlUBU4zhs
         aXftcrsSwSI9z6Cz+2GWDar/0lQ8jPLuqftOVFoRL2j4NGGin7OJ/Zzyd8bt6jH953q2
         6AGuiYwjUmnjd7PSnUcH+VpKQcnIgeB4zvr/I5yoVmXUoEjCrEMQPBxpJdtQEW7TTuAP
         /4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352633; x=1779957433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wfw1udEagj7cAx0swsN1pe6k67tQ0Df7+z2byi0rBCs=;
        b=Q+yu764ZldU10CPQGe3Mf7RuYr+8vIq5pR1U34uvapn3+p/DdYVRnDnzmfFNVlGdk8
         dtRMQEAO1jkfgiopx9nF18zz4tdY6QXiz5rAxNn1pPPIlD5JR183Sw1m4ZP+4C+1kpo9
         S1MUJvwT6ZUJHqFdhetHK/ndJbONTaMfRTaCWTWTmXOItPFu+UyKNzJuL5Pu83OLyBpN
         1U/gx3z7uEqcg0ROpxy6dp2ELeiuyQJGiDCagn95a+/xRXpHqO2SWuyreyKBV0cEXPsF
         5+QgJlSOyQGwTqBrWFkjfogPZS+FD4x5X5jaYJcbEfMnBOv2D04xdrLAkKpsaXZqncjk
         o8bg==
X-Forwarded-Encrypted: i=1; AFNElJ85x1rNQ/IYj4bbG0jqYCrYuu5uf8Z3mkDtSKufoGvr3c6Ol52aF1SrKS7jNxRO5gbAOhRDZDQHFqKK@vger.kernel.org
X-Gm-Message-State: AOJu0YyoZ1lAuJX2iZYR5N4+O5nYoXP4ajnhExlx+JNYgziUktWLgj/x
	OhilsaPJZTehYmIkSTzHxPdyV2sGqmgU+52++mFhsKy72WyKzvYyYWIiHLTB3QM6z1bAeft7wjI
	T/jBeF4JjPyAOI/dMNiNEaZCpfuhgxSBM2lS/Js92lPolWEcJdxm+CDa7/yxt4RAL
X-Gm-Gg: Acq92OEL3ym4VVSpOlUiL1bMxwmLhflU9Ex0hgUV8ALGAPhBkoa7Jx8MZwFdWwtDFzE
	/IdMVeTVVY78ZG1Uot06151ZQxwHmLykpkJWNhBwqHL06EXtOnPYl4E99KRo6yMuH0oxbb/mcF/
	q/SzDmQhpEZZrod0kmTyUAegKf3hWlWc3aC0wjES3EH+IvV3eHauZYZ5AJ1qLBtZOFYwXfJwI08
	a8MAbgkCEz0h7o3I++VmXCqFXtP/ykvKfpQ2KAFaWomdUrTmwbiGQ9Ch7twxrKhu1goG/HMHlX7
	kdm3WcXyFxwecxnQlNMOcNfa5nj5trkOG7dFLrzostZue5BiYAVZELIXOCbIbh6iRkovVBWa5r4
	9L10CLGEEn8n3lBGOqKcSxdyZndSJncqBDyx/BdLDIv4XMTD7ipY=
X-Received: by 2002:a05:622a:342:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-516c544afb5mr24558621cf.10.1779352633356;
        Thu, 21 May 2026 01:37:13 -0700 (PDT)
X-Received: by 2002:a05:622a:342:b0:50f:c65f:a4fc with SMTP id d75a77b69052e-516c544afb5mr24558211cf.10.1779352632852;
        Thu, 21 May 2026 01:37:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:25 +0200
Subject: [PATCH 02/23] net: mv643xx: fix OF node refcount
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-2-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vq0LogXtRhRUgP5LIHiwXCljDYw8Y78nK8IIxKqwPs0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQeyipWeVwe1gZ+CShmDvyxkCw/2ac+wigtc
 yDfWrx9B7OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EHgAKCRAFnS7L/zaE
 wyD4D/96Sc4XMe6BqcGdeU5XMrq255mM+2Q9i1CnFxUGJYNsHRGALjwq4agMpWWID3Xz0IFWadP
 f9cYo4zSx5YrZJ3NC8aBSnDFEgSpaoPv3vd9dR2i8safu4aQx7wG82O3RVcGqAtL3shTrfG+ziV
 24wzbVP4UKjc4kcw0m4sVpF7kpzz7f5uypJ40k4tC22VMdLsN48F2nNloAOonMA1CRtVwaegwPS
 +LUzSr8fUVE+Cxwfhm9M9QMbPPQV+Xz+9D2lIV7JibUmMSyMlUkkC6W1WGY+EE+y164ZvEPQUQ8
 pTOt0/CtDCCs881XvieaOneXcOv3CZKeJfbv1pyGp4onPZPod1ja8YYi3oKqQoKx/gipqSIa+KZ
 Q/NIA268QzWCrxR8+M+BFyghvPzKE3QrjxrAPc3rcoL21lH4E0UT10PFSpkt6UoABVUDQdVTK8R
 RrccYHir46M0LNRd0CQvLxeHCuup/uV62AYyq1es4haCqR+Sd8PD0hE4YjipqixdOX1d7vlbeSE
 rgk90YNfpnJQ3q+VJCtHjTCKFzSuzfumxnfLZNPUSMSvUO20eJ4PT3Lo1yq4VTiixwQqm6Ev6wg
 dUzkMbEHmGi4j5dxcRVozkGO2hBgM1870hwtdEda5YSqgm33yqUq5FDx8pa0vrhMYxaI4X/Iwcc
 +Nh8Ur4nvc/+Ing==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec43a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=2glh-Q7MoEu8omcI7JcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NY3q4HKXdrepJdFg7vMwWiZIh3EQplIN
X-Proofpoint-GUID: NY3q4HKXdrepJdFg7vMwWiZIh3EQplIN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXxQHRwiChySVn
 952yv9lv6pNzujC1CVefhnZJIih5A6wqtG6DmdHpoYuP5bzdMrrgN9mBeQklmo7RmZfbcbvfJxK
 yZKl1y7dTsFw3Zy8ft6ZgjQ6ydRDPejrCO7lLJ8VuWiT2umgjhGgjcYlPWkI+WyfjYjbwu7DbNL
 xQhrKwgdSdemvnOHUAWCRlqk7y8TkHIpn2nGuwOYdXTNM1Mb7h5WecjaYOw5nutpgiktFWpDr8P
 IPpvVZiNOOpT6DD0iXZ5DsTJRgieC28ae3odZTg0EIujOqWkQiJUKXa9JSOBcz48mVkyEC6KBoN
 0uCtenC4CbxFVe/f4SfjbO9rb7MkZ1qq2l01oWJVWUvUgM+LHMxjPO3kHAdwQSgNJRowY0GG+ny
 bAYuYhnlkGXKxnXCVluFEFIeKB/42cxmLqqEDBW9ddv3I0aHuEWZg9Y77F7c8/Hwx4ZcqL5CrtC
 Vd+obuEorMgN0NsbD8Q==
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
	TAGGED_FROM(0.00)[bounces-14675-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[67];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 646F45A1D18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 76723bca2802 ("net: mv643xx_eth: add DT parsing support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index f9055b3d6fb102ebc695dce9c6c8321889a78dfa..1881583be5ce2e972fceb14c2b8348280c49ad1d 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2780,7 +2780,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 		goto put_err;
 	}
 	ppdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
-	ppdev->dev.of_node = pnp;
+	ppdev->dev.of_node = of_node_get(pnp);
 
 	ret = platform_device_add_resources(ppdev, &res, 1);
 	if (ret)

-- 
2.47.3


