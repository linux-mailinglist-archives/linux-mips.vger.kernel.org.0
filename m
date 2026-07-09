Return-Path: <linux-mips+bounces-15660-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aoAoNlk/T2pPcwIAu9opvQ
	(envelope-from <linux-mips+bounces-15660-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:27:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5891B72D20F
	for <lists+linux-mips@lfdr.de>; Thu, 09 Jul 2026 08:27:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=e8drr8S6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="h1daU/Fm";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15660-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15660-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 81F123045CB5
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2026 06:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38003C10A1;
	Thu,  9 Jul 2026 06:26:06 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553033C1984
	for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2026 06:26:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783578365; cv=none; b=fVT/beSD+WUdzSRQgYiMekAYYCI4RXsTb0W9MPMi/nG2cA0TzCbWy4CyjUxInKARyRdDxyIb7/V2sNIRnjuNr8+Edw3/Un9ASA24OqAtPyZjE2AStFbWjH9otKgbg2Gw86uVMg8TYKCWmIsZ32Mdau9+1azhlhW7h6xWtx5ZnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783578365; c=relaxed/simple;
	bh=b2izFxn+4IiiyKp9j0s8vQoNlL/tiuR3/hHtBJpHypk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ti8HN5vti7dCV5b2flwowswBbXLaHCj0pqzdAjCx4pAJ8LoYwzrA25dtpzufaj1m28dVpC2PQksJU7tbEQ572PhPnNU3xPL32+Q9xb1g1F+siiUDgIkLhcvZ50JFtsTViAj43V6gh6QWF0iPGfy2zOSmO06aKQDih1EXFSJ0cHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8drr8S6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h1daU/Fm; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960Goj932035
	for <linux-mips@vger.kernel.org>; Thu, 9 Jul 2026 06:25:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XkS0qjbBMR4bx7I0LwF03G25ZO0lBo870NfALSlDjq4=; b=e8drr8S6L/NQmGEG
	+01bhR+Y+IVDfJc99E+U3BaaxSi87bNGogUvMwHI6OjC/MlcteROsVg0tpt15Uic
	iK7VAiITAy4z0uDp3HZWFOV2k5QK6nBh7kDZzgPdwnpYFX3XI7qsHgUjQMLQHz/b
	ArxVvks6Si/rwNIEsKdmhTEBMMftGG58nWCOrOC7m5YtsD8UPMf4wa6h/zpOn6Kd
	XbmkXSpQPgXLJi6Ze7mkyXtmKBrEK6GaSw+IjuFVvDI6wB+AbUcmvtRZ3VfEDc9A
	VWwcv7sjdTl0XE/dAh+qpiKbWJNYGFKX7u0XdpCpAfmQJM92BbfBXbaGUpe46D53
	TDOQVw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqsaq1v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2026 06:25:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so2301413a12.2
        for <linux-mips@vger.kernel.org>; Wed, 08 Jul 2026 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783578357; x=1784183157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkS0qjbBMR4bx7I0LwF03G25ZO0lBo870NfALSlDjq4=;
        b=h1daU/Fmx3Hjus0nNPbksoi6Jf8pbFseciWOCN4YLgPj71iue1cKb7Hp4j2kVzaY/D
         J5D9vnP7FVEg4oxiBc7Fd3Ezch4tq98FZD5crtcHEbHhIGHBktvvt47QvyjsqkUUIr3I
         K8pmMtrsSCAPHz4f7/LiavFMY332CaZJsbQ4KBRZ4ZTuSbSwVmvQvekwJj3qcxtp5iwE
         UWgAEnTzmvXfZ+SIPZezGVboI14WegzBJA1qK0mITWIwmR0JNnO6XJ3+DWk9iIo54pAv
         K2NjEnP0GtTT6nGRJZ8t+n6BRViTkxkT7LUoK/H7Qyxg4i959aRMBU6JoRlU/0Gs7Yf+
         vUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578357; x=1784183157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XkS0qjbBMR4bx7I0LwF03G25ZO0lBo870NfALSlDjq4=;
        b=N3GdGYgOcyhc/lm1woRQRyyoOGpfqwy/fIATY+M4eUOlICJBKgbMsv/gop9YuIYFe+
         iRZNBRo6rSxXBwgM5L8jp6zcDOHj5PvnxG2zJ5c2tR+zuzzuuq8OCIJmy9LnZLt444Em
         ibBUQobSJka0NSK72mwY4gfNR9CuC/QthhDj4in1o0FulFO/KyqIYa2HNbdlPUwm5dx4
         7bB0ZWU35BM2hcFmtFbt0kV+Ckw4tCcfMGx6u480hkDZwE7YYCAXkutOiBkKUXi9FQgZ
         c+vVFxhk4yxeTosWJ8Sj2r/mh8O0QsTBLrh2OAiiOSt44A3WWMGhgvbch6vei2lCyJeG
         C0ig==
X-Forwarded-Encrypted: i=1; AHgh+RrOIIIXQ978R6oKXYtAXpr8+cQfEMQP4cRcggZV0GhB7mVQ3o0n2Icpt/0bti5KHkiFY5p2+ZiNR8yd@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9q2RGI1fS8UQBMUoAP2FLjJozm+DaHBSTHxrMNZcqP/lXcwr
	RRATyshUPPs+rSFDlgA4DFTAfGgpmwYiQVXYyfCWYTucMJvRE7YE1CmcVen+MdXIk8kyFRXaF1Y
	bwHSrm+6nLowFEfC8m3tccU6sHGtPfZ/74ZlJN2q4QiNqkZ1vsmgiXlG6VYcvvqW8
X-Gm-Gg: AfdE7cm/CBH2hZ8GukmuZTTCKJwQrhooVCtFqA6QwQCmI11Mw4eC9vmNT+8aeos0DGd
	BBEQyG3/0tMLp/Zn9Ni8fvjXD85Du+uUYo24nOosJh8Ft2xpSZIDx96rrKMYznrvB88RRLYW2Hv
	uSr4E03oR/MqhSV43Ojn+vBncKVLUHOgovUT/PKdqwshCxnckNJ93j8JHoelICiU5vxB9eCymKX
	8uNFCnwjTKutv4lgGzOlxypi9LBR71NgrjBaZcm+XpmXP+itsUFlSGT75Sdo1JvlbAjGFQQKmR+
	oWYnCmXfjXtQPGrRfAd5KBjJBCc5R66azCCSTzna2MuBXtBbcbNZw0EmlUPfhZA2615XEjd3Z3W
	9+A4BFbl9Gu5nNJnCM+ziPX2j6GbtDjtR4y6IIKZYExW+
X-Received: by 2002:a17:902:daca:b0:2ca:c4a5:84bb with SMTP id d9443c01a7336-2ccea3a737fmr61764165ad.38.1783578356719;
        Wed, 08 Jul 2026 23:25:56 -0700 (PDT)
X-Received: by 2002:a17:902:daca:b0:2ca:c4a5:84bb with SMTP id d9443c01a7336-2ccea3a737fmr61763605ad.38.1783578356098;
        Wed, 08 Jul 2026 23:25:56 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm37986405ad.18.2026.07.08.23.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:25:55 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 11:55:14 +0530
Subject: [PATCH 2/6] serial: 8250: update .pm callbacks to return int
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-add_return_check_for_uart_change_pm-v1-2-e85c6ffa8ec4@oss.qualcomm.com>
References: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
In-Reply-To: <20260709-add_return_check_for_uart_change_pm-v1-0-e85c6ffa8ec4@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Richard Genoud <richard.genoud@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Michal Simek <michal.simek@amd.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783578321; l=7834;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=b2izFxn+4IiiyKp9j0s8vQoNlL/tiuR3/hHtBJpHypk=;
 b=DiGW1ZUts1Plz+MKuKKnKr4MwFWfW5eunK8R4MyGl0ZMAS/6fAayulfFs5o4Ae/dAXTYeNVbK
 +fgruC+Vge8B91yUCFVVeTpTzyXxnoAKhIaokLIyV6nwlSzhKWExJ8e
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX+kikcB8PGsnV
 fHsdNMJTAZHlMCfhQzHXfaRn7MaERkJebO/sx3i0yA9W4jGB6Oxx63e1wczOgRDEDTbZ5oUs6FW
 eSQU9OIG8tAgQOHX6cbB/SigO5KXuog=
X-Proofpoint-GUID: KoeHJNS3iCBTULx6VxWoND6DdpgAxgVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1OCBTYWx0ZWRfX6jH6sE3SGZKA
 gLuxjAG00rFsIH6N0XpEwSdymhkQxLbx+homwEF1GiTdti/3zAtFMypRscRYRa1J3x9dd2A9Cd+
 bQFcUhq7wprxW1lSEAehPb8VxcsSt8eEqTqu3VjybTeeycqVcJ7ejQwgswkCCt9geS+No5XJ74S
 S8z8QHucq9Zt5P0FbI88DcSQaPKJOUUwgdAHvpbftTVIMuFd/dyWC9z7e2NrLL5TGc3zqtecfiP
 DmwuR3rxWnUuExvf+puVLe4gCqeRHTVdg1tGGIgz0EyVgko+cWgb3143Zyyqa1YMe/8l6tUcYIS
 2aHqcuvcq5IQE0NZPmf2M2qpK5X8yWK6Wpeu2O1n8L2hBmSqW+c3v1j59bBhSOvLyhjw/UKW7O7
 bjmPpBi+UT1pNPkB2xeuaCEUwqm02Y32JMtjSY7uD3qaSYYWPX+v84FARfgRoFSZjFE1jHwgwQk
 rbfpJU+m6oKoZ5CuCqw==
X-Authority-Analysis: v=2.4 cv=Sv2gLvO0 c=1 sm=1 tr=0 ts=6a4f3ef5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=MdvWXRze9gsMBWCGvMoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: KoeHJNS3iCBTULx6VxWoND6DdpgAxgVW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090058
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-15660-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,linux.intel.com,gmail.com,collabora.com,bootlin.com,microchip.com,tuxon.dev,linaro.org,samsung.com,linux.alibaba.com,foss.st.com,sunsite.dk,amd.com,iki.fi,atomide.com,armlinux.org.uk,alpha.franken.de,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:andriy.shevchenko@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:richard.genoud@bootlin.com,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:krzk@kernel.org,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jacmet@sunsite.dk,m:michal.simek@amd.com,m:aaro.koskinen@iki.fi,m:jmkrzyszt@gmail.com,m:tony@atomide.com,m:linux@armlinux.org.uk,m:tsbogend@alpha.franken.de,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:linux-serial@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-samsung-soc@vger.kernel.or
 g,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-omap@vger.kernel.org,m:linux-mips@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:praveen.talari@oss.qualcomm.com,m:matthiasbgg@gmail.com,m:zhanglyra@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[praveen.talari@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,uart_port.pm:url,uart_ops.pm:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5891B72D20F

The uart_ops.pm and uart_port.pm callback signatures have been changed
from void to int. Update all 8250 .pm implementations to match.

serial8250_do_pm() is the core 8250 power management helper, exported
for use by sub-drivers. Change its return type from void to int and
update its declaration in include/linux/serial_8250.h accordingly.
serial8250_do_pm() always returns 0.

serial8250_pm() is the uart_ops.pm entry point for the 8250 driver. It
delegates to a per-port pm function stored in uart_port.pm or falls back
to serial8250_do_pm(). Both paths are called for their side effects and
the function returns 0.

The remaining sub-driver callbacks perform their PM work through
platform-specific helpers (clocks, runtime PM, GPIO) and currently have
no error paths of their own. Update them to return 0 to satisfy the new
signature; individual error propagation can be added per-driver as
needed.

  8250_exar: exar_pm()
  8250_mtk:  mtk8250_do_pm()
  8250_omap: omap_8250_pm()
  8250_pxa:  serial_pxa_pm()

No functional change intended.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/tty/serial/8250/8250_dw.c   | 3 ++-
 drivers/tty/serial/8250/8250_exar.c | 4 +++-
 drivers/tty/serial/8250/8250_mtk.c  | 4 +++-
 drivers/tty/serial/8250/8250_omap.c | 6 ++++--
 drivers/tty/serial/8250/8250_port.c | 9 ++++++---
 drivers/tty/serial/8250/8250_pxa.c  | 6 ++++--
 include/linux/serial_8250.h         | 6 +++---
 7 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 5fba913f3301..7d5fa11d685f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -458,7 +458,7 @@ static int dw8250_handle_irq(struct uart_port *p)
 	return 1;
 }
 
-static void
+static int
 dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
 	if (!state)
@@ -468,6 +468,7 @@ dw8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 
 	if (state)
 		pm_runtime_put_sync_suspend(port->dev);
+	return 0;
 }
 
 static void dw8250_set_termios(struct uart_port *p, struct ktermios *termios,
diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index c682c0d0dffa..0d0026ea155f 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -419,7 +419,7 @@ static const struct serial_rs485 generic_rs485_supported = {
 	.flags = SER_RS485_ENABLED | SER_RS485_RTS_ON_SEND,
 };
 
-static void exar_pm(struct uart_port *port, unsigned int state, unsigned int old)
+static int exar_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
 	/*
 	 * Exar UARTs have a SLEEP register that enables or disables each UART
@@ -428,6 +428,8 @@ static void exar_pm(struct uart_port *port, unsigned int state, unsigned int old
 	 * the UART channel may only write to the corresponding bit.
 	 */
 	serial_port_out(port, UART_EXAR_SLEEP, state ? 0xff : 0);
+
+	return 0;
 }
 
 /*
diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index e6a56cf54ae0..9184b1eeddd7 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -452,7 +452,7 @@ static int __maybe_unused mtk8250_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static void
+static int
 mtk8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 {
 	if (!state)
@@ -462,6 +462,8 @@ mtk8250_do_pm(struct uart_port *port, unsigned int state, unsigned int old)
 
 	if (state)
 		pm_runtime_put_sync_suspend(port->dev);
+
+	return 0;
 }
 
 #ifdef CONFIG_SERIAL_8250_DMA
diff --git a/drivers/tty/serial/8250/8250_omap.c b/drivers/tty/serial/8250/8250_omap.c
index c552c6b9a037..8f099afd6ff8 100644
--- a/drivers/tty/serial/8250/8250_omap.c
+++ b/drivers/tty/serial/8250/8250_omap.c
@@ -527,8 +527,8 @@ static void omap_8250_set_termios(struct uart_port *port,
 }
 
 /* same as 8250 except that we may have extra flow bits set in EFR */
