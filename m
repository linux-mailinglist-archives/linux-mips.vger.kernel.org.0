Return-Path: <linux-mips+bounces-13570-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBkpLByhsWn4EAAAu9opvQ
	(envelope-from <linux-mips+bounces-13570-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:06:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD8267BE1
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 18:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BFE731830EE
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2026 17:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397A83E3C58;
	Wed, 11 Mar 2026 17:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vag1znOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VLgBAUIi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509F73E3C5F
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773248652; cv=none; b=u66c+IyaXb2b8t0Nzn/k/0I7uWWntVgH9xrBelvjP8mI4+ldJI+SRHDDxne+nXqDNqVtJzVL9QwopMvyEfJm5ac2oinIUQbJFwgzBbdBu2diT/fzPAYnKf8WFKtlmiyVIc11KUs68uxxgJmU+jH3OJKSA8O+PZ1wiKmceaEaAnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773248652; c=relaxed/simple;
	bh=XQTa6KufrKePUx/Uu/qM+rFcQNF6NZDePeNkUKq8Ik4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZFaNdpR1z3fRv5oQxZufXlXPCDk8IRpbHBMgs/WrNZUs7PAiadBDWhyYMmCt5gulgLDYkqP+y9zEv8OcolJR1xjl996QmcSFpOkPLAROK3b0n6uXZ7wj6+5kNCb3jnDWGIl2NC5NT1iATCkyT7nXRD9mMRExawJQ9SiVhTRP6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vag1znOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLgBAUIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BFoxnL350617
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=; b=Vag1znOofy4KWeNa
	XHK7Gkan+Utz2ctuBY82nlWXcZ11ZO0aeZ0FpQDuqwGaJmNrUmNyBx4KxcoEed36
	t/aoDUd2bNLTA8o53HE6JNMVXLRNsFmWjEXQB0zL+eqBL8bcFb6Goy8TK+XAoocF
	wPiFGWlNIOdhz6wpsMO3k807HQNaVFwYwdO/2cJnS05XCmrqaRaNU3RES55sKcIh
	6ORMweOkApSxIXoTztGXGFzYNBQpr8+F2Oi9GvCfsQbydTY3/zAhApn6jXz0GZRx
	vBp5Widhy8YWU0BzngmC9zYgS+fervDaedSjWCPdKX3GQVCBWSrFM+6rNG14suH+
	vJ3zGA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cubd6g9mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 17:04:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093787e2fdso8833421cf.2
        for <linux-mips@vger.kernel.org>; Wed, 11 Mar 2026 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773248649; x=1773853449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=;
        b=VLgBAUIibIFTht9rvGxK+AHDQPXxCCcE2UrravqdguidwfOK5VVmxRKSvYBly/4V+N
         Jwsj+25mfApX3z+Hjd7L3tv7YQ7fhUD5cxu+x1JgYY+dlSaTCd9rsjV24InNVKQbYz9T
         XBl3FUAvCBApJVDg3JalKLQkl7BtmFyIbPrRvEbxab5NyEDHZ1AOFmHljLamFJJ5CDce
         ZgERBt4faJ14treNItXqZFY1eH7p0wN9O6Xe8Z1ZIJdOcf8HVE0KuKWAnBTjQuqC84Gy
         +7/Zt14W6D6uKuttu+EEne1ssBwx3/0qc95vFidCih5IaXHBlMFZ4IBQRtJf3jXgu42b
         dOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773248649; x=1773853449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NW+6C/YlptYPDKfGIe3lKXnCrt4PCKobOVQcU827DkQ=;
        b=OqVkf4Pe3VNkI3AXxg3XU5rFUbTdoAMddJdwkWwbiriAvGm7rBelobzyA4Gi+cVETE
         31U/WhfrqHsWZbpDqYT13tmpiIK4xOj01QPFO19QCSGNGKiD7QTeXUb71W4/y8A+t86D
         qsZVLluYvYU3b+k8ZcHxUivhFL4iHrqFxwXhntknpFgbuEcMgfyswx6vHoCelqwqqJs4
         7otbq2gUWp8rw0Pw671dNgYkJhUMfM0vWNuCBl5CXjR9XEbGDEDFqF/LaZWAJG0K0jhB
         BBpNW8uCdX9ffL5S/Dph4YFDNLsz/3Hki+9eanDpgeGxvUNIo24s1+oXw6AF2vsyIZAI
         vDtg==
X-Forwarded-Encrypted: i=1; AJvYcCWEMmRf9i7Hnm5KPy0ViaFK8FhaX8PvzrWb2r6Xk57o+SuHU9RRS3SdtoGF95Ysdp5vgEIdm4/MEn6z@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8GSSvuBMQs7ri/bdZEG04AWDsZJhYobNqh/oNDVNB9R5iaS4A
	J7Q+tjCqpwK4BbvgoYwYo+Q59h5YFhXxgxo6ID+SShcDoF38lhbLZVbivIX/qoE+nF9QdHiRV86
	Q5PNpEOo73I9RUpqOLq7rCb4lMYfenfu76ACKM0TCPUa4SmyrT9xd+ntaEceBLr6l
X-Gm-Gg: ATEYQzwrwPe25EDwf6Xsta75HNFCPIkCm02Iyg2dDkU3lmwmrwLkB4zyDePq/oVSeLK
	MX4PS3P8H1zC8SAIY16zQEFiTLsEwNdm0eN3dAbcJFe6Eimk+XoTZkpcfl79c3AzZgqnXRKVlhM
	IOwc80ZpPjTOem0FTgp39vFCQG2IZwOmgk7+OvBPU5hD5v6El5Mtln2+b74N5Uj6n9TcjpxvJma
	Ds8LY8fmYMGaQJmWrWj3SzRuoScN1pEHFjT+/ZZhFtghEVLyxDH7DET05K+s04N1OzRIYrbLTQS
	e6raXOMOL2aGzrvwb/f02eMu4v4uF8XWiKc6Y0+ITldYrGG8uBK5gS2ZoupUTK1dPrFs0mqBFgn
	fwR/rGRDCzjU0hKPUJk1r9DgIhxHVFUpEq6y75gft1LNcz4iF8SS2
X-Received: by 2002:a05:622a:1b09:b0:509:3f5d:4fa8 with SMTP id d75a77b69052e-5093f5d61ddmr27706891cf.18.1773248648570;
        Wed, 11 Mar 2026 10:04:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1b09:b0:509:3f5d:4fa8 with SMTP id d75a77b69052e-5093f5d61ddmr27705771cf.18.1773248647821;
        Wed, 11 Mar 2026 10:04:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3a92:6740:d71b:5056])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm167993075e9.8.2026.03.11.10.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 10:04:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 18:03:38 +0100
