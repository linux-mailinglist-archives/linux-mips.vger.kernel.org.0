Return-Path: <linux-mips+bounces-15244-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K1g0NYw3QmoJ2AkAu9opvQ
	(envelope-from <linux-mips+bounces-15244-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:14:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 844776D7F5F
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 11:14:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=REa1Sqeu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Srx6iECG;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15244-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15244-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95CF6301FB08
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 09:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16573F9268;
	Mon, 29 Jun 2026 09:13:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF833F871E
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:13:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724381; cv=none; b=GlH2k7mu4GLBGmi/BVr7H27YM/RfOTRLhxh227m7J3iOi/mT730AK+KqxNxu3yHgCVKhNDTTBgJ/4ltZzNxiG8yZZQLQLobijh81kpJkWkIDyPwStN9Tg0tdRdlpO5J+o2zymBE/Qc8KiO1iRI8lqcIM/T6eDLL72jTnEV2tOzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724381; c=relaxed/simple;
	bh=SVCO5gWvclBRpZDymBp3Xgi/Iwkz3WPRgBlCjAVpAdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ooo236vO8J94xApydSUu550mUcRWi05doQEFdVpCFP+ar96dZXrN/G223wiIEsxeIvvYd1WfVMuuYI1Tfag5FqD7qJ/cqnKjgfo/k1U19WDTXzFyEp6ViIczUZLlfTqB9LckUfp/w3rg4w7k9CfpSZJ6QLx9I13BY1qqFt4GcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=REa1Sqeu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Srx6iECG; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7DqqA2188734
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9pHsHj8j3f9AJ4gGh3rvQi
	L5ZcEANVsagK59YcLlw7c=; b=REa1SqeushWSQer8aXnmzptQdlYOnad/KzZIbr
	rVjM4xb7i0SX74d0nA2b+w9XRvBwQkqhep6aT+ltZ1ouyDakYMkRa+VyocWigHdo
	ECwkr5q1JXG7+mfowPxSQdQs6XgnFgiHD2IUwclaJNx1g9ZF02zxTaIFo6yBhq56
	Hf/eR9yqJ/wbPWGBiH+qs6pHrsCT+T18AtHMuqpDZMwZNXa7J8/pZ3lT78YJWlPO
	BYhuTeqodcjSJqaSuoP8RudOhsInRwXgPAPoYeft1FxenH75SlwxfQp3KgcyJJrK
	52n/t2iwdFpv0jMUlhS+1DragxFC2Cru9FOYXkTn8lAor5kg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4trfys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 09:12:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b4b575561so537208085a.1
        for <linux-mips@vger.kernel.org>; Mon, 29 Jun 2026 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724378; x=1783329178; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pHsHj8j3f9AJ4gGh3rvQiL5ZcEANVsagK59YcLlw7c=;
        b=Srx6iECGiZQf+3VHyrw6QbE5BkKBhbSmVpKo5wRrPyG++wAJf9BQlVk2EAnvLP/vqz
         gNrGnakXKToy8K6NI92QB+1YNctIzltWdjTX31LjRHXlT/064AgmXfuyjm4oNwPJNHf3
         2pj8w1a1WU13bW6n6ZU1df7JFOZM/69764vgl7QOvpdC+9zwpGLhLrThIxnuwhl0N/f5
         BeP3SmcCS9lShalGsYbMFo2Nn3/04XsiCAmD4RSMLPphSLksAzIog9Z0iqMTRc47BPa9
         wHQI6Y+6xS1u64iBg+I2y4VuF9bZEkakcGd0/zjTCHYuRw2iub2Fq1M4TWb6lv84l606
         OmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724378; x=1783329178;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pHsHj8j3f9AJ4gGh3rvQiL5ZcEANVsagK59YcLlw7c=;
        b=A1JguIjKqGN5f4cNZEg8PCeyXdNrPrxpXQQSUPFmjzKqpyxZkGunf2k1boL8PCFls/
         KeNow0eTMiXvp/GJvLoAW31SdmnBTjfZxslGzN5DACFyCa2gqzWfzWs9i06iCEigG4Ne
         dile4lvIvRa+BWUMd2Mki7N9pdsdyMlZZFS7yvdvmHcR5PXiYlpL93pkQ6RU1l7g24VU
         Epd9M2TukWtdx0FToHpfdDTe0Aejr+y+joR3FRFFre3Ux7XPhL3fp6KABWn3Snzo9TX1
         lft5cSUt+p0HeDdfbRwfhEFjWHFrdeyK1rM3MCHy8ZgQ01/ZqeHFgSok3csMnKc17QR9
         CGOw==
X-Forwarded-Encrypted: i=1; AFNElJ+vSPLobdbdPLBDgRncq0K+wkrcq6XyUzbweX3kpHPhB40/QX5ZP6VRRLa5BtATjwVlb/j5PRQ5u9lu@vger.kernel.org
X-Gm-Message-State: AOJu0YxkB8YNScHdEyrlst9NNZJsPNyF0qhCDCDvP2qVc0vFFuw6qvGW
	TyUMelaYlY07UnFo2xEj019sKxkk2pM6ZAu9zTL8K5FtVTJeNoDiaczOthD5nrnJDi2q448syKr
	6Ge27bfYyOMG+NT26xbM3oWEXcpBXIOCP5IGa5x9BGjzKyzpYNo8JYZCO7IxRfReO
X-Gm-Gg: AfdE7cmxDGI1Kewodq22yGvvXZv3tGmVRYRbIpqsu38ac2dyuznVqFn6uGdPszfFjId
	NwdyWa18M+yQSdcAgWuuvH4XVvCV/IS6cBgqkDzVJ30+d5lRy/QesV3KkecalRC2NQIyvUguiEZ
	gEtVcnNRoh7I8ZxT2scI+O8WR8pJDSgMEEBypi6PRBKlqNTGNpfnCGVOcl2CDebFYFuGsL6h6eA
	RYc7GzgQ80VHSFEz7ocpcq2fNY3IsZdVakRwDzIW0Nu1RSGPwTCl0TPB3gL58P3WF3z9n+OBA0F
	VnJ+wh1OcYP2uOcQY96iggU8kMg5VDqwNLFFG2mxAdxIkIvYJnY9tvLFaAoDtVHcU3gJaz2rtzd
	gKxv6C9Peen7vkAYjSY+GE/QHgzgxu9sX+FkKbekA
X-Received: by 2002:a05:620a:4693:b0:915:fc16:2ae0 with SMTP id af79cd13be357-92601f1b941mr3700623585a.25.1782724378004;
        Mon, 29 Jun 2026 02:12:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4693:b0:915:fc16:2ae0 with SMTP id af79cd13be357-92601f1b941mr3700615885a.25.1782724377393;
        Mon, 29 Jun 2026 02:12:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:12:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 00/19] driver core: count references of the platform
 device's fwnode, not OF node
