Return-Path: <linux-mips+bounces-13878-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIExMds/wWlnRwQAu9opvQ
	(envelope-from <linux-mips+bounces-13878-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 14:27:55 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2DB2F2E7D
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 14:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAC7E3035006
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 13:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1097D3A9D9E;
	Mon, 23 Mar 2026 13:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0bGsK2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TrDeYL7M"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFFB37C90E
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272083; cv=none; b=sejnogP5tur1kIwsVEkoTmmGfPUfFgHUH4YNhzM6Kfmge+3hPo3LWXEOx+qbJ41nQnxtum+7/heU4uTb83y9Rqw6B/mFXCm9MZM3gjXTlGsZPBmMtmuRrxpAZE/LhGPEvcyBRWD94p/4hKfEpxHgYne0uRkLEFDPzrCNp77fBSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272083; c=relaxed/simple;
	bh=62lf3t5qbOxIlaStdMXwEVkxERzacKVDrC+KBhgqa5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D9ckjcxBhns6VNbQQ1VhFYR1AKtMc9DuHFoSARE91FzRo+0TVGkUJfLyUNPynVnvVEvB9TI2JbLxqMVFhy3vtpiwIDA1z8QRCww1vjrhVp2XTyBmWOSSrsksjZhpq/qYDTlPlJIAEIYZZVGkA0aFP6aw3REDZcACEl1p81HdbDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0bGsK2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TrDeYL7M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9vATL3737826
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 13:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vI/1k+nqYj3LM3ZnQClELF
	8nYZoxxBvQftKyxpY1xZs=; b=o0bGsK2slcntOm/N0wLXwMkCP7ZYcVI1Y46NYs
	zz1sziraJPBbRx+EWkgCeop3Oixt4aIp8ccE3ZOfx5BquubnaZng/A/otlog5jJ6
	z4gzQP5OjYF/qCZ/ZO0xeVZeoltm4BPfOvYolTrg4Mc5i4NBdu84EZ1nD9s0G/po
	WGJy1g6aNmfFOCXQ3MidKW5kAck1o/DPksVHHkbxIj9DEo8MJ8EWRDpyXPbWuXgZ
	dV9tNn5JTvizT6M+ygi7N1biHlD0cvbDSrTb+nW2SVjzQC0T/Q0AhMDh5xwEjH4q
	3wu5YQpkSqNvTkenDT1cIwGyh8gm0wyXxI9GPna7KFsx2Kqw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghde2q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 13:21:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b3544bc7bso1951331cf.2
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272081; x=1774876881; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vI/1k+nqYj3LM3ZnQClELF8nYZoxxBvQftKyxpY1xZs=;
        b=TrDeYL7MPMzMcE/LJrFTOrgbsj9I8KxKp08fITOpOHxV7GM6/wWtpuBENih6Gw0j+A
         dNDQm6RLjV5Mqj0E49LtqF+59ARArc9tVNIxx7vd8yeIw3gB6g5RmqqSeOQL1JJEyRbY
         VjEEt1CDuYjQNpiRpohGIGNAG6lhaYqv8wlTQBNPdxYF44CXQlcu3w0ihiB4e77AJAz8
         m/PzUtfKp0A7pAjI5mRvYJ3pw1ghVcaFuwQiuIk1XycVYUovQPnPulvV8NJ5DpgFmPbg
         YWZe7NeFnJNm+uruiU4ppoDR2+1cue7AwtPCjJRF341TnB48N7sYutFThINf3GLELAJH
         rnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272081; x=1774876881;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vI/1k+nqYj3LM3ZnQClELF8nYZoxxBvQftKyxpY1xZs=;
        b=svWbeN2NzTcOA3egzPo7b39I/bw0UCDQgk/4Ou3aHxTbxWJ2NkItkpKee39nee2EVZ
         7ID8VIzRNYwkY1p/gM5sIeaWessQjS+ZkZa5E8LXz+b6nUSOkc4KQh00MkjQ2S17HLIU
         h7Vy4sqMYo4ACapTFnxGG6teKuAtRm7GiC9mUrLsC3f9+7EF8fsD1Hv89jr6vKn6gIcV
         ghbkSzEQ34J5DeRWn2aSs/9jqZ57/CTcAsDaUmZegqwbgyYdoaRoY2YWppEiBVjeYM9A
         Kln3LJfMqPB1DLxgbjrTkBk9BnXZN7IW944+UA3L2giTEbwpHIre4dQ84IOh8aFKir2q
         mRgA==
X-Forwarded-Encrypted: i=1; AJvYcCXD9D5so2mhbrd2K9fiTrCYz6xjQZrWXXinVAGfKkGPx0yMBxkK529mS0bMivX58+DxoFt8l95L3L/g@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9ydcIvj/kS3Fu/COQcOyiv08uHE2zyxCWU5gmF7NIIHI/TAx
	xW38iKPVEnpPmgyNaKKZE0WAq3/gku/lf5wsm7AclQQ8SdpPQKjTExAJxXS7gFHBBnInQSyJ6Nn
	UVxCadNaG/YNpk/QQ3fuUQ3p859TlmlRITJFQ9MIcML3IQlKg+JUyIOe+uvfePMoO
X-Gm-Gg: ATEYQzwwZWOAHWRT8Sb4UPGM8lCAtDWZmi4l8e6hdy4qa3XQnDRZcp7EmZQbchQJjRd
	4Ufe1y6iiRCG5kLIaMLLupLUrPbMaXzfgWrH6XCtNwF7SBV642SKGxlXH0T5vDRiQK2ZqYF2KPG
	R2dkYm9VUg/ImezZNJxp004p/fDiOSuCXs3piE1G7CcInpE6V3s8JDVlUhXwBCRhpJOD1QZm/dD
	kiH6jcosb4+YoBAXEvFg9y8tVg9Ozui+CEpGbCt+fmfgGA+pMsaXtJj/w5mL99kn21t4WqRn+9O
	+E3Ic3XkQEqv2qRCtARDlwrqTtrdcyWLjn8vZqJynCoCLe+jbMITE+DhJM9CMEXi9gyhKEFxsa9
	3E6jD57jQLBmVuLUMTDo4xIHziAEl+9PRiUt6LLlquISDYjEOWzui
X-Received: by 2002:ac8:5f89:0:b0:50b:51a0:f752 with SMTP id d75a77b69052e-50b51a0fd0fmr92226861cf.15.1774272080800;
        Mon, 23 Mar 2026 06:21:20 -0700 (PDT)
X-Received: by 2002:ac8:5f89:0:b0:50b:51a0:f752 with SMTP id d75a77b69052e-50b51a0fd0fmr92225671cf.15.1774272079938;
        Mon, 23 Mar 2026 06:21:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v10 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 23 Mar 2026 14:20:52 +0100
Message-Id: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQ+wWkC/3XRUW/CIBAH8K9ieB7m7oAD9uT3WPZAW6pNtNXWN
 S7G775bk00T8YUEDn78D65qymOXJ/W+uqoxz93UDb1MEN5Wqt6lfpt118iCIiAHHqw+1cNBTym
 Qc0edD6nWwTKQcal2SErOHcfcdpcF/VB9Pus+X87qUyq7bjoP4/dy24xLfXEjQsGdUYM2lHysW
 8zMYbPv+jQO62HcLtxs/gkE8iXCCOGdZ19FMpCqJ8LeCSx2N1shWs/MAMHXOT0R7pEopnBCADY
 mm5RaE54b4TtBGEsEC2GDbxECWca8GaZpffpKe9l6WMvw+/ICMCDSKyBwMo2tKDXBPANLEv+Xh
 MEAlyAvUCMQoIFoK/8CCg8QYgkKArlA5Cv5X8DwAoqPUDFRFKh2IRqbPbctFaDb7fYD3QgOBew
 CAAA=
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
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=62lf3t5qbOxIlaStdMXwEVkxERzacKVDrC+KBhgqa5o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5BAapgeuAII/igpPc8Q5Z/zNn8yHLPz/tCp
 ZAp3W8wW5mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+QQAKCRAFnS7L/zaE
 w3gsD/9/Dl9xaxiheSRVvYWnqhrPFyNVSpiwZG147FCytvuP+CGThjen3fCnLawlczMGnJizvlZ
 mo1gpTDVRhQZqja8nokWyHnkTRxnlTkYUkLXv5MK2Cp7Ly4Un3lG6k7yl6TI+AiR0tzQT37Rsma
 GqjgSPhb7TfibiBDaAKI5F8VK2iVULENWwTfSaCKyxcX/02JtJrZbdUm9VG6dKa5XOANEVfW7mu
 bJTUdUhk1LDZCjlN/1AROvTL2NQ/ENEWcXXAC8Q8HP/WlJ9qUc/zJ/UceVH1MtCBN0yedHhyNMq
 9Sdqx0XjJZnYNIrb7/wu2qNkGqn4M1KcHDfL/dL3euFCifPN8WjioVSI706yZqrf0idjVy2QHLz
 Tk5glZhJfciJIXTd6z7kUzAAUpMXD39PoG/T4vY4PRaMVr5ZF+sosTPQ0jSPRl/FnlSegyvY53M
 gKdnvwsUdBpxhtwTnOnuEUyy8oCEBgMKH77qJs6AEn1q/ZBFgytSInpjVoyMnYKVhffktwR69e+
 pJw8b3fJBTvwuGmtHexhhUwWCpZXee7Aw/JX6cW7JBF5IU2GdiaUfaIzdVVW6aZ/ssNZbPqRi6u
 XKDxVqIPAbTcoQ1Ym8FwqMNB30UMt1xKZeMqBb3PbnkJSpWgwhdwzn0BftA4j0xVai9SqgK9PCj
 3r3JMxXjRxZ0ymA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c13e51 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=11IwEMuB_qlnYAimh1cA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: DrW-_gZCJG-tbgwv_OIuuFSRrbn1G9AV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfXwTHxZFODe7Cw
 WYFApn8aFupzG7j33Sdly+DqfhE0pLmk78t5A1LxiLKs9Rn5Rr2nhs3K0KBnFlgIQMKMHIzTR1f
 3VH5T/GCn2xbNQ0qymSAdtGMkV57bNTSomb0OwTvXwytJb2LOjw/Jpf26G8j1ovSmpGyponJW6/
 w4A1YI5bFqsQrvxUQueXKknUd61328CTPe5i+RM2rEGy2Tp4ig2u2jywanPf4ORIhyCQ/a00qcV
 uxRNcOJcDsfNkrAxqTgD184nXBrw9WA/A5KV3LZvBftzLLA7GlIEJlhH42/T2OFUf+kcoEPlmkC
 Ou6PtvD3JUAuvWFB543voxrTIERmtoxgURbO3oI06+Ay598qLfgiFXLvyQNFLrxxYWEKSUuyEVq
 Uer7UPWM9bkUz5jYd4Le13hfSpErlf8wWOy4+MRTor4GkBJ0hhsgxSH0EcgbmYsO0ZWQkHhCWTX
 a5y9igU4VP69uTCIcNw==
X-Proofpoint-GUID: DrW-_gZCJG-tbgwv_OIuuFSRrbn1G9AV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,kernel.org,linaro.org,oss.qualcomm.com,googlemail.com,bp.renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13878-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,msgid.link:url,armlinux.org.uk:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[53];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3B2DB2F2E7D
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
Changes in v10:
- Fix unit address in DT example
- Link to v9: https://patch.msgid.link/20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com

Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

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
base-commit: 2caea0c68b85f5c2ee505a7fc0fe8d71060af7b7
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


