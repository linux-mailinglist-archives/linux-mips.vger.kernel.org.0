Return-Path: <linux-mips+bounces-14450-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHUUIcyy+Wld/AIAu9opvQ
	(envelope-from <linux-mips+bounces-14450-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE304C91C2
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3309B3016CDA
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D705A3CEBA9;
	Tue,  5 May 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+7P1UWY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esmubnZK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E103D16EC
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777971907; cv=none; b=PnmLVhBDo6XJhv+e6+WJjzvWyFxMg/EoaAOhkEB/YzPfgfEKKBDe+L7qucz/8cHSbrnFMVQT746fYk8iqL5e3bImSwqWzVfSjGuDI7TQemgjoGmlDJIQeccaOoHtQDmJVVOptk0K3gVt8Ei+MuaCiOCUGGQFBDmAXvjVbInvUVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777971907; c=relaxed/simple;
	bh=GXjsDjx+WgT1VqhJVAntutRgS0j9UI1LjhKd2NJDpN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cygTSHsJjG45hTCY5KG1mblOqZBwnlE+m17xGMWChgekTKZqvrKansiE7d/4KxySyea/3/Sa/phQc4+H4q7etrt0Z291w8zVzKTS45H5zn4iRw02ZVU/si+rV/LazXd+YP52AYIJrOIyjMiv3Kx6YAXMMxSdVQVfGzzbUGIt44Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+7P1UWY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esmubnZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64585e6V1187203
	for <linux-mips@vger.kernel.org>; Tue, 5 May 2026 09:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	all9g437688to+4I5xDHevk70Ctd16Rz8HFVLPHs7L0=; b=D+7P1UWYPKV7TUKa
	QNSeacf+wT/EB7h9EQx+WQJKITI6/hYcG7QPQz3G//A65YwL8yRRLZWcFzOwHWha
	evUmiH759uRA6gBy5pVY98wKxncf1X4ym78T7wHG3N/DjbX7M2hC+yzKt6C17M2p
	ufh21VPGuDWtPSVTu9qgjPTN42PtdgqHEGFG+QyM0GesnKozhAGmQkh6AarPg/r5
	B/R1Iz9ivSA4AmPuSedeAOiiM75xdEAlqmeAWx7LqPfR9boQoklE8sG1R4B1erII
	5hk501ddd/+7N7Tity84oltMU0hWt94pqSetUPE48QoLLOc3CvzNI+kxu6dR+Yc7
	AUqJdg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvgbhvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 09:05:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50edf01172bso139634891cf.2
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777971904; x=1778576704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=all9g437688to+4I5xDHevk70Ctd16Rz8HFVLPHs7L0=;
        b=esmubnZKOX6oKkZLr6dcdU3ZGUfjbk5LtNFU1AIDLkFBjWukEYlEJM4xcQxEiBcbU5
         EfKeta2pNTxB6V4gKzTRvRKuoCBrUcWzEgwDZkWHG0i9W4pv2NWifU8F7zYKXW3QWAYY
         ClIvrR4dLLWXGZpswkRhfNDCl3cr/DZ0kw0TzEIRMnFqCfSySYd3DSwBwghDUqSoD8Pl
         aiBewGZ8CVUefWwIEINCnGFyDAbGX8ARmw4RU6SkX00+jJGIjI6aw4wAo/lPFs3ieab7
         JjYI0a/PKyXh8n1+PQCLHiOIke7BuEQdLsNJcsIIJZCKJcAVVwQ/AOaTVTvQzcdHkJDV
         MqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777971904; x=1778576704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=all9g437688to+4I5xDHevk70Ctd16Rz8HFVLPHs7L0=;
        b=ee9JUBTNvnqqmlLLut9anDu+tWUOFkvvDYwvxoY3faGyvsxG5Xnh2QlBDdTBHpKXDP
         s1uG7PVOKESTarjYfK042ItU4u8DjwHmleluvafbEOVxSoRmM7eLo/xQ/GhyeShBsSLB
         abFudAnZE405V07vlQjf4fLZYOinu7OIVPSK4F5cl2z5UlAfHGRvw2aKkHQ3To5e2TF3
         7ECQYF722VJxqbzsBN+6TwjwgjIqv486+Kn6PdosOQTJ2CnXqt4GXhsZlAjm5lIQqxJS
         ui/+X/dQDaw/ljY3MpGKgjuDoRd7XOGOsnXSF+jFIdjkL1vDWElbvMIy+GOFG15U4GQB
         GiBA==
X-Forwarded-Encrypted: i=1; AFNElJ9Okw6tapSZDZyMwKu6j51wlHd1St3e7W3F5HYQkPwQNkXi6KHjrTfgN9K8uKJ3L4Q7yZVTUQFqLB+P@vger.kernel.org
X-Gm-Message-State: AOJu0YyIuQz6dpPrF8osoRxjwEo0YEvPokK+VqVSMY6+uIvJ93KD2Dd7
	eLbf75R1st+HVkoU4D+sQ++yMOHY6vxUpgLyK4UR28e7fqB2pFv75A2fwNN8XhOp/KSBGZs3okg
	OIiiWrWjyS5t3fy2zGg47P4R6YHsDBtlD0/bZT3B8uosCmkc9/iwiV30Y626Tm45C
X-Gm-Gg: AeBDieu3g8Eb1nBDrh6czh6e+xBIGRIX8wA93YfK0mcYy/EbXa0cpYO+hyBH4wWKKpj
	3OtsWmsKHJfxyDhz3UvVSzh9WJji9L1lu/VGCAGiREHHeixr308bBNw8TfTXQ0XrFTxm0oNUhau
	O9bl1a7kLqQJZF+ohQpmBcDmwlX+O3N90e3zZ6vecnmjv2I1N1NoklGqQfb9wZDIwPhqHmK6L+L
	Chg9+tf+LSEgV9DGFIt6H7WpUQHzVr4OhzUompQdVH74eOSEvD//EgknUrhLiHGv5KamcZOZd4/
	rxF+D/uFINSVsq3qegFxfPetqfPgmba/bcE2Dj06hzC5V7OTF5Fulbp+yiDi4xXQLviginHAluY
	VqjzQoWg8dPCI6+rN1J9pPsIEeJoohnTVRoUgSYI9O/ohbQM7fvSpOA909wLTjQ==
X-Received: by 2002:a05:622a:245:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-5104bdefcfbmr202993061cf.8.1777971904196;
        Tue, 05 May 2026 02:05:04 -0700 (PDT)
X-Received: by 2002:a05:622a:245:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-5104bdefcfbmr202992751cf.8.1777971903649;
        Tue, 05 May 2026 02:05:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3276:ff51:bd0f:7f92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48d14d1b4f6sm14133385e9.12.2026.05.05.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:05:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 05 May 2026 11:04:43 +0200
Subject: [PATCH v2 3/6] MIPS: alchemy: mtx1: attach software nodes to GPIO
 chips
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-gpio-swnode-alchemy-v2-3-cb208afc5b56@oss.qualcomm.com>
References: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
In-Reply-To: <20260505-gpio-swnode-alchemy-v2-0-cb208afc5b56@oss.qualcomm.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8982;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ouY399Dp4LXW7+W2OZKDgpITZ1iOm6HOoI6Upz28iRE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+bK1DYZTe5V51r17jE3qKHkvKFySHAjSNPRh4
 vsLZEICRkSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafmytQAKCRAFnS7L/zaE
 w05MD/sHYPeIEL8CJFVnI17CTa7QBsThIqKEJDXSQT3bf59kklD0cgZOM+eQ3Wd+zsWKMvvzFM4
 Fe545rJzoWJFA4eQikB5/oXe4aF0yA4PDrQetVAHIBj+hntUk4J8At6WVo1dktaDFyU4HA1PXhv
 gzxQPmzi8t3XsA2CEv23J3tDOipogBjB0A9yC5EOUX3YqiY0fL+bRUzQ5DISU8YWartz1NevqI0
 Gt1t4ysjdCOnw9fKP9wgbocmxw5GJKCBZho7gOhWXC5pvJEHSAiDtjB2Wd7VjcdLS1EtT492Mc1
 /BeQNQGnc/hNVN+0tXpZf4eO4HGQxIHRJMLAj4fqx75WYBbMqnjwpq/AKLOk5ApODM7C4QSf+oY
 aHygtuGtIJiaAZVYiL3m86Q4EfGH/MrOY6pmjczATi2doPZKdM6RwYvDp9XHXBud97h9nNdpJjQ
 4mgyfCLbe3/HuhwlA7IEho3ERXwtKbslSC4/KaOtKNR12TJfmrwDyYor50qS3yJ8Xb4v9eK1KGn
 4D5Xw1ZZ7P8OmokjOkJAVqPteSscVRkl553jj3+7l5SkaAW1byrRjT/8QyVAz3aLA963WsY9aUh
 AfjQg03CNH0r3EMFlbURCa3eY8ijxi1JWzUXd+iMyPlFYapiaK1uAsQM7cZB3Z1TD5GnI3b6GrE
 GtAFVy0eABaLlrQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Ve_ZEtwfI7dX9Z6zAZWGw1HW34RfyjHF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA4MyBTYWx0ZWRfX9OkQG0xc+oEL
 p/LC/BYacbkfW/mnKX/TZjsHCqGSE7fSFqvsF2X6J8D7dvvr/4cys5StKQtQSQ1KYdceDISnNAo
 +2/N0U7oW+l2qoS8ioCsF5sVM5b+4zpDVY73JjxRE7T5CdKCjX45ZaZkunOdg8BOHMgZXUs2GTx
 trlrDlttGqwg0SPN0GjxCS84CSO47tnZXk4dRUxd8ZJ5VNDJZNvZRLAuXFiHY8f5ek9+o5oZ+kP
 IbtEg1icuI+xtYc7SgHSN1CQkWOKcq7BIoXsPHywh8zNcqFUqnfx0cF/X8QQIJM80Nx2qIi54QW
 P3yWcpU4jEyaBGrhLD1wAiTcYBCFwKU9THktpdOfuV6tvtGTaCMRL9KKQzJV8ayILPAnoL3FxS3
 PFxpZJfIhU1754q4BjUQ/UPxRnV86f2T6SV4Ej4mVFlKDidWxTXu14mKVz+8+Y/hYWMDyQbOePk
 BO8+214hKFLqlGvmGHA==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f9b2c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=tWZPv7H_HbOMA4K40sMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Ve_ZEtwfI7dX9Z6zAZWGw1HW34RfyjHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050083
X-Rspamd-Queue-Id: 3BE304C91C2
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
	TAGGED_FROM(0.00)[bounces-14450-lists,linux-mips=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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

GPIO subsystem is switching the way it locates GPIO chip instances for
GPIO references in software nodes from matching on node names to
identity matching, which necessitates assigning firmware nodes
(software nodes) to GPIO chips.

Move the node definitions for alchemy-gpio1 and alchemy-gpio2 to
arch/misp/alchemy/common/gpiolib.c, register them there, and attach
them to gpio_chip instances. Adjust MTX1 board file to use these nodes.

Note that because nodes need to be registered before they can be used in
PROPERTY_ENTRY_GPIO() we have to do the registration at
postcore_initcall level, otherwise (due to the link order) MTX1 board
initialization code will run first.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
[Bartosz: use platform_device_info::swnode]
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/mips/alchemy/board-mtx1.c                  | 79 +++++++++++--------------
 arch/mips/alchemy/common/gpiolib.c              | 39 +++++++++++-
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h |  5 ++
 3 files changed, 76 insertions(+), 47 deletions(-)

diff --git a/arch/mips/alchemy/board-mtx1.c b/arch/mips/alchemy/board-mtx1.c
index cb6be58808a08e667a401573d6ba515d70a58aa2..add83aa684196fb1aa708de65ff4fcf733731d3b 100644
--- a/arch/mips/alchemy/board-mtx1.c
+++ b/arch/mips/alchemy/board-mtx1.c
@@ -9,6 +9,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <linux/input.h>
@@ -78,27 +79,22 @@ void __init board_setup(void)
 
 /******************************************************************************/
 
-static const struct software_node mtx1_gpiochip_node = {
-	.name = "alchemy-gpio2",
-};
-
 static const struct software_node mtx1_gpio_keys_node = {
 	.name = "mtx1-gpio-keys",
 };
 
-static const struct property_entry mtx1_button_props[] = {
-	PROPERTY_ENTRY_U32("linux,code", BTN_0),
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 7, GPIO_ACTIVE_HIGH),
-	PROPERTY_ENTRY_STRING("label", "System button"),
-	{ }
-};
-
 static const struct software_node mtx1_button_node = {
 	.parent = &mtx1_gpio_keys_node,
-	.properties = mtx1_button_props,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_U32("linux,code", BTN_0),
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 7,
+				    GPIO_ACTIVE_HIGH),
+		PROPERTY_ENTRY_STRING("label", "System button"),
+		{ }
+	},
 };
 