Date: Mon, 29 Jun 2026 11:12:23 +0200
Message-Id: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPc2QmoC/2WNQQ6CMBREr0L+2k/aolBZeQ/DorQfaSIUW60a0
 rtbSVy5meRNMm9WCOQtBWiLFTxFG6ybM4hdAXpU84XQmswgmKjZQTBcDEUcnrMzhJ4GNLJuZFU
 fG0495NWSS/vajOcu82jD3fn3dhD5t/25+J8rcmQopa7EXvFeGnFyIZS3h7pqN01lDuhSSh80E
 UEUtQAAAA==
X-Change-ID: 20260520-pdev-fwnode-ref-d867836971eb
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
        stable@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4368;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SVCO5gWvclBRpZDymBp3Xgi/Iwkz3WPRgBlCjAVpAdc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcB3e6fvH8ZvfEeXy1YHmy9qNmpXNBrMB4kt
 LmEukvHaW+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3AQAKCRAFnS7L/zaE
 w40lD/wI6sh/lZCL9bUVUVfhXHR/FqEMavHUiaEtY5IReyg186SG0Mncc66am9ylUTBeWqQ/Liw
 PzdetjPKGkl2mRBV79p59svntSoPYTxm6bDfJPTylBULVfRbMV7zUX6GR1R+9sMsAdjQHtttUXf
 ZBYlTf8+D4tdCF3nYWHuDG6oYuVSuhppnHyCuIBenJainf9Et2R1oilvSiR6Hk44dtysCxxi138
 A6o/fQNZwJLNbc3o5niJuwb3gwBibFPBM4cUBQAVUlDHNnBKyZCxcqxvDR5Ded0FPvaLw4EoqSz
 Gk3oBMfE6C7nlRN1JjX9mIG6cMstinUsYDiLYHKq78u4qimbUdoG0ZCLgugigHzUfVQzn6Dk7jq
 iO+7/OLu8FPESDY773Btr8TTJIEPdZtDzxzBMfpVVf61+me8i7ek7mzZjdn5o0vlajQPr2sqeQu
 GU1drfykhuySyrVsiDuF5zWfbXZg6txYZ7r4Xxxlr2oR5fqMX+olKS7JxDu5bUDCkONRb2obyvO
 aFVU2bR34ttE1KlDGhTcuXUbyvTHH4mMDh4sHOCLfxYHwZgXl8Tx7JwiJ0biQHhZLEwRAlBTImw
 4dVDIoHBWFRybmqNGjB4p+CCdmZWlRuXhakcLbWo01E6rCLmZBNphAu0jdgsDfCGFnENlKAoNdd
 L4/8S38znNlGEZw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX2giETc29OUnT
 gAx6Ila+1F1xqN44r4Wsc3milVBTEPqXk+Q6FXtrB9Fs4/1pk9ZYB0HogmPytskbOqqani8eEKh
 dXNvyO+RSty+9d2CQO+2+PKC+Jjs2ICOJ2XwfRRhC4M4N9y9uIHreFMxl2+1XjeV0MsM3Bi2TlY
 mmxWSe+cIWCJ0mPFyxeFQH7wPsfWf6yGdawiZgSMny6vmUb91keKy3M1ioq06aB9NrkiJQ4j0rA
 LICg56SPokDF38tgLPr2UeZv1iDtr9/qJxgMXmixqsoHkM+CpbUGaHwr44DTiNZSfhjmww/qtPD
 5EQxcN9YpVgsQk0DyWKCX8KL1JznzBxoUOHxegEGgnupaZHp7KMXCikSHiCbQyFjCK03cI5bZIW
 poqkH8NJZ37XQUN+mFxU8K+W3vYPIOGHBDJcchY0A6mLmWdF3iEr/6FbKbbrteRzgSt0sBRvmRB
 PIdqRqX/gdqBD/sc5bg==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42371b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=rL0NY73m5x218zCt0XUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX25dLrJsGEN5O
 rzZow62GU9TrXjpKl4LFoNCw+KghOpfEd96dNzYFnP2P9W5aB1HycWESbGSVElujJ/Kww8PccnP
 6Pigj7D9x9O7a/YsV3nFTm7R8y/G4pI=
