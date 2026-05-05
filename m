Return-Path: <linux-mips+bounces-14453-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AEODv6y+Wld/AIAu9opvQ
	(envelope-from <linux-mips+bounces-14453-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:06:06 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFB4C91E9
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:06:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A74783021ACF
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B70C3E9295;
	Tue,  5 May 2026 09:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPwDzPS/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0yLrFVl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A6F3E3155
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971913; cv=none; b=rkp6T5EwvaqMBCF0Z7OKSPrDVwSevyOSWbxzxWWaqIS8+kWZU6aUIKurWtHVDCJ02ZKl3E6CmY+HUgj9+5k5nbYPK7PYQf0rQFeIa9qkJq0g35MFnyJs+WaheWj4BJ49Z9hxmJ2AkzPmi0nt5Datn+T+87IusjrSEr/wsxW/tws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971913; c=relaxed/simple;
	bh=VYWLcciMZy7vhIJ0fJ6MxOtLCwgzkw2TyvXIKliZPVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FN0UzWHtnXAjTcXrxPu2SBvktWCCHji3Rx3O2jfJLKwh5yrh5d1RuCT2NuK0+PQ6SuWuRcwvHqutiLWsCsrIXos4ya391HkAVhqH0D07zLzbkVywTmPF+9WDZ/6qUz8pTxTZn2dDxqOkqx7vpDC19EFd90RXYk0+Dmi9HPzLY48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPwDzPS/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0yLrFVl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6455cq6K4128658
	for <linux-mips@vger.kernel.org>; Tue, 5 May 2026 09:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n6Yc6o2fojNozyNSjuPTq5tjkKOv4sjUssfLaOoQ5Ss=; b=PPwDzPS/eiwZ7btZ
	481yOOHskIUC0Dj7FQ8RTnWHYsH7RM/ZzfLzR2GFp0HjjafwELqeWuLJQP53EAhb
	JcUJo2XaAss0uJ2M1kvDKrhvtFux1SXbEjet4B16c0RqnrOySd8ltCugeuYGPqcm
	QIH3LgHU6Ry1LNYV1SgY1L2B3rIFReaZq2m4zqZavHJlyGZp3EyurHsdsksPmXj0
	E0LpOew+tnPbLPwSbVaMtxeGQ8J3reuAneu895wxdxKCoPm8ZQU9MUF0AMKuJxX6
	l0CT/m6CmxOucQDVA4C56mvkoBI8n6SfLOOEtKwXOyxVHlz40gf09KkIIsotg8rL
	nfo4Wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw49du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 09:05:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eacc2008b2so994575985a.3
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971909; x=1778576709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6Yc6o2fojNozyNSjuPTq5tjkKOv4sjUssfLaOoQ5Ss=;
        b=b0yLrFVlCTs5STJtNIkuw8U+SWBfnfKo927ZJWn7NF2+4faC4XKVmcTuYN4UQIcjeK
         X1UvfswOWGvAwMSv07IdAPnExaYcxPhFN/mZXDu2NI9GBwOci5jCW+vyRZlGdGNE+c6E
         udd8ziKlwzoKXOQyq6xbsFg0xCbCz7gwhDrI6M9sbthMaEIxVRRe11+9/TQkeO9OpWuE
         u3plIU4TV7MOWt3fwfTmDufFcQmZbNHcoLDRA4hpa/rzSAVhUPdqxrDvVS5YS/a5Dn01
         gZTmakF9wjd8u+w1XrRVFwVpPdrisDt50GlMLmmjU854SFpxkYWxljD28qHJNwaryefG
         lSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971909; x=1778576709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n6Yc6o2fojNozyNSjuPTq5tjkKOv4sjUssfLaOoQ5Ss=;
        b=iqVducQUvpZwmcmn2a7G2y+KjmF34pjc/qDd/vocXDKQvnWSj1xEsSkIiv7wRKBFkv
         1ZxUJ5l3lqYrC60BHXwlG2aNq1KuednRS9YH7NSdlVA+urJCjRk4k7TC5UbmLEO4Q1C/
         2bYj7XszoBgL6iHayvuGacBOMM1zG4e7finujdZGLAjRtvyR1qQlfjjdA1mVYfQpLbx0
         f8zB1E4aXps3QgqHIa1Hnc64VemLuCVdQ0JfbiL8KVnBdKxupS+P5zG4eKQQSje8z75i
         mO4LnCHGIlNE1q04yxJ/p/tX806nrA/IbTt2myHikyNoTSzc95kdSLNEwBrQPDW167oE
         YIfg==
X-Forwarded-Encrypted: i=1; AFNElJ9f1AShDQRVf1KcQGVgU+qL98Btvq1//vptMmv3eB7K9355CFaIR5W7H6gBoCCYqxEu1oHNdkpvj1kf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcm3quppi7MhOS0/ogl6AYYogJWGaBJ8JBvqa6srtKqbK6RJSt
	ExX8kFZf/0b9UFw2BCmJcvAPGQoTQN8rlUk6hVv5V5SoqDkYrHGMb7UR+5wf1fA3lLrsBQ0U0Ws
	iGpqCMQQbMnxDJCMmj+ZnkSIuFom6nDmXDR+xHuv8P9hSx4qAUkBeFYKk7CPxLCc2
X-Gm-Gg: AeBDietGsB6gy/K/W2p1U0lNE02q5ntqiK0pRq+DOQJhDKqQESQ9RErkR1+JWIo0yMZ
	rzbMT0BYVDnydgb411ClE6FfUhkCi8tifuUPpWFKVYaCfpv80LVYYVu+MsIGtAMkUJR0+f/TtYo
	9ek+rDJV3ZN3lp7MnwE48R0v9SVQJSgLacNLB/TEXiPMyN86xYe6wVTTM+hampbii3Mj1fE+qFA
	goEEpCJevweUUVlS+koTtqY3p6ge5dKwvUBVXKDWJemkTkcRMpQapeUQE6ZI8UwgBdzs3Oe43Ai
	dB/+nC9+7KeK9VE7Dktfn78x6NVeGg1rYMmV1us1vfnZnuZgl1vxWOveA0wnXmO4Cs0aSxXFhRm
	DI+8bW6LuvUDiUV2eX4/YK2vNve1rpcbsVgXn+/yi0w4HrlRN7NW7l/pDtpwHFw==
X-Received: by 2002:a05:622a:2304:b0:50e:5cc3:6f42 with SMTP id d75a77b69052e-5104c033490mr190950501cf.59.1777971909531;
        Tue, 05 May 2026 02:05:09 -0700 (PDT)
X-Received: by 2002:a05:622a:2304:b0:50e:5cc3:6f42 with SMTP id d75a77b69052e-5104c033490mr190950061cf.59.1777971909024;
        Tue, 05 May 2026 02:05:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3276:ff51:bd0f:7f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14d1b4f6sm14133385e9.12.2026.05.05.02.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:05:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 05 May 2026 11:04:46 +0200
Subject: [PATCH v2 6/6] MIPS: alchemy: db1300: switch to static device
 properties
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-gpio-swnode-alchemy-v2-6-cb208afc5b56@oss.qualcomm.com>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
In-Reply-To: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10298;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5zi7qR/K+v+P/K3FWqxjCmj3ofA+IeU+ByyLN3VhO/E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+bK5OoKsp+RHxXNyxkGrO5mAoa6lTcOcdZZTx
 hcW3i8lejqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafmyuQAKCRAFnS7L/zaE
 w6PjD/9OclcHlnb81r7bkxIcuQUOSD99Q+ipZgHGqWKLa0G2+syFSxcXFhriivPe4Kky7DjxJky
 x7MqIY6E4G1n5HWqSqlfXmmLqhX4fM0aPGiqYTAI8wtmXyzXU7wRQ1yCEcyiw71sUhasARtv8/D
 9lCjdsd+aMyPpv2r2UqeSTN54CdL1KUNy8yOU3FA4cb/bpCdf+yEuFI3fHmtslHw97eFvQ9HU7E
 Ciy5MsPWpJFiY9AnO+cWCILLgkz3d5cjMH14TgFmzn9tlH29WauGuOdS+O+SylQR+yjSnaHzapZ
 Lql6Rg/30ndU2LKO3f1yithiE4K7nxNo3GWmHgjiSEWCx7DQw6wHp3ygnmH6RtG8oYx7Q6mGhuS
 1JfG7wddffcez5Oum6VxnEVVLgJiEAnyW39T1ddcmxDblxheDQu3uyfWwYuKAyiNOgKFYrUkb9o
 +Tl6BSYLDdw0fDYNpXj7FOHe8KX0Z2TPZNagwY0wfmjFaBa9QUMUVqBV89lncT5ih87C56pZZTX
 fNTR74lxjsyqR/ycIkISxl1t3ViwJiqor4BuGAgdO60So259B5qSk5D2kBglX+dd7c8vU2ADjf4
 WQtdHhWgfRFxeRBLtSE8NBjswXpE2PA7phpxEw6Vve3j5KC7M0cB4JM2lNijYbKZFwFlQwvnMRo
 8wYqpLR8lp9QupA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f9b2c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=fAK9oTJ6_i1v3btX8BAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TIBUx0tuj6MwSx1LuNELxDtg8xEOrpZj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MyBTYWx0ZWRfX3bKqoUf43T63
 bhq0iHGYOR4qmF6ZJFCuXt+R7EaxdVbYeI/VNF0nVm9OhMbMd87uZvn37HKwnSRy9cjSZkJPESc
 Hn6Ug3qKATzkmOo8zAPVIRO9NRKF3qKotYrKyblaw38kyqc9VTp1RP3pWHTsn/847uv5HgVOBEf
 Lw9ULe6REVZmlOsvdDiBUmlWTe0oMCgo27/JacmaMtGNt0O1VRsdi2gyWjA2CJuive/2jkyIoun
 OL4HhWVmrq2jduJp1MJ5Ty8/Wb5kUj9Al0EcrFm7jn9g2wwXvebEHwvpvcLvl5suPcWp5GO7BwK
 +h4sbth+EO1e1FSpsa0nBHzPQDSkNGT/hOwyy5ciodJTzA8Vty/i4RqbBGsv3PP34g3P2FtaEpB
 s5nDRjKBDBIaNmHf3PfM/4DcJyREmEmroLk7OHCAjsG3EV1JyULip+XDYWlzNXTbuwjKwNYKXyl
 UrRfW8Stfdx85O2+Ykg==
X-Proofpoint-ORIG-GUID: TIBUx0tuj6MwSx1LuNELxDtg8xEOrpZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050083
X-Rspamd-Queue-Id: BEDFB4C91E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14453-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[alpha.franken.de,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Convert "5way switch" gpio-keys device and smsc911x ethernet controller
to use static device properties instead of bespoke platform data
structures for configuration.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[Bartosz: use platform_device_info::swnode]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/common/gpiolib.c              |   6 +
 arch/mips/alchemy/devboards/db1300.c            | 209 +++++++++++++++---------
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h |   3 +
 3 files changed, 144 insertions(+), 74 deletions(-)

diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index 2141eae5ce4502aad920333cba1f7a6e08411f9e..c926cc13756171e0650eed93ca14ec99c487782f 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -104,9 +104,14 @@ const struct software_node alchemy_gpio2_node = {
 	.name = "alchemy-gpio2",
 };
 
+const struct software_node alchemy_gpic_node = {
+	.name = "alchemy-gpic",
+};
+
 static const struct software_node *alchemy_gpio_node_group[] = {
 	&alchemy_gpio1_node,
 	&alchemy_gpio2_node,
+	&alchemy_gpic_node,
 	NULL
 };
 
@@ -189,6 +194,7 @@ static int __init alchemy_gpio_nodes_init(void)
 
 	alchemy_gpio_chip[0].fwnode = software_node_fwnode(&alchemy_gpio1_node);
 	alchemy_gpio_chip[1].fwnode = software_node_fwnode(&alchemy_gpio2_node);
+	au1300_gpiochip.fwnode = software_node_fwnode(&alchemy_gpic_node);
 
 	return 0;
 }
diff --git a/arch/mips/alchemy/devboards/db1300.c b/arch/mips/alchemy/devboards/db1300.c
index b46f5e47da2c32be3b44bcb80ea4b6e2623f735b..6aaba24849440956bc56bd026f5637fed6d0fe0b 100644
--- a/arch/mips/alchemy/devboards/db1300.c
+++ b/arch/mips/alchemy/devboards/db1300.c
@@ -7,10 +7,10 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
-#include <linux/gpio.h>
-#include <linux/gpio_keys.h>
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/init.h>
-#include <linux/input.h>	/* KEY_* codes */
+#include <linux/input-event-codes.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
 #include <linux/leds.h>
@@ -20,6 +20,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/platnand.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/smsc911x.h>
 #include <linux/wm97xx.h>
 
@@ -237,23 +238,36 @@ static struct resource db1300_eth_res[] = {
 	},
 };
 
