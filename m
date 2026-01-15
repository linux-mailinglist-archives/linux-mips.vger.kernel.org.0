Return-Path: <linux-mips+bounces-12941-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 12512D289B8
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 22:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88623300CEE5
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jan 2026 21:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D0132694F;
	Thu, 15 Jan 2026 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyP4ZgH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkH5SnJ3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4202874E0
	for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 21:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511154; cv=none; b=LmMYc9kQzDTI3r3oag+QYcBW+Z//nL9fIQZhlue+3J2Le3Lldn12Pb4q2FDt5waPKRMzXNk4DvBtsa+Rb3nBnUeCUA1N1AQaDD70FfchV3iP2w8uTOmFzO38GbfQuPSaaFD0sc1kEqe2WTyMO0peRB2v8Ztw0q1QLdMw1GmGfVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511154; c=relaxed/simple;
	bh=ENmGoObji0+Hq4MublklfZhpzGxYbI0JiS47cctdDv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qj/3FYmQxFk3qvHLlupItN85riDM1m37nrxJ61uya565sRH47tRWY1Da2ZlVKZog49jOMzgl5SF721WuYKIHI0tnF6zYNSugacqMcnv213MiK6OBKUWzpN4SI7bppszMiIr0mIC7T5MC0rNsFfD1OW2y7IdLgIr8gHJMsBUyiBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcyP4ZgH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkH5SnJ3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYAcc1722628
	for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 21:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=; b=LcyP4ZgHar0lfCNc
	erfRehhLm+Jly3LD5YZe+gnbNWLMPpKpCHqXWqbxOusksc+bO9tXicyW7jh//NJi
	usIGfOEjO9AEv9gpfGj/98YCcHfrTukl/zYmQLydJsdQKttHrSPAJdyOP2ZwhZgo
	JBQMEwdzMGLiVdBk1W/SXyZVvNdc5NRZT+FM7qpEx7/7NvdPOy5frXysA8s0gU8J
	ZqNYay2ewVXzcLHlbBz3ecFwu6edWv5ajyjydAsDG19/Yj+LuCA7AN0opCmt5loq
	k4QJeBZL720AEGIBMtghVzSNUa8Qz2OgpGPhh0XGju56X61amGvdnRG64wNypL3C
	6E2Taw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2fkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 21:05:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52dcf85b2so523023185a.0
        for <linux-mips@vger.kernel.org>; Thu, 15 Jan 2026 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511151; x=1769115951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=SkH5SnJ379fWvURX63Vxc3HKwmbQ79q3DlQeJxE9g4FlrriS9zaYSuSuPMlmUCV4QK
         DpRNVNewpczX1tlQzgDUQOZnvKg+Nphjndr5bm9yha71Zjs5lJsVbkaqMfRzVKFh+xgX
         X/fcOZiCyUht3n94f+7rX0GtudAaecYxgAQHimpeo0VQKQOOj2CVRnvJTLDcp7nVz4Jl
         oAKptckF98NDSVGF0+cRhCVSG7cu4FJ5noowFbqGQDYohVwmWbAF92FGZ8t5J648GMHC
         Ckf8ygMXs3kivXkLEAwByI1qSB9WDyHuy6J5s/SCjoxa50JQWtGsy+Uka2rBOLBVnrL2
         pbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511151; x=1769115951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLhM43u7KTCNMftZSAW1g9y9SRicJ/aCzV4l0MaawTE=;
        b=o1fXnfNs1vEzyT+0xXks4vm7N0XXLRVvvRnvgQpMi0XZszMDp+QlhqToU91m83MsP6
         BM7WTkah4axMgMo6pP9e2Pn1AfVVMLgEIbwkreYuKbqkGRy5UuQJWwSTB6IK2v9G0leJ
         eBaJV4Er14t+HULY4N7AN4DXRhBYhKAQORWx4FhS9w9fEMFLm2O2qQqA/sQRh3+jDfwr
         sjaShpTTKkcZSOwN1Ip74wpBtgnggOGj4s7a6tEuUasJzCiV3kvzGq+EFSBzbpPd75zH
         XcpcJHb/rAQYg5P5pJsRCRdpZpB1b98A9IrA42m8JW7FvozDROt7yEDyRmBFtjeOCmCY
         EH3g==
