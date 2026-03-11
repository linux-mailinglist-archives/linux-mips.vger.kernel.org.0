Return-Path: <linux-mips+bounces-13567-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP9zJYWgsWn4EAAAu9opvQ
	(envelope-from <linux-mips+bounces-13567-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:04:05 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36650267AC5
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D47293042266
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 17:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A293E2767;
	Wed, 11 Mar 2026 17:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZqRiKjD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcVcHakO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958043E2774
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248643; cv=none; b=VxNgdKSNhUVJ9hWY8dbZVAmB5SrGr0t1mNL9nLbvfm485++9q3mR9ML2WGocEwssy1+VZKRiGfS0tHqZ8KIjKshI9U00qJ1vYv09XKqMjw6LOkCBtHFZcr/y/J1LvNcU8vRGC6ro6eW3nO6GzvhddSCqXbsKgfNKhFP0s8PsYp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248643; c=relaxed/simple;
	bh=m7zsUMUyzNBIWWoKKRwkdq+2rL8U0KXnQkmaFuIW2hk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tkFHlwKfDaH9IuMIES2qPsRsFhqfXcpgDEPBxGfdBRznm6OyqQDD8qp9jMdqpwF5X5oVQTb4hHp7dDAPKeXr0VATMyNClqbtpRT3xNfcAilqJVCur1liC0cFwhUjfkQEPbVKlq6R4Te1Qgl4bQ/19iMFCL7ZWNlF90xUPY9DIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZqRiKjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcVcHakO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFolta3601153
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HaU1Spu8fMrfvtbuBT8OCk
	Qdgf8P6cW2VDQWDXgjkOU=; b=UZqRiKjD46aRSyiWEzVPGMrsQ6dMNou77dVGT0
	xSQOdrWpSK6K4NiHRJqpeJSca0wM6L/5/dPCFRVgE31MHP/MhaykwevSXSyLYLul
	KenGNDuLtJfLgLgzppAMTtK/pJ8r1J6Mf/rt16IteDuG7EWf6McpondpnIiYm2m7
	ikdarIDoKbXM44F2WYATuYnhAVlD60WYh0IzNzzX4H00hrMc+4HZdnKfDl4CFRA5
	NbwMknFFgfMltwpbQFsYJfnpNfiJQhLoBwQlWPPntGafN7xV9t95rCTQtAml1eva
	FVzvG54N4tYxaE5p3KupbNWIreKCcJsLY31T+Pe3Sh0C7mWQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd4r9m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:03:59 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffb9a0bf22so502203137.3
        for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248638; x=1773853438; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HaU1Spu8fMrfvtbuBT8OCkQdgf8P6cW2VDQWDXgjkOU=;
        b=fcVcHakOq9dJ3rChqAiZih31E4tDPgn/5NCW3mFDFX2wIO+i2jEzu7MkwWMKd2X/vi
         j1ylD6ihH7LD9BYk7MPs18yMzvXXIyaaxyGrhKqOEipphjWkDNblEVK1kgQS/yc4BWjy
         c2kAukRza7/+vrDFHfwigvNVuWznhyH4b2vLWpmyaE7wkTKigklK0TB7gvo7R40kfBNt
         Qj5hE7hml9/z+vXqM7ltcsO0q7uPk32TnFN9An4OLMDUoUoP1oXcifRwTrZxxNbLO1li
         WxEZt+I/CeC61aBuF0+ObKzBqxf0MdAJpmgOqUkeh2NTZrtcZ6KxI5AinSi38XP0W24z
         Wyuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248638; x=1773853438;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HaU1Spu8fMrfvtbuBT8OCkQdgf8P6cW2VDQWDXgjkOU=;
        b=IXmfbToRKDr6w7g8WPgE+ZgfIKdpn7WY2OW65bIxECR8mKms7vGNgDpt0RhPsrfSJK
         8DzF+92E4YJkjVvrgL54Zn30be8dvee8mhaMYE0w9gLHzZkzhrYpViElYu6sU4qx+BNJ
         wKKXHXqieK0QgtrmHqVfwOQ9Cra1b1iLYoxAHU/3YQaleaGCn7TOkeisBCiMmv334CLJ
         RYdvlxjGYhz6ZEnofrSHa3RLbkeLWFEetZcTJRDuSuF/VpDVCyc9L0AqvDrvfaHsaMOd
         v1e9Jzas1itQ+YMqFphEzZqA6Jmx5y741LwC1nZxJehtQ7kBgmsx8VdQBDBFayEbUV86
         /XuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFP9pmWsGzIGC3WE/Kdwc9G6Gl9XjszZzreBYWR81cHAAKkCooYY+UGCj/rw9oot4fDXSS+UePSHUp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/T8Zt7xPX0+1j/6GhJds+ZIm5RACn+Yj7n46dTC3v8AVoskCq
	7rvzBZK35p7HwTeloNBQ1bt3Y+JKZ1x/lfXKe7iY/zy9a4R9QqkX41XcW0oHOfww7VXxwfLCJWQ
	LUx7Fdh5d4VlT8a8SvjAPjjmufSv4HAX7L4xzPp+R+5xnnL2tshg+qSGS2us19NUd
X-Gm-Gg: ATEYQzzjlOxww58SfveTZ4/ZoxJrhpHQhomLk29Hl/8dcRMIQuX6krvCA8JKcoOx+Zb
	Q3MJmCBeB5p3awv6a21WbPBD44JX4g4Ij/XnQE/TqJvdVWcgODKyIFV9U4BfrGMkC0CyBDyoYqt
	61EpEJhGJq8y6OuJla44pOEt2lfJiFQkwaAKKTe/j69jy5IZveLc7PkdUPaUqm8tTon6Lh7TqEe
	zE/L3tml4nd6aJhQmrFC033krwe6O2V3WjJRQ7DPfp4FjG+ZVwItgSIcuuI/qULEulrp9v2Tj0u
	T4Frd9Zg4bCTM252luwZ6VW+5+Sgxb+ZAS110V+RXoy+ldt/U/4ekEZsqOqPD8/W/n3HfKwjKWy
	k9XvvkGiH/8pPXiHhxHEXV21EaGInzptk/HZaJ3MKIvxilltKX8tm
X-Received: by 2002:a05:6102:5489:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-601defd5d92mr1452518137.29.1773248638437;
        Wed, 11 Mar 2026 10:03:58 -0700 (PDT)
X-Received: by 2002:a05:6102:5489:b0:5dd:c3ec:b75 with SMTP id ada2fe7eead31-601defd5d92mr1452426137.29.1773248636892;
        Wed, 11 Mar 2026 10:03:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:03:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v8 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Wed, 11 Mar 2026 18:03:35 +0100
Message-Id: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGigsWkC/3XQzWrDMAwH8FcpPs9B8ofs7NT3GDsoidMamqSNu
 9BR+u7zAlsH8S4GIfnnv3wXKcwxJPG6u4s5LDHFacyFf9mJ9sjjIcjY5VooUBYcGHlpp0Em9sr
 aswwDt9IbAqUttxaVyPfOc+jjbTXfxBiucgy3q3jPnWNM12n+XB9bcO2vbo1QcBeUILViV7c9B
 iK/P8WR56ma5sPKLfqXQFCuROhMOOvINbXSwM2GME8Ci9stJhO9IyIA79rAG8L+JYopbCYAOx0
 0c6/9dhF6EgrrEkGZMN71CF4ZwrCfUqouH3zKo0OVj++fzwABovoP8MS6M43izustsCZxP0kIN
 FAJchnqMgSooTaNK0CPx+MLjGiqT1kCAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4964;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=m7zsUMUyzNBIWWoKKRwkdq+2rL8U0KXnQkmaFuIW2hk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaBtMYKRG+G1iHDOODwHpPwuweuk13HbVcQie
 3BhK9Dx+wWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgbQAKCRAFnS7L/zaE
 wzDED/4sIY4N6g84JyC+hXEHABm6Gs7uXfGAusaNiIblglss4QUI39l4yWdvkmYj5hBh1GmXeg7
 RCzY/RKCRcpX8eNN2swVYV4b4J+g1k/yVGsvbt5PCw3poYM+KRwzr4zRxrPNNSX+Ew3Td0fLftA
 iUqsCfc3M8Hl4z7A83M7/XOpNMkiG2xxgtBkPpkc0suGiVopZ81LrXFqdnje9+QkQirddqX854q
 iAehIdBx5hualJrCS2cUDLEAen/Y+ycDpfKd7WRWRaOl6lcNEQ0EzGeGHnBP+Vb4WNo78I47X1F
 RD7kNNYf7R3QDOz+RaDT4CBID3hLNW+6QeTCf4HU/GQ4STgvvfJtXBgxVGh7IUrzL0tHU7MmQoF
 WFLikDVyjwj6sq7B3Ro/49jg1K4xX7NvTYUODisvtGtrH7xEKTF0G2DASbJnQBttG4EIBH9cOot
 dY2i4AR6nx6bfaiOUF8aJpqvsQEoZaz3TAIdBLggUnA5MiaYSJN8eNi0/LqsYR4D5kAJP//KL3f
 tZQZUlcJeqnJVz5eQgDxtk2u8VuF96AeLSAMdLN7gr8hxDwvfQt+Vd5hXmELLRmWN9YC6tOiCVt
 QCc+Gu1K4M05ATMBBmWniUawjHUwc7AFfS/nmxKpfjce7ldCDoEMwN4cVBao1RQ9ySZYTCts58l
 e1CLTORfV7tCm0A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mVhAG4P6ZiE-p20LAAT8yCaiPfQyFjdI
X-Proofpoint-GUID: mVhAG4P6ZiE-p20LAAT8yCaiPfQyFjdI
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=69b1a07f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=h7uu4O38hj_b6GN6T5YA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfXx9SnOU4bLxj5
 yqVGkJ36Jvtc0hlmjCkKWUfPVVFQHPGWURf7vNnS7LYecehRQe3hpyIUmAJlijVd4oDcv80sFrg
 fDA4c9B+JCgVJeA0slxRhpyCTE9AZPIh10wjEtkTFQ3tgFqHdFYZ8tMmyKkMngR3k8wEG3USiJY
 +bOc6kwd8cKX85hrBd4Eo+k55pXKtxDTa8Nqq5oRXFUoNA6CiT8lRyuGDCWXCh9lDVcA2khZWm8
 wefneVDVfPye4SpdXc0iiXwq6P4QN3SaolC5ozNkmz8UAnLrRNBLxv9e0+adEpxM5+jy07cc5uR
 rtNxCVB6CAW0Tr6P6RxdeXjWHLrv5gREm/2dYb8ipDx/Edk2ETDS/znd1R/TCnGSIdiPCBdb996
 4Lumi7ybuvnnEEbPALqJi5ND13Ej8v3mT/0tPQtkhd99iIJ9tDv3/MlXu1k88dWQ9+SupGfhP7h
 ZDu0lLwABWwJrFXHkQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
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
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,kernel.org,linaro.org,oss.qualcomm.com,googlemail.com,bp.renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13567-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[52];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 36650267AC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (6):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 +++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 401 +++++++++++++++++----
 26 files changed, 498 insertions(+), 72 deletions(-)
---
base-commit: faa893280833784cf45adcb71d2d38d780b5d909
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