-static struct smsc911x_platform_config db1300_eth_config = {
-	.phy_interface		= PHY_INTERFACE_MODE_MII,
-	.irq_polarity		= SMSC911X_IRQ_POLARITY_ACTIVE_LOW,
-	.irq_type		= SMSC911X_IRQ_TYPE_PUSH_PULL,
-	.flags			= SMSC911X_USE_32BIT,
-};
+static u8 db1300_eth_macaddr[6];
 
-static struct platform_device db1300_eth_dev = {
-	.name			= "smsc911x",
-	.id			= -1,
-	.num_resources		= ARRAY_SIZE(db1300_eth_res),
-	.resource		= db1300_eth_res,
-	.dev = {
-		.platform_data	= &db1300_eth_config,
+static const struct platform_device_info db1300_eth_info __initconst = {
+	.name		= "smsc911x",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= db1300_eth_res,
+	.num_res	= ARRAY_SIZE(db1300_eth_res),
+	.properties	= (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("reg-io-width", 4),
+		PROPERTY_ENTRY_U32("reg-shift", 0),
+		PROPERTY_ENTRY_BOOL("smsc,irq-push-pull"),
+		PROPERTY_ENTRY_STRING("phy-mode", "mii"),
+		PROPERTY_ENTRY_U8_ARRAY("local-mac-address", db1300_eth_macaddr),
+		{ }
 	},
 };
 
+static void __init db1300_eth_init(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	prom_get_ethernet_addr(db1300_eth_macaddr);
+
+	pd = platform_device_register_full(&db1300_eth_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create eth device: %d\n", err);
+}
+
 /**********************************************************************/
 
 static struct resource au1300_psc1_res[] = {
@@ -356,62 +370,110 @@ static struct platform_device db1300_i2c_dev = {
  * according to the schematics swap up with down and left with right.
  * I chose to use it to emulate the arrow keys of a keyboard.
  */
-static struct gpio_keys_button db1300_5waysw_arrowkeys[] = {
-	{
-		.code			= KEY_DOWN,
-		.gpio			= AU1300_PIN_LCDPWM0,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-down",
-	},
-	{
-		.code			= KEY_UP,
-		.gpio			= AU1300_PIN_PSC2SYNC1,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-up",
-	},
-	{
-		.code			= KEY_RIGHT,
-		.gpio			= AU1300_PIN_WAKE3,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-right",
-	},
-	{
-		.code			= KEY_LEFT,
-		.gpio			= AU1300_PIN_WAKE2,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-left",
-	},
-	{
-		.code			= KEY_ENTER,
-		.gpio			= AU1300_PIN_WAKE1,
-		.type			= EV_KEY,
-		.debounce_interval	= 1,
-		.active_low		= 1,
-		.desc			= "5waysw-push",
-	},
-};
+static const struct software_node db1300_5waysw_node = {
+	.name = "db1300-5wayswitch",
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_BOOL("autorepeat"),
+		PROPERTY_ENTRY_STRING("label", "db1300-5wayswitch"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_down_node = {
+	.name = "5waysw-down",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_DOWN),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_LCDPWM0, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-down"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_up_node = {
+	.name = "5waysw-up",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_UP),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_PSC2SYNC1, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-up"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_right_node = {
+	.name = "5waysw-right",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_RIGHT),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_WAKE3, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-right"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_left_node = {
+	.name = "5waysw-left",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_LEFT),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_WAKE2, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-left"),
+		{ }
+	},
+};
+
+static const struct software_node db1300_5waysw_push_node = {
+	.name = "5waysw-push",
+	.parent = &db1300_5waysw_node,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", KEY_ENTER),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpic_node,
+				    AU1300_PIN_WAKE1, GPIO_ACTIVE_LOW),
+		PROPERTY_ENTRY_U32("debounce-interval", 1),
+		PROPERTY_ENTRY_STRING("label", "5waysw-push"),
+		{ }
+	},
+};
+
+static const struct software_node * const db1300_5waysw_swnodes[] __initconst = {
+	&db1300_5waysw_node,
+	&db1300_5waysw_down_node,
+	&db1300_5waysw_up_node,
+	&db1300_5waysw_right_node,
+	&db1300_5waysw_left_node,
+	&db1300_5waysw_push_node,
+	NULL
+};
+
+static void __init db1300_5waysw_init(void)
+{
+	struct platform_device *pd;
+	int err;
 
-static struct gpio_keys_platform_data db1300_5waysw_data = {
-	.buttons	= db1300_5waysw_arrowkeys,
-	.nbuttons	= ARRAY_SIZE(db1300_5waysw_arrowkeys),
-	.rep		= 1,
-	.name		= "db1300-5wayswitch",
-};
+	err = software_node_register_node_group(db1300_5waysw_swnodes);
+	if (err) {
+		pr_err("failed to register 5waysw software nodes: %d\n", err);
+		return;
+	}
 
-static struct platform_device db1300_5waysw_dev = {
-	.name		= "gpio-keys",
-	.dev	= {
-		.platform_data	= &db1300_5waysw_data,
-	},
-};
+	pd = platform_device_register_full(&(struct platform_device_info){
+		.name	= "gpio-keys",
+		.id	= PLATFORM_DEVID_NONE,
+		.swnode	= &db1300_5waysw_node,
+	});
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create 5waysw device: %d\n", err);
+}
 
 /**********************************************************************/
 
