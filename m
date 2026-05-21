Return-Path: <linux-mips+bounces-14690-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MFWHVrMDmpoCQYAu9opvQ
	(envelope-from <linux-mips+bounces-14690-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 11:11:54 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C27335A2005
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 11:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793A331BD6A6
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 237C93D9049;
	Thu, 21 May 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETMv0UEz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Otkh8bus"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7FB3CF66C
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352699; cv=none; b=DZiUo9EZjMPQS9JURXAxEfI0i4nL0Vv0zlZXrj8HMWA1Uarw/7CROMSBjG0EuXxAX1sUn5oUQdEnK9tnXIG8CmqA40bI2yNdC7VMIwM3Gyss+mxARr5SjCYLUNF7p2w2depAzWoO5P6pWimXmQPmfVIBxO0sXhPzEMU4SRQJzhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352699; c=relaxed/simple;
	bh=BQp3BJQMi/G+gQE50h68jsUUyT+B8hxHS7036l8NXls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pTKzG8PSBM3u2b8QWlccXa9HwfLdU3jm5kYpGbJPKE740pyMiEASk+tElYgl3X5DnH54+8guTVCLh4HRqHDMlQ7k5CMtSjSJCmoDjszwOhFokVz/xp+pgdBffdhVKe+4YBD8vRkllJ7L8HtxFY4qQPVvDR/Oos7dzizLAe3R4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETMv0UEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Otkh8bus; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7PXPf119026
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=; b=ETMv0UEzGin18yIO
	zOHyP7x8iY+OlWlx9nKmm444bzrPOPxKwh3b2E+AZUBPwvrz34RnxbQiemMT1XNT
	Nzaw5W04hcIM3aShKSaFmTXczPUAy1RwkVkuZEhrNUeN0B0utS61B7jMcxDL1MYi
	dgZ7uJC6QGv2JrzBWVq0ThUYemMcLrNROllJ0Td/q1IjYV23CRsACtchry7AwdpC
	99JE9KQ7duYxULEWMIr5Sw76zn4qf+i8X/kH6sFyOLBk49gRvkPlBf9UP1qGCU2a
	QEyls5Pg9lt1s+gyw3fKGWsm6VpskmbS+g6c7huGknaUwlmF4lft0+EyxIMpScFp
	7tiZLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c1gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:38:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516ccfa109dso1704291cf.0
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352687; x=1779957487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=;
        b=Otkh8buszhLUi4Y4tevtGlI8dYdHpOpe2GwRzAwngpsouynbea3UAef4NoMB3DVpXV
         QmOMmnAVwgOcsYnynd4pVsNy7GWDp4GjWUswTnovmggfvvFLW0i2l10B4yn625Ers8tB
         0WIImoJYIe+3cbTPQfzecCX9bQGdjdVG7fVYBVI5RA6sMFhNfkvYJNz/j5h6FEc/teN4
         h4h94V9UUhMKh6P1jc5i4z9lBye+0jgF9p1ZYEsUkmpzdD2riVRZcxUUE22M11cuaLHd
         jkth4y7+ygn9ER66cQAuHn+n975iEJmsGG9sNPHliT3tExoujSt9JK4TLSHaG/351Sn+
         cQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352687; x=1779957487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=;
        b=aYfhtFrvg1D22INxyF1IPsZ9BaXElTHGvm5aZX6stGgGrodfjvW22VSOC/wrGxLQnR
         Ozj3EBCDsG+COfPunNw6TSzbrzelgPNypcY7cee3A5Ux+2k6W4VKNLAa8RXhC2sfBeg0
         GX6Zv131GMHc/fQ0o1paqCI0Iz2IiRAVGI8xsgS5mLIDb1s1aLZCDLtCJU7LfiDbr2D9
         rDWnL7o3rVCqE9nY35lSXu5vf05T0t6nyiXm+goBlR8nRKdnd5Ta7/haK7sYDmDwLJBZ
         6l0hS5lUcPhWCFa3mANU6/7kE2n4LmqD9ykWUcVt//oPve1DxDgQ8WDAwrMjNU7xa4cA
         hreA==
X-Forwarded-Encrypted: i=1; AFNElJ/4x069dj778rSOePf6pWb9fDTaVvD2FwfuN8IEt/wQ7NDFm3c+SeL8MRu1xbgmUgy+B/3kQVwFyNDc@vger.kernel.org
X-Gm-Message-State: AOJu0YzCDCo8J59ACo2qTFnwedMfGzxL2kxJCNqwC7XvrbwTa/h756MV
	H3CoAr4mj7nwfYEEsHi8aAO0iIXXpLY8oG9v/lWltXzycEMJtBheuMuBtn7+SpKlW8xGQui142n
	opDIgL3DftW2XLx0LX8p+AA/dRA3af4x8+2n8vHgKldfXILpxnV7K17SZ80Kiml9I
X-Gm-Gg: Acq92OHL0KuGoE4t08deFmqQA03+viGiLHtbHZdN+TM6ceuGX94//EIj3xsAmAlg6LC
	v8BcD91u+FMq1dxht4Ts8/9dRzqIF6fSBoZA3fudf5gBtdA9n4vEEIqtDppPCGcRMyb9LHqloTM
	322uuOgr4xn4FVhHTIeW3flSGqqg4t35wYdRdKh/Aj5xENN6X81ScrMrEkKhjDMNacI2i/WfEXs
	UheEB8dn6XGAmjSX7KDkVNXgXR+GHTwoaLAWTDVx5j8JZPJqXI1ajvu7qnXGvb8U4qbAjrmGe+h
	us8uuJ66vF7bNtFAZta9mM25S1ww8GJ8sJbtMyEEiioDiDPqzNoG2hbsZhoNdcHtBk47UgYMnyS
	rwYdoCwrckxccHViemhsbhybY9fh8YL08tGs6W4UUVKo5g/j7DHE=
X-Received: by 2002:a05:622a:5986:b0:50f:be4f:465b with SMTP id d75a77b69052e-516c55a0cb2mr25069171cf.33.1779352686648;
        Thu, 21 May 2026 01:38:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5986:b0:50f:be4f:465b with SMTP id d75a77b69052e-516c55a0cb2mr25068921cf.33.1779352686206;
        Thu, 21 May 2026 01:38:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:43 +0200
Subject: [PATCH 20/23] usb: chipidea: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-20-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQp3BJQMi/G+gQE50h68jsUUyT+B8hxHS7036l8NXls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQtJH8QMbFPV1dWqzeHalCAZ+RpZK0MKHRiJ
 e2Dnj28kPiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELQAKCRAFnS7L/zaE
 w4sFD/43Yx1hMHGpbYfxWKnFqlN/WdgLuFdPU6cY8Np++YZo2rYf3uPGYaOPteE7Q4cL5RynKN9
 tR0Q5pOUhbL/jLv9XdF/FeTDp2Wtb+TtYWM4RNYXfZiLtOcIW1O1RcscMBMDg4SKDXrB9nTsFlJ
 Ets8a398cI+pUsB6ZfjOT2KSJcdnUmMi+G9PftPgIVhNrFawhhoQeIPbZjqlS5xIYc7aoup8q/F
 cHF+pVR8vRKDG1fnQKF7uZujTEhgvA55j3FSZTVCZkxCsBX0/njfg8jh+9GfGikqXOJtpFtrqIB
 YRP/K01aDpXYz4urERxYGVxMrwzGzHwEGh2xWQFo4GyeVir0TahMIMPZogHAdeXd2fwtP0+Lurc
 oF92WGf2yxlTJfSUv88Hf+XvE8g1GANQ6YH6zrRxwkbaYi1lAW7i6pVPyAZsYPHERSHgjP+9t/+
 UJeBVAVjRDPH5bZtRjJSdOzNtuBlEvMbQhzXOo91V7kuzqQjqauwM0s6wHQTd/P0JuKRyXzkBbZ
 2WgOWEzaNqEGJyVsjDv9LxSCs8TCSw1CnD1brSHk6LTZZWG6G7GUcE6KkvtVssqWUr1hner+mI+
 /oFzTOsTFEXIwdUHSm5mfY+fzKnlCN4a0GHwdRITxW8thNpsdc6uikexiFWnwMcZhAW6Q1lW8wp
 aEsUt3Z9Z/xE1VA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: k_JE0R_YgwpG6ngpFvGeoznSe_dtVV1t
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec46f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX/iV3qxgCJR/V
 NaWtsmzZUeZ3Gyg+CxOR0C7LoPGdsTc+GOUDqOok228KB1yZ+pgwp8EE86xUlfLzLjOm2nbiH3M
 1UlLPCd5JvLPs35gZSb8ObEYXn11lXqTozluRhgMVbXfHab30JyZJA0jFI6aSSvmRRn+vNH2h0Q
 B/Gv8Nz7kvrD/8vks1n+S2dnAR8YSMl6PM2zZp8blzLehzm6PyMjAYaEeDd73gYQ8QVee91QyYB
 aaR62pIGsDXMZ7AiWFypfKecqLHEKEMzdrgFFlgmGFzu0+AjxurdJ3m3iWJrq2WKIdqWgV0s0je
 UJ07L4ZqpCUUvxTVrNUFGjlDcAchgkyQnNrCPlaJWBFFIXiIBeAcXpkDqonITB2dmHCU+SME3Qy
 D4pucwFcjvkgGBLVX0VgjO2AeT25OB58b9gODkAFc+uMzX8Xi/MG2BacGozS/F3OZkxQEicIAVM
 NNu60Q4dSm8eejVHElA==
X-Proofpoint-GUID: k_JE0R_YgwpG6ngpFvGeoznSe_dtVV1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083
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
	TAGGED_FROM(0.00)[bounces-14690-lists,linux-mips=lfdr.de];
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
X-Rspamd-Queue-Id: C27335A2005
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7cfabb04a4fb80c6db56ccb430d290dbac61b716..5dd415f42fe0dd026e8a1cc162357e42ba8ceaec 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -888,7 +888,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 	}
 
 	pdev->dev.parent = dev;
-	device_set_of_node_from_dev(&pdev->dev, dev);
+	platform_device_set_of_node_from_dev(pdev, dev);
 
 	ret = platform_device_add_resources(pdev, res, nres);
 	if (ret)

-- 
2.47.3