-static void omap_8250_pm(struct uart_port *port, unsigned int state,
-			 unsigned int oldstate)
+static int omap_8250_pm(struct uart_port *port, unsigned int state,
+			unsigned int oldstate)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 	u8 efr;
@@ -546,6 +546,8 @@ static void omap_8250_pm(struct uart_port *port, unsigned int state,
 	serial_out(up, UART_LCR, UART_LCR_CONF_MODE_B);
 	serial_out(up, UART_EFR, efr);
 	serial_out(up, UART_LCR, 0);
+
+	return 0;
 }
 
 static void omap_serial_fill_features_erratas(struct uart_8250_port *up,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 630deb7dd344..315e0a2fcc14 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -2848,16 +2848,18 @@ serial8250_set_ldisc(struct uart_port *port, struct ktermios *termios)
 		serial8250_do_set_ldisc(port, termios);
 }
 
-void serial8250_do_pm(struct uart_port *port, unsigned int state,
-		      unsigned int oldstate)
+int serial8250_do_pm(struct uart_port *port, unsigned int state,
+		     unsigned int oldstate)
 {
 	struct uart_8250_port *p = up_to_u8250p(port);
 
 	serial8250_set_sleep(p, state != 0);
+
+	return 0;
 }
 EXPORT_SYMBOL(serial8250_do_pm);
 