Subject: [PATCH net-next v8 3/6] net: stmmac: qcom-ethqos: wrap emac driver
 data in additional structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-qcom-sa8255p-emac-v8-3-58227bcf1018@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5837;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=2zf7cV5niFr/Qb4QPMTi/HX8ZYjENRtU1oQDGJyGl9Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsaB1mmZQXuEu4bbth9QU3xYhh2Qxxy9q7oUg1
 FY+D5MHkQqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabGgdQAKCRAFnS7L/zaE
 w74lEACEFJaarSoABJQFbSYeHV538sFoYbOryEnz5EU7iqj4R99lrHSfM5x3UoB1t11n9UkjvEp
 0o0yKon/m/Ew7ECqYZApQU9dlzDzicEm4tQx2TQ2L2BzWDuby+0p36nN5vUIqy9eg911C37FMCZ
 DddDlQhgP1x3xSehAID8j5ZQlvA3A3m0UXJ8w+GJg/v3EWN9c9TXv8jN/33/8wRAHw8TBLpfGLq
 QKykQ4IZorCOHDTxdDtMoBXfonN6czGW8xXyZbD7FOes71ciYkNnuW+xZAp+it888J1z1tGyft/
 5OLDslcDd7D4Vwu2kpk/IDMrRxt+v1fQSZgajOQJAxQ8DPwb1n4qop4x0maZaxaNmSMG3qKNMe2
 450PcXH9+3xYbMm/Lg+WegGJlVbYjAHmu7ALXvWDBQXQRPvZO5DEOg0LJwZ/YfZwK1P3F07iPq/
 Wx46v79ZEm2rADaWCOz6Eg8g+kMBkOSlv1+UaxIhGRj5sdzvj/tdzZ65uDWFOIE10WTcFaZH3Io
 jzuFVfWB92HDkH4EdopgtWZUjulJmhNmHULbJHwOkEUk2rUbpJmBupPKue5IEG+I/XUF0XFhwY6
 iO2n2U/+l2qBqtLpEb3MQaDKQsw7G92GCnSu1dayjTLq4Wfu1ufs5HeS5x0aeRU99gD6WVWgto/
 BK45EqfiyCx5hMg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=OvdCCi/t c=1 sm=1 tr=0 ts=69b1a089 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0NCBTYWx0ZWRfX6QgU60/L5fmB
 VPgvSjey0zyFKp1QKWi5UA+1XxNets6UQxxQw79wJ2fFEts7CBpK3oIhN7+dWYFfV4cyC+3oJC3
 EI2AC/lHSn0qifBhAaXzMicWDPrch/E9JV7oE029FVWrdXs9e+qgTmV6u+8qJyTU7Snj4JFtA90
 0aE8Xpywyf31OaoZTRKGEFFt+8Lprj6qncB1PH6kPhExZ3ZajXHRAQFAsEL0hN5l+MSKz/afR7x
 lLOc3OXltVP+zTFe9WSazAnurcIHHSdGBxcrQU2vYmeqhs0cdHDwXdS7PLH9U9Mzo86kBX6O5in
 EcdZB0BJ0wW29eqDZyKXN6Y24xFvl6ZhqFkdDvjXC8rs3OhwxWFTGsbWt/1YJFCPmY5GMkA23Sz
 ABZHdwZBamU8qa2VBXg0GAOZj3HZZv4RQ+4qdgAz/sNhaC+AZ40UqQxZof6WRLzLjbtpVYbztdF
 g+HhVl2Mdmb/m5o6cHg==
X-Proofpoint-GUID: RHDY085QzACLF2qoprIejFqcwj2gzACr
X-Proofpoint-ORIG-GUID: RHDY085QzACLF2qoprIejFqcwj2gzACr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110144
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13570-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 15BD8267BE1
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
index fb4ffd0d5360d091bf0192740b8a4a8d2c66e09e..92fc1fd0b4a1f85fdca7ee6f2c78b88415ce440d 100644
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
 	plat_dat->pmt = 1;
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


