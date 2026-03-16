Return-Path: <linux-mips+bounces-13655-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iP1PFl7yt2mfXQEAu9opvQ
	(envelope-from <linux-mips+bounces-13655-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:06:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C93F5299250
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:06:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15A563034A34
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 12:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8DB396576;
	Mon, 16 Mar 2026 12:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqbKE/Ta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qexheg1R"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCE539448D
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662747; cv=none; b=StUiL9pRartChSbRAI/rOr0qQgX6JfzDYJ0j1ijC9LyXrlxQ8g/DCVlShzfu08e8+El3d0ZPkO2uS6Iw0hzQ9Ni7B49XNbl+iMsFMIDsfUHuQAvQPIlG6PrIWf4cgVXLnaWP832nuXEoga+0/QOskT+57vuUbRSShBdk4KrJXKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662747; c=relaxed/simple;
	bh=fbNtS/uHH7i+GRvFL8DqLP7cyjy46QeuA5MPj1IWrU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VOHNfXELAOYwdGY0VgiBX9994ncA4RwyGmHRBeftPmQImYHE08C00Wh6/cMsnwgJlhWKY38uXNRBEt1ZJzqdc5yUPtcTDDcn+lYyihFR8/xX/IpQBZHNdaEFVXnsf66ToxSXb9KDL87JVAUETCpqQVta/DNJ7swnIq0z5Vno0Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqbKE/Ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qexheg1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GC4fFm744133
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=; b=bqbKE/TausygwjMR
	pXQ2QX4j3/v27dLfoyVIfPX9g1cYvRop9VAcxVW/zgev2JGsOYMcVUGoqBtVMEp4
	HGvD0rSeQoQZGDPofVKLbhnbD/TdM5zSarJphqPMGtrQ7ud7UkKlglWkGOpVHZDp
	vtZPgvBkGZIL40HP9Mq1bzF/QR50SX4VqKMndn011TqAiaegYylMqbxAWv66M7yR
	G5zxJhBWzlRvmPjIjaMwBbOVcQvEhQx5HoSp6N9B70L9kxStO+M90ZJbS0WYptJH
	z87YxR48Xf6KphArdlCfx1cwCJXC8DxLAuEpEjXZ4dVz8W/R+08ggYxA6Ve851Zg
	vRW8dg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00bdr22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffba6a4d84so6176300137.2
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 05:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662744; x=1774267544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=Qexheg1RXxj94OHnLUDLJiFm3CvJvjmWDuREjBPuDsQqRW9pg7vP82tDLWllYYA0A6
         XlX6+Ld1hxLjVaxmNiAnViuHK4roHbGdMYYTImu2+zjPJR1dYYXIxsePu0VYPyuUTKhX
         4HUMSsEGNRD2jDvZ/oIoBNdJOUjM8NLOLEiGYl/tlQ6B6WL0X3CRXYElRdVY+HUuA1vd
         MFQYdw9YkrCgV4Y653Wneh/tNiASWWtiK5H6DQJtd40bDuctTsjqa5oMTNzi+7l9kZAi
         /JerwlXU3Hlt1GAgNqN0lKJnwDkc5VXzpfdquyd3dl5lz3niXgsDn0HHq3BaZohXAAjw
         /Hxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662744; x=1774267544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=csLpiOr7ekYrXHPE8DyCvtw4Ykxcfbkxh4geQTV/Gc+XxpwLnmpEqA/9uyHB9NNMu6
         pQamGQiwuGIlYPyDTpPhT+ddrfa1eiGHWWKUo03sysZu30LNy6ucO0Emjl148GOEcPp4
         lNBFtOxQgpOsZ+gUQ6hN2aigxihRVbf+WFBSImbJcHT5xEfhwKs8pSNd2th4SDQpjIUy
         5wMi3HoiJDS1xTSdW0if8lPie8fR+F+LIPwXZcKMqCXO9SEJG/eie6+5NvWNLfZfQzeN
         whQaO78imhx286dL2XlbDFzlonf9/3iZemWwDd2lFGrEKSTr28AJy6nSmkUxaVcgttuO
         Tx3w==
X-Forwarded-Encrypted: i=1; AJvYcCVdXG/JqOWOAPP3j2Ca2YvLFoixmG0auQdJzzgfJbQmjgffRLHQgHs2sAalzn8plsA5hx7h8V+6KjN6@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwZSCA9GmvtW/H7FQFIJGZQti9x1pJGy+XTJfuTM4ROJvDAwl
	gPE+CrwcBxR4QRee3f5e6YEiKfQkQsq0i8QX/+ZVZ+4ouHXukzcJf3GxSTQ69dT6T96KDuu2Eef
	OAVn1RGm8a7wwGe9XyTdU2a+IlJRuNFyyWIoiSSBKhWQLvSqmhlnEB/tTiLPCyOgt
X-Gm-Gg: ATEYQzw2NNj8ab+QBMaIStpd2dq1SlZHIIqyOzqyN4W0LvF6bUpOHpLr6/cBAwrSPb6
	7VfxnoJvmXuFr4t4yZoi2RrdfLik83jqQWS/HXM416qoYajiQUEDeW6JjHz5w3aLXsTpKopZYlE
	awiqlw3/iNuZqQpmQ2UXjSBQ06VfUPHfy1hb762/0u++m8WZ3iCmoeMZtoYUxAUircIJ+QvEnB/
	uFiKnj2yzpHvF5uyQ36pPSFrXp5mE1UcDnRh31R92SbqNKUEnmxWmZoWZrar27fwbpXe8oITQvr
	vLJzTWRa7TsWFzy5BBiZ/geGg9zLrs8lp6ytzvrVKwjSh+X+8KijwkCOX5Z/63umhM6WqjElD0G
	+sKr1zvGiPnYg5Blr7gtZ6mAATPpb1O4RhnZOFV997HH0Jx+vf2E=
X-Received: by 2002:a05:6102:dd2:b0:5ff:219b:497a with SMTP id ada2fe7eead31-6020e1aa7e9mr4589862137.3.1773662743740;
        Mon, 16 Mar 2026 05:05:43 -0700 (PDT)
X-Received: by 2002:a05:6102:dd2:b0:5ff:219b:497a with SMTP id ada2fe7eead31-6020e1aa7e9mr4589815137.3.1773662743239;
        Mon, 16 Mar 2026 05:05:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:08 +0100
Subject: [PATCH net-next v9 3/6] net: stmmac: qcom-ethqos: wrap emac driver
 data in additional structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-sa8255p-emac-v9-3-c58934e76ff2@oss.qualcomm.com>
References: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
In-Reply-To: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5840;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEjA6ztNoVJqA2fzdic1acw7AfUASpMj8dS/VFE3Oks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IGiOkgQG00O6yLrjBHMqTdoAG75F1dhJnlu
 Lzf54ETAY2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBgAKCRAFnS7L/zaE
 w/NXD/0WYnQvTwYnvGFZ3tZr0XsqU4FEWJx9KsbJOyfL1o10P2IF+tEBWRR3H+MAqxoQVwNanY6
 hvTBiTIkSuWmeK0hbtihq3ezWr93j3vu6iZSXfCBxjs0eQ6v6FZtHMg6IAhkrne8u9MQCVSopwH
 Rve4qYdPMW2EX0okqbsmSvxK7pG5MnMo0JCrOVs95H4tOzH+Q2qGjQXnhTsaY89//IS4I9BbyW2
 PS+bbn8qDXRLVYu5v1LbS1eQMElYQn6yGoWNGmQ4nZg4DAUSs2oLP85k533GObc2dHy4nHpvyRu
 1mga1B3kSsERLkShcBERg64YOOWxBWUkZZFqIrBjYe5rXiP4zwGs8k9IzsYsDntFMlKX1khQAgm
 WIaxTDbktidDuqkO17AOraRLdCD5dziT+0OAl8oazGrHrbXiyRICbqLQF2aqQGZqEiCzNDE4mNF
 aRo4Mbyvg73vpHCcXKA+URZGgR+orz90M+w8HWPtIumOLT7KuUaxIhrJ8MQ3wqEBcqvdnuJUnmw
 JCFfSzqvHWm3D2jL6Z2Ms0hTXxj7plPjtrSZG3HOm4apQi2vVhebQW6bHVlZoLU2MbcszBf7q6M
 qIpC9Si0bbE6+0bas+VDfiwncRNY997gkgjiAWrNy9KGy8GX/Fvbz1rxy9JZpVf12eHBqlzM2Yd
 1j0Glhm9rpoPZ5w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IsATsb/g c=1 sm=1 tr=0 ts=69b7f218 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfXyb2xL0GZ0itS
 ai5Y+AjXznKqRR4ipIwDlXWtydV6v1B+2gvcT0WE8+y0xRFvlpEvwTx4RCroKfKAWW4+kZX8Y47
 B/9dqXD2oHoQrG9R2K5mn9pAao8IYqzmtkpeUnjeP6CBYTHgUduJCvVBLhr/INyfiHVyFsbkxoJ
 WvMHDU/6qhc7XCAq1awmc2EU0zzwROHc1Zidlm/DJMoQUnbpAsJxEe4S3b/Jj1Xf8bkGhIh68wx
 mIHu0N6tbRA992KuylZgWzFrND75KxyjI/2cfS3/BIDrYBDLZ/UR8NArf52okNrdH7MyUUx2CyW
 0oCFNSEmma7SjMu/wIp1AakWQpWbzc/X5K7ah5c5uJAMqOyrXjOHrSemKj9DZIlw+btLZAyzE6A
 J/Cjyyr6kjPqiBltO10c85qOlDlzvzdDGfN9DAbj8m1Au2lo9rluPcS3e4+3RBkTEpK0LHUlFzm
 fiSey7Xu69vCrXTo/5w==
X-Proofpoint-GUID: k5PkQuMN9gvOzAEwlh0lMZhyEYyNRaMV
X-Proofpoint-ORIG-GUID: k5PkQuMN9gvOzAEwlh0lMZhyEYyNRaMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
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
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13655-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C93F5299250
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 66fd2ed2c2c8428694c07d89220d0e1608546791..8fda6c128117d7f5b1dece68c919f2a09a511210 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -223,6 +227,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -239,6 +247,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -271,6 +283,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -306,6 +322,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -728,7 +748,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -778,13 +799,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	drv_data = data->drv_data;
+	ethqos->rgmii_por = drv_data->rgmii_por;
+	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -815,14 +837,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -837,10 +859,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3


