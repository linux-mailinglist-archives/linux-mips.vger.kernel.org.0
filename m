Return-Path: <linux-mips+bounces-14677-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCZmJ2bGDmqzCAYAu9opvQ
	(envelope-from <linux-mips+bounces-14677-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 10:46:30 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 548C85A15FF
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 10:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02860302960A
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2026 08:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A03D361667;
	Thu, 21 May 2026 08:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djQmFj4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1pm9IoU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B713A6B70
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352645; cv=none; b=E2giBNxY8lG5WpWZMh4zxu1YZY2rX9Bft/TIMRJpOPMfE2r+yWdLMxHZENa+TYlnDLaWmgdBxOu1nfgGrrYTjPwHR7eFrmv0Xs99+f3gZ4IJxA1PYok8EYZLxZFIUvO+xJDnSdgNtPh8NnNWIRGh5oaTSdGJIMvLUOq4khe1s8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352645; c=relaxed/simple;
	bh=S6soBSVe9KjUpY4fV3w6m8V++eYkYCwWMWeUkaW05Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=biVIP8naBTt778c5Cs8jPFUoBVeDTAH1M7v/Oii4hpzel59oBl/83lgOtgCPDLhJ45ZcTvMydbtnp47V1R7EolG3w+ZAxSVVZVk+/Wh1qRL3tbod8eJ5B1QKLABL5pHn4geYOQOU02Tv6O9VxrnAEgPe/Zz5o4XN95vT9pOFA7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djQmFj4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1pm9IoU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6IdZH3680289
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=; b=djQmFj4O78Kw61Af
	ZTRwyYsSq1FlwApquXAjrrMNV6MDYgIBSnNZiRtCqTVIosmFcxjAkb1ty/75WjCK
	YhtUfvmst1pJLM3GcrvSe0ezIW7Y50K4lTYcWo33TJohgKYVSUOZ+WkqzTwOCbCo
	gSbIPnGGTI5VqDzxpucso1RxtjGPhan9P3mqO4xk4xxPWE95nTbckAEOX/Nhkh6A
	zpCTWRZMwjoYJuZP0mtrLG2RWeFPWj/XrmkVB+nJYoKeg7L7a3JorUpO1077eV9g
	V9PdzC9QKLJxRsQUorxPcY9EMEzc++ifXfG4xJzguDOQbn218aeX2vyAagWRixO5
	w5qyzg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9e9j40v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 08:37:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516879bf1a7so158277041cf.1
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352639; x=1779957439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
        b=g1pm9IoUkisOblTKuSD5RPORrrWDPsOqAUx0N7Z84R0Zad0jgM5L60FSiwJ15zmL6R
         KIwezllm8VsIzk8OwNd1SYHRJxyu/GexUuiQYyanv3wozeoQVXF2vrs6xcJEr3XRQVCa
         JNWKXehnjEYZayWxtxus4ol7G+3CCBoS7XY9JFlOKDU3Rbg7JVPxphcelxUZ0NCxv+YI
         NmCSGz11wlSJmzPXdyUkAVgLf8yiA0dzq2GDnCWBmTm9d6WJuaO7nH8C117JcKGJcTxt
         B7yWiDSYAUdl74cYAUMfc+Vo520G6r4pOeg5b9PsE3pbmekuVtQQoKf9hMSkGzS+JUrw
         LHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352639; x=1779957439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
        b=lQ5y3nSh9G45ZVZEWjJBaBMZsNVhoi/aqY0cvfjRSBckhTCqJSESEBhRiaqpZRiXZJ
         zHqxDSbgMu36aerhTIn8ExjETjM8xDKrXLvJFp0thn42Ox9A3EtcJUcsy9A2pSwLz9+l
         szci9S2/uwee2sIA5N/QxpIfxv9sOFQD9vg5D16IBr2T3h3wqHmFXxN6zbLvnhRcTLkx
         KrJIqGngyMyAWBHQVijXWSvIkkRXItKW0MGxRYWt7bKDDWRksqjztCRA1ey1JKp3wADf
         19enQxjCICJeRS7RMuq2sfBCGCYHfMZ9NA+chZgsJ7e/UCKHpEhbfOLumQCHAPKaOhcC
         fupw==
X-Forwarded-Encrypted: i=1; AFNElJ8eDaBmE8zHfoYORK/Z+AkUrMvBkvqadNEfB5P7rIrQ1xejnLzkwUITSkDS1ZmcB0njxdPwei/IejXX@vger.kernel.org
X-Gm-Message-State: AOJu0YzcB7GN+HKWnAY/ch9bBpBHSxhGZcU5BiKW3zfI0q6tjBq+3hWA
	xxysl0KP4z+F0VEd7HX3XszBgLvJtQeOnucBemTgCHssXTpgw1PRcUHKOv3/Gnbsnm/ZaFrNMV9
	YIAXxNPQbJmtFg9pfefpsAXyK6XgeQbLwxkNwN1iy4Z9dDLvxqocKy60yB2Z5/Zuz
X-Gm-Gg: Acq92OFZ9qnUFpdkj/3lBi8HCPOb802p95tfzLyF7yAGBG7ydQ9k3PGpNGaT1b0lZ/7
	yf+KRGnGrHOUIPtulM6+UAokjPQiV5xmwEpZMvkQvJVsUUozpwM4WrPwu7Fma9VQdWemj0oAinU
	36Ab5thaELXjHCGQdI9nPc9b1duvrxFBLLbJE+p0ZhK4iqqs/5oKli7UIi3Kq6syptiZ6axU63F
	1VBHOizDYTCmc1IGhR9iCu18Wi9GWW3XXc7JzXObJmJ2MpWfEA9DRTZoD6mS5VrGocqjp2szgXO
	PZDDXk/2SqkA8faqQor5Ks6yr/jz3jg06sSPZGBfIUwce/7rN5Jy3aTNL1NSm+iF+pPv7L2+Ugb
	jx6zUU/AV03Ic0I2lHZsf7pY9SeMkoXaOg3kDtYTGi6BEctV2DKw=
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id d75a77b69052e-516c551754bmr17064151cf.11.1779352639511;
        Thu, 21 May 2026 01:37:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id d75a77b69052e-516c551754bmr17063841cf.11.1779352638906;
        Thu, 21 May 2026 01:37:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:27 +0200
Subject: [PATCH 04/23] pmdomain: imx: fix OF node refcount
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S6soBSVe9KjUpY4fV3w6m8V++eYkYCwWMWeUkaW05Ts=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQhtpU/CqYzAaq1jp+LLLiJjIA5Qt/YY/0VT
 S3IUh2uDoyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIQAKCRAFnS7L/zaE
 w1etD/4l9O7wUTmpxjRT+gvruneHUxzYHEIhXscwzHkmXXFaTqlBavoUQKz+sPAmBcudjOXscQZ
 mu4A2CkrCOVZtrepbcDAksLfqo0RIXfw8xZ6iNAc7TSbIK3BuxmxPm9SM9FrlfFCYlcXIlQCPU3
 VVJ56YN3+53SSoxDlaWqJqOl01UWof5ledWKTH8dzoqTxaxB+LlTLL2+tl6wzT1hIGLaHrq0NHx
 bCcVpM4BywkAyrn1olQuZt9D+PmGCR/zu4IqxjWNsg1Ik47sX+JWSrJCCDlVs9WzwSP6edRFsTr
 eWVh9X/z0Zp1hPf5XkuxC8WEE+ciQUi1ZtOFxOUY3Vjfup0mR2EWcJYYwcvH85XbmRz/VZugYMl
 LhAXbqUdasak8C0n65UmlfBHkKOBeIwN23suD7Yx+Q0ORyAUBdEQEp4N7QpNWQpHLr+upEQjLOY
 2MWtqbCVH++FysZ9T8ZwTwT0ndcQDFCyMi2V3eXQjB7KVSGpXFzWPg/SFqJSbL97xhV84W6Izaz
 hKCOM+EEUU296NZs3+u5L2wPfjObJIqYpxM9fKJuc1oRI1cjHoUUBAbdGLhOXXnN62XXTsUqhLm
 zCKbcupHSwPo+aF8UgCOTdYr82ZFVr+ZBQa5PZBJSIY2Wd4qB0rRonQwRh/TRYIARXk9niYp7WR
 TMEzEazWVqpnxdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bfhbluPB c=1 sm=1 tr=0 ts=6a0ec440 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3puIpDhKG-71yv69WsIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UAk-wVD7L_NjRelwOhfE76DavCKlMkVI
X-Proofpoint-ORIG-GUID: UAk-wVD7L_NjRelwOhfE76DavCKlMkVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX4XZfhuNvNmPD
 kAy2AOahqzY9Q36F7XBJZz2To6Kz2Vq2rpQ2LXPqOUOo3ZQ+jnTyzthWtRpLoeto358MFFJc5U2
 QRxqwsu200jye1W/x1uF4/pkYsW6I7YKdJmectYRttrYsxwgb0kIMB/G5d3qSE4JDy/Q3fr1CHL
 S93LGAUiMoMu1tZvFMZfR9VidJRMqE/jJTWQDZKuuNkzE+QrFp8BrxM1Yg7cwTkJP15e6p1knrB
 J9KZfaRPtFNYTvGgYHOw/8iz22/lu7gJ8v8szEgoPblxOrp5yzD444zUpa1MAsQCZU1CriON8mX
 IRfiWQcAFVu5BggHHzlDme770p3itco2iHaD0f3mhHTbSd5/pUd/DicUEzkuUCsEOKi28mkdRjv
 hj8VVuGtE8xDgRT8Gv363d4ETMWdvbIaO0VhtVSBLc88jxs1iTZ1ZZFHHZzCcRr88daEEGKu4Cv
 4D7OjtEN2Dm/NDix+Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,opensource.wolfsonmicro.com,avionic-design.de,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,linuxfoundation.org,linux.ibm.com,ellerman.id.au,linux.intel.com,8bytes.org,arm.com,broadcom.com,nxp.com,pengutronix.de,intel.com,ffwll.ch,crapouillou.net,ti.com,kernel.crashing.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14677-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[67];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 548C85A15FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

for_each_child_of_node_scoped() decrements the reference count of the
nod after each iteration. Assigning it without incrementing the refcount
to a dynamically allocated platform device will result in a double put
in platform_device_release(). Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each OF child loop")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d4eb5168942a893c 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = np;
+			pd_pdev->dev.of_node = of_node_get(np);
 			pd_pdev->dev.fwnode = of_fwnode_handle(np);
 
 			ret = platform_device_add(pd_pdev);

-- 
2.47.3