@@ -765,9 +827,7 @@ static struct platform_driver db1300_wm97xx_driver = {
 /**********************************************************************/
 
 static struct platform_device *db1300_dev[] __initdata = {
-	&db1300_eth_dev,
 	&db1300_i2c_dev,
-	&db1300_5waysw_dev,
 	&db1300_nand_dev,
 	&db1300_ide_dev,
 #ifdef CONFIG_MMC_AU1X
@@ -805,8 +865,6 @@ int __init db1300_dev_setup(void)
 	/*
 	 * setup board
 	 */
-	prom_get_ethernet_addr(&db1300_eth_config.mac[0]);
-
 	i2c_register_board_info(0, db1300_i2c_devs,
 				ARRAY_SIZE(db1300_i2c_devs));
 
@@ -849,6 +907,9 @@ int __init db1300_dev_setup(void)
 	swapped = bcsr_read(BCSR_STATUS) & BCSR_STATUS_DB1200_SWAPBOOT;
 	db1x_register_norflash(64 << 20, 2, swapped);
 
+	db1300_eth_init();
+	db1300_5waysw_init();
+
 	return platform_add_devices(db1300_dev, ARRAY_SIZE(db1300_dev));
 }
 
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
index b12f37262cfa5466e8d167ca120740b47e61514e..c92d3c2a5ef87e4c21c90f56491d63e4894faba4 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
@@ -13,6 +13,9 @@
 #include <asm/mach-au1x00/au1000.h>
 
 struct gpio_chip;
+struct software_node;
+
+extern const struct software_node alchemy_gpic_node;
 
 /* with the current GPIC design, up to 128 GPIOs are possible.
  * The only implementation so far is in the Au1300, which has 75 externally

-- 
2.47.3


