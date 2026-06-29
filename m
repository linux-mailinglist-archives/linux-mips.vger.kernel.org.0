Return-Path: <linux-mips+bounces-15263-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id R7ISDFg5Qmqq2AkAu9opvQ
	(envelope-from <linux-mips+bounces-15263-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:22:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B56D815A
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:22:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jXRgvZnj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gZMRTppp;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15263-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15263-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E6D793037818
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 09:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B15407CEA;
	Mon, 29 Jun 2026 09:14:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE45407CDE
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:13:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724440; cv=none; b=EKF/Qb66P7Ff9i5UJU9EHazNHGi3x8mIHCCdLajUBe+PGzIxM5yzIeqcRMVE9v2BS+iHfjjYlqB7Jye/qaP5EI2HoeCGiYKLZMFXtp02fPOc9GQ9/SsiaMFJk/7MMRXG7fbxrT6qRsvPdiRBYl4MGyhXZfItXzKyPYnpi8XnhS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724440; c=relaxed/simple;
	bh=VEyUxYLMr0/kZUc3hQzqiXRE39K4YPDPrI9dGBJJGzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vq8Hs6AyhxY8LOY3oKbkghf1VLgI1bth82p2DpdHmx4wDAkWVjiLGQOODW/OBdLaViOByBG3I9c/NiCxbSn07beB55PWn9+2nprhdvEG1MfjucnjkOflmi5lH7qC3VY0ohqIuuxOLr6uaMXQwPAbD9mRcUio+GCm/Idic48W+nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXRgvZnj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZMRTppp; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6qv872076267
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1CXheUuAMODxr2cJ8/mrzTf3yj1wuZdPj+yzX83Vyc=; b=jXRgvZnjw5GcHWfE
	EdU7pqnfu1aWmT1Qn83DNUkYLXZwtGxZctz5Pk3eozOWBd2IJevGjeFy9d+S2RDI
	b3b72IXqCckD20juun7ZhHEfyVD5nJtyyHcSQOMo30hCVGZxHgHELkthlpER1Vz6
	0Eb5Qv15bCrjQT7N9QhM13gtQQB9/4AUtNto0lbiDQOJcoHuuSzbNTdq8XEOHe/G
	c2tEUTwdqe10fVkez/t5upUYrbnnxsM4T48AAdSfvA9y+NZG3EJ0istb+YJ+knp/
	bBGVlhKOwCxw3JF+ZskQRCKUV8AxFXwVEJSQu3IZqDJMPo9bQBuN3xDFCfueJBvB
	aptFDQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gksw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:13:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e4f27f49bso110733185a.0
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 02:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724437; x=1783329237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1CXheUuAMODxr2cJ8/mrzTf3yj1wuZdPj+yzX83Vyc=;
        b=gZMRTpppEaLKeUo06xOKwzlXlReSucogsneGJRGzBqVvZjzOND4zuYc+PFutGryoOH
         4vIM5ODY34T+ZMWjRwjVIK0swCIuFg0+mTywfkG4wjanoyoLGZp4hu0WIAWwmk7NqNO3
         Ap6uc3s3RASxEAAWf1zjdOOcFiENbMsWU1qF5POQANfRMxUhgucJVqN0VfMaRiWBFZZs
         LSc9ldnWir0DYpmablzkehTnxubjFOzEIjNqpOFB/EGpCGqad+atmLq1dycMU/JFx93E
         /WMvtu7ASww1AqxA0QdmmfaVyV1Yt7zl0GGZapDA1xl6wvDCrm464J/ssjiA45DFTTxP
         o0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724437; x=1783329237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1CXheUuAMODxr2cJ8/mrzTf3yj1wuZdPj+yzX83Vyc=;
        b=NF35HcAw0R9JrQIQ7Fbvu+KYnU23WUqvvCtjzExbHP2bAjeKTI15XRaFznbEkPTWMw
         l9PQQNGXG6qWHgQ6f82qda7+SIcZ0o1qLUR9Ns9i/dYmc3s8hm5UZzfwSJOh3Kkqu08/
         W9/AY+WEO2bRNgoXykd0T2qj8b6JslmAkqzhY/7Fb9dMjBuPDCkqgmrQvRCqvwVNex8y
         XutbtbKsVSj0yLY68S7NoL/x1pcX9q46dShof8ROhBDzjGo9GlmL6IbxbbGInk0Vu/C1
         C9T+dMAVYq4T/fuVNgKJeOO8F/KhThcE1t0L/QwWgZbEviEvTAn5YMIIkM7cWh5p9qR8
         H1KA==
X-Forwarded-Encrypted: i=1; AFNElJ/qPkDiKxnnrcMfbkRfZ7gqt7M5MRdCsUd4lnthFI4kDMSXD19qnfBYECH3OVehjoLVF5re3R5Y7m/x@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6LixWE4yfUisN3gMaXGFgfBNLCDzxKZ5dANz5OqY+3t4I6qvG
	45pE5y/yCqIKb6ihRdYFDlQHFHnGk78/bO/hLNSnLML+qqcWQ2SXSxGwwq7pplQd/zSbkm2JtjN
	h7G2RkWYS2EZ43dKra+X9ZlPrxnkcsqv1kn4nVGSvee0kQFLqScfOk61zgO9SXCHc
X-Gm-Gg: AfdE7cmRbQqJGhkUzzyx7y94HqLeVSADYXuB4FM3MKepj3qcaIBug7i9tW9g2uc9gbE
	kBvsDb/6DUn5rHzwgVJ2L3MlTmamdZIKIoTBAw3rSpVf/a1crgqjf8mpGmDxk6B3iL+FUrfG2/v
	hge6tsgxUVgrfyCIh8KBnMAk/H975wX1br4fTnrVkdtrhBUtq1IZ7VhrwWEFHM+6/B0fjeHBfgj
	SlovHPqyWOj7i7nwNbsCxUJGLqaH7NEUS567Jw3VbGI5wLTeIC0kBD/Vjw0SLx8veEYZqRwosIa
	ef+b6UGY+UV8ppHLheWex7fH3bsdeM9bV9jKjctGMDQk2ha+EgS4Hj8D6/v3rTPAAoYx6zXsiyx
	kHBgI6TVtbhCPzZAzFZYGGU5/Loe5v6qEKWDJED+u
X-Received: by 2002:a05:620a:6499:b0:915:9273:9239 with SMTP id af79cd13be357-92b3b6eeaf7mr1315076685a.13.1782724437387;
        Mon, 29 Jun 2026 02:13:57 -0700 (PDT)
X-Received: by 2002:a05:620a:6499:b0:915:9273:9239 with SMTP id af79cd13be357-92b3b6eeaf7mr1315070685a.13.1782724436678;
        Mon, 29 Jun 2026 02:13:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:42 +0200
Subject: [PATCH v2 19/19] driver core: platform: count references to all
 kinds of firmware nodes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-19-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VEyUxYLMr0/kZUc3hQzqiXRE39K4YPDPrI9dGBJJGzo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcV2ZO/mjVvS7fscrieifMk6bWNF2AN6BkT5
 4dxIfGu2nWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FQAKCRAFnS7L/zaE
 w2YpEACbPZSAaWOfh+OuT1Zwlgz+BsRRZZy6cDhBoTiUeYqKdcPmZxipz2TsAMuIlfYPKLh5abm
 46zQkAaG1vtOnsxm9+NTs1QAQ6xkDAoZzhIZMDHqyOPOoG8Gr+0mG5poyrmzhIJ2gZetsvDhSUg
 9BI4HNO2Ya2KjeYG+sFBfGfeJBAYbg81BgstPscXYSUTtblGBlW3R8dYSpD0xb5mS8spl+VhdDC
 3Eyi1jA28rzmPeRic1GeilgXo2ivpXQ1UGz0YeY2OdeZ5bq39rMU95OrW8kxMNV7LqUcxiPdxrK
 +fmmam/m3oLoXNKVFHp0LsKRGjrxZAtCV1oUDuNsQJqoEgaj695Gpkmr0wyk53BDm+QyBQTKJ5a
 azgRvH9HAuBxKvtCV+7ZH9BC/fDFaMPQ1RHKQWg5aIVDBh6TePB9H7+5enD4z+jF2LEogBad/L2
 GCZHbciAEbPm7xr2qYxHLMIgDFckOP8wAQjTjPZzrk8O6H/L1KbIMZEro0kRYsSBj/ofkZho6tT
 2RFWYf+OCFS23k9vsQNHX6T08a2EQEIL7w6cyBp1iSio1pHhuMvlvnT1iKOkYXSPxDK1FPJmjOi
 NZ2QX1sApJPEihNT9LGA6nRo6KyHttwNCAeYh/bhtKB4gUErD3iL6L6N2RotJIEEZbbdzq5OQma
 y6IZyLYWBBndyZg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX/AiWBBEqrkmg
 IZUeXoDIErBSgKjvvHihbeVh7y1qZpVWZEoVMVGcZArms9c+pZhgo4MvjH3Rmhzu4ZZx3kGhJ3U
 QJeiZQ5Hoe8JuqSPxLZJU2+gs759oAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXyB06jjM0PxRw
 uZR9TG39gaXPLVrGSXJWpXWira7JlD0UAb0S1FTNkaGvx3Ppjde7T0mfL63NZRJ3sycFA754nEE
 AhRXv6zDo+3NNjCGxiCXG+Kicp/kiakgRX22a+2Mt2QEXZ/4IYkyLSRVicxcm+Dp7jjf8W2aUQf
 Jkl1saTxJam6t4VoCzE/zV0GVUlJNh2OIVkchwspr/PXHlBk0xWIC7dOVKyAG6IhZ0pur8FOGJw
 kTvqq2pyfoK4kf4i9rnYlAF3IJiM3OXLrwYp4LGhA33tsG7kRnQ/S33nADNhoCrPT3P4eVzlJvD
 ng4/Fjk+UL7mOYbB+crZBQG3Ng5Tt98uR/oVkrdwk8uzzfqxEvi9Tsz6JSmlda8j+BcY0dzCzyz
 Hgpfd2iPcYL0qL61LK5jHHkbUcauJUELW/QuYXELfAQi9VRUgP1BRm31aYBsaI2cFqeaOVnQApV
 iWc6JoEkkwsb3GmttUQ==
X-Proofpoint-ORIG-GUID: gg8EgZfQW____AdiSsZszwNQVJm3rqzY
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a423756 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2sGp0kyKjRk1obZUzdUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gg8EgZfQW____AdiSsZszwNQVJm3rqzY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15263-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pdev.dev:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[66];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB7B56D815A

When using platform_device_register_full(), we currently only increase
the reference count of the OF node associated with a platform device. We
symmetrically decrease it in platform_device_release(). With all users in
tree now converted to using provided platform device helpers for
assigning OF and firmware nodes, we can now switch to counting references
of all kinds of firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f24a5f406746b53ca9eaab9472f6dd1345e04ad6..bb5f5bddd047d4ec6f238e36dfe4f4ea36b92a76 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,7 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
-	of_node_put(pa->pdev.dev.of_node);
+	fwnode_handle_put(pa->pdev.dev.fwnode);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
@@ -705,9 +705,7 @@ EXPORT_SYMBOL_GPL(platform_device_add_data);
 void platform_device_set_of_node(struct platform_device *pdev,
 				 struct device_node *np)
 {
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = of_node_get(np);
-	pdev->dev.fwnode = of_fwnode_handle(np);
+	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
 }
 EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 
@@ -723,10 +721,9 @@ EXPORT_SYMBOL_GPL(platform_device_set_of_node);
 void platform_device_set_fwnode(struct platform_device *pdev,
 				struct fwnode_handle *fwnode)
 {
-	if (is_of_node(fwnode))
-		platform_device_set_of_node(pdev, to_of_node(fwnode));
-	else
-		pdev->dev.fwnode = fwnode;
+	fwnode_handle_put(pdev->dev.fwnode);
+	pdev->dev.fwnode = fwnode_handle_get(fwnode);
+	pdev->dev.of_node = to_of_node(fwnode);
 }
 EXPORT_SYMBOL_GPL(platform_device_set_fwnode);
 
@@ -921,8 +918,8 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		return ERR_PTR(-ENOMEM);
 
 	pdev->dev.parent = pdevinfo->parent;
-	pdev->dev.fwnode = pdevinfo->fwnode;
-	pdev->dev.of_node = of_node_get(to_of_node(pdev->dev.fwnode));
+	pdev->dev.fwnode = fwnode_handle_get(pdevinfo->fwnode);
+	pdev->dev.of_node = to_of_node(pdev->dev.fwnode);
 	dev_assign_of_node_reused(&pdev->dev, pdevinfo->of_node_reused);
 
 	if (pdevinfo->dma_mask) {

-- 
2.47.3


