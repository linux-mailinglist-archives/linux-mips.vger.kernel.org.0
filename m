Return-Path: <linux-mips+bounces-13883-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOSyE90+wWk9RwQAu9opvQ
	(envelope-from <linux-mips+bounces-13883-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 14:23:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BA92F2D7C
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 14:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3EE630275E8
	for <lists+linux-mips@lfdr.de>; Mon, 23 Mar 2026 13:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014623AD537;
	Mon, 23 Mar 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7T6It8n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ckdh+jxc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054753AD53E
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272099; cv=none; b=r8MYqMO9/ZRALkNXd282LvslyNok7yPofenafLD2PXvQWvkAr60WSmGvb6G9x9uhusquyLxBet+1Be4qjCUgSKk638SKF3tW4aASul034/PCb97hNoNLWLABa6Bg97/t6/i/9buDBdiFqTbaMpVLmjk3lEZM/n2+1rW2YfE2LU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272099; c=relaxed/simple;
	bh=cUDrs1O/XO11AhOC23rnXsi1wxL7UD1u0mwnarp3gg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHoZ7ghNKwQ2m+ucJPb3MUD4nfUEIQxjprI9oFTIO7VDgTR2BNvEXn66Bx6ztAbRnIamhg/xOkcxz1wphxidS30OzkzkfIllHRAy2ATJjoGFGMWHKU3q7PcwwBGY9qcVCgcUaRcrSWBfhT1r88/s0TXZrsg5aZDPzhJVs0GQVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7T6It8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ckdh+jxc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N9vATT3737826
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 13:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=; b=N7T6It8nbsDjVway
	9BaZbbouLTiam7yJxUITofAZlsTOVZ9Uonfn7oqHXjXD70WrIyNaCPW1Rtph2gir
	o96a5zTDERM23kBtl0XofxJBEr/VQ54r6TS+MzShIQmAfX/OeJj7GXjqMEK3Sh0M
	nkiHvPDXvFyPyysqKWmIGbDpPfRRC/VeyUvxf86mcKZ1aziJSXdOmlazQNQZdmLD
	IHkSHwRwB25W6q/iLKlgpEUsuaMSW6fQELS1dZ0iB8f9Ni2BdEIgZY+iVdq9BDBi
	5a5lDTrA3wOQfaFe/e59Hnptt9CqeoNVspDsgl++i1ZDj+R95UkgxCpu5FLjZSjB
	SM/ZcA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1mghde50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 13:21:37 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-950d6f230b7so4564790241.0
        for <linux-mips@vger.kernel.org>; Mon, 23 Mar 2026 06:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272096; x=1774876896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=Ckdh+jxcyvgtt9jSSmLZbnu9f42PTFMPsxTEftqMgEZ7Kj2qsgMkEa2spzwg5sGq2I
         togbtxr+QSuFJ+YHTXPoFeNQ0fiGJMjwixZLn1gKPvFQqloKeBozznGTpmXrXj4O8KPN
         doXbE5m0Gzqs9qEw2q/gZK0WMXOe3g30qfMjPdOhJwNP50AlPXE1l1eL5IXuK/MhcjZ3
         d9FEzB3x4MQYXH6PERyZXKHhRvxDilsvav5j773TWrigLmQqF8aIWru8YkoZM0mEoIED
         DsqApxa0z2XSPtaj9uq44Nl2Enz88TWN0UFUYbvZEbuDXetaIxRWSB+XLttkgRRY+KSu
         Khhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272096; x=1774876896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=kKK46JlEXLXrNgdNqPhHX+zp/TyysDQAErxom92CsvybB79r4jla/aS2jBmzXcony6
         yZ2YO3nR11+n42zaRronlv8zUgV9d5uUVWsDUQjqlG/zjGH8JHO3rrIeDz/Axg2aYP2j
         dFNmjxc5ty72O6hMRAMwLNNUzKkIUJg4zjLLuf7FZVOqQZXhISgNyIS72zu1vdMSERWI
         uNT1QUxhULBI/gRsmJNu9AGDHtNQv1kTfuHZHJxbWmPeRuXFJ6Iui+YkZCMVn0hasF3Y
         byV2J7fYFqweKwbwn0dtjZ5PAvlQhjzaSzyYAO/t6/83Yu3CTRu9rpXHNoZlAuH4d1Ee
         n7Lg==
X-Forwarded-Encrypted: i=1; AJvYcCWIZvJVIFbaHki292wU0P3HRukpkF60HwLkXNG5MVxti57mU4tx7P0iBG51dgAd5LbxioU1Fnu9nJ04@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+lDVkyPiLBaJFjIW6LYY/RhVUxpysTnP7noe+0VxDZFPXUKUa
	mDQLQM/QZhCz0aY6IgDH0q3q7uTExOTzwbaCJH4B6cZBoZpfTrCpQ+AIqLo36Sxk4Ct2N0ZfWcz
	nyLSRwJcbpteQg3s0U7SpStY6I+4Q1YCqfakPmfBbcqovWnqF5u5PmM86wai0Q8mf
X-Gm-Gg: ATEYQzypS9EO8bGgjG8MYKVhRCetYGn2P+AA9bYt4SD8kHw8NWFAtPnRxEH4QSbsxpm
	k8RcVFT96TG38GacKi982Z1Ugzu1sMx5uA0MCQ1dgsWdnJCulpJZIh+ABYh/iZoFKYFEqjekKEn
	7oTbyNP/cHZBmkQKeMVfCYF/O9FDBu/BUk6NvHKflNVf5v72djBM5KCNvibctKP+wyS9IUpDI6X
	aK8HWgoy5xQDgADC8uP1zSBwEdc/Ph3ouMlCfsXtQB+yGDSmxH6gvGUe8thfVPDZeKNUN376lnC
	dR78YH0Iq0FzkIN4TwuSj7JHjl7zY25IzRQzbsTnvEyGbW9o4W6H1RptiXyooiUoZlv0VZDYQpi
	tqKhEMo9EFvFJ8mPckVKNQJiNUsP0EZriscsd9T1e1NEUCkeHd2ky
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id ada2fe7eead31-602aeb097e7mr4875632137.14.1774272096010;
        Mon, 23 Mar 2026 06:21:36 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id ada2fe7eead31-602aeb097e7mr4875596137.14.1774272095387;
        Mon, 23 Mar 2026 06:21:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:57 +0100
Subject: [PATCH net-next v10 5/6] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-sa8255p-emac-v10-5-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNVr79Fi6sLZ+qldLv+chKiF5qjCh0lSqoNC0bsdcWI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5Kco3rCH1VoOXFDR6Bta8LK7OVpeQox5VMf
 wZ4Jyd66j6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SgAKCRAFnS7L/zaE
 w6WiD/43aaKifrVrtm996QHxWlyMyw5s93jMLKJudGiTSczX3O/TIKMXj794jsC0Pc4OBGPTqss
 Z0mROAxzMuBD37BojXp/vcgcGqNZg0C3TnWxCKWAD0K2SDDd9447LEJHMLcaGzGwfGnKplt0qbm
 rCu3cocM6WNQgCmHWphIBCmzdOCMkZ5pct7oC6hZab0GVwMyhgyhsySKKWvWYFbygWpbGAMZSDQ
 ThxdhrIA7NdGkT7ThmW42HafLfeF6UXMDVRtggBL0D1cvBx1ClnCmo1lxH1ADl+Xp0Fk+7SAnj8
 lwjEkCvhzKK7jkAqCH0KgccSCsJqZahhtsC0eF0iKElRDXmmKGwo6tur0en5yINcOaY4I3kv+Uk
 fjtiuJIeE6m0P/6OvTXroZK8880eODd8OGjhaHBGSIm/yyS4jzb8OyP0xNsOU+htF0R7OZlgDM1
 4b7y6O6RTgnyj078Siyr9DcyI5f34Lx7/MRkdKMbkGtMOr6JYo2fshp2DloitMISvkm/nQDfqSe
 auEeVmwORvOUbUdefPJR2mDibC+whHC9nxZT6cTrz/1eqhdFP5xKjPFBO9wKGaPbNOZmUXWIxno
 Re35XT5k6K2sPqmE1pKF4aO0C4casqDsVItnRxIp+UMKfESDbaj4Orb16Zc6J1TATb0CUihwqAG
 AWkCcpWGVud+Wcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=69c13e61 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ozMqfuFcuQizTyvGvvw4rEUrfdzZMNCv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX1xpeHzDE7T9R
 bpxxqAyXgt+pLV5LSKMvO/t2Fe/iAXU7m2xCUPzBvcDd5qraErb8QWKatgPxtaIvfed+I1u1Rhy
 nq0hY1t9gGeKfEYEbrnnHtFW+RqQRtwNNL3VytLCkP2uQjIHuNgjsjaSg0Vzpy5sdBcEBFpbETT
 QSvqddxTD5HlvDH2UMz1vhtkMTInkELICbBJV/hZU64az09PZWfjD5O2G+x7ftMMOgsp3UquRTX
 Wna7dFsfu72tNu0HgPWusIF1Rl/L7+LazmkkwrgJhbfg/Bw+uh1RqHpNwmDmLMmXfW9KMotYg8k
 QMGcD7vkTv5SlW7+WvbsGvVGUoaDcXcNvu9mXaNq0N+dNAevoxZkShL1tg7HaeX9MpM4Zhoq27B
 6RbI2+Eoyaug3qFHhJqjL5i9bQ1/fqoPVUv1Hqmo1Et4bav/egPY+/D0MIXv3AwIiIIDWhhBTN2
 DCQWECAZuDocY5e/SVg==
X-Proofpoint-GUID: ozMqfuFcuQizTyvGvvw4rEUrfdzZMNCv
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
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13883-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: E1BA92F2D7C
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
index cbfae18773c1193cd640f07824f5a66d68f9634b..f32ff0d9ce513d8270c8db9c549a79778549df59 100644
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


