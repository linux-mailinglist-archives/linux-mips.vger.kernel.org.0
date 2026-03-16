Return-Path: <linux-mips+bounces-13656-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBxyOpXyt2mfXQEAu9opvQ
	(envelope-from <linux-mips+bounces-13656-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:07:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A483429928A
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 13:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 309343040033
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 12:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5250395D98;
	Mon, 16 Mar 2026 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWohj5Ok";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eNeQ/2UE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE2394498
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662750; cv=none; b=QLJ/dXkmj1Tnw28HtVewavvaa/71BrpXg8Q04PcIuIdXJSY6a2gq7HgDKwhldcHk8kz+A9tfmqn1LGhaNTQAlTDdnLl66tYIPFFhMcQcMVs7BK1FKc8jexszO/qBCEUfRTCyyMcciw8CRQirOtHXRDHR6zUMjqFLd9bbJehKbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662750; c=relaxed/simple;
	bh=XhgTnkFPN/kAnMEKzRTRMtvjC9Al1B8l8RFwI+TZLZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyZvnGrJMbQHJv44G/mwMjfzGSqpE1pyp8v8K8wJoZA9iykmIkCUNQ0Rdl1Rvvh5ay3C0FqBLoLPqwj1xdEBzZB652hg1Ob1T3g+Yp5VV3dl5zunJjh39hTeIj81Gb/sz+PXVhl7z5C7O/Qk12GWCbWgHqv9ZmpuUcDMnq+XnP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWohj5Ok; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eNeQ/2UE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBO6eG1724892
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=; b=pWohj5OkCVNuv7KM
	pcX5zRTmSz08iVsJofRQs6bshQLQOoRtpVo4lt8OkgAS5ytGeomQdtnbgsPIiIjE
	ebJrpv4eUbRhpGq0/3EUn8YCcQ91EVjqhf7ZTrl90Qalv8kApiAh4odcD3x57ZHJ
	Mjq31SyWQ8X1hOGqhwS4sO/S6myNJlE+8H+s7cmrd6r90P9WAQDG1+e9UJsJtWVI
	ktUPr8OwQB25pm0mwGJWu/tWEvISYqHcd4OCSLRPbJd455OKBtz/7JzyJQ69+iSo
	qKmqtxT7zahYK/zpcr4qYMp4NuYoYpLDeUGACcMr5TDyf/wFuXDao1hUUuj10fCy
	rD5kJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0udng93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 12:05:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd827a356aso2980080685a.3
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2026 05:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662747; x=1774267547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=eNeQ/2UExY553xOCIwsZVAHcX7Vi4cprWovQM3ZNdg/2NwqZkEIj/wR4QlccdDAB86
         z6uVn8BhqmACa/yEeymZwOuHmebVYmFbrTEG5lcrH8sTxcZJ9SVmHicA1/TQNAuAdwfj
         yPpAA62Fmbttj8oi+RGpk8bTJMPc7f9VjgYSu1wzQGdo/aZnd25zFDvzLxhMQRkqh0K2
         8yBz3JupJUvXuzSzZs2o406FJQyetXCOee8lPI+SAb4VCBgKwreIkrwyPugsZfzcMcb+
         27O7YhDHa23zsEcWqzXlxD2XublF8UMqc6qtfwPkhUoODUzmBzr1iQxaJh4t/Hy2++lI
         6tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662747; x=1774267547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7uFBMrySSyg762knrQZ8WDLYNBJTFUwiXUIQ+8VU9Pg=;
        b=atRTtt48YKkA75rFzOPz1/YSLOuugfQdvoK6c6Nmf/AepnQjEx7TdmnjEO5QcmB+iL
         3C3AJEzVr/xSidDAVM7JEauIYWTky7pgVefMtOd6lOVe5xbiORoo7g+MTKGUtOPDgwLo
         67Zt9/1kaIICnjGtgFD7bOO3/go4+caZ6XmS07u6tlTKPSc+MO0px1L4DdjVcjQio0m/
         NweZWsmMFDdeWtA+9W17NySTnSjvJJ3t8PbqgbFyRDRMVUSkKjPAfMc6Fo5lOOPiXvPx
         MUIEGaIp2xDKO5tONkfN2L5F2APJX5LOxikmWfEQd2hNhSM9zlq+exMEo9xQK5b4Vw5m
         imTA==
X-Forwarded-Encrypted: i=1; AJvYcCVZt0wPo+E/cUSSWQb3MG1B0LSJ4WjAnOHqxCwwugoWVIXYsmA1E4BoqY2fY/PyIWWbulXd+v6IWfkU@vger.kernel.org
X-Gm-Message-State: AOJu0YzrScZWqCCS9pGIu5GEt+eVBvnSq0EBc8LWi43O/yGp2WclgCH6
	BOXMbuYsACe/m1WtBIUjzF74xORErLKQda3Z7x5gSNCD7sgfqjOWmN++SI4GTy4c/JOnED4bKpL
	YC6vxqNmVGmLwnfSpFUAd9jogRh7GGkw7q/GMIVwZcXvKjc6gUxy2WEsadavuiSJy
X-Gm-Gg: ATEYQzzDEqxXqqCJHRvMxhtnWBrsYk9wcnfuZgJYHJRcm1Q8E5g4lkH14eBqYsmdF71
	kKlkar6K+s2FLNG2HH8udGzrph16bdkRPnwYI8z0Mp8FhhY0OG3m8YxwJ8EomNHT1rnfqiATTgK
	nba+9xPgI0Z1hGWttUjEITsqSrGbRKjtS+q8x6sEfUBOV/L3XXJmnjxR6T9MMdeguTwS9DQwUx+
	gD5+mgTOSZQVzfvhXJTmquOODtiETGeXDu83vpZPCmMBrz7uFVQ9YOxYP2O/X+dILSAJiofA5fV
	EA/X/iESBYX1bavvjWqiBN05r2jO2002WWgK2CBwH8PQJcKOUQ3T8FvrIdxtPTplay5yQmpFfN5
	vJBQxDGsoJM1uOsSL+6a8b49V1vN0cC6QjbjColHkqqCtCsy7lJo=
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cdb5ba0d89mr1602664785a.73.1773662746759;
        Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
X-Received: by 2002:a05:620a:40ca:b0:8c6:abc5:f169 with SMTP id af79cd13be357-8cdb5ba0d89mr1602654885a.73.1773662746194;
        Mon, 16 Mar 2026 05:05:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 13:05:09 +0100
Subject: [PATCH net-next v9 4/6] net: stmmac: qcom-ethqos: split power
 management fields into a separate structure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-qcom-sa8255p-emac-v9-4-c58934e76ff2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hJGGsrAtahyuAplrTDgGRPmhh8bkkO/cgS9bRedR9Qk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/IH7+UzksxcBqpQnoVfm94yesTehZL6KZa/o
 zJAXvOazA6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfyBwAKCRAFnS7L/zaE
 w0DvD/4kVc12bfMNOItY55yvgMugKA5cgssCjAAELIhilzqsOtLF+QTcauo3L1I4XkAxCeu8HnT
 YLVxoD5YyVO1KrDNdPN/7uMPGxXLeHm4YFHm56SH134R5E35bQmIJQphjvYQ4rPyafNHeIocA+M
 gTNt5zmtV9Lgg+dKckIxkmpgzdM5u7IeAONHtRFKLUK96ZdEJeqqx4qUq0x0RNMayO5tg4B/tyb
 qPozJZ0U0fzmcKSUV+vaNUgjWVw87V+bRr1UmREmSNLBjUxehepEZr8meRGeGbL2lZPcyovttRK
 YPgjYDgYAs1nqUbvw3SEW4h9pYidZpJR5x+rNeLZLJ4hkd5ranw/yW4/aHyJKNfYzS+NnXkR2nj
 AMUO0C/1KBeZ5/9Ij0f7zR5jVSCA0142W2M6reVXXATjqjnmfwYrplfZHqkhQ31cGReOb+/+rhH
 2SO/4iApf3mkTtyd9q/vNkisn3oyvw7aonZ0zIrVOYSeo+EiCPPC3cFe6biaAl6QQwWSVOR1Q4h
 fTlX8TjeiplK96fSAqsISmDmbgtxtfjj+4ZG2Fa5cloAnl6uW3rT/AXDzEvU9rxosWdvI/R7QWz
 O1Y5TdzAK9dlH/v3NPiseZjs31VVohvZU4FQdkq8oPp5+SUaFvTBjgLGoCfbdY3eNpCl0O4aayy
 Y7sbsvP+AHLWnMA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=BJ2+bVQG c=1 sm=1 tr=0 ts=69b7f21b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KCp3k1edx3YIq9yPN_4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xh89v_ktbjgIYCQDda1ntSikQp6kQ_uz
X-Proofpoint-ORIG-GUID: xh89v_ktbjgIYCQDda1ntSikQp6kQ_uz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfX1rqZb61RVLZv
 pHpUQP6l0gbKFrPlON4ifYgz2/A8IpNa1S8RFHebfVHdgeoFyb2OkzQVvpUqmSw3JxGJ9Wx8PJR
 VUplOzm0K3LWg5sXgYeY+lUCisxHkkUQ0sM+KJjkOJpYNHIQuMcRiWU55dCO5j3I+0PBoEpPlpA
 VkRzvK5JktYUSy/kdaWG16KFnopj6DOJInF0aimKfHMvb9FenFQl4W+DawKVqiEWoNxgLsBK6q0
 6APc5p4iHten4ZfZafjb62Dknkx057BcIM6c41sa1hTtAlhI2U5ABdQCmgsfyifeq5On3/6gcbd
 iFYLhbID2212E16Ytyc54iSGp97/jpJbYjsDigYpE562HUJwhixCIX9FB1cgNpK2GMg1Pm3R7j/
 +zDQxEUNKjKFMTKaGueeoi3hKSJA6445cFWYte8yZvuhicWfKnfnrkcRc3iSNiQwGYWoJCk4vuc
 5PsMdNz+WCsG83gOXWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13656-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: A483429928A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Now that we have a separate wrapper for device match data, let's extend
this structure with a pointer to the structure containing fields related
to power-management only. This is done because a device may have the
same device settings but different power management mode (e.g.: firmware
vs manual).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c   | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8fda6c128117d7f5b1dece68c919f2a09a511210..cbfae18773c1193cd640f07824f5a66d68f9634b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -92,13 +92,17 @@ struct ethqos_emac_driver_data {
 	bool rgmii_config_loopback_en;
 	bool has_emac_ge_3;
 	u8 dma_addr_width;
-	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_pm_data {
+	const char *link_clk_name;
+};
+
 struct ethqos_emac_match_data {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 };
 
 struct qcom_ethqos {
@@ -301,7 +305,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v4_0_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = true,
-	.link_clk_name = "phyaux",
 	.needs_sgmii_loopback = true,
 	.dma_addr_width = 36,
 	.dwmac4_addrs = {
@@ -322,8 +325,13 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_pm_data emac_sa8775p_pm_data = {
+	.link_clk_name = "phyaux",
+};
+
 static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8775p_pm_data,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -749,11 +757,13 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_pm_data *pm_data;
 	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
 	struct qcom_ethqos *ethqos;
+	const char *clk_name;
 	int ret, i;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -800,13 +810,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 	data = device_get_match_data(dev);
 	drv_data = data->drv_data;
+	pm_data = data->pm_data;
+	clk_name = pm_data && pm_data->link_clk_name ? pm_data->link_clk_name : "rgmii";
+
 	ethqos->rgmii_por = drv_data->rgmii_por;
 	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
 	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
+	ethqos->link_clk = devm_clk_get(dev, clk_name);
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");

-- 
2.47.3


