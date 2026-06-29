Return-Path: <linux-mips+bounces-15249-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oAbiEm84Qmpd2AkAu9opvQ
	(envelope-from <linux-mips+bounces-15249-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:18:39 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 404A76D8062
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:18:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Q7A1WH+H;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="cW/SHh9e";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15249-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15249-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DAB653028476
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 09:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF713F99E3;
	Mon, 29 Jun 2026 09:13:18 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA33FD94C
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:13:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724397; cv=none; b=sj2Bws4yOrEBPatsVF3EWx37xZyVTiPOzBQocH0WKQV+H9xxRkD4NFH9ozDcAqQcz1UghXiXWnSm4rT68tvXpaAlHR/239O23mchkOPCU7mH6En9+xklh3uYn/e6aqMnevSTFf5Gl8RiffmKD9c3pKHGYe7lXhLfe0mq481LYgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724397; c=relaxed/simple;
	bh=rrDc1Uz6I2aUdO8G3QZmOKFJZ+6purM4q0mZXEAYeWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuMxkTgvdKnVPwUrUDNO0e0+Xj3G18Fawg/1DynoQKDyhcjNSaZbS6B4anRLSWcMlp2DKPe/piknEK/YAw74GVOhBuyp2pn8759/6Z+Jlac26nYIUuzc4IR6mpJ0htjp+ATka93qwpPFr4nxHUUARAyllq91qIPPbBRyV3Ype34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7A1WH+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cW/SHh9e; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xgGJ2431944
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PdwT8nLR+wGOxQU+flamgY8hJjPj2GWlxWbKLJWAUtg=; b=Q7A1WH+H+84NUDVy
	kDlSuaTfa/vDNHD5W+jKXjedHKuT7ZADHpKjsgJObzl6LiN29woI2/c/EVIdiHaU
	ouvLXuPvm3hTZAu8/3JklErXI9fUWdY2naoBi1dOsLbotNAexxbD2MV3NVu77Rnw
	21Wh4Jn+7IES2oRaZoPE4PJz5LXB6ILiYL4Fey3A5DQpRenp+HGt/ConT4BsdQWB
	llBJ9IhMym+GtD1Nw11ufljxY8VJnPyUYPDIONZKGAY1apG6hCEzgWm3W+bTqUEg
	RENXcrOuCvXQer3CV2t2j0K/EmdrtXA4lvG6UReSzTVy+hgcBEp+vs4Q3QujJTs7
	PDaHFQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper21d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:13:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so10369285a.2
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724395; x=1783329195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PdwT8nLR+wGOxQU+flamgY8hJjPj2GWlxWbKLJWAUtg=;
        b=cW/SHh9ePwk0DLEmYGpEh14FfIJSylYl4Cb8t/6vobC3t+iDQ8x5HYA/VlNzEDBJxQ
         WG43Rbz1XdbLlTPeMdsUeXs8+lPDHWkPZYaSuvVnQc4rQuYpXTiac57lhjdnf85IY6VY
         tZn9QgXQ1EJG56JDnwK3crzowxa+kIfHvX/fvlI1hXhPsmRIFVe6XQfhdsTCK8l/PgNC
         9Rl7pq6rimdtxo4DpkwStmRSnoe/iDLyPFYXbS892/01d1k6G9ofiYKEDiDUyisu5n5H
         9a8wbcOG4i8rQtorx1DqvNscZFDnOt5szR7DvKFYcd0c8RW0fzpNGCQj4jcQ5N9fLMjI
         qTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724395; x=1783329195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PdwT8nLR+wGOxQU+flamgY8hJjPj2GWlxWbKLJWAUtg=;
        b=RXnfOjwjF4A3SGbGOO8DTyhzAPr925eycPZHtCSvHhBiTRgAByU29rGBztQJNFWQ/t
         jBJXW5Qp/8+YjRkyxSZBRt05aR+SO2ANp5dU5euEcMQ51/4sQLhipwaj9kDr7U+Gn2Ax
         Xt6VGW1P81fo2Zkl84GM6AoWAz70M+1F6DCl2PZDJR+Ctxk+dsalrK4eH1AmezWYzgVE
         8ASvwRiwgdlaz20lCLlHiQbbwiuAeJbUxwt5DtbMgPLjb6ww9Uu6vjAJDqcx3HGYoz9B
         vjYSqtx1nMERMARxHzwLUgiAyed+dFubKKBdakWyXCjnl3bbhg3ZEVYJsuohXqaTRPB/
         p+1g==
X-Forwarded-Encrypted: i=1; AFNElJ/+bnTE17iYBGA3Oww/h8kdGVSNE9BKTanKnNPRhUx0IefhzFarFRWMGUzngBGeBSK7EivZaSrUbcao@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ5xlwOJfXv7lTiukwovUhqHyhL6ocZLykUcn9M6aztgZhIrBt
	1DXULOrSgYyL3Uts92Y92ffCzZPFv1rqC4oPpZ5YVK53V7tsM1kDZgvcQUSC4XiWc9fZ07rHy/y
	EIxcfDtl70VF0lYewhHDDKckljuNb+f/HU7Xy59iejz0J0k/Heh34CTSFJSIMOqiQ
X-Gm-Gg: AfdE7clSkFitRPhkspoziIlTbjbehzVelSTGApAXLVX/i3SW5ch4MJjBLgOBwaw23qH
	fPGJT56YU9aDTQ4Mj88cR0naJq2D2Oi20UI7Eg9MA332MWtcM0ExUPRlZptkmu9bPO7VSuD0gVy
	P00oVJqjYX4tqQ4rZvv7a7dzxJatYOMFMv01pceWYgAQG4e3tQmE37+7CvW3ht9oX+QcNKpvnZK
	I8QFsAA51i7qTS4E07IZMlJx8mBgZ5809d4znyk9LnStnu9DTUi9xyQfP+ADlRYh3b8jE4vgRMO
	xRXDIPbQtndn4rC1bo1lHgLxoArBPigswIkjEkAdxsVuARfUtpLnlDa99Eum2lK0Ukt4c9YAuYD
	H2120rb3YDh96MOXVb7HvE7JnZgaGTZ8P4u+rkElT
X-Received: by 2002:a05:620a:2591:b0:927:59bf:46ca with SMTP id af79cd13be357-9293cdca63cmr2440345385a.40.1782724394368;
        Mon, 29 Jun 2026 02:13:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2591:b0:927:59bf:46ca with SMTP id af79cd13be357-9293cdca63cmr2440337085a.40.1782724393838;
        Mon, 29 Jun 2026 02:13:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:28 +0200
Subject: [PATCH v2 05/19] of: platform: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-5-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rrDc1Uz6I2aUdO8G3QZmOKFJZ+6purM4q0mZXEAYeWA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcLD++JnQrIX2VzO+dYdToOeDwQeKJ2LBgA2
 f41r81v332JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3CwAKCRAFnS7L/zaE
 w2WfD/wPpjTQ5122QbfNMJ1ncEqmky0pkCQKc8KgH16BI/YYrf6YCDYbVXp4OOhlfZ+AA0amozc
 YlbIHZr8yW/8Ww61zaZ/f24+kXP5qnHaraGtL08YSswqy+bgiy6DYHDY5qUo73sVcHKO5sUkyJd
 VNvTzMspkd/CSHW9IobLoZY+2kWm8E31AIOO/hfDyyS3EQifk8vhfUoNuOK4JQ+Udl2MocgNcXK
 gyJcW5wP7/teYAL5yUwNwHOW2goa4bkxNwYhDjV1m2ha5HM7wBmjMo4nxKPRhHknE26NmoUY/3V
 MVt/rrRKu9cMEw0bVUAg5LpMWATwm6DGIvMMdyUGdCYJ3FOdpR2oNyAPt7c1w6VQ9hw+yemoMsB
 GM0rf3wL6NxEZ2U3n2TMFLsq04TUPNcmqkCPxGoNBe4WDfEoJQOjWTqr6QhpKRhjanbvLUCLhnG
 C24dqO1si0SdYnqmqfdJAtp2HtSOy3jb3n0S4scELZMX/cUKTCUyKAyESPlXE12RQk4Y4kjHrQF
 klKXae+vS4MilI8Hxo1/p0tl31WhBiLnQx0NO9E8f895BW3R7CYmGU7OAlRsZlXZaJb6J2MAl/p
 N3t1e8+eIs5bngjp6talt1GoO0x1cZpCIGKELGViK+k99s1krS/BpZ+cZiesq+H5lGbn7cCw0vr
 wkNrdcAeGiShgow==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX3TR6zZfn0CGy
 rjIZMeNlMXpGcE76Kfzlo3GEigC+7IukYUyturS37aBfVhXG7AWz8VbNi/Zs6rw/D/OaQq8m8Qn
 6J4Q5mFz62YgZpI1IVHJ47cx8BxqAyI5wAshluURRMMpDX8lbBslltXRgWN4sb8A8yk/T9z/Gdx
 s1yGEO8EjtTCqHEhOAAEGfetwdFPnoKJLUz4mrI4ZOpj5LJokcVxZ5R7pSQ1bFabnHtfwD5MGU5
 aJA/dOMVNJSMliBsmxE2hleo4r+FMTJz34M+ahs8ytywOf8b1O3b2uAGXDoa+hLFTEBm14dCkce
 QVq/KGm+FREctKCBeWwnQ9WBzXxmB4kwhOyq2S1vgAHp39YwH1rYYlcR6TijUEJ6M6EQzDj0AmV
 0HjSi08X232iVX+HAad/IMcqZiTl791OQTdLT01j/WoM30JkZHFps2MbLl1dLPfXSEM2Y/Ij87x
 evEm4DLT59r6NTBSI5A==
X-Proofpoint-ORIG-GUID: p5wj00CNr-knKPzuDeDPg8gzoGFyRwVd
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a42372b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX9zzZGXQ02ser
 O3AxMynp4oXg/OU/orRRrRJjSnRBqwFy/IDn/7paJ1sl7FBntOiJSC3L+PiwYKjqSAUsX9C5DCb
 0ftauVwO0JXFKu5M+IHb3gG+oYgS7N4=
X-Proofpoint-GUID: p5wj00CNr-knKPzuDeDPg8gzoGFyRwVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15249-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 404A76D8062

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