-static void
+static int
 serial8250_pm(struct uart_port *port, unsigned int state,
 	      unsigned int oldstate)
 {
@@ -2865,6 +2867,7 @@ serial8250_pm(struct uart_port *port, unsigned int state,
 		port->pm(port, state, oldstate);
 	else
 		serial8250_do_pm(port, state, oldstate);
+	return 0;
 }
 
 static unsigned int serial8250_port_size(struct uart_8250_port *pt)
diff --git a/drivers/tty/serial/8250/8250_pxa.c b/drivers/tty/serial/8250/8250_pxa.c
index 6dd0190b4843..02f0037e0a31 100644
--- a/drivers/tty/serial/8250/8250_pxa.c
+++ b/drivers/tty/serial/8250/8250_pxa.c
@@ -76,8 +76,8 @@ static void serial_pxa_dl_write(struct uart_8250_port *up, u32 value)
 }
 
 
-static void serial_pxa_pm(struct uart_port *port, unsigned int state,
-	      unsigned int oldstate)
+static int serial_pxa_pm(struct uart_port *port, unsigned int state,
+			 unsigned int oldstate)
 {
 	struct pxa8250_data *data = port->private_data;
 
@@ -85,6 +85,8 @@ static void serial_pxa_pm(struct uart_port *port, unsigned int state,
 		clk_prepare_enable(data->clk);
 	else
 		clk_disable_unprepare(data->clk);
+
+	return 0;
 }
 
 static int serial_pxa_probe(struct platform_device *pdev)
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index a95b2d143d24..12916189c20c 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -57,7 +57,7 @@ struct plat_serial8250_port {
 				     struct ktermios *);
 	unsigned int	(*get_mctrl)(struct uart_port *);
 	int		(*handle_irq)(struct uart_port *);
-	void		(*pm)(struct uart_port *, unsigned int state,
+	int		(*pm)(struct uart_port *port, unsigned int state,
 			      unsigned old);
 	void		(*handle_break)(struct uart_port *);
 };
@@ -189,8 +189,8 @@ void serial8250_do_set_ldisc(struct uart_port *port, struct ktermios *termios);
 unsigned int serial8250_do_get_mctrl(struct uart_port *port);
 int serial8250_do_startup(struct uart_port *port);
 void serial8250_do_shutdown(struct uart_port *port);
-void serial8250_do_pm(struct uart_port *port, unsigned int state,
-		      unsigned int oldstate);
+int serial8250_do_pm(struct uart_port *port, unsigned int state,
+		     unsigned int oldstate);
 void serial8250_do_set_mctrl(struct uart_port *port, unsigned int mctrl);
 void serial8250_do_set_divisor(struct uart_port *port, unsigned int baud,
 			       unsigned int quot);

-- 
2.34.1