-static const struct software_node *mtx1_gpio_keys_swnodes[] __initconst = {
+static const struct software_node * const mtx1_gpio_keys_swnodes[] __initconst = {
 	&mtx1_gpio_keys_node,
 	&mtx1_button_node,
 	NULL
@@ -127,16 +123,15 @@ static void __init mtx1_keys_init(void)
 		pr_err("failed to create gpio-keys device: %d\n", err);
 }
 
-/* Global number 215 is offset 15 on Alchemy GPIO 2 */
-static const struct property_entry mtx1_wdt_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 15, GPIO_ACTIVE_HIGH),
-	{ }
-};
-
-static struct platform_device_info mtx1_wdt_info __initconst = {
+static const struct platform_device_info mtx1_wdt_info __initconst = {
 	.name = "mtx1-wdt",
 	.id = 0,
-	.properties = mtx1_wdt_props,
+	.properties = (const struct property_entry[]){
+		/* Global number 215 is offset 15 on Alchemy GPIO 2 */
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 15,
+				    GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
 static void __init mtx1_wdt_init(void)
@@ -147,36 +142,34 @@ static void __init mtx1_wdt_init(void)
 	pd = platform_device_register_full(&mtx1_wdt_info);
 	err = PTR_ERR_OR_ZERO(pd);
 	if (err)
-		pr_err("failed to create gpio-keys device: %d\n", err);
+		pr_err("failed to create watchdog device: %d\n", err);
 }
 
 static const struct software_node mtx1_gpio_leds_node = {
 	.name = "mtx1-leds",
 };
 
-static const struct property_entry mtx1_green_led_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 11, GPIO_ACTIVE_HIGH),
-	{ }
-};
-
 static const struct software_node mtx1_green_led_node = {
 	.name = "mtx1:green",
 	.parent = &mtx1_gpio_leds_node,
-	.properties = mtx1_green_led_props,
-};
-
-static const struct property_entry mtx1_red_led_props[] = {
-	PROPERTY_ENTRY_GPIO("gpios", &mtx1_gpiochip_node, 12, GPIO_ACTIVE_HIGH),
-	{ }
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 11,
+				    GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
 static const struct software_node mtx1_red_led_node = {
 	.name = "mtx1:red",
 	.parent = &mtx1_gpio_leds_node,
-	.properties = mtx1_red_led_props,
+	.properties = (const struct property_entry[]){
+		PROPERTY_ENTRY_GPIO("gpios", &alchemy_gpio2_node, 12,
+				    GPIO_ACTIVE_HIGH),
+		{ }
+	},
 };
 
-static const struct software_node *mtx1_gpio_leds_swnodes[] = {
+static const struct software_node * const mtx1_gpio_leds_swnodes[] __initconst = {
 	&mtx1_gpio_leds_node,
 	&mtx1_green_led_node,
 	&mtx1_red_led_node,
@@ -185,10 +178,6 @@ static const struct software_node *mtx1_gpio_leds_swnodes[] = {
 
 static void __init mtx1_leds_init(void)
 {
-	struct platform_device_info led_info = {
-		.name	= "leds-gpio",
-		.id	= PLATFORM_DEVID_NONE,
-	};
 	struct platform_device *led_dev;
 	int err;
 
@@ -198,9 +187,11 @@ static void __init mtx1_leds_init(void)
 		return;
 	}
 
-	led_info.fwnode = software_node_fwnode(&mtx1_gpio_leds_node);
-
-	led_dev = platform_device_register_full(&led_info);
+	led_dev = platform_device_register_full(&(struct platform_device_info){
+		.name	= "leds-gpio",
+		.id	= PLATFORM_DEVID_NONE,
+		.swnode	= &mtx1_gpio_leds_node,
+	});
 	err = PTR_ERR_OR_ZERO(led_dev);
 	if (err)
 		pr_err("failed to create LED device: %d\n", err);
@@ -335,10 +326,6 @@ static int __init mtx1_register_devices(void)
 
 	au1xxx_override_eth_cfg(0, &mtx1_au1000_eth0_pdata);
 
-	rc = software_node_register(&mtx1_gpiochip_node);
-	if (rc)
-		return rc;
-
 	rc = platform_add_devices(mtx1_devs, ARRAY_SIZE(mtx1_devs));
 	if (rc)
 		return rc;
diff --git a/arch/mips/alchemy/common/gpiolib.c b/arch/mips/alchemy/common/gpiolib.c
index e79e26ffac99e6b12b430ab60df1cc7d42afd4a8..2141eae5ce4502aad920333cba1f7a6e08411f9e 100644
--- a/arch/mips/alchemy/common/gpiolib.c
+++ b/arch/mips/alchemy/common/gpiolib.c
@@ -30,6 +30,7 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 #include <linux/types.h>
 #include <linux/gpio/driver.h>
 #include <asm/mach-au1x00/gpio-au1000.h>
@@ -95,7 +96,21 @@ static int gpio1_to_irq(struct gpio_chip *chip, unsigned offset)
 	return alchemy_gpio1_to_irq(offset + ALCHEMY_GPIO1_BASE);
 }
 
-struct gpio_chip alchemy_gpio_chip[] = {
+const struct software_node alchemy_gpio1_node = {
+	.name = "alchemy-gpio1",
+};
+
+const struct software_node alchemy_gpio2_node = {
+	.name = "alchemy-gpio2",
+};
+
+static const struct software_node *alchemy_gpio_node_group[] = {
+	&alchemy_gpio1_node,
+	&alchemy_gpio2_node,
+	NULL
+};
+
+static struct gpio_chip alchemy_gpio_chip[] = {
 	[0] = {
 		.label			= "alchemy-gpio1",
 		.direction_input	= gpio1_direction_input,
@@ -157,6 +172,28 @@ static struct gpio_chip au1300_gpiochip = {
 	.ngpio			= AU1300_GPIO_NUM,
 };
 
+/*
+ * Software nodes must be registered before board-specific code (that runs
+ * at arch_initcall level) attempts to use them as GPIO targets or as fwnodes
+ * for registered devices. We can not do registration in alchemy_gpiochip_init
+ * because it also runs as arch_initcall and runs after board-specific code
+ * because of the link order, and so we do it at postcore_initcall level.
+ */
+static int __init alchemy_gpio_nodes_init(void)
+{
+	int ret;
+
+	ret = software_node_register_node_group(alchemy_gpio_node_group);
+	if (ret)
+		return ret;
+
+	alchemy_gpio_chip[0].fwnode = software_node_fwnode(&alchemy_gpio1_node);
+	alchemy_gpio_chip[1].fwnode = software_node_fwnode(&alchemy_gpio2_node);
+
+	return 0;
+}
+postcore_initcall(alchemy_gpio_nodes_init);
+
 static int __init alchemy_gpiochip_init(void)
 {
 	int ret = 0;
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
index e6306f6820e64e193b1be5e258211cca509edaa6..de7f857cb333a209c43fd6ca7198d2aa988c0bd7 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
@@ -40,6 +40,11 @@
 #define AU1000_GPIO2_INTENABLE	0x10
 #define AU1000_GPIO2_ENABLE	0x14
 
+struct software_node;
+
+extern const struct software_node alchemy_gpio1_node;
+extern const struct software_node alchemy_gpio2_node;
+
 static inline int au1000_gpio1_to_irq(int gpio)
 {
 	return MAKE_IRQ(1, gpio - ALCHEMY_GPIO1_BASE);

-- 
2.47.3