X-Proofpoint-ORIG-GUID: yt7C_M38psxC_aP8P0pZucF7A2UTGwG8
X-Proofpoint-GUID: yt7C_M38psxC_aP8P0pZucF7A2UTGwG8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15244-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:broonie@opensource.wolfsonmicro.com,m:thierry.reding@avionic-design.de,m:sebastian.hesselbarth@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:srini@kernel.org,m:gregkh@linuxfoundation.org,m:vkoul@kernel.org,m:rafael@kernel.org,m:dakr@kernel.org,m:robh@kernel.org,m:saravanak@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:andi.shyti@kernel.org,m:andriy.shevchenko@linux.intel.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:opendmb@gmail.com,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:ulfh@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:rodrigo.vivi@intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:peter.chen@kernel.org,m:paul@crapouillou.net,m:b-liu@ti.com,m:p.zabel
 @pengutronix.de,m:luzmaximilian@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:krzk@kernel.org,m:benh@kernel.crashing.org,m:brgl@kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:driver-core@lists.linux.dev,m:devicetree@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-i2c@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-pm@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:intel-xe@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-mips@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:sebastianhesselbarth@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[68];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 844776D7F5F

Platform device core provides helper interfaces for dealing with
dynamically created platform devices. Most users should use
platform_device_register_full() which encapsulates most of the
operations but some modules will want to use the split approach of
calling platform_device_alloc() + platform_device_add() separately for
various reasons.

