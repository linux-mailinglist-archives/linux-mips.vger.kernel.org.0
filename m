Return-Path: <linux-mips+bounces-13572-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICvvKaGhsWn4EAAAu9opvQ
	(envelope-from <linux-mips+bounces-13572-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:08:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC1267CA9
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7B40309921F
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 17:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73903E4C79;
	Wed, 11 Mar 2026 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HShLjO/4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKvjshsW"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED8A3E2761
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248658; cv=none; b=gzRiftFfViPlLKK7MjKSpFkKzme3IHdbATT7HRmfPugfmHb6OyGiQ0SzhcX7IP2UrsBVCFbHQhQrnGPewYmEXkWtjEtWV0qk8e9L7f/C1WKrfU/IVH53+C7ExvTlXAYRR3qkp82HMUVbixLSf5FyU8Bt7XjRgNQrVhtKfcWiDkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248658; c=relaxed/simple;
	bh=UxQzot14DdC7CE3YaoCCMFXOrmY+FP1snqPU/sV+/0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QqjsruwRwVkUJKEXE6H8lOs5lTz4T2OcLgrLGFa/0IqAfCkn7EgLF1MonlH9Vf27YZ/tKaXShWSvK9/txGJcko6tkDMHhgUjOqrDG73tRSSzgEG+Y92MW/P6MrqYsiBlUNtzAC4R+D4ozuKGdR45DUh9mHlyhtUvvdfzUE3/Qz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HShLjO/4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKvjshsW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFp7f93171977
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPN/i/l2ssLEfyh7UE2pbxQ0TrPdBXJ1R/NupA3ANWs=; b=HShLjO/4DPGGT+83
	AhEtKny8VCwP5xABeVCd8sKDDEVUo1Hi/e5iZ667HQSx1DQaPOHaCMWKy8l0c2fg
	gHNSR3tC/HJEnlGo7lEqwdwQJ1k7+pwoPHfFosISwP5/jgVw5cH0GCmIzKZdPXn0
	qSB4+3UtNghZnDYLOmtQkadomcQFcGMBwiMH/cMKBwo2GVTHsD97dlDth8+gnx/u
	/u9gC10OXihSZj30FI1FdAs/Fzaee4HbKF/HOixi/XHwHb4vyzCRgnKhEJXS+p8U
	p3bCYZ5KRfHVxyz5x+5ncU5t41rAweRXYp0z+IW5+UZ8yRGLqdCQJQAG75NllcR7
	L9mZBQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd8r9jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:04:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509011403a7so6298441cf.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 10:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248655; x=1773853455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPN/i/l2ssLEfyh7UE2pbxQ0TrPdBXJ1R/NupA3ANWs=;
        b=NKvjshsWzknYGCO15yuPoR0ty53Rdv3pTbdc1Q4tunkRqdPojssJwLS80V65xR0fDU
         TU9t8EPGaH6cMZZbjDoQlzTMiwM+iMxFbH8uGZHrQsom0ScSdpP16PC1+OK2q34U6Afo
         Kc3R1mlW9qAR5Mos+mGJjNLbWVELYSXqAH9CYHQ9z+gV/MeBujdqTCHSMwQH4U6KbKk2
         H99OZj2eMBWh1YwNzHu9avjUeeoE+4vXp0MwF/p4btj5zNDxYRggkIkL+S7AjrX3EpIQ
         Jv3OkqVUrfmcf6zFlPDE16jjOyA0erz8vanwDkuzAHSmLUCLHBvpFcjdOSw8iDnBF9Yf
         X/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248655; x=1773853455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DPN/i/l2ssLEfyh7UE2pbxQ0TrPdBXJ1R/NupA3ANWs=;
        b=WizUS3ZXweTyuD7tlt6OQkArw3xBhfmtt70N87OCmPeMc542Vt3wxRuhJ70MRE+RMN
         a19x3skKDxEEcOwbEfUCUh+SzGNIMlAG/Q3UXmjQ5I6e+LJ5tz5i5cQ73GHjUnJkaGBl
         otfgV2Bd9mAKH8ZiLtzi29oniiQLDVS/XrWZRkJz6cQ9cNgI7wAmIkPOrZ7LRiy1GV7n
         TOeJ/6QQOWiJnVn4QwgrPDILgGSoQwdCodTWDP7k4TS5h5HnSMWuPzoi2OZKqQJ2kyDL
         +J/Eu8kCrxzu9ewNoq/zJBtnc0mF55e3mLEnJvbE0l6OFWfVOSrojmZFh7baZ4YJPGuF
         5yNw==
X-Forwarded-Encrypted: i=1; AJvYcCW9N1KqdgC930AbGnl/qoHUaTK40+kmFuTPfia212Wx79dWbOhj6qW3z6Ig9AbhilP80znuRnNaECed@vger.kernel.org
X-Gm-Message-State: AOJu0YxPGhStStA4Nn7mpDlYZJQL+rpv3qT1cVLmgjjwHX/+3QkOGzVb
	j2kdH9UW5ShbjcNMZDzYb0s+Rgm/fv2wcejX2Gnm2jNzJlB01wpj/MuvMtrqHyjUCy9nYcgGeQ7
	xT+xp8qFArYXSWufa1sHckV2f+CA5n5xFhsNwzwcizFer0+hUndY2zOphwKW7d8O/
X-Gm-Gg: ATEYQzxMr+YMzLKPN1SkbecRICxsVYTrFed4joNsleucYgcbyphXf9TK28zzPz5YrhE
	OMRoeNs/jT/ZU1GrmnFzTVaVwE7zJR4LkDBCfUSKSmOQ3uLuvKwzqBWBBCpJ86LP7JbWROXoT37
	QOSTNbN1hS8VMMdr5Fq/A/bsB66pGgsln2z2sTnGorG2+VkPpn9a2J1JVLKurN4Ltc4JbOxAXoR
	YCYIGyAS9IR6If1EtkxFyx/PtbSWBVa8SjCKyfkX3y6CWuu8nu7tnRzmRIBAws32nZkgEDvdJnt
	NtURJpeJKUMRxr9pFZ/U7UlcCcG6niFN+/Hx8r0wR61MSd2iOozDBL3/EvvbWZqFnhJhJkkYB3j
	6tNFjZ/bxfRWEO30LU+Zqra0L1ztyhG4cBOmP/MbRftEVBxNSNMwq
X-Received: by 2002:ac8:5d91:0:b0:509:1579:7c3b with SMTP id d75a77b69052e-5093a1ce54bmr37535451cf.51.1773248654974;
        Wed, 11 Mar 2026 10:04:14 -0700 (PDT)
X-Received: by 2002:ac8:5d91:0:b0:509:1579:7c3b with SMTP id d75a77b69052e-5093a1ce54bmr37534621cf.51.1773248654258;
        Wed, 11 Mar 2026 10:04:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:40 +0100
Subject: [PATCH net-next v8 5/6] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-qcom-sa8255p-emac-v8-5-58227bcf1018@oss.qualcomm.com>
References: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
In-Reply-To: <20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fxsbaPI9iOaLzA8Nxl0AqrCTE2PtpwOgDoj1b5dzN78=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB34b5S/F8GTVL3hALT65A8dpesAVcFpLmve
 Eu6M/Ib2jaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdwAKCRAFnS7L/zaE
 w6B4D/wJOw6/U3iZswLeegYbU9W2+3pVejpInhXJRODaIgahpve2jOPj+VKygqE3E4VOJ+Rtwsw
 QsSTezm0FPTw8Dl67/TsIBlfTYp2k603PBrtQtvneCURCJjzVhJIHhE1UILZO3bzh9nKF/qHUXY
 h7eYpsfBs1ID4ha+L+nW0RZagztA3MlXmTnbRt6dbi9qdgYjsEnk6x1rHb4K8meqp4cZ57gxOyY
 ZBzT2NcGV+NnfHz54zRsu8c8bjoJBcvNjanfgVaRscTPyz4z7Sbclxe6VmAFqi2R+FR6TMrC7Iq
 VgTarwiatqz0jhjmGD5sOvE91kF2MKWe80SF7CJIY1NfAi8zauidyNAncObdZqAiCNk2YoR35oP
 kd4DRqzlREVTu7yOF3WKS0r3kbH0sKRU5MUuOBEFnGIN5rQik4T7yPbGHNGDz0PySmunJCLU/Pf
 Q7KVhD9yaZKQSZ+lAARWGv2FBeat6NLpOxTvwSrnkpsp8e16XwZpxH5UziSYbhyiL49zTezayx7
 JB/If/rKwhrgTaS+iRubV03hv4+jvCIdQ4dLOYDi5SO89BcRkcXRx80X37uhJLSp7Xxq2kQv6yf
 yrWt+zHWu5eN+ixxZnfuWjMAlWlBEXPm03cdHC/EHHq3r9gTo/hba7ieSOj6c/lUwqwNVIQ4wlk
 MseQZHuzHn39sfQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 9MNyI20a7oeSW2Ltql-to2C9V7IgRbPW
X-Authority-Analysis: v=2.4 cv=eqHSD4pX c=1 sm=1 tr=0 ts=69b1a08f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9MNyI20a7oeSW2Ltql-to2C9V7IgRbPW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX2YqeTYpksa+E
 Fx6bXCpiuQ1+2kxYTv3VpNAb4AMVoX/yNgL04V8pcAMjtKfiC+VXls5pptHeHKEcXJMxEPguNwd
 hnmb1bGTRRF1OrBcmSNoXkc5HEmeUaK3ihL+fm/s4Q1zshDDwTBkakR+RshAjsCaC0+5F14k8kG
 C2y0of7EXPu5a4DAWIJNt4ZQxfLwZPTUEQyGlDB85NJchdJCSZqFRgPOI2fnc2IxsX18hLoSavK
 NHAgc2e8wzVvQi2rOFvrf3rEtvCagq4e+bj3xZQn/DO0ONbXvtXSOULbiTPNt3S+jpt0UIz/fcl
 nPfD7gp4rsADiWYOX3AbgS9ycu+l4DbtNt/Mo7fpPjzwSxOHm2rIATve1Iv0DqmNMqQGNFAkiyd
 XSdCTAjgVKvY/tTGKjCHLkOPMLTi8B3dWoI9NIBiqMU6j6OHllHQ01p9dtDXe4oiX3zry/hcKAs
 eHeWmTsH2RHaLgpVREw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13572-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0FEC1267CA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 40 ++++++++++++----------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2166084aac999a38367af4294129f925391179de..7e3dc1df093a20eb766ebcb29738d9f4261145eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,14 +105,18 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct clk *link_clk;
-	struct phy *serdes_phy;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -194,7 +198,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	return clk_set_rate(ethqos->pm.link_clk, rate * 2);
 }
 
 static void
@@ -670,13 +674,13 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 
 	return ret;
 }
@@ -685,8 +689,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
@@ -700,7 +704,7 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
-		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+		ret = phy_set_mode_ext(ethqos->pm.serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
 
 	return ret;
@@ -712,7 +716,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -726,7 +730,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -819,9 +823,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -832,9 +836,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
@@ -859,7 +863,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3