X-Forwarded-Encrypted: i=1; AJvYcCUY3YjIXMg7m9uvwYDtqiLfIPt9HVtS58Og0j558DntNf17aFhyV0MH1gyB6pZZAoisDS4b72wPgvRP@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLRIsyfGPraiY1ERqdL6vNo0qGdHnzKP2vrKDmq4FnfJg9XUj
	0Tp1+rEIhcSM5SVNioXDC5KXipPFY1mXstWLKoF7Uvm8KWEQG1TLKkD8bXTI6/h7Gdnfy8fgJDp
	fbPBylZ2zBQVPy5f0OUFbef1Ud14cy1UlVinXcHFOrCYe36ja/FG3BHhvMUtq3Mci
X-Gm-Gg: AY/fxX4+DlAsNqLSS9pQqDw0CwDCyhWfEzhJ4ZQ8q5fr9Nb7yfr0XsE42GRmXICE5i+
	f09RqoLfrcszLkVhQIccXdWNqEWSA5ZQ3F8wJhqFF9HpxMLy6oLQDLbjQWPPh1ZD3EB+tJzybyr
	bYMbkuSEBCdfDB/bpKI5TlTX/XAlrcBsAY7be19lITS8xW5dr+rB+HBFwLot2DfpY0PLt7dL9CF
	REjOHkkoauHyQhiX+vymmbWQoEQEcJ5YB7Y6nsBA4DMnqKHbU+yu6sQuqwIaN+3DRJe5VHxsRSd
	pfLJzbOQiqA3UWkMkN7TLtmaNYguovZnmhhuq+TtbE67P8zEopQrOfEbP3akJw9UBWVJ9wOh7C9
	Kf1GPrctmJp6rzZK65zB7uRRzbB/t3TML9zP5PLkp9L0/n6TKvb3eQ1OwNFUs2TZ22H4vih2pID
	AQl3lkko++jBW33LNXEHSJSvo=
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120079585a.8.1768511150908;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
X-Received: by 2002:a05:620a:1723:b0:8b2:dfda:66c4 with SMTP id af79cd13be357-8c6a68d2f67mr120072385a.8.1768511150340;
        Thu, 15 Jan 2026 13:05:50 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
        Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-actions@lists.infradead.org,
        Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Michal Simek <michal.simek@amd.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 00/27] clk: remove deprecated API divider_round_rate() and friends
Date: Thu, 15 Jan 2026 23:05:48 +0200
Message-ID: <176851027322.3933285.17869583744437773979.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iXsyxYvJ7yImKrwh9WDJMqm2GwlB7I9r
X-Proofpoint-ORIG-GUID: iXsyxYvJ7yImKrwh9WDJMqm2GwlB7I9r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX0Qpyl2Feo22o
 IYy+t37MG40LvvmyVkNMFE0BiE4WxQfRQ02UF2qR9dJ7tsXddtQtAjrtZnyal6KopzHu94INYyc
 rVwCVwXg2wXkfIGpRSCSOiW49QXTNdyqGFt3bjFQ78oMcXsnMeDL0jS1X3Lr58GnAN+3KXoERZi
 oI6erDhesqxsFz6Q7tJ/orr3yCuGVPttvGSkImwMAgOh4JAzQUk/L/WC3+bC8sleeQoa0Qx5fjZ
 VtiSDOixSGj3XV4WBhq5jzK2o7lqHLJYyPDmO1ht9vD9oVwG68u+JRD+Hp8uvQwuxzf8y4bVftF
 5FAkg4VdX8uNRhXPDLoD0Wo2fE9ixNhxchMdKMHNq1UShVLVdk8C0+FCtGry1qlJBvHJfAyurPe
 gb8cLTVHyTx2TK6dglk+WrHkfCiZWUQFi0HFy3yOmHbPuK1OPCyfcfppQyqbSMNPa1h0nyxnAbd
 pwO0yGPa9K2hlXC7ohA==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696956af cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=whp_R4xS9ENlu3RGya8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1011 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied to msm-next, thanks!

[24/27] drm/msm/dsi_phy_14nm: convert from divider_round_rate() to divider_determine_rate()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1d232f793d4d

Best regards,
-- 
With best wishes
Dmitry