With many platform devices now using dynamic software nodes as their
primary firmware nodes and with the platform device interface being
extended to also better cover the use-cases of secondary software nodes,
I believe it makes sense to switch to counting the references of all
kinds of firmware nodes.

To that end, I identified all users of platform_device_alloc() that also
assign dev.of_node or dev.fwnode manually. I noticed five cases where
the references are not increased as they should (patches 1-5 fix these
users) and provided three new functions in platform_device.h that now
become the preferred interfaces for assigning firmware nodes to dynamic
platform devices (in line with platform_device_add_data(),
platform_device_add_resources(), etc.). The bulk of the patches in this
series are small driver conversions to port all users to going through
the new functions that now encapsulate the refcount logic. With that
done, the final patch seamlessly switches to counting the references of
all firmware node types.

This effort is prerequisite of removing platform_device_release_full()
and unifying the release path for dynamic platform devices using
unmanaged software nodes.

Merging strategy: The entire series should go through the driver core
tree, possibly with an immutable branch provided to solve any potential
conflicts though these are rather unlikely.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Rebased on top of v7.2-rc1, dropped applied patches, collected tags
- Link to v1: https://patch.msgid.link/20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com

---
Bartosz Golaszewski (19):
      powerpc/powermac: fix OF node refcount
      driver core: platform: provide platform_device_set_of_node()
      driver core: platform: provide platform_device_set_fwnode()
      driver core: platform: provide platform_device_set_of_node_from_dev()
      of: platform: use platform_device_set_of_node()
      powerpc/powermac: use platform_device_set_of_node()
      i2c: pxa-pci: use platform_device_set_of_node()
      iommu/fsl: use platform_device_set_of_node()
      net: bcmgenet: use platform_device_set_of_node()
      pmdomain: imx: use platform_device_set_of_node()
      mfd: tps6586: use platform_device_set_of_node()
      slimbus: qcom-ngd-ctrl: use platform_device_set_of_node()
      net: mv643xx: use platform_device_set_of_node()
      drm/xe/i2c: use platform_device_set_fwnode()
      platform/surface: gpe: use platform_device_set_fwnode()
      usb: chipidea: use platform_device_set_of_node_from_dev()
      usb: musb: use platform_device_set_of_node_from_dev()
      reset: rzg2l: use platform_device_set_of_node_from_dev()
      driver core: platform: count references to all kinds of firmware nodes

 arch/powerpc/platforms/powermac/low_i2c.c    |  2 +-
 drivers/base/platform.c                      | 56 ++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_i2c.c                  |  2 +-
 drivers/i2c/busses/i2c-pxa-pci.c             |  3 +-
 drivers/iommu/fsl_pamu.c                     |  7 ++--
 drivers/mfd/tps6586x.c                       |  2 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 10 +++--
 drivers/net/ethernet/marvell/mv643xx_eth.c   |  2 +-
 drivers/of/platform.c                        |  2 +-
 drivers/platform/surface/surface_gpe.c       |  2 +-
 drivers/pmdomain/imx/gpc.c                   |  3 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c      |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c              |  2 +-
 drivers/usb/chipidea/core.c                  |  2 +-
 drivers/usb/musb/jz4740.c                    |  2 +-
 include/linux/platform_device.h              |  8 ++++
 16 files changed, 84 insertions(+), 23 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260520-pdev-fwnode-ref-d867836971eb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


