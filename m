Return-Path: <linux-mips+bounces-15476-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hfD7JXoSSGqOlwAAu9opvQ
	(envelope-from <linux-mips+bounces-15476-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:50:18 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC2705543
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 21:50:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Oe2yBMtu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TON8g9Mf;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15476-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15476-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 228AA3014E48
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 19:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFD8D340D90;
	Fri,  3 Jul 2026 19:48:46 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E283333F584
	for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2026 19:48:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108126; cv=none; b=WduPhQvp4qFRGRYhKnb9QYhw1vcfdF2Boqcnp7bV4t1WgoRYz71nTUszN9Z0LsTyVfavZuckqWLjIBc+vkW4x6DHq6ejED1c4gMeHR1B9/n50jyBYGpZB+5M/ZuqAVsqjElfnADj584Hn9BSJ3ZwCyRCWLzFTW2rJanxpfsAzLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108126; c=relaxed/simple;
	bh=KKoYBENlGwSryGtgIQNpuBsFHNXkIZL9mEja8t22cvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIC8LYw2SGlt6kLIpVJ7Csi6XfspvHnhha/rPZwcDBW6p0dYCFdWKrYVSP5YXzfwSMXgvfl03GnTDgaHNYpFvY3rw7TCn2NxMZ8edFGE/kkzF2dGyh6CHxlv9om1jPtVTBnXIOpnwwlSPDSvGjAdGzvRHTY7qMxjwu9R7NCYpAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oe2yBMtu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TON8g9Mf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663HicLE662948
	for <linux-mips@vger.kernel.org>; Fri, 3 Jul 2026 19:48:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vTaFds4j6VI
	tza7UvAMztb4cdgVduD/jcDAbw1WAnR0=; b=Oe2yBMtuiakzJoNHyUhWZrUssrK
	VkYy44as8rYFaPVY3qYkY58rW5vsbqBLlEVR1wNCoOP409lsvwRermF3M/2rZckO
	jDRSAa1yhBNtN9Z35pxSi31zhiIjTvpsUGRTw/pqHw+R0wHgO6YcLOKJUyc8SVKP
	c6zl/n2I5OUPpbZRdTcpiWOUvbo0NlKiTQ5N1OKL+St860bWesJlesEKMiGuGXfV
	2eby/uOoEfslWXMef31inHLf1ztWTQyHIMq7e5WpqVs0l1nAzq6GJnq4lPGmaaTM
	w39ZQFAZOHylcs/I2t11wpHn4o1yjBTu6D/2Ao7mpX6BoNbpRrVQAm2oUnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eycfqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 19:48:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38112fd8b48so981262a91.2
        for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 12:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783108123; x=1783712923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTaFds4j6VItza7UvAMztb4cdgVduD/jcDAbw1WAnR0=;
        b=TON8g9Mf//vGW18UVbXPJNHGbM+XSUnBfkqfM/Qwu+r4hft7gOqCa9X49LheSPDrV7
         t6SN9B1Sa9Tr0W3zGi5drJbRs/Cwr+MvC3DSntGWtjffn7k2bckBn0RI7vpyYmNUil2/
         R88Vuq7+cr6n1eAcUwr1ImImTvOBKynE/kXnD52aK7opew3CmI9bkIxIj5+yxwN+plxf
         GG+3cvigXWVKd5whEymM3/rQT4UZRdUWkBD3xTuBHFvwFwD437EZQZpEnSyz+UzXpjyg
         +AmnP3VJQKBSm8PkEdf1l+6n1DgsHAxzmIEYPl+XcqCPAHqBJ4764S8WR7l3V7XY9RSi
         zcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783108123; x=1783712923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vTaFds4j6VItza7UvAMztb4cdgVduD/jcDAbw1WAnR0=;
        b=eUqe7HlDQo7cKyXjkRA0xRdg83cAT3jmrhkwQhc4LZDjciZvMBB+jHRACcfT6JArK5
         SVX8StQNrxc6qZO34/mkRZV8wKx89bT6/3lggA7TW0d/BrRjeKmg/emOnJe6FlfhzDoN
         1Qfyknx9G1oB1GpWESAZMi37rf9cD7y3CNvNXXS380wdsbcOWia25+v6h39vYkHoXKHB
         qVwaVKpsMn9Ne6FsZPL6Rd3adXo9CUgmD642yQDUrcj9CZCAI2G7w0sywG+g9rnQukul
         bqhFFmLAASe5Rrt6OCdfaaUVX4zp8ZvByitZPbv6d3HHIQGgdnsHV9Tt5V+vgrKn2ExE
         mdNw==
X-Forwarded-Encrypted: i=1; AHgh+Rod1KC5jNzf/B0/Sx4WA/9MQqHUoU3Uw/9Fl7HBvyAsutcD2i+VAL1oLnUhHqroFh4476cy0srQEfI9@vger.kernel.org
X-Gm-Message-State: AOJu0YzFtWAXqXgf382Z210fHu8dyg74Xf7qTACZdhLuwTKI2v0mblgn
	nm6VR/lSyE10uueb4kO0gVXgCUJdAR4eAxSz6yfZ8g0Q3FVVPN14BJypuwI57qaZRnIZi8B2PbO
	WLY8LlhKRtEGGughr6aNS+qkgigQf4j5KApPqAlX4x1DWM+ocDp7jS81gxKIAjrLe
X-Gm-Gg: AfdE7cmmNzS9D1Ec8hmZv/XESDyHLC7nYgZaHStw0GXdo9tuMLdadiJ8GpbNIHG0Y4N
	/tDYyvdQtfab2eo2aA4CmtG2az4lfBDE33WUw0Qd5r9SCwkXU1y9iUlU0jcEfAdzh/73Wb3FZ1H
	KMDFydPjC0SFAH8QxCjqHysm6dBMhZIWlAdGzDfImPHVkhoB/1nuqyM0YUrT6qas7pY9FXmYbQl
	uYK3W4yRvhmBQmWSujwrs5Ij5wqmp4Zgn8rzeMF7nJddlOBPzcEldUxOWGgzil4fko5zLae3JU4
	W6Y2Y/dKdjswHZaT2p35h7pPBAZ+P5sTpOkN9FhxmYmyNOsuMl/Xf0T23HPrWaTgHKHGb1zIlZM
	Fugv749aFpIFL1WAFr1vRZRSou3xeIGbH0qXV7w==
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr934563a91.0.1783108122652;
        Fri, 03 Jul 2026 12:48:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4a46:b0:37f:f89a:a1e6 with SMTP id 98e67ed59e1d1-3825c50b0aamr934462a91.0.1783108122019;
        Fri, 03 Jul 2026 12:48:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f290b6bc2sm10065845eec.27.2026.07.03.12.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 12:48:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ge Gordon <gordon.ge@bst.ai>, Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Peter Chen <peter.chen@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        BST Linux Kernel Upstream Group <bst-upstream@bstai.top>,
        Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        kernel@collabora.com, linux-tegra@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        imx@lists.linux.dev, sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 23/42] mmc: sdhci-of-bst: Use devm_of_reserved_mem_device_init_by_idx()
