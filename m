Return-Path: <linux-mips+bounces-15528-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yPk4IJWmS2qMXwEAu9opvQ
	(envelope-from <linux-mips+bounces-15528-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 14:59:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55075710E7C
	for <lists+linux-mips@lfdr.de>; Mon, 06 Jul 2026 14:59:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=a9nGmkj7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=GWxxfzzU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15528-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15528-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21BE830D37FD
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2026 12:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B2D4C6EEF;
	Mon,  6 Jul 2026 12:45:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB394C6EF8
	for <linux-mips@vger.kernel.org>; Mon,  6 Jul 2026 12:45:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341925; cv=none; b=alv/zUlYq7w0+OGImemf1Npvl4wqngmowRSHFg81a1W1rVoa5ZzZU1Gw7A0vhsiQQ+HXsxH0+pIHbi7ASTrneHF+ptOj/qZoojFZvN2BLqML9zhpr77Y3nAvghJL9Mkzq5B6WOR3Qlu1Bv3FqF2MBex0GL2GFl007A+T/iH7zCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341925; c=relaxed/simple;
	bh=6rZCe/y2D+a9YrBo7o44HEaRO/K53E+00VjO92+29A8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mS+F4BUmP7mbdLvWxioP1O2oA5zl6Ng6PMBhfsMgm8Bn4XFwm31jW/WUEgMUiDrzU/gne5itAkVahK0MaReoiPQmprXwNUuTsKyw+lFnwTrsBywSiXO/HgSFcf4mg/Dl9afqsiEJlmSCFP8l4xgUwsWV9Bj5D1LY/Umw3QHTwW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a9nGmkj7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GWxxfzzU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDLx395293
	for <linux-mips@vger.kernel.org>; Mon, 6 Jul 2026 12:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=; b=a9nGmkj784flMoWo
	nlKDw8oMF+f2NfnRndN3+dZK88CW/gRhqy/CF50Haqk143r8bBMiDmKMu4SsVtTJ
	JqRxsX/BvCSiWsJvNyWg3st2ohyg760/41Uz1k0Srb2HbopSvNxu6pOv0OaB5K+I
	4uCMM1F9+Prtbl/F7/vwUeslmBjrfxxhAtTMWAxI2r7PSpQSvLEV8h+t1EAB5Wfw
	H6gZRSu6PVH1kQ+/H/1UgtqRMwirgBgGE3rTfctlD07zovPLGyBUEE6zjhNroxkL
	6krnr/WfWomJ3jWUjR6rnlZP8NRu1grRW5qBkb60Sr0uPQMVjU95lg3j9GL0etUi
	MTbyWQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpgqmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 12:45:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91ed0e140c5so539118085a.0
        for <linux-mips@vger.kernel.org>; Mon, 06 Jul 2026 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341911; x=1783946711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=;
        b=GWxxfzzUZPJi1/YVfoGulIHNy/XofO3bwqJ9Qa2TS4tnQLLHpCzQA65qXrD+C7d8ZV
         MEv4HowSWlRRDV9k8ofEfWMuK9sEOQ1Xr1t2gfFfYyhynorZv+z8+PdhY/auM2wY8J9I
         yQu1D7W9ZdkkYhqFcUbmnHsUC2FGC1j7E+84/5aRLHJG74xcpXjOSIMuCUcFrNrMvMUF
         Z2VEzGquhxOgvtNFJsQTBwP0udjrDhtqJXT+MyyMpOA3/R4gxo2ofTFcaHGE4CnyctxR
         CdOQluCa/vFMYze51WMELb4PeKbWsbQqLwmDJ1RlK3qRWpQWUU0BwvAjQ2sFS2AAPJMB
         5xXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341911; x=1783946711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xl89k/DVW/7Z5ZCZ0MfgdfeY7qOMrXozhfna0OAi74Y=;
        b=Tcm/MQ4wHJASBkGwgWUWQaPlMqnu4DF+R+g4L94OAvakIJDcceFvVoKf56kTIEEI77
         ObIiJODer2QdNJ30nHYnRBnLrov38yGL2UyHNk3Xcit6389HNC6oxl8GKMTJCEyfYL4e
         crzTQh+OpfwTK1mLoFct/B3+61WGI5Zoyj4FMYj7h/JmL/8c4qo13pZAXuokjbMCW74b
         C31FL7pN4ZxMSqBtBTTDpQq7mw9XY40KpG1arodkN3WNhnWyA9U5GMZFwfoBHeWyBeg/
         /2M+s39/39uU5euAa/iN1NaapaxCLOl++zP27rxWr5RUeuASxZB8P3xuJmkR3+AEU3vI
         nNgg==
X-Forwarded-Encrypted: i=1; AHgh+RrQCZ1v+ukQsvTC9pgXmm52JhPa+pn8jslnt3wf9ugp1ozGrysqH4PAOO/qzCzxw4SfOiDpBrg/5ZDo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy78Q+piQLsoO8tEmosADRmxO7wxbTMkw+fSxK1F8QnH9kzsyn2
	l2ngfOTE4eyQzVFNH/+PHE2XumNEOxrdimBeHbkVS2M0mFsteMl/CWa7lAu34EgwW3RnXSmI62P
	77U1WkZao0N2hQAG0R4nAEbfL69tr5SPvFv7NE0BTe4RP6PABc/1ihF8t4DgZFIVY
X-Gm-Gg: AfdE7ck+ReF8KqToZiP7ktb+kk391/5jwak3wEl3pHXdgeV7qVhQHN5GmzysV2BWcQI
	oaL+yIm3h+drIgCXqK6PtAs2SUuAjucbtPgm01deXg65Yc1/8xlpLTseElK3Y1+sKQxz54paRMt
	2Eun4k8KU/PJavcZQHQiqwSRA2cYhbHDGD0mxIiL+/i1qO2FeJJ/KHSmzBfzR9YkvXYrv+7Y5Qd
	RdWvKesmyMEjFlX04FKeiKg1B41MC8bqCkk1Yp0znPhbzIPULeY0DsfNAZYIP4SWyNPimfQGC62
	DZSUUaMd4bkchhA/McDD+knL4uDUilc62itesvED05waFtvUFWCR0AVLGP2bG82SFKH+HfMYrwx
	t6oYvW32eELNNqn2005V3T8h5cIo0eA9vDC+o3EzM
X-Received: by 2002:a05:620a:6888:b0:915:4211:baa1 with SMTP id af79cd13be357-92ebb514d03mr45491785a.33.1783341909042;
        Mon, 06 Jul 2026 05:45:09 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:915:4211:baa1 with SMTP id af79cd13be357-92ebb514d03mr45480385a.33.1783341908161;
        Mon, 06 Jul 2026 05:45:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:18 +0200
Subject: [PATCH v3 06/20] of: platform: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-6-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
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
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6rZCe/y2D+a9YrBo7o44HEaRO/K53E+00VjO92+29A8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6MzbEKkoY7zHwdHh1nhL7+KUq6bmwPT/0qpN
 3KEErC5TPeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMwAKCRAFnS7L/zaE
 w60EEACTZsP51kWnjlnO2jdIFQ7rVOfzFGs6vreWn5WZ/mLyIg9up5SCC/v1gGODbvvSYMfrpPm
 Ad1NgJk61lE4Uat3YIah8N/690VRcsB8TdioMaFx8Y507jYHNEaWoY88xEeK0CJ4Mwike6XPjOR
 GEO5nxlIQw9xvALF8fVuc8iaZTOixQX/ObFGe7Cs2CT7+t8RLsF+Vxm0rGC8QVHfxBQTI8GfgLs
 WHKZ7rFwOFnGNa+BbflSlCxSvtd0M/BxMgc6OM70xU0/uHmP+w5qVUUYk1RNOONSyK+8Gqf/M8t
 +qNGS/XhygjkdGCarvI58e1YP2vFOezVdRt5CV9xA0gqIAKViiNYuOcbF7EdfSKGVzL+aM83HVn
 IB2+oUWPmEglBLJUHCHjCS5ZrCwk0j2/2SWTJhkvp9/5G9keP0q3kdVub06bMDW+1mOjw3j4CgI
 E1deH3qz7a10c7gmtthQqcIkdsGpqVgLKi8G/nsA9i/5VkNcLM9yCKpo1lQ+UWH1cYYetKLY8Mx
 961OZ+RmlwG9djjwf5eDpCQxOakUVoDX2RnGxJzOuTkKwEH8RxMxuwwM9l+Ml+7i/bsnScdRX9N
 Iqy3R+yve8htINya0Mxi38Q1JZfJ/lWL8CdNpHdWyO8KCAgK3PTqQlKGkyjmPLRj458OO2fr0ta
 Mo9Bsbw78owdeyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4ba357 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hmbLjuioV2P22xyXYr7gyO-dpN54aic8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX5No+YGKgD/Mq
 9q3cbI7o+n1WZu0zF86Ib/VigRN+Wr1+KVfn3TdTdjiByX2gSvksJsM5VxPw5eF6S4nEpj+8zxj
 sjzxNL/NUpC51l0uKoX2g7pYc0N5rJI6EuB9l4pcQnwMlOVMWzXF90wNrIorRDKmEeDd6HrA/fp
 aoxMTLCPDEF/EYYSWYO8pEo3qhcVk9dDHx/t/njogmMqi10isLBmdsgWSs9FRjEtRcDqSKNMQgH
 1HdNbMsCPuR+pWESZwgdEXnGx6qx4hlVQXHz79QiGGrzA7ZK7lT5Dra9FGu2klLavs8RkSYbmIk
 5sd9Kgun+CGS9NOgotF/mGSl4h4Td/NI9Sgqhz6npEjLMyw1ZzyZGpQNccF8hnUKUU6YnuF/MAK
 Xb84pYufw/9/hco4kBGay5YQzPAHRBK+A5/hNSw7Mq8VH+cvD3WJK9/Dud3sH/By1xQnPJT5Yyi
 QdlpnpDv6NaljwFy9Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXynH1e0Xt7Gv9
 H+2+mjTy5C+KnXQwLZjUyVBHnc9bEA5O5fPmgQVGajvdzDGhYLQJegEHW5UU9j1jEkYFKctErJT
 nrOCwfXWQIPt2y5ctN562xkfhmATyfY=
X-Proofpoint-GUID: hmbLjuioV2P22xyXYr7gyO-dpN54aic8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15528-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:mfd@lists.linux.dev,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[67];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55075710E7C

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 53bca8c6f7810ce2235b4d084a361626b1d2da33..8b1e7640778253492c080085b4015e1423389d83 100644
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