Date: Sat,  4 Jul 2026 01:08:36 +0530
Message-ID: <20260703193855.110619-24-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX9Pc4TsNSJeUM
 7gMgwZ60/ggreSziXh/nAANsEqUDmeFzX5szl3ESnRmFeTP8O9i/fMQ6CzaQOv6MD3sabEOPYV9
 M3rAXUrsY2KhwYoYxTlGi6G81JHRJiFHkyBQ0zFG8mADw9+Ui1B+DAEmuSrVqMEFDjxzlHAsx85
 BqvwUvqqe1UL6ZKzU4PMwkAUSvfXKOqpBzvpSH3FcTnh6+d6i+JzBPQGLzDn8HHRUgEXJBYc8TH
 9Iou6sN4EBNxaUFR+4l+P7FlQSUBPJzByDuf6zvgrtqacgxAAY/5tpWqpTUxiu1cGVDr2iFdRvb
 F45/s98E96B6cGim5X89jYr7O7pBN4V8h7b6yz2duy4B4s0j9WUcGb7lOMoYXmlkvr3saS2dJtL
 9xMYIWDtLZ85CeFsg0lKPy198J15sx7MiPvHKVHOA5LIlsf0j4F2j43agNW+irvPXytFgsi1hFe
 xKzqU9NR/G6bo7/6eVg==
X-Proofpoint-GUID: DMO5x-ZqW47VWa3FapviSB8nf3pIg-QO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwMCBTYWx0ZWRfX+AXyY6Wpdgxz
 ycT3bX2DfMM7COTOhV19zsFeIcZHCUee0sH2rnVdbozGcC76V60pr1ySpPUA274CxCoKnyADNuw
 41VfvQa5vImlXGWi4nJZPCzEtQcxcEY=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a48121b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BxB3lidwPopAx76cZsYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: DMO5x-ZqW47VWa3FapviSB8nf3pIg-QO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bstai.top,gmail.com,pengutronix.de,linux.intel.com,linux.dev,amd.com,cixtech.com,vger.kernel.org,lists.freedesktop.org,lists.ozlabs.org,lists.infradead.org,lists.linux.dev,collabora.com,alsa-project.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-mips@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-15476-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:paul@crapouillou.net,m:anitha.chrisanthus@intel.com,m:paulk@sys-base.io,m:linusw@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:abrodkin@synopsys.com,m:laurent.pinchart@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:michal.simek@amd.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:mchehab@kernel.org,m:eajames@linux.ibm.com,m:tiffany.lin@mediatek.com,m:andrew-ct.chen@mediatek.com,m:yunfei.dong@mediatek.com,m:minghsiu.tsai@mediatek.com,m:houlong.wei@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kwliu@nuvoton.com,m:kflin@nuvoton.com,m:dmitry.osipenko@collabora.com,m:krzk@kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:srin
 i@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:gordon.ge@bst.ai,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:mathieu.poirier@linaro.org,m:perex@perex.cz,m:tiwai@suse.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:peter.ujfalusi@linux.intel.com,m:yung-chuan.liao@linux.intel.com,m:daniel.baluta@nxp.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:peter.chen@cixtech.com,m:fugang.duan@cixtech.com,m:ekansh.gupta@oss.qualcomm.com,m:bst-upstream@bstai.top,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:kernel@pengutronix.de,m:kai.vehmanen@linux.intel.com,m:pierre-louis.bossart@linux.dev,m:Vijendar.Mukunda@amd.com,m:zhang.lyra@gmail.com,m:cix-kernel-upstream@cixtech.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.or
 g,m:linux-mips@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-media@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-mediatek@lists.infradead.org,m:kernel@collabora.com,m:linux-tegra@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:imx@lists.linux.dev,m:sound-open-firmware@alsa-project.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,jms.id.au,codeconstruct.com.au,crapouillou.net,intel.com,sys-base.io,sholland.org,synopsys.com,ideasonboard.com,amd.com,linux.ibm.com,mediatek.com,collabora.com,nuvoton.com,nvidia.com,arndb.de,linuxfoundation.org,bst.ai,linaro.org,perex.cz,suse.com,nxp.com,pengutronix.de,linux.alibaba.com,cixtech.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_GT_50(0.00)[93];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABAC2705543

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() instead
of the manual of_reserved_mem_device_init_by_idx()/
of_reserved_mem_device_release() pair, letting the device resource
manager handle cleanup automatically.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-of-bst.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-bst.c
index f8d3df715e1a..304554ced690 100644
--- a/drivers/mmc/host/sdhci-of-bst.c
+++ b/drivers/mmc/host/sdhci-of-bst.c
@@ -405,7 +405,6 @@ static void sdhci_bst_free_bounce_buffer(struct sdhci_host *host)
 				  host->bounce_buffer, host->bounce_addr);
 		host->bounce_buffer = NULL;
 	}
-	of_reserved_mem_device_release(mmc_dev(host->mmc));
 }
 
 static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
@@ -417,7 +416,7 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 	/* Fixed SRAM bounce size to 32KB: verified config under 32-bit DMA addressing limit */
 	bounce_size = SZ_32K;
 
-	ret = of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(mmc_dev(mmc), mmc_dev(mmc)->of_node, 0);
 	if (ret) {
 		dev_err(mmc_dev(mmc), "Failed to initialize reserved memory\n");
 		return ret;
@@ -425,10 +424,8 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 
 	host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
 						 &host->bounce_addr, GFP_KERNEL);
-	if (!host->bounce_buffer) {
-		of_reserved_mem_device_release(mmc_dev(mmc));
+	if (!host->bounce_buffer)
 		return -ENOMEM;
-	}
 
 	host->bounce_buffer_size = bounce_size;
 
-- 
2.53.0


